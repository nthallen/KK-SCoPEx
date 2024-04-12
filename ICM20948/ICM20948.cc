/* ICM20948.cc */
#include <stdio.h>
#include "ICM20948_drv.h"
#include "dasio/appid.h"
#include "oui.h"
#include "subbuspp.h"
#include "nl.h"

using namespace DAS_IO;

ICM20948_t ICM20948;
const char *ICM_dev::subbusd_service = "subbusd";
const char *ICM_dev::mlf_config;

ICM_dev::ICM_dev()
    : Interface("ICM", 0),
      mlf(0), ofp(0), records_in_file(0),
      quit_requested(false),
      req_mode(0), req_fs(0), req_modefs(0) {
  SB = new subbuspp(subbusd_service, "serusb"); // for now
  for (int i = 0; i < NS; ++i) {
    cmd_modefs[i] = rep_modefs[i] = 0;
    set_cur_skip(i, 0);
    dev[i].skip_set = false;
    dev[i].nw = 0;
  }
  mlf = mlf_init(3,60,1,"ICM","dat",mlf_config);
}

void ICM_dev::set_mode(uint8_t mode) {
  if (mode > 2)
    msg(MSG_ERROR, "%s: Invalid mode code: %d", iname, mode);
  else req_mode = mode;
}

void ICM_dev::set_fs(uint8_t fs) {
  if (fs > 3)
    msg(MSG_ERROR, "%s: Invalid full scale code: %d", iname, fs);
  else
    req_fs = fs;
}

void ICM_dev::set_rem(uint8_t rem) {
  rem_setpoint = rem;
}

void ICM_dev::set_gain(char cmd, float val) {
  switch (cmd) {
    case 'P':
      ICM20948.Gp = Gp = val;
      break;
    case 'I':
      ICM20948.Gi = Gi = val;
      for (int i = 0; i < NS; ++i) {
        dev[i].rem_err_sum = dev[i].cur_skip/Gi;
      }
      rem_err_sum_lim = max_skip/Gi;
      break;
    case 'R':
    default:
      msg(MSG_ERROR, "%s: Invalid gain code '%c'", iname, cmd);
  }
}

void ICM_dev::Quit() {
  quit_requested = true;
}

void ICM_dev::set_cur_skip(int i, int skip) {
  if (skip > max_skip)
    skip = max_skip;
  dev[i].cur_skip = skip;
  dev[i].nrows_needed = samples_per_report + skip;
  dev[i].nwords_needed = dev[i].nrows_needed*3;
  ICM20948.dev[i].samples_per_sec = dev[i].nrows_needed;
}

