#ifndef SDUAL_H_INCLUDED
#define SDUAL_H_INCLUDED

#include "dasio/serial.h"
#include "dasio/tm_data_sndr.h"
#include "SpatialDual.h"

extern const char *SDual_port;
extern int SDual_baud;
extern bool SDual_sim;

using namespace DAS_IO;

class SDual : public Serial {
  public:
    SDual(const char *port, TM_data_sndr *TM);
  protected:
    bool protocol_input();
    bool report_system_state(system_status_t *recd);
    bool tm_sync();
    
    struct __attribute__((__packed__)) frame_hdr_t {
      uint8_t LRC;
      uint8_t Packet_ID;
      uint8_t Packet_len;
      uint16_t CRC;
    } *hdr;
    TM_data_sndr *TM;
};

#endif