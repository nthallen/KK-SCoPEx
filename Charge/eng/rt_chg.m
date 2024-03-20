function dfs_out = rt_chg(dfs)
% dfs = rt_chg()
%   Create a data_fields object and setup all the buttons for realtime
%   plots
% dfs_out = rt_chg(dfs)
%   Use the data_fields object and setup all the buttons for realtime plots
if nargin < 1
  dfs = data_fields('title', 'SCoPEx B3MB Charging Station', ...
    'Color', [.8 .8 1], ...
    'h_leading', 8, 'v_leading', 2, ...
    'btn_fontsize', 12, ...
    'txt_fontsize', 12);
  context_level = dfs.rt_init;
else
  context_level = 1;
end
dfs.start_tab('Plots');
dfs.start_col;
dfs.plot('pbk', 'label', 'B Kd', 'plots', {'pbkv','pbka','pbks','pbkstale'});
dfs.plot('pbkv','label','Volts','vars',{'BKd_V_limit','BKd_V_set','BKd_V_disp'});
dfs.plot('pbka','label','Amps','vars',{'BKd_I_set','BKd_I_disp'});
dfs.plot('pbks','label','Status','vars',{{'name','BKd_Output','var_name','BKd_Status','bit_number',0},{'name','BK_Stale','var_name','BKd_Status','bit_number',1}});
dfs.plot('pbkstale','label','Stale','vars',{'BKd_Stale'});
dfs.plot('pmpsl', 'label', 'MPS Ld', 'plots', {'pmpslv','pmpsla','pmpsls','pmpslstale'});
dfs.plot('pmpslv','label','Volts','vars',{'MPSLd_V_limit','MPSLd_V_set','MPSLd_V_disp'});
dfs.plot('pmpsla','label','Amps','vars',{'MPSLd_I_set','MPSLd_I_disp'});
dfs.plot('pmpsls','label','Status','vars',{{'name','MPSLd_SS','var_name','MPSLd_Status','bit_number',1},{'name','MPSLd_STBY','var_name','MPSLd_Status','bit_number',6},{'name','MPSLd_PWR','var_name','MPSLd_Status','bit_number',7},{'name','MPSLd_CV','var_name','MPSLd_Status','bit_number',8},{'name','MPSLd_CC','var_name','MPSLd_Status','bit_number',10},{'name','MPSLd_Output','var_name','MPSLd_Status','bit_number',13},{'name','MPSLd_Setpt','var_name','MPSLd_Status','bit_number',14}});
dfs.plot('pmpslstale','label','Stale','vars',{'MPSLd_Stale'});
dfs.end_col;
dfs.start_col;
dfs.plot('ptm', 'label', 'T Mbase', 'plots', {'ptmtd','ptmcpu','ptmram','ptmd'});
dfs.plot('ptmtd','label','T Drift','vars',{'SysTDrift'});
dfs.plot('ptmcpu','label','CPU','vars',{'CPU_Pct'});
dfs.plot('ptmram','label','RAM','vars',{'memused'});
dfs.plot('ptmd','label','Disk','vars',{'Disk'});
dfs.plot('pbmb', 'label', 'B3MB', 'plots', {'pbmbt','pbmbbmbv','pbmbb3mb_100v'});
dfs.plot('pbmbt','label','Temps','vars',{'B3MB_T_mean','B3MB_T_min','B3MB_T_max'});
dfs.plot('pbmbbmbv','label','B3MB 28V','vars',{'B3MB_28V_Batt_V_mean','B3MB_28V_Bus_V_mean'});
dfs.plot('pbmbb3mb_100v','label','B3MB 100V','vars',{'B3MB_100V_Batt_V_mean','B3MB_100V_Bus_V_mean'});
dfs.end_col;
dfs.start_col;
dfs.plot('pbmbs', 'label', 'B3MB Spread', 'plots', {'pbmbsbv','pbmbsbus_28v','pbmbsbatt_100v','pbmbsbus_100v'});
dfs.plot('pbmbsbv','label','Batt 28V','vars',{'B3MB_28V_Batt_V_mean','B3MB_28V_Batt_V_min','B3MB_28V_Batt_V_max'});
dfs.plot('pbmbsbus_28v','label','Bus 28V','vars',{'B3MB_28V_Bus_V_mean','B3MB_28V_Bus_V_min','B3MB_28V_Bus_V_max'});
dfs.plot('pbmbsbatt_100v','label','Batt 100V','vars',{'B3MB_100V_Batt_V_mean','B3MB_100V_Batt_V_min','B3MB_100V_Batt_V_max'});
dfs.plot('pbmbsbus_100v','label','Bus 100V','vars',{'B3MB_100V_Bus_V_mean','B3MB_100V_Bus_V_min','B3MB_100V_Bus_V_max'});
dfs.plot('pbmba', 'label', 'B3MB All', 'plots', {'pbmbat'});
dfs.plot('pbmbat','label','Temps','vars',{'B3MB_100V1_T1','B3MB_100V1_T2','B3MB_100V1_T3','B3MB_100V1_T4','B3MB_100V2_T1','B3MB_100V2_T2','B3MB_100V2_T3','B3MB_100V2_T4','B3MB_100V3_T1','B3MB_100V3_T2','B3MB_100V3_T3','B3MB_100V3_T4','B3MB_100V4_T1','B3MB_100V4_T2','B3MB_100V4_T3','B3MB_100V4_T4','B3MB_100V5_T2','B3MB_100V6_T1','B3MB_100V7_T1','B3MB_100V8_T1','B3MB_28V1_T1','B3MB_28V1_T2','B3MB_28V1_T3','B3MB_28V1_T4','B3MB_28V2_T1','B3MB_28V2_T2','B3MB_28V2_T3','B3MB_28V2_T4','B3MB_28V2_T5','B3MB_28V3_T1','B3MB_28V3_T2','B3MB_28V3_T3','B3MB_28V3_T4'});
dfs.end_col;
dfs.start_col;
dfs.plot('plots_b3mb_all_28', 'label', 'B3MB All 28', 'plots', {'plots_b3mb_all_28bv','plots_b3mb_all_28bi','plots_b3mb_all_28bus_28v','plots_b3mb_all_28lv','plots_b3mb_all_28li'});
dfs.plot('plots_b3mb_all_28bv','label','Batt 28V','vars',{'B3MB_28V1_Batt1_V','B3MB_28V1_Batt2_V','B3MB_28V1_Batt3_V','B3MB_28V1_Batt4_V','B3MB_28V2_Batt1_V','B3MB_28V2_Batt2_V','B3MB_28V2_Batt3_V','B3MB_28V2_Batt4_V','B3MB_28V3_Batt1_V','B3MB_28V3_Batt2_V','B3MB_28V3_Batt3_V','B3MB_28V3_Batt4_V'});
dfs.plot('plots_b3mb_all_28bi','label','Batt 28I','vars',{'B3MB_28V1_Batt1_I','B3MB_28V1_Batt2_I','B3MB_28V1_Batt3_I','B3MB_28V1_Batt4_I','B3MB_28V2_Batt1_I','B3MB_28V2_Batt2_I','B3MB_28V2_Batt3_I','B3MB_28V2_Batt4_I','B3MB_28V3_Batt1_I','B3MB_28V3_Batt2_I','B3MB_28V3_Batt3_I','B3MB_28V3_Batt4_I'});
dfs.plot('plots_b3mb_all_28bus_28v','label','Bus 28V','vars',{'B3MB_28V1_Bus_V','B3MB_28V2_Bus_V','B3MB_28V3_Bus_V'});
dfs.plot('plots_b3mb_all_28lv','label','Load 28V','vars',{'B3MB_28V1_Load1_V','B3MB_28V1_Load2_V','B3MB_28V1_Load3_V','B3MB_28V1_Load4_V','B3MB_28V2_Load1_V','B3MB_28V2_Load2_V','B3MB_28V2_Load3_V','B3MB_28V2_Load4_V','B3MB_28V3_Load1_V','B3MB_28V3_Load2_V','B3MB_28V3_Load3_V','B3MB_28V3_Load4_V'});
dfs.plot('plots_b3mb_all_28li','label','Load 28I','vars',{'B3MB_28V1_Load1_I','B3MB_28V1_Load2_I','B3MB_28V1_Load3_I','B3MB_28V1_Load4_I','B3MB_28V2_Load1_I','B3MB_28V2_Load2_I','B3MB_28V2_Load3_I','B3MB_28V2_Load4_I','B3MB_28V3_Load1_I','B3MB_28V3_Load2_I','B3MB_28V3_Load3_I','B3MB_28V3_Load4_I'});
dfs.end_col;
dfs.start_col;
dfs.plot('plots_b3mb_all_100', 'label', 'B3MB All 100', 'plots', {'plots_b3mb_all_100bv','plots_b3mb_all_100bi','plots_b3mb_all_100bus_100v','plots_b3mb_all_100lv','plots_b3mb_all_100li'});
dfs.plot('plots_b3mb_all_100bv','label','Batt 100V','vars',{'B3MB_100V1_Batt1_V','B3MB_100V2_Batt1_V','B3MB_100V3_Batt1_V','B3MB_100V4_Batt1_V','B3MB_100V5_Batt1_V','B3MB_100V6_Batt1_V','B3MB_100V7_Batt1_V','B3MB_100V8_Batt1_V'});
dfs.plot('plots_b3mb_all_100bi','label','Batt 100I','vars',{'B3MB_100V1_Batt1_I','B3MB_100V2_Batt1_I','B3MB_100V3_Batt1_I','B3MB_100V4_Batt1_I','B3MB_100V5_Batt1_I','B3MB_100V6_Batt1_I','B3MB_100V7_Batt1_I','B3MB_100V8_Batt1_I'});
dfs.plot('plots_b3mb_all_100bus_100v','label','Bus 100V','vars',{'B3MB_100V1_Bus_V','B3MB_100V2_Bus_V','B3MB_100V3_Bus_V','B3MB_100V4_Bus_V','B3MB_100V5_Bus_V','B3MB_100V6_Bus_V','B3MB_100V7_Bus_V','B3MB_100V8_Bus_V'});
dfs.plot('plots_b3mb_all_100lv','label','Load 100V','vars',{'B3MB_100V_Bus_V_mean','B3MB_100V1_Load1_V','B3MB_100V1_Load2_V','B3MB_100V1_Load3_V','B3MB_100V1_Load4_V','B3MB_100V2_Load1_V','B3MB_100V2_Load2_V','B3MB_100V2_Load3_V','B3MB_100V2_Load4_V','B3MB_100V3_Load1_V','B3MB_100V3_Load2_V','B3MB_100V3_Load3_V','B3MB_100V3_Load4_V','B3MB_100V4_Load1_V','B3MB_100V4_Load2_V','B3MB_100V4_Load3_V','B3MB_100V4_Load4_V','B3MB_100V5_Load1_V','B3MB_100V5_Load2_V','B3MB_100V5_Load3_V','B3MB_100V5_Load4_V','B3MB_100V6_Load1_V','B3MB_100V6_Load2_V','B3MB_100V6_Load3_V','B3MB_100V6_Load4_V','B3MB_100V7_Load1_V','B3MB_100V7_Load2_V','B3MB_100V7_Load3_V','B3MB_100V7_Load4_V','B3MB_100V8_Load1_V','B3MB_100V8_Load2_V','B3MB_100V8_Load3_V','B3MB_100V8_Load4_V'});
dfs.plot('plots_b3mb_all_100li','label','Load 100I','vars',{'B3MB_100V1_Load1_I','B3MB_100V1_Load2_I','B3MB_100V1_Load3_I','B3MB_100V1_Load4_I','B3MB_100V2_Load1_I','B3MB_100V2_Load2_I','B3MB_100V2_Load3_I','B3MB_100V2_Load4_I','B3MB_100V3_Load1_I','B3MB_100V3_Load2_I','B3MB_100V3_Load3_I','B3MB_100V3_Load4_I','B3MB_100V4_Load1_I','B3MB_100V4_Load2_I','B3MB_100V4_Load3_I','B3MB_100V4_Load4_I','B3MB_100V5_Load1_I','B3MB_100V5_Load2_I','B3MB_100V5_Load3_I','B3MB_100V5_Load4_I','B3MB_100V6_Load1_I','B3MB_100V6_Load2_I','B3MB_100V6_Load3_I','B3MB_100V6_Load4_I','B3MB_100V7_Load1_I','B3MB_100V7_Load2_I','B3MB_100V7_Load3_I','B3MB_100V7_Load4_I','B3MB_100V8_Load1_I','B3MB_100V8_Load2_I','B3MB_100V8_Load3_I','B3MB_100V8_Load4_I'});
dfs.end_tab;
dfs.start_tab('B3MB28');
dfs.start_col;
dfs.plot('bmbbmbvb', 'label', 'B3MB 28V1 Batt', 'plots', {'bmbbmbvbvv','bmbbmbvbav','bmbbmbvbtv','bmbbmbvbs','bmbbmbvbf'});
dfs.plot('bmbbmbvbvv','label','Volts 28V1','vars',{'B3MB_28V1_Batt1_V','B3MB_28V1_Batt2_V','B3MB_28V1_Batt3_V','B3MB_28V1_Batt4_V','B3MB_28V1_Bus_V'});
dfs.plot('bmbbmbvbav','label','Amps 28V1','vars',{'B3MB_28V1_Batt1_I','B3MB_28V1_Batt2_I','B3MB_28V1_Batt3_I','B3MB_28V1_Batt4_I'});
dfs.plot('bmbbmbvbtv','label','Temp 28V1','vars',{'B3MB_28V1_T1','B3MB_28V1_T2','B3MB_28V1_T3','B3MB_28V1_T4'});
dfs.plot('bmbbmbvbs','label','Status','vars',{{'name','B3MB_28V1_B1S','var_name','B3MB_28V1_Cmd_S','bit_number',0},{'name','B3MB_28V1_B2S','var_name','B3MB_28V1_Cmd_S','bit_number',1},{'name','B3MB_28V1_B3S','var_name','B3MB_28V1_Cmd_S','bit_number',2},{'name','B3MB_28V1_B4S','var_name','B3MB_28V1_Cmd_S','bit_number',3},{'name','B3MB_28V1_Stat_LED','var_name','B3MB_28V1_LED_S','bit_number',0},{'name','B3MB_28V1_Fault_LED','var_name','B3MB_28V1_LED_S','bit_number',1},{'name','B3MB_28V1_ID_CPU','var_name','B3MB_28V1_LED_S','bit_number',2}});
dfs.plot('bmbbmbvbf','label','Fault','vars',{{'name','B3MB_28V1_B1F','var_name','B3MB_28V1_Cmd_S','bit_number',8},{'name','B3MB_28V1_B2F','var_name','B3MB_28V1_Cmd_S','bit_number',9},{'name','B3MB_28V1_B3F','var_name','B3MB_28V1_Cmd_S','bit_number',10},{'name','B3MB_28V1_B4F','var_name','B3MB_28V1_Cmd_S','bit_number',11}});
dfs.plot('bmbbmbvl', 'label', 'B3MB 28V1 Load', 'plots', {'bmbbmbvlvv','bmbbmbvlav','bmbbmbvls','bmbbmbvlf'});
dfs.plot('bmbbmbvlvv','label','Volts 28V1','vars',{'B3MB_28V1_Load1_V','B3MB_28V1_Load2_V','B3MB_28V1_Load3_V','B3MB_28V1_Load4_V'});
dfs.plot('bmbbmbvlav','label','Amps 28V1','vars',{'B3MB_28V1_Load1_I','B3MB_28V1_Load2_I','B3MB_28V1_Load3_I','B3MB_28V1_Load4_I'});
dfs.plot('bmbbmbvls','label','Status','vars',{{'name','B3MB_28V1_Load1S','var_name','B3MB_28V1_Cmd_S','bit_number',4},{'name','B3MB_28V1_Load2S','var_name','B3MB_28V1_Cmd_S','bit_number',5},{'name','B3MB_28V1_Load3S','var_name','B3MB_28V1_Cmd_S','bit_number',6},{'name','B3MB_28V1_Load4S','var_name','B3MB_28V1_Cmd_S','bit_number',7}});
dfs.plot('bmbbmbvlf','label','Fault','vars',{{'name','B3MB_28V1_Load1F','var_name','B3MB_28V1_Cmd_S','bit_number',12},{'name','B3MB_28V1_Load2F','var_name','B3MB_28V1_Cmd_S','bit_number',13},{'name','B3MB_28V1_Load3F','var_name','B3MB_28V1_Cmd_S','bit_number',14},{'name','B3MB_28V1_Load4F','var_name','B3MB_28V1_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb28_b3mb_28v2_batt', 'label', 'B3MB 28V2 Batt', 'plots', {'b3mb28_b3mb_28v2_battvv','b3mb28_b3mb_28v2_battav','b3mb28_b3mb_28v2_batttv','b3mb28_b3mb_28v2_batts','b3mb28_b3mb_28v2_battf'});
dfs.plot('b3mb28_b3mb_28v2_battvv','label','Volts 28V2','vars',{'B3MB_28V2_Batt1_V','B3MB_28V2_Batt2_V','B3MB_28V2_Batt3_V','B3MB_28V2_Batt4_V','B3MB_28V2_Bus_V'});
dfs.plot('b3mb28_b3mb_28v2_battav','label','Amps 28V2','vars',{'B3MB_28V2_Batt1_I','B3MB_28V2_Batt2_I','B3MB_28V2_Batt3_I','B3MB_28V2_Batt4_I'});
dfs.plot('b3mb28_b3mb_28v2_batttv','label','Temp 28V2','vars',{'B3MB_28V2_T1','B3MB_28V2_T2','B3MB_28V2_T3','B3MB_28V2_T4','B3MB_28V2_T5'});
dfs.plot('b3mb28_b3mb_28v2_batts','label','Status','vars',{{'name','B3MB_28V2_B1S','var_name','B3MB_28V2_Cmd_S','bit_number',0},{'name','B3MB_28V2_B2S','var_name','B3MB_28V2_Cmd_S','bit_number',1},{'name','B3MB_28V2_B3S','var_name','B3MB_28V2_Cmd_S','bit_number',2},{'name','B3MB_28V2_B4S','var_name','B3MB_28V2_Cmd_S','bit_number',3},{'name','B3MB_28V2_Stat_LED','var_name','B3MB_28V2_LED_S','bit_number',0},{'name','B3MB_28V2_Fault_LED','var_name','B3MB_28V2_LED_S','bit_number',1},{'name','B3MB_28V2_ID_CPU','var_name','B3MB_28V2_LED_S','bit_number',2}});
dfs.plot('b3mb28_b3mb_28v2_battf','label','Fault','vars',{{'name','B3MB_28V2_B1F','var_name','B3MB_28V2_Cmd_S','bit_number',8},{'name','B3MB_28V2_B2F','var_name','B3MB_28V2_Cmd_S','bit_number',9},{'name','B3MB_28V2_B3F','var_name','B3MB_28V2_Cmd_S','bit_number',10},{'name','B3MB_28V2_B4F','var_name','B3MB_28V2_Cmd_S','bit_number',11}});
dfs.plot('b3mb28_b3mb_28v2_load', 'label', 'B3MB 28V2 Load', 'plots', {'b3mb28_b3mb_28v2_loadvv','b3mb28_b3mb_28v2_loadav','b3mb28_b3mb_28v2_loads','b3mb28_b3mb_28v2_loadf'});
dfs.plot('b3mb28_b3mb_28v2_loadvv','label','Volts 28V2','vars',{'B3MB_28V2_Load1_V','B3MB_28V2_Load2_V','B3MB_28V2_Load3_V','B3MB_28V2_Load4_V'});
dfs.plot('b3mb28_b3mb_28v2_loadav','label','Amps 28V2','vars',{'B3MB_28V2_Load1_I','B3MB_28V2_Load2_I','B3MB_28V2_Load3_I','B3MB_28V2_Load4_I'});
dfs.plot('b3mb28_b3mb_28v2_loads','label','Status','vars',{{'name','B3MB_28V2_Load1S','var_name','B3MB_28V2_Cmd_S','bit_number',4},{'name','B3MB_28V2_Load2S','var_name','B3MB_28V2_Cmd_S','bit_number',5},{'name','B3MB_28V2_Load3S','var_name','B3MB_28V2_Cmd_S','bit_number',6},{'name','B3MB_28V2_Load4S','var_name','B3MB_28V2_Cmd_S','bit_number',7}});
dfs.plot('b3mb28_b3mb_28v2_loadf','label','Fault','vars',{{'name','B3MB_28V2_Load1F','var_name','B3MB_28V2_Cmd_S','bit_number',12},{'name','B3MB_28V2_Load2F','var_name','B3MB_28V2_Cmd_S','bit_number',13},{'name','B3MB_28V2_Load3F','var_name','B3MB_28V2_Cmd_S','bit_number',14},{'name','B3MB_28V2_Load4F','var_name','B3MB_28V2_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb28_b3mb_28v3_batt', 'label', 'B3MB 28V3 Batt', 'plots', {'b3mb28_b3mb_28v3_battvv','b3mb28_b3mb_28v3_battav','b3mb28_b3mb_28v3_batttv','b3mb28_b3mb_28v3_batts','b3mb28_b3mb_28v3_battf'});
dfs.plot('b3mb28_b3mb_28v3_battvv','label','Volts 28V3','vars',{'B3MB_28V3_Batt1_V','B3MB_28V3_Batt2_V','B3MB_28V3_Batt3_V','B3MB_28V3_Batt4_V','B3MB_28V3_Bus_V'});
dfs.plot('b3mb28_b3mb_28v3_battav','label','Amps 28V3','vars',{'B3MB_28V3_Batt1_I','B3MB_28V3_Batt2_I','B3MB_28V3_Batt3_I','B3MB_28V3_Batt4_I'});
dfs.plot('b3mb28_b3mb_28v3_batttv','label','Temp 28V3','vars',{'B3MB_28V3_T1','B3MB_28V3_T2','B3MB_28V3_T3','B3MB_28V3_T4'});
dfs.plot('b3mb28_b3mb_28v3_batts','label','Status','vars',{{'name','B3MB_28V3_B1S','var_name','B3MB_28V3_Cmd_S','bit_number',0},{'name','B3MB_28V3_B2S','var_name','B3MB_28V3_Cmd_S','bit_number',1},{'name','B3MB_28V3_B3S','var_name','B3MB_28V3_Cmd_S','bit_number',2},{'name','B3MB_28V3_B4S','var_name','B3MB_28V3_Cmd_S','bit_number',3},{'name','B3MB_28V3_Stat_LED','var_name','B3MB_28V3_LED_S','bit_number',0},{'name','B3MB_28V3_Fault_LED','var_name','B3MB_28V3_LED_S','bit_number',1},{'name','B3MB_28V3_ID_CPU','var_name','B3MB_28V3_LED_S','bit_number',2}});
dfs.plot('b3mb28_b3mb_28v3_battf','label','Fault','vars',{{'name','B3MB_28V3_B1F','var_name','B3MB_28V3_Cmd_S','bit_number',8},{'name','B3MB_28V3_B2F','var_name','B3MB_28V3_Cmd_S','bit_number',9},{'name','B3MB_28V3_B3F','var_name','B3MB_28V3_Cmd_S','bit_number',10},{'name','B3MB_28V3_B4F','var_name','B3MB_28V3_Cmd_S','bit_number',11}});
dfs.plot('b3mb28_b3mb_28v3_load', 'label', 'B3MB 28V3 Load', 'plots', {'b3mb28_b3mb_28v3_loadvv','b3mb28_b3mb_28v3_loadav','b3mb28_b3mb_28v3_loads','b3mb28_b3mb_28v3_loadf'});
dfs.plot('b3mb28_b3mb_28v3_loadvv','label','Volts 28V3','vars',{'B3MB_28V3_Load1_V','B3MB_28V3_Load2_V','B3MB_28V3_Load3_V','B3MB_28V3_Load4_V'});
dfs.plot('b3mb28_b3mb_28v3_loadav','label','Amps 28V3','vars',{'B3MB_28V3_Load1_I','B3MB_28V3_Load2_I','B3MB_28V3_Load3_I','B3MB_28V3_Load4_I'});
dfs.plot('b3mb28_b3mb_28v3_loads','label','Status','vars',{{'name','B3MB_28V3_Load1S','var_name','B3MB_28V3_Cmd_S','bit_number',4},{'name','B3MB_28V3_Load2S','var_name','B3MB_28V3_Cmd_S','bit_number',5},{'name','B3MB_28V3_Load3S','var_name','B3MB_28V3_Cmd_S','bit_number',6},{'name','B3MB_28V3_Load4S','var_name','B3MB_28V3_Cmd_S','bit_number',7}});
dfs.plot('b3mb28_b3mb_28v3_loadf','label','Fault','vars',{{'name','B3MB_28V3_Load1F','var_name','B3MB_28V3_Cmd_S','bit_number',12},{'name','B3MB_28V3_Load2F','var_name','B3MB_28V3_Cmd_S','bit_number',13},{'name','B3MB_28V3_Load3F','var_name','B3MB_28V3_Cmd_S','bit_number',14},{'name','B3MB_28V3_Load4F','var_name','B3MB_28V3_Cmd_S','bit_number',15}});
dfs.end_tab;
dfs.start_tab('B3MB100A');
dfs.start_col;
dfs.plot('bmbabmbvb', 'label', 'B3MB 100V1 Batt', 'plots', {'bmbabmbvbvv','bmbabmbvbav','bmbabmbvbtv','bmbabmbvbs','bmbabmbvbf'});
dfs.plot('bmbabmbvbvv','label','Volts 100V1','vars',{'B3MB_100V1_Batt1_V','B3MB_100V1_Bus_V'});
dfs.plot('bmbabmbvbav','label','Amps 100V1','vars',{'B3MB_100V1_Batt1_I'});
dfs.plot('bmbabmbvbtv','label','Temp 100V1','vars',{'B3MB_100V1_T1','B3MB_100V1_T2','B3MB_100V1_T3','B3MB_100V1_T4'});
dfs.plot('bmbabmbvbs','label','Status','vars',{{'name','B3MB_100V1_B1S','var_name','B3MB_100V1_Cmd_S','bit_number',0},{'name','B3MB_100V1_Stat_LED','var_name','B3MB_100V1_LED_S','bit_number',0},{'name','B3MB_100V1_Fault_LED','var_name','B3MB_100V1_LED_S','bit_number',1},{'name','B3MB_100V1_ID_CPU','var_name','B3MB_100V1_LED_S','bit_number',2}});
dfs.plot('bmbabmbvbf','label','Fault','vars',{{'name','B3MB_100V1_B1F','var_name','B3MB_100V1_Cmd_S','bit_number',8}});
dfs.plot('bmbabmbvl', 'label', 'B3MB 100V1 Load', 'plots', {'bmbabmbvlvv','bmbabmbvlav','bmbabmbvls','bmbabmbvlf'});
dfs.plot('bmbabmbvlvv','label','Volts 100V1','vars',{'B3MB_100V1_Load1_V','B3MB_100V1_Load2_V','B3MB_100V1_Load3_V','B3MB_100V1_Load4_V'});
dfs.plot('bmbabmbvlav','label','Amps 100V1','vars',{'B3MB_100V1_Load1_I','B3MB_100V1_Load2_I','B3MB_100V1_Load3_I','B3MB_100V1_Load4_I'});
dfs.plot('bmbabmbvls','label','Status','vars',{{'name','B3MB_100V1_Load1S','var_name','B3MB_100V1_Cmd_S','bit_number',4},{'name','B3MB_100V1_Load2S','var_name','B3MB_100V1_Cmd_S','bit_number',5},{'name','B3MB_100V1_Load3S','var_name','B3MB_100V1_Cmd_S','bit_number',6},{'name','B3MB_100V1_Load4S','var_name','B3MB_100V1_Cmd_S','bit_number',7}});
dfs.plot('bmbabmbvlf','label','Fault','vars',{{'name','B3MB_100V1_Load1F','var_name','B3MB_100V1_Cmd_S','bit_number',12},{'name','B3MB_100V1_Load2F','var_name','B3MB_100V1_Cmd_S','bit_number',13},{'name','B3MB_100V1_Load3F','var_name','B3MB_100V1_Cmd_S','bit_number',14},{'name','B3MB_100V1_Load4F','var_name','B3MB_100V1_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb100a_b3mb_100v2_batt', 'label', 'B3MB 100V2 Batt', 'plots', {'b3mb100a_b3mb_100v2_battvv','b3mb100a_b3mb_100v2_battav','b3mb100a_b3mb_100v2_batttv','b3mb100a_b3mb_100v2_batts','b3mb100a_b3mb_100v2_battf'});
dfs.plot('b3mb100a_b3mb_100v2_battvv','label','Volts 100V2','vars',{'B3MB_100V2_Batt1_V','B3MB_100V2_Bus_V'});
dfs.plot('b3mb100a_b3mb_100v2_battav','label','Amps 100V2','vars',{'B3MB_100V2_Batt1_I'});
dfs.plot('b3mb100a_b3mb_100v2_batttv','label','Temp 100V2','vars',{'B3MB_100V2_T1','B3MB_100V2_T2','B3MB_100V2_T3','B3MB_100V2_T4'});
dfs.plot('b3mb100a_b3mb_100v2_batts','label','Status','vars',{{'name','B3MB_100V2_B1S','var_name','B3MB_100V2_Cmd_S','bit_number',0},{'name','B3MB_100V2_Stat_LED','var_name','B3MB_100V2_LED_S','bit_number',0},{'name','B3MB_100V2_Fault_LED','var_name','B3MB_100V2_LED_S','bit_number',1},{'name','B3MB_100V2_ID_CPU','var_name','B3MB_100V2_LED_S','bit_number',2}});
dfs.plot('b3mb100a_b3mb_100v2_battf','label','Fault','vars',{{'name','B3MB_100V2_B1F','var_name','B3MB_100V2_Cmd_S','bit_number',8}});
dfs.plot('b3mb100a_b3mb_100v2_load', 'label', 'B3MB 100V2 Load', 'plots', {'b3mb100a_b3mb_100v2_loadvv','b3mb100a_b3mb_100v2_loadav','b3mb100a_b3mb_100v2_loads','b3mb100a_b3mb_100v2_loadf'});
dfs.plot('b3mb100a_b3mb_100v2_loadvv','label','Volts 100V2','vars',{'B3MB_100V2_Load1_V','B3MB_100V2_Load2_V','B3MB_100V2_Load3_V','B3MB_100V2_Load4_V'});
dfs.plot('b3mb100a_b3mb_100v2_loadav','label','Amps 100V2','vars',{'B3MB_100V2_Load1_I','B3MB_100V2_Load2_I','B3MB_100V2_Load3_I','B3MB_100V2_Load4_I'});
dfs.plot('b3mb100a_b3mb_100v2_loads','label','Status','vars',{{'name','B3MB_100V2_Load1S','var_name','B3MB_100V2_Cmd_S','bit_number',4},{'name','B3MB_100V2_Load2S','var_name','B3MB_100V2_Cmd_S','bit_number',5},{'name','B3MB_100V2_Load3S','var_name','B3MB_100V2_Cmd_S','bit_number',6},{'name','B3MB_100V2_Load4S','var_name','B3MB_100V2_Cmd_S','bit_number',7}});
dfs.plot('b3mb100a_b3mb_100v2_loadf','label','Fault','vars',{{'name','B3MB_100V2_Load1F','var_name','B3MB_100V2_Cmd_S','bit_number',12},{'name','B3MB_100V2_Load2F','var_name','B3MB_100V2_Cmd_S','bit_number',13},{'name','B3MB_100V2_Load3F','var_name','B3MB_100V2_Cmd_S','bit_number',14},{'name','B3MB_100V2_Load4F','var_name','B3MB_100V2_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb100a_b3mb_100v3_batt', 'label', 'B3MB 100V3 Batt', 'plots', {'b3mb100a_b3mb_100v3_battvv','b3mb100a_b3mb_100v3_battav','b3mb100a_b3mb_100v3_batttv','b3mb100a_b3mb_100v3_batts','b3mb100a_b3mb_100v3_battf'});
dfs.plot('b3mb100a_b3mb_100v3_battvv','label','Volts 100V3','vars',{'B3MB_100V3_Batt1_V','B3MB_100V3_Bus_V'});
dfs.plot('b3mb100a_b3mb_100v3_battav','label','Amps 100V3','vars',{'B3MB_100V3_Batt1_I'});
dfs.plot('b3mb100a_b3mb_100v3_batttv','label','Temp 100V3','vars',{'B3MB_100V3_T1','B3MB_100V3_T2','B3MB_100V3_T3','B3MB_100V3_T4'});
dfs.plot('b3mb100a_b3mb_100v3_batts','label','Status','vars',{{'name','B3MB_100V3_B1S','var_name','B3MB_100V3_Cmd_S','bit_number',0},{'name','B3MB_100V3_Stat_LED','var_name','B3MB_100V3_LED_S','bit_number',0},{'name','B3MB_100V3_Fault_LED','var_name','B3MB_100V3_LED_S','bit_number',1},{'name','B3MB_100V3_ID_CPU','var_name','B3MB_100V3_LED_S','bit_number',2}});
dfs.plot('b3mb100a_b3mb_100v3_battf','label','Fault','vars',{{'name','B3MB_100V3_B1F','var_name','B3MB_100V3_Cmd_S','bit_number',8}});
dfs.plot('b3mb100a_b3mb_100v3_load', 'label', 'B3MB 100V3 Load', 'plots', {'b3mb100a_b3mb_100v3_loadvv','b3mb100a_b3mb_100v3_loadav','b3mb100a_b3mb_100v3_loads','b3mb100a_b3mb_100v3_loadf'});
dfs.plot('b3mb100a_b3mb_100v3_loadvv','label','Volts 100V3','vars',{'B3MB_100V3_Load1_V','B3MB_100V3_Load2_V','B3MB_100V3_Load3_V','B3MB_100V3_Load4_V'});
dfs.plot('b3mb100a_b3mb_100v3_loadav','label','Amps 100V3','vars',{'B3MB_100V3_Load1_I','B3MB_100V3_Load2_I','B3MB_100V3_Load3_I','B3MB_100V3_Load4_I'});
dfs.plot('b3mb100a_b3mb_100v3_loads','label','Status','vars',{{'name','B3MB_100V3_Load1S','var_name','B3MB_100V3_Cmd_S','bit_number',4},{'name','B3MB_100V3_Load2S','var_name','B3MB_100V3_Cmd_S','bit_number',5},{'name','B3MB_100V3_Load3S','var_name','B3MB_100V3_Cmd_S','bit_number',6},{'name','B3MB_100V3_Load4S','var_name','B3MB_100V3_Cmd_S','bit_number',7}});
dfs.plot('b3mb100a_b3mb_100v3_loadf','label','Fault','vars',{{'name','B3MB_100V3_Load1F','var_name','B3MB_100V3_Cmd_S','bit_number',12},{'name','B3MB_100V3_Load2F','var_name','B3MB_100V3_Cmd_S','bit_number',13},{'name','B3MB_100V3_Load3F','var_name','B3MB_100V3_Cmd_S','bit_number',14},{'name','B3MB_100V3_Load4F','var_name','B3MB_100V3_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb100a_b3mb_100v4_batt', 'label', 'B3MB 100V4 Batt', 'plots', {'b3mb100a_b3mb_100v4_battvv','b3mb100a_b3mb_100v4_battav','b3mb100a_b3mb_100v4_batttv','b3mb100a_b3mb_100v4_batts','b3mb100a_b3mb_100v4_battf'});
dfs.plot('b3mb100a_b3mb_100v4_battvv','label','Volts 100V4','vars',{'B3MB_100V4_Batt1_V','B3MB_100V4_Bus_V'});
dfs.plot('b3mb100a_b3mb_100v4_battav','label','Amps 100V4','vars',{'B3MB_100V4_Batt1_I'});
dfs.plot('b3mb100a_b3mb_100v4_batttv','label','Temp 100V4','vars',{'B3MB_100V4_T1','B3MB_100V4_T2','B3MB_100V4_T3','B3MB_100V4_T4'});
dfs.plot('b3mb100a_b3mb_100v4_batts','label','Status','vars',{{'name','B3MB_100V4_B1S','var_name','B3MB_100V4_Cmd_S','bit_number',0},{'name','B3MB_100V4_Stat_LED','var_name','B3MB_100V4_LED_S','bit_number',0},{'name','B3MB_100V4_Fault_LED','var_name','B3MB_100V4_LED_S','bit_number',1},{'name','B3MB_100V4_ID_CPU','var_name','B3MB_100V4_LED_S','bit_number',2}});
dfs.plot('b3mb100a_b3mb_100v4_battf','label','Fault','vars',{{'name','B3MB_100V4_B1F','var_name','B3MB_100V4_Cmd_S','bit_number',8}});
dfs.plot('b3mb100a_b3mb_100v4_load', 'label', 'B3MB 100V4 Load', 'plots', {'b3mb100a_b3mb_100v4_loadvv','b3mb100a_b3mb_100v4_loadav','b3mb100a_b3mb_100v4_loads','b3mb100a_b3mb_100v4_loadf'});
dfs.plot('b3mb100a_b3mb_100v4_loadvv','label','Volts 100V4','vars',{'B3MB_100V4_Load1_V','B3MB_100V4_Load2_V','B3MB_100V4_Load3_V','B3MB_100V4_Load4_V'});
dfs.plot('b3mb100a_b3mb_100v4_loadav','label','Amps 100V4','vars',{'B3MB_100V4_Load1_I','B3MB_100V4_Load2_I','B3MB_100V4_Load3_I','B3MB_100V4_Load4_I'});
dfs.plot('b3mb100a_b3mb_100v4_loads','label','Status','vars',{{'name','B3MB_100V4_Load1S','var_name','B3MB_100V4_Cmd_S','bit_number',4},{'name','B3MB_100V4_Load2S','var_name','B3MB_100V4_Cmd_S','bit_number',5},{'name','B3MB_100V4_Load3S','var_name','B3MB_100V4_Cmd_S','bit_number',6},{'name','B3MB_100V4_Load4S','var_name','B3MB_100V4_Cmd_S','bit_number',7}});
dfs.plot('b3mb100a_b3mb_100v4_loadf','label','Fault','vars',{{'name','B3MB_100V4_Load1F','var_name','B3MB_100V4_Cmd_S','bit_number',12},{'name','B3MB_100V4_Load2F','var_name','B3MB_100V4_Cmd_S','bit_number',13},{'name','B3MB_100V4_Load3F','var_name','B3MB_100V4_Cmd_S','bit_number',14},{'name','B3MB_100V4_Load4F','var_name','B3MB_100V4_Cmd_S','bit_number',15}});
dfs.end_tab;
dfs.start_tab('B3MB100B');
dfs.start_col;
dfs.plot('bmbbbmbvb', 'label', 'B3MB 100V5 Batt', 'plots', {'bmbbbmbvbvv','bmbbbmbvbav','bmbbbmbvbtv','bmbbbmbvbs','bmbbbmbvbf'});
dfs.plot('bmbbbmbvbvv','label','Volts 100V5','vars',{'B3MB_100V5_Batt1_V','B3MB_100V5_Bus_V'});
dfs.plot('bmbbbmbvbav','label','Amps 100V5','vars',{'B3MB_100V5_Batt1_I'});
dfs.plot('bmbbbmbvbtv','label','Temp 100V5','vars',{'B3MB_100V5_T2'});
dfs.plot('bmbbbmbvbs','label','Status','vars',{{'name','B3MB_100V5_B1S','var_name','B3MB_100V5_Cmd_S','bit_number',0},{'name','B3MB_100V5_Stat_LED','var_name','B3MB_100V5_LED_S','bit_number',0},{'name','B3MB_100V5_Fault_LED','var_name','B3MB_100V5_LED_S','bit_number',1},{'name','B3MB_100V5_ID_CPU','var_name','B3MB_100V5_LED_S','bit_number',2}});
dfs.plot('bmbbbmbvbf','label','Fault','vars',{{'name','B3MB_100V5_B1F','var_name','B3MB_100V5_Cmd_S','bit_number',8}});
dfs.plot('bmbbbmbvl', 'label', 'B3MB 100V5 Load', 'plots', {'bmbbbmbvlvv','bmbbbmbvlav','bmbbbmbvls','bmbbbmbvlf'});
dfs.plot('bmbbbmbvlvv','label','Volts 100V5','vars',{'B3MB_100V5_Load1_V','B3MB_100V5_Load2_V','B3MB_100V5_Load3_V','B3MB_100V5_Load4_V'});
dfs.plot('bmbbbmbvlav','label','Amps 100V5','vars',{'B3MB_100V5_Load1_I','B3MB_100V5_Load2_I','B3MB_100V5_Load3_I','B3MB_100V5_Load4_I'});
dfs.plot('bmbbbmbvls','label','Status','vars',{{'name','B3MB_100V5_Load1S','var_name','B3MB_100V5_Cmd_S','bit_number',4},{'name','B3MB_100V5_Load2S','var_name','B3MB_100V5_Cmd_S','bit_number',5},{'name','B3MB_100V5_Load3S','var_name','B3MB_100V5_Cmd_S','bit_number',6},{'name','B3MB_100V5_Load4S','var_name','B3MB_100V5_Cmd_S','bit_number',7}});
dfs.plot('bmbbbmbvlf','label','Fault','vars',{{'name','B3MB_100V5_Load1F','var_name','B3MB_100V5_Cmd_S','bit_number',12},{'name','B3MB_100V5_Load2F','var_name','B3MB_100V5_Cmd_S','bit_number',13},{'name','B3MB_100V5_Load3F','var_name','B3MB_100V5_Cmd_S','bit_number',14},{'name','B3MB_100V5_Load4F','var_name','B3MB_100V5_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb100b_b3mb_100v6_batt', 'label', 'B3MB 100V6 Batt', 'plots', {'b3mb100b_b3mb_100v6_battvv','b3mb100b_b3mb_100v6_battav','b3mb100b_b3mb_100v6_batttv','b3mb100b_b3mb_100v6_batts','b3mb100b_b3mb_100v6_battf'});
dfs.plot('b3mb100b_b3mb_100v6_battvv','label','Volts 100V6','vars',{'B3MB_100V6_Batt1_V','B3MB_100V6_Bus_V'});
dfs.plot('b3mb100b_b3mb_100v6_battav','label','Amps 100V6','vars',{'B3MB_100V6_Batt1_I'});
dfs.plot('b3mb100b_b3mb_100v6_batttv','label','Temp 100V6','vars',{'B3MB_100V6_T1'});
dfs.plot('b3mb100b_b3mb_100v6_batts','label','Status','vars',{{'name','B3MB_100V6_B1S','var_name','B3MB_100V6_Cmd_S','bit_number',0},{'name','B3MB_100V6_Stat_LED','var_name','B3MB_100V6_LED_S','bit_number',0},{'name','B3MB_100V6_Fault_LED','var_name','B3MB_100V6_LED_S','bit_number',1},{'name','B3MB_100V6_ID_CPU','var_name','B3MB_100V6_LED_S','bit_number',2}});
dfs.plot('b3mb100b_b3mb_100v6_battf','label','Fault','vars',{{'name','B3MB_100V6_B1F','var_name','B3MB_100V6_Cmd_S','bit_number',8}});
dfs.plot('b3mb100b_b3mb_100v6_load', 'label', 'B3MB 100V6 Load', 'plots', {'b3mb100b_b3mb_100v6_loadvv','b3mb100b_b3mb_100v6_loadav','b3mb100b_b3mb_100v6_loads','b3mb100b_b3mb_100v6_loadf'});
dfs.plot('b3mb100b_b3mb_100v6_loadvv','label','Volts 100V6','vars',{'B3MB_100V6_Load1_V','B3MB_100V6_Load2_V','B3MB_100V6_Load3_V','B3MB_100V6_Load4_V'});
dfs.plot('b3mb100b_b3mb_100v6_loadav','label','Amps 100V6','vars',{'B3MB_100V6_Load1_I','B3MB_100V6_Load2_I','B3MB_100V6_Load3_I','B3MB_100V6_Load4_I'});
dfs.plot('b3mb100b_b3mb_100v6_loads','label','Status','vars',{{'name','B3MB_100V6_Load1S','var_name','B3MB_100V6_Cmd_S','bit_number',4},{'name','B3MB_100V6_Load2S','var_name','B3MB_100V6_Cmd_S','bit_number',5},{'name','B3MB_100V6_Load3S','var_name','B3MB_100V6_Cmd_S','bit_number',6},{'name','B3MB_100V6_Load4S','var_name','B3MB_100V6_Cmd_S','bit_number',7}});
dfs.plot('b3mb100b_b3mb_100v6_loadf','label','Fault','vars',{{'name','B3MB_100V6_Load1F','var_name','B3MB_100V6_Cmd_S','bit_number',12},{'name','B3MB_100V6_Load2F','var_name','B3MB_100V6_Cmd_S','bit_number',13},{'name','B3MB_100V6_Load3F','var_name','B3MB_100V6_Cmd_S','bit_number',14},{'name','B3MB_100V6_Load4F','var_name','B3MB_100V6_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb100b_b3mb_100v7_batt', 'label', 'B3MB 100V7 Batt', 'plots', {'b3mb100b_b3mb_100v7_battvv','b3mb100b_b3mb_100v7_battav','b3mb100b_b3mb_100v7_batttv','b3mb100b_b3mb_100v7_batts','b3mb100b_b3mb_100v7_battf'});
dfs.plot('b3mb100b_b3mb_100v7_battvv','label','Volts 100V7','vars',{'B3MB_100V7_Batt1_V','B3MB_100V7_Bus_V'});
dfs.plot('b3mb100b_b3mb_100v7_battav','label','Amps 100V7','vars',{'B3MB_100V7_Batt1_I'});
dfs.plot('b3mb100b_b3mb_100v7_batttv','label','Temp 100V7','vars',{'B3MB_100V7_T1'});
dfs.plot('b3mb100b_b3mb_100v7_batts','label','Status','vars',{{'name','B3MB_100V7_B1S','var_name','B3MB_100V7_Cmd_S','bit_number',0},{'name','B3MB_100V7_Stat_LED','var_name','B3MB_100V7_LED_S','bit_number',0},{'name','B3MB_100V7_Fault_LED','var_name','B3MB_100V7_LED_S','bit_number',1},{'name','B3MB_100V7_ID_CPU','var_name','B3MB_100V7_LED_S','bit_number',2}});
dfs.plot('b3mb100b_b3mb_100v7_battf','label','Fault','vars',{{'name','B3MB_100V7_B1F','var_name','B3MB_100V7_Cmd_S','bit_number',8}});
dfs.plot('b3mb100b_b3mb_100v7_load', 'label', 'B3MB 100V7 Load', 'plots', {'b3mb100b_b3mb_100v7_loadvv','b3mb100b_b3mb_100v7_loadav','b3mb100b_b3mb_100v7_loads','b3mb100b_b3mb_100v7_loadf'});
dfs.plot('b3mb100b_b3mb_100v7_loadvv','label','Volts 100V7','vars',{'B3MB_100V7_Load1_V','B3MB_100V7_Load2_V','B3MB_100V7_Load3_V','B3MB_100V7_Load4_V'});
dfs.plot('b3mb100b_b3mb_100v7_loadav','label','Amps 100V7','vars',{'B3MB_100V7_Load1_I','B3MB_100V7_Load2_I','B3MB_100V7_Load3_I','B3MB_100V7_Load4_I'});
dfs.plot('b3mb100b_b3mb_100v7_loads','label','Status','vars',{{'name','B3MB_100V7_Load1S','var_name','B3MB_100V7_Cmd_S','bit_number',4},{'name','B3MB_100V7_Load2S','var_name','B3MB_100V7_Cmd_S','bit_number',5},{'name','B3MB_100V7_Load3S','var_name','B3MB_100V7_Cmd_S','bit_number',6},{'name','B3MB_100V7_Load4S','var_name','B3MB_100V7_Cmd_S','bit_number',7}});
dfs.plot('b3mb100b_b3mb_100v7_loadf','label','Fault','vars',{{'name','B3MB_100V7_Load1F','var_name','B3MB_100V7_Cmd_S','bit_number',12},{'name','B3MB_100V7_Load2F','var_name','B3MB_100V7_Cmd_S','bit_number',13},{'name','B3MB_100V7_Load3F','var_name','B3MB_100V7_Cmd_S','bit_number',14},{'name','B3MB_100V7_Load4F','var_name','B3MB_100V7_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb100b_b3mb_100v8_batt', 'label', 'B3MB 100V8 Batt', 'plots', {'b3mb100b_b3mb_100v8_battvv','b3mb100b_b3mb_100v8_battav','b3mb100b_b3mb_100v8_batttv','b3mb100b_b3mb_100v8_batts','b3mb100b_b3mb_100v8_battf'});
dfs.plot('b3mb100b_b3mb_100v8_battvv','label','Volts 100V8','vars',{'B3MB_100V8_Batt1_V','B3MB_100V8_Bus_V'});
dfs.plot('b3mb100b_b3mb_100v8_battav','label','Amps 100V8','vars',{'B3MB_100V8_Batt1_I'});
dfs.plot('b3mb100b_b3mb_100v8_batttv','label','Temp 100V8','vars',{'B3MB_100V8_T1'});
dfs.plot('b3mb100b_b3mb_100v8_batts','label','Status','vars',{{'name','B3MB_100V8_B1S','var_name','B3MB_100V8_Cmd_S','bit_number',0},{'name','B3MB_100V8_Stat_LED','var_name','B3MB_100V8_LED_S','bit_number',0},{'name','B3MB_100V8_Fault_LED','var_name','B3MB_100V8_LED_S','bit_number',1},{'name','B3MB_100V8_ID_CPU','var_name','B3MB_100V8_LED_S','bit_number',2}});
dfs.plot('b3mb100b_b3mb_100v8_battf','label','Fault','vars',{{'name','B3MB_100V8_B1F','var_name','B3MB_100V8_Cmd_S','bit_number',8}});
dfs.plot('b3mb100b_b3mb_100v8_load', 'label', 'B3MB 100V8 Load', 'plots', {'b3mb100b_b3mb_100v8_loadvv','b3mb100b_b3mb_100v8_loadav','b3mb100b_b3mb_100v8_loads','b3mb100b_b3mb_100v8_loadf'});
dfs.plot('b3mb100b_b3mb_100v8_loadvv','label','Volts 100V8','vars',{'B3MB_100V8_Load1_V','B3MB_100V8_Load2_V','B3MB_100V8_Load3_V','B3MB_100V8_Load4_V'});
dfs.plot('b3mb100b_b3mb_100v8_loadav','label','Amps 100V8','vars',{'B3MB_100V8_Load1_I','B3MB_100V8_Load2_I','B3MB_100V8_Load3_I','B3MB_100V8_Load4_I'});
dfs.plot('b3mb100b_b3mb_100v8_loads','label','Status','vars',{{'name','B3MB_100V8_Load1S','var_name','B3MB_100V8_Cmd_S','bit_number',4},{'name','B3MB_100V8_Load2S','var_name','B3MB_100V8_Cmd_S','bit_number',5},{'name','B3MB_100V8_Load3S','var_name','B3MB_100V8_Cmd_S','bit_number',6},{'name','B3MB_100V8_Load4S','var_name','B3MB_100V8_Cmd_S','bit_number',7}});
dfs.plot('b3mb100b_b3mb_100v8_loadf','label','Fault','vars',{{'name','B3MB_100V8_Load1F','var_name','B3MB_100V8_Cmd_S','bit_number',12},{'name','B3MB_100V8_Load2F','var_name','B3MB_100V8_Cmd_S','bit_number',13},{'name','B3MB_100V8_Load3F','var_name','B3MB_100V8_Cmd_S','bit_number',14},{'name','B3MB_100V8_Load4F','var_name','B3MB_100V8_Cmd_S','bit_number',15}});
dfs.end_tab;
dfs.end_col;
dfs.resize(context_level);
dfs.set_connection('127.0.0.1', 1080);
if nargout > 0
  dfs_out = dfs;
end