void ICM_dev::read_sensors(int i) {
  msg(MSG_DEBUG, "%s: read_sensors()", iname);
  uint16_t mask = (1<<NS)-1;
  while (mask) {
    for (int i = 0; i < NS; ++i) {
      if (mask & (1<<i)) {
        uint16_t *udata = dev[i].udata;
        int nw = dev[i].nw;
        subbus_mread_req rm;
        int n_fifo_reads = dev[i].nwords_needed - nw;
        if (n_fifo_reads+2 > max_mread)
          n_fifo_reads = max_mread-2;
        rm.req_len = snprintf(rm.multread_cmd, 256,
                      dev[i].rm_fifo_fmt, n_fifo_reads+2, n_fifo_reads);
        rm.req_len += 2*sizeof(uint16_t)+1;
        // msg(MSG_DEBUG, "%s: format is '%s'", iname, rm.multread_cmd);
        rm.n_reads = n_fifo_reads+2;
        uint16_t udata_save[2];
        if (nw > 0) {
          udata_save[0] = udata[nw];
          udata_save[1] = udata[nw+1];
        }
        uint16_t nwords;
        int rv = SB->mread_subbus_nw(&rm, &udata[nw], &nwords);
        if (rv < 0) {
          msg(MSG_FATAL, "%s: Driver error %d", iname, rv);
          break;
        } else {
          if (rv == SBS_NOACK)
            report_err("%s: SBS_NOACK on sensor read", iname);
          if (nwords < 2)
            msg(MSG_ERROR, "%s: Expected at least 2 words: %u", iname, nwords);
          msg(MSG_DEBUG, "%s: nwords:%u modefs:%u nw_fifo:%u",
                iname, nwords, udata[nw], udata[nw+1]);
          uint16_t modefs = udata[nw];
          rep_modefs[i] = modefs;
          ICM20948.dev[i].mode = mask_mode(modefs);
          ICM20948.dev[i].fs = mask_fs(modefs);
          uint16_t rem = udata[nw+1];
          if (!dev[i].skip_set) {
            // Since we were last here, we have read
            // dev[i].nwords_needed words, and an additional
            // rem - dev[i].remainder words have arrived
            set_cur_skip(i,
              dev[i].nwords_needed +
              rem - dev[i].remainder - samples_per_report);
            dev[i].remainder = rem;
            ICM20948.dev[i].remainder = rem;
            dev[i].skip_set = true;
          }
          if (nw > 0) {
            udata[nw] = udata_save[0];
            udata[nw+1] = udata_save[1];
          }
          if (nwords > 2) {
            dev[i].nw += nwords-2;
          }
        }
        if (dev[i].nw >= dev[i].nwords_needed) {
          mask &= ~(1<<i);
        } else if (ICM20948.dev[i].mode != 2) {
          mask &= ~(1<<i);
          break;
        }
      }
    }
  }
  
  // Update dev[i].cur_skip to try to maintain a small
  // (probably non-zero) remainder
  // if (Gp != 0 || Gi != 0) {
    // for (int i = 0; i < NS; ++i) {
      // double rem_err = ICM20948.dev[i].remainder - rem_setpoint;
      // dev[i].rem_err_sum += rem_err;
      // if (dev[i].rem_err_sum > rem_err_sum_lim)
        // dev[i].rem_err_sum = rem_err_sum_lim;
      // else if (dev[i].rem_err_sum < -rem_err_sum_lim)
        // dev[i].rem_err_sum = -rem_err_sum_lim;
      // double new_skip = Gp * rem_err + Gi * dev[i].rem_err_sum;
      // if (new_skip > max_skip) new_skip = max_skip;
      // else if (new_skip < 0) new_skip = 0;
      // dev[i].cur_skip = (uint16_t)new_skip;
      // ICM20948.dev[i].samples_per_sec =
        // dev[i].cur_skip + samples_per_report;
    // }
  // }
  
  // Write out the raw data to MLF
  // Records are all int16_t
  // First row is: uint16_t[3]: dev_index, dev_fs, N_rows,
  //   followed by int16_t[N_rows][3]
  for (int i = 0; i < NS; ++i) {
    uint16_t hdr[3];
    int n_rows = dev[i].nw/3;
    msg(MSG_DEBUG, "%s: Output: nw:%u", iname, dev[i].nw);
    hdr[0] = i;
    hdr[1] = mask_fs(rep_modefs[i]);
    hdr[2] = n_rows;
    if (ofp == 0) {
      ofp = mlf_next_file(mlf);
      ICM20948.mlf_file = mlf->index;
    }
    fwrite(hdr, sizeof(uint16_t), 3, ofp);
    int16_t *data = (int16_t *)&dev[i].udata[2];
    fwrite(data, sizeof(int16_t)*3, n_rows, ofp);
  }
  if (++records_in_file >= records_per_file) {
    fclose(ofp);
    ofp = 0;
    records_in_file = 0;
  }
  
  // Analyze max shock
  for (int i=0; i < NS; ++i) {
    int16_t (*data)[3];
    data = (int16_t(*)[3])&dev[i].udata[2];
    int n_rows = dev[i].nw/3;
    uint32_t max_g2 = 0;
    int max_g_i = 0;
    for (int j=0; j < n_rows; ++j) {
      int32_t term;
      uint32_t sum = 0;
      for (int k=0; k < 3; ++k) {
        term = data[j][k];
        sum += term*term;
      }
      if (sum > max_g2) {
        max_g_i = j;
      }
    }
    for (int k=0; k<3; ++k) {
      ICM20948.dev[i].max_accel[k] = data[max_g_i][k];
    }
  }

  // Perform FFT and identify peaks
  for (int i=0; i < NS; ++i) {
    dev[i].nw = 0;
    dev[i].skip_set = false;
  }
}

void ICM_dev::read_modes(int i) {
  uint16_t data[2];
  for (int i = 0; i < NS; ++i) {
    SB->mread_subbus(rm_idle[i], data);
    rep_modefs[i] = data[0];
    ICM20948.dev[i].mode = mask_mode(data[0]);
    ICM20948.dev[i].fs = mask_fs(data[0]);
  }
}

void ICM_dev::prep_multiread() {
  for (int i = 0; i < NS; ++i) {
    uint16_t base = base_addr[i];
    rm_idle[i] =
      SB->pack_mread_requests(base+0x64, base+0x65, 0);
    snprintf(dev[i].rm_fifo_fmt, 32,
      "M%%X#%X,%X|%%X@%X\n", base+0x64, base+0x65, base+0x66);
    rm_fifo[i] = new subbus_mread_req;
  }
}

uint16_t ICM_dev::base_addr[NS] = { 0 };

void ICM_dev::event_loop() {
  int subfunc = SB->load();
  if (subfunc)
    msg(MSG, "%s: Connected to %s", iname, SB->get_subbus_name());
  else
    msg(MSG_FATAL, "%s: Unable to load subbus", iname);
  prep_multiread();

  while (!quit_requested) {
    req_modefs = mask_modefs(req_mode, req_fs);
    // msg(MSG_DEBUG, "%s: Top of loop: rep_modefs = %02X", iname, rep_modefs);
    for (int i = 0; i < NS; ++i) {
      uint16_t cmd_addr = base_addr[i] + uDACS_cmd_addr;
      if (req_modefs != rep_modefs[i]) {
        msg(MSG_DEBUG, "%s: req_modefs=%02X rep_modefs[%d]=%02X",
            iname, req_modefs, i, rep_modefs[i]);
        if (mask_mode(rep_modefs[i]) == 0) {
          // Now we can command the new mode
          if (mask_mode(cmd_modefs[i]) == 0) {
            report_err("%s: Previous mode 0 command not completed", iname);
          }
          msg(MSG_DEBUG, "%s: commanding new mode/fs of %u/%u",
              iname, req_mode, req_fs);
          if (req_fs != mask_fs(rep_modefs[i])) {
            SB->write_ack(cmd_addr, uDACS_fs_cmd_offset+req_fs);
          }
          SB->write_ack(cmd_addr, uDACS_mode_cmd_offset+req_mode);
          cmd_modefs[i] = req_modefs;
          read_modes(i);
        } else {
          // rep_mode not zero, need to command it
          if (mask_mode(cmd_modefs[i]) == 0) {
            report_err("%s: Expected mode zero", iname);
          } else {
            SB->write_ack(cmd_addr, uDACS_mode_cmd_offset+0);
            cmd_modefs[i] = mask_modefs(0, mask_fs(rep_modefs[i]));
            read_modes(i);
          }
        }
      } else if (req_mode == 2) {
        read_sensors(i);
      } else {
        read_modes(i);
      }
    }
    // msg(MSG_DEBUG, "%s: Entering event_loop()", iname);
    ELoop->event_loop();
  }
}

ICM_cmd_t::ICM_cmd_t(ICM_dev *ICM)
    : Cmd_reader("cmd", 20, "ICM20948"),
      ICM(ICM) {}

/**
 * Accepts the following commands from the command server:
 *  - M[0-2] : Select mode 0, 1 or 2
 *  - F[0-3] : Select full scale sensor range. Fn => 2^(n+1) g
 *  - Q      : Quit
 */
bool ICM_cmd_t::app_input() {
  uint8_t MF_val;
  float PI_val;
  if (nc > 0) {
    unsigned char cmd = buf[cp];
    switch (cmd) {
      case 'Q':
        msg(MSG_DEBUG, "Received Quit");
        report_ok(nc);
        ICM->Quit();
        return true;
      case 'M':
      case 'F':
      case 'R':
        if (not_any("MFR") || not_uint8(MF_val) || not_str("\n")) {
          if (cp >= nc)
            report_err("%s: incomplete command", iname);
          consume(nc);
          return false;
        } else {
          msg(MSG_DEBUG, "Received '%c' command %d", cmd, MF_val);
          switch (cmd) {
            case 'M':
              ICM->set_mode(MF_val);
              break;
            case 'F':
              ICM->set_fs(MF_val);
              break;
            case 'R':
              ICM->set_rem(MF_val);
              break;
          }
          report_ok(nc);
        }
        return false;
      case 'P':
      case 'I':
        if (not_any("PI") ||
            not_whitespace() ||
            not_float(PI_val) ||
            not_str("\n")) {
          if (cp >= nc)
            report_err("%s: incomplete PI command", iname);
          consume(nc);
          return false;
        } else {
          msg(MSG_DEBUG, "Received '%c' command %.3e", cmd, PI_val);
          ICM->set_gain(cmd, PI_val);
          report_ok(nc);
        }
        return false;
    }
  }
  return false;
}

bool ICM_cmd_t::not_whitespace() {
  while (cp < nc && isspace(buf[cp]))
    ++cp;
  return false;
}

ICM_TM_t::ICM_TM_t()
    : TM_data_sndr("TM",0,"ICM20948", &ICM20948, sizeof(ICM20948)) {}

bool ICM_TM_t::app_input() {
  report_ok(nc);
  Send();
  return true;
}

int main(int argc, char **argv) {
  oui_init_options(argc, argv);
  { Loop ELoop;
    
    AppID.report_startup();
    
    ICM_dev *ICM = new ICM_dev();
    ELoop.add_child(ICM);

    ICM_cmd_t *ICM_cmd = new ICM_cmd_t(ICM);
    ELoop.add_child(ICM_cmd);
    ICM_cmd->connect();
    
    ICM_TM_t *ICM_TM =
      new ICM_TM_t();
    ELoop.add_child(ICM_TM);
    ICM_TM->connect();
    
    ICM->event_loop();
    ELoop.delete_children();
    ELoop.clear_delete_queue();
    AppID.report_shutdown();
  }
}
