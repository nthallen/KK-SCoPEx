function dfs_out = rt_scopex(dfs)
% dfs = rt_scopex()
%   Create a data_fields object and setup all the buttons for realtime
%   plots
% dfs_out = rt_scopex(dfs)
%   Use the data_fields object and setup all the buttons for realtime plots
if nargin < 1
  dfs = data_fields('title', 'SCoPEx Platform', ...
    'Color', [.8 .8 1], ...
    'h_leading', 8, 'v_leading', 2, ...
    'btn_fontsize', 12, ...
    'txt_fontsize', 12);
  context_level = dfs.rt_init;
else
  context_level = 1;
end
dfs.start_tab('Main');
dfs.start_col;
dfs.plot('ms', 'label', 'System', 'plots', {'mssws'});
dfs.plot('mssws','label','SW Stat','vars',{'SWStat'});
dfs.plot('gondola','label','Gondola','vars',{'east_m', 'north_m', 'heading', 'Nav_Course', 'Track', 'velocity_forward'}, 'custom_axis', @gondola);
dfs.plot('mtm', 'label', 'T Mbase', 'plots', {'mtmtd','mtmcpu','mtmram','mtmd'});
dfs.plot('mtmtd','label','T Drift','vars',{'SysTDrift'});
dfs.plot('mtmcpu','label','CPU','vars',{'CPU_Pct'});
dfs.plot('mtmram','label','RAM','vars',{'memused'});
dfs.plot('mtmd','label','Disk','vars',{'Disk'});
dfs.end_col;
dfs.start_col;
dfs.plot('mgnsshk', 'label', 'GNSS HK', 'plots', {'mgnsshks','mgnsshkf','mgnsshkd','mgnsshkstd','mgnsshkstale'});
dfs.plot('mgnsshks','label','System','vars',{'system_status'});
dfs.plot('mgnsshkf','label','Filters','vars',{{'name','orient_init','var_name','filter_status','bit_number',0},{'name','nav_init','var_name','filter_status','bit_number',1},{'name','heading_init','var_name','filter_status','bit_number',2},{'name','UTC_init','var_name','filter_status','bit_number',3},{'name','Int_GNSS_en','var_name','filter_status','bit_number',9},{'name','dual_heading_active','var_name','filter_status','bit_number',10},{'name','atm_alt_en','var_name','filter_status','bit_number',12}});
dfs.plot('mgnsshkd','label','Drift','vars',{'nav_drift'});
dfs.plot('mgnsshkstd','label','Std','vars',{'latitude_std','longitude_std','height_std'});
dfs.plot('mgnsshkstale','label','Stale','vars',{'SD_stale','SD_n_reports','SD_nc'});
dfs.end_col;
dfs.start_col;
dfs.plot('mgnss', 'label', 'GNSS', 'plots', {'mgnssll','mgnssa','mgnssp','mgnssv','mgnsst','mgnssaccel','mgnssattitude','mgnssh','mgnssav'});
dfs.plot('mgnssll','label','Lat Lon','vars',{'latitude','longitude'});
dfs.plot('mgnssa','label','Altitude','vars',{'height'});
dfs.plot('mgnssp','label','Position','vars',{'north_m','east_m'});
dfs.plot('mgnssv','label','Velocity','vars',{'velocity_north','velocity_east','velocity_forward','velocity_down'});
dfs.plot('mgnsst','label','Track','vars',{'Track'});
dfs.plot('mgnssaccel','label','Accel','vars',{'body_accel_x','body_accel_y','body_accel_z','g_force'});
dfs.plot('mgnssattitude','label','Attitude','vars',{'roll','pitch'});
dfs.plot('mgnssh','label','Heading','vars',{'heading','Nav_Course'});
dfs.plot('mgnssav','label','Ang Vel','vars',{'angular_velocity_x','angular_velocity_y','angular_velocity_z'});
dfs.end_col;
dfs.start_col;
dfs.plot('ma', 'label', 'Ascender', 'plots', {'map','mas','mac','mal'});
dfs.plot('map','label','Pos','vars',{'AscPosition'});
dfs.plot('mas','label','Speed','vars',{'AscSpeed'});
dfs.plot('mac','label','Cmd','vars',{'AscSpeedCmd'});
dfs.plot('mal','label','Limits','vars',{{'name','AscLimit1','var_name','AscStatus','bit_number',4},{'name','AscLimit2','var_name','AscStatus','bit_number',4}});
dfs.end_col;
dfs.start_col;
dfs.plot('mahk', 'label', 'Asc HK', 'plots', {'mahkv','mahki','mahkci','mahkm','mahkt','mahkn','mahks'});
dfs.plot('mahkv','label','V','vars',{'AscHoistV'});
dfs.plot('mahki','label','I','vars',{'AscHoistI'});
dfs.plot('mahkci','label','Ctrl Inp','vars',{'AscCtrlInp'});
dfs.plot('mahkm','label','Mode','vars',{'AscMode'});
dfs.plot('mahkt','label','Temp','vars',{'AscMtrT','AscMtrCtrlT','AscOutputPulleyT','AscConvT'});
dfs.plot('mahkn','label','Nreports','vars',{'AscNreports'});
dfs.plot('mahks','label','Stale','vars',{'AscStale'});
dfs.end_col;
dfs.start_col;
dfs.plot('mn', 'label', 'Nav', 'plots', {'mng','mnt','mndthrust','mntiming','mns'});
dfs.plot('mng','label','Gains','vars',{'Nav_PGain','Nav_IGain','Nav_DGain'});
dfs.plot('mnt','label','Thrust','vars',{'Nav_Thrust_pct'});
dfs.plot('mndthrust','label','d Thrust','vars',{'Nav_dThrust_pct'});
dfs.plot('mntiming','label','Timing','vars',{'Nav_T_acc','Nav_T_rot'});
dfs.plot('mns','label','Status','vars',{'Nav_Status'});
dfs.end_tab;
dfs.start_tab('Motors');
dfs.start_col;
dfs.plot('mpmc', 'label', 'PMC', 'plots', {'mpmcs'});
dfs.plot('mpmcs','label','Stale','vars',{'PMC_Stale','PMC_StaleF'});
dfs.plot('mpmcl', 'label', 'PMC Left', 'plots', {'mpmclrpm','mpmclc','mpmclv','mpmclp'});
dfs.plot('mpmclrpm','label','RPM','vars',{'PMC_Left_RPM_SP','PMC_Left_RPM_Demand','PMC_Left_RPM'});
dfs.plot('mpmclc','label','Current','vars',{'PMC_Left_I_Demand','PMC_Left_I_Measured'});
dfs.plot('mpmclv','label','Voltage','vars',{'PMC_Left_BusV'});
dfs.plot('mpmclp','label','Position','vars',{'PMC_Left_Pos_SP','PMC_Left_Pos_Demand','PMC_Left_Pos_Target','PMC_Left_Pos_Measured'});
dfs.end_col;
dfs.start_col;
dfs.plot('mpmcls', 'label', 'PMC Left S', 'plots', {'mpmclss','mpmclsstatus1','mpmclsstatus2','mpmclsstatus3','mpmclsstatus4','mpmclsstatus5','mpmclsstatus6'});
dfs.plot('mpmclss','label','Status 0','vars',{{'name','Left_Bridge_En','var_name','PMC_Left_Status0','bit_number',0},{'name','Left_DynBrk_En','var_name','PMC_Left_Status0','bit_number',1},{'name','Left_Stop_En','var_name','PMC_Left_Status0','bit_number',2},{'name','Left_PosStop_En','var_name','PMC_Left_Status0','bit_number',3},{'name','Left_NegStop_En','var_name','PMC_Left_Status0','bit_number',4},{'name','Left_PosTrqInh_In','var_name','PMC_Left_Status0','bit_number',5},{'name','Left_NegTrqInh_En','var_name','PMC_Left_Status0','bit_number',6},{'name','Left_ExtBrk_En','var_name','PMC_Left_Status0','bit_number',7}});
dfs.plot('mpmclsstatus1','label','Status 1','vars',{{'name','Left_DrvReset','var_name','PMC_Left_Status1','bit_number',0},{'name','Left_DrvIntErr','var_name','PMC_Left_Status1','bit_number',1},{'name','Left_ShortCir','var_name','PMC_Left_Status1','bit_number',2},{'name','Left_CurOverShoot','var_name','PMC_Left_Status1','bit_number',3},{'name','Left_DrvUnderV','var_name','PMC_Left_Status1','bit_number',4},{'name','Left_DrvOverV','var_name','PMC_Left_Status1','bit_number',5},{'name','Left_DrvOverT','var_name','PMC_Left_Status1','bit_number',6}});
dfs.plot('mpmclsstatus2','label','Status 2','vars',{{'name','Left_ParRestoreErr','var_name','PMC_Left_Status2','bit_number',0},{'name','Left_ParStoreErr','var_name','PMC_Left_Status2','bit_number',1},{'name','Left_InvHallState','var_name','PMC_Left_Status2','bit_number',2},{'name','Left_PhaseSyncErr','var_name','PMC_Left_Status2','bit_number',3},{'name','Left_MotorOverT','var_name','PMC_Left_Status2','bit_number',4},{'name','Left_PhaseDetFault','var_name','PMC_Left_Status2','bit_number',5},{'name','Left_FBSensorErr','var_name','PMC_Left_Status2','bit_number',6},{'name','Left_MotorOverSpeed','var_name','PMC_Left_Status2','bit_number',7},{'name','Left_MaxMeasuredPos','var_name','PMC_Left_Status2','bit_number',8},{'name','Left_MinMeasuredPos','var_name','PMC_Left_Status2','bit_number',9},{'name','Left_CommError','var_name','PMC_Left_Status2','bit_number',10},{'name','Left_PWMBrokenWire','var_name','PMC_Left_Status2','bit_number',11},{'name','Left_MotionEngErr','var_name','PMC_Left_Status2','bit_number',12},{'name','Left_MotionEngAbrt','var_name','PMC_Left_Status2','bit_number',13}});
dfs.plot('mpmclsstatus3','label','Status 3','vars',{{'name','Left_LogEntryMissed','var_name','PMC_Left_Status3','bit_number',0},{'name','Left_SWDisable','var_name','PMC_Left_Status3','bit_number',1},{'name','Left_UserDisable','var_name','PMC_Left_Status3','bit_number',2},{'name','Left_UserPosInh','var_name','PMC_Left_Status3','bit_number',3},{'name','Left_UserNegInh','var_name','PMC_Left_Status3','bit_number',4},{'name','Left_CurLimiting','var_name','PMC_Left_Status3','bit_number',5},{'name','Left_ContCurFoldback','var_name','PMC_Left_Status3','bit_number',6},{'name','Left_CurLoopSat','var_name','PMC_Left_Status3','bit_number',7},{'name','Left_UserUnderV','var_name','PMC_Left_Status3','bit_number',8},{'name','Left_UserOverV','var_name','PMC_Left_Status3','bit_number',9},{'name','Left_NonSinComm','var_name','PMC_Left_Status3','bit_number',10},{'name','Left_PhaseDetectActive','var_name','PMC_Left_Status3','bit_number',11},{'name','Left_MotionEngActive','var_name','PMC_Left_Status3','bit_number',12},{'name','Left_UserAuxDisable','var_name','PMC_Left_Status3','bit_number',13},{'name','Left_ShuntRegActive','var_name','PMC_Left_Status3','bit_number',14},{'name','Left_PhaseDetectDone','var_name','PMC_Left_Status3','bit_number',15}});
dfs.plot('mpmclsstatus4','label','Status 4','vars',{{'name','Left_ZeroVel','var_name','PMC_Left_Status4','bit_number',0},{'name','Left_AtCommand','var_name','PMC_Left_Status4','bit_number',1},{'name','Left_VelFollErr','var_name','PMC_Left_Status4','bit_number',2},{'name','Left_PosTargVelLim','var_name','PMC_Left_Status4','bit_number',3},{'name','Left_NegTargVelLim','var_name','PMC_Left_Status4','bit_number',4},{'name','Left_CmdLimiterAct','var_name','PMC_Left_Status4','bit_number',5},{'name','Left_InHomPos','var_name','PMC_Left_Status4','bit_number',6},{'name','Left_PosFollErr','var_name','PMC_Left_Status4','bit_number',7},{'name','Left_MaxTargPosLim','var_name','PMC_Left_Status4','bit_number',8},{'name','Left_MinTargPosLim','var_name','PMC_Left_Status4','bit_number',9},{'name','Left_SetPosActive','var_name','PMC_Left_Status4','bit_number',10},{'name','Left_HomingActive','var_name','PMC_Left_Status4','bit_number',12},{'name','Left_SafeTrqOff','var_name','PMC_Left_Status4','bit_number',13},{'name','Left_HomingDone','var_name','PMC_Left_Status4','bit_number',14},{'name','Left_ZeroPos','var_name','PMC_Left_Status4','bit_number',15}});
dfs.plot('mpmclsstatus5','label','Status 5','vars',{{'name','Left_CmddStop','var_name','PMC_Left_Status5','bit_number',6},{'name','Left_UserStop','var_name','PMC_Left_Status5','bit_number',7},{'name','Left_Cap1Active','var_name','PMC_Left_Status5','bit_number',8},{'name','Left_Cap2Active','var_name','PMC_Left_Status5','bit_number',9},{'name','Left_Cap3Active','var_name','PMC_Left_Status5','bit_number',10},{'name','Left_CmddPosLim','var_name','PMC_Left_Status5','bit_number',11},{'name','Left_CmddNegLim','var_name','PMC_Left_Status5','bit_number',12}});
dfs.plot('mpmclsstatus6','label','Status 6','vars',{{'name','Left_AbsPosValid','var_name','PMC_Left_Status6','bit_number',0},{'name','Left_PosStopActive','var_name','PMC_Left_Status6','bit_number',1},{'name','Left_NegStopActive','var_name','PMC_Left_Status6','bit_number',2},{'name','Left_ConfigSelect','var_name','PMC_Left_Status6','bit_number',4},{'name','Left_BrakeCommand','var_name','PMC_Left_Status6','bit_number',5},{'name','Left_DigOut1','var_name','PMC_Left_Status6','bit_number',6},{'name','Left_DigOut2','var_name','PMC_Left_Status6','bit_number',7}});
dfs.plot('mpmclg', 'label', 'PMC Left G', 'plots', {'mpmclgg'});
dfs.plot('mpmclgg','label','Gains','vars',{'PMC_Left_VL_Kp','PMC_Left_VL_Ki','PMC_Left_VL_Kd','PMC_Left_TCL_Kp','PMC_Left_TCL_Ki'});
dfs.end_col;
dfs.start_col;
dfs.plot('mpmcr', 'label', 'PMC Right', 'plots', {'mpmcrrpm','mpmcrc','mpmcrv','mpmcrp'});
dfs.plot('mpmcrrpm','label','RPM','vars',{'PMC_Right_RPM_SP','PMC_Right_RPM_Demand','PMC_Right_RPM'});
dfs.plot('mpmcrc','label','Current','vars',{'PMC_Right_I_Demand','PMC_Right_I_Measured'});
dfs.plot('mpmcrv','label','Voltage','vars',{'PMC_Right_BusV'});
dfs.plot('mpmcrp','label','Position','vars',{'PMC_Right_Pos_SP','PMC_Right_Pos_Demand','PMC_Right_Pos_Target','PMC_Right_Pos_Measured'});
dfs.end_col;
dfs.start_col;
dfs.plot('mpmcrs', 'label', 'PMC Right S', 'plots', {'mpmcrss','mpmcrsstatus1','mpmcrsstatus2','mpmcrsstatus3','mpmcrsstatus4','mpmcrsstatus5','mpmcrsstatus6'});
dfs.plot('mpmcrss','label','Status 0','vars',{{'name','Right_Bridge_En','var_name','PMC_Right_Status0','bit_number',0},{'name','Right_DynBrk_En','var_name','PMC_Right_Status0','bit_number',1},{'name','Right_Stop_En','var_name','PMC_Right_Status0','bit_number',2},{'name','Right_PosStop_En','var_name','PMC_Right_Status0','bit_number',3},{'name','Right_NegStop_En','var_name','PMC_Right_Status0','bit_number',4},{'name','Right_PosTrqInh_In','var_name','PMC_Right_Status0','bit_number',5},{'name','Right_NegTrqInh_En','var_name','PMC_Right_Status0','bit_number',6},{'name','Right_ExtBrk_En','var_name','PMC_Right_Status0','bit_number',7}});
dfs.plot('mpmcrsstatus1','label','Status 1','vars',{{'name','Right_DrvReset','var_name','PMC_Right_Status1','bit_number',0},{'name','Right_DrvIntErr','var_name','PMC_Right_Status1','bit_number',1},{'name','Right_ShortCir','var_name','PMC_Right_Status1','bit_number',2},{'name','Right_CurOverShoot','var_name','PMC_Right_Status1','bit_number',3},{'name','Right_DrvUnderV','var_name','PMC_Right_Status1','bit_number',4},{'name','Right_DrvOverV','var_name','PMC_Right_Status1','bit_number',5},{'name','Right_DrvOverT','var_name','PMC_Right_Status1','bit_number',6}});
dfs.plot('mpmcrsstatus2','label','Status 2','vars',{{'name','Right_ParRestoreErr','var_name','PMC_Right_Status2','bit_number',0},{'name','Right_ParStoreErr','var_name','PMC_Right_Status2','bit_number',1},{'name','Right_InvHallState','var_name','PMC_Right_Status2','bit_number',2},{'name','Right_PhaseSyncErr','var_name','PMC_Right_Status2','bit_number',3},{'name','Right_MotorOverT','var_name','PMC_Right_Status2','bit_number',4},{'name','Right_PhaseDetFault','var_name','PMC_Right_Status2','bit_number',5},{'name','Right_FBSensorErr','var_name','PMC_Right_Status2','bit_number',6},{'name','Right_MotorOverSpeed','var_name','PMC_Right_Status2','bit_number',7},{'name','Right_MaxMeasuredPos','var_name','PMC_Right_Status2','bit_number',8},{'name','Right_MinMeasuredPos','var_name','PMC_Right_Status2','bit_number',9},{'name','Right_CommError','var_name','PMC_Right_Status2','bit_number',10},{'name','Right_PWMBrokenWire','var_name','PMC_Right_Status2','bit_number',11},{'name','Right_MotionEngErr','var_name','PMC_Right_Status2','bit_number',12},{'name','Right_MotionEngAbrt','var_name','PMC_Right_Status2','bit_number',13}});
dfs.plot('mpmcrsstatus3','label','Status 3','vars',{{'name','Right_LogEntryMissed','var_name','PMC_Right_Status3','bit_number',0},{'name','Right_SWDisable','var_name','PMC_Right_Status3','bit_number',1},{'name','Right_UserDisable','var_name','PMC_Right_Status3','bit_number',2},{'name','Right_UserPosInh','var_name','PMC_Right_Status3','bit_number',3},{'name','Right_UserNegInh','var_name','PMC_Right_Status3','bit_number',4},{'name','Right_CurLimiting','var_name','PMC_Right_Status3','bit_number',5},{'name','Right_ContCurFoldback','var_name','PMC_Right_Status3','bit_number',6},{'name','Right_CurLoopSat','var_name','PMC_Right_Status3','bit_number',7},{'name','Right_UserUnderV','var_name','PMC_Right_Status3','bit_number',8},{'name','Right_UserOverV','var_name','PMC_Right_Status3','bit_number',9},{'name','Right_NonSinComm','var_name','PMC_Right_Status3','bit_number',10},{'name','Right_PhaseDetectActive','var_name','PMC_Right_Status3','bit_number',11},{'name','Right_MotionEngActive','var_name','PMC_Right_Status3','bit_number',12},{'name','Right_UserAuxDisable','var_name','PMC_Right_Status3','bit_number',13},{'name','Right_ShuntRegActive','var_name','PMC_Right_Status3','bit_number',14},{'name','Right_PhaseDetectDone','var_name','PMC_Right_Status3','bit_number',15}});
dfs.plot('mpmcrsstatus4','label','Status 4','vars',{{'name','Right_ZeroVel','var_name','PMC_Right_Status4','bit_number',0},{'name','Right_AtCommand','var_name','PMC_Right_Status4','bit_number',1},{'name','Right_VelFollErr','var_name','PMC_Right_Status4','bit_number',2},{'name','Right_PosTargVelLim','var_name','PMC_Right_Status4','bit_number',3},{'name','Right_NegTargVelLim','var_name','PMC_Right_Status4','bit_number',4},{'name','Right_CmdLimiterAct','var_name','PMC_Right_Status4','bit_number',5},{'name','Right_InHomPos','var_name','PMC_Right_Status4','bit_number',6},{'name','Right_PosFollErr','var_name','PMC_Right_Status4','bit_number',7},{'name','Right_MaxTargPosLim','var_name','PMC_Right_Status4','bit_number',8},{'name','Right_MinTargPosLim','var_name','PMC_Right_Status4','bit_number',9},{'name','Right_SetPosActive','var_name','PMC_Right_Status4','bit_number',10},{'name','Right_HomingActive','var_name','PMC_Right_Status4','bit_number',12},{'name','Right_SafeTrqOff','var_name','PMC_Right_Status4','bit_number',13},{'name','Right_HomingDone','var_name','PMC_Right_Status4','bit_number',14},{'name','Right_ZeroPos','var_name','PMC_Right_Status4','bit_number',15}});
dfs.plot('mpmcrsstatus5','label','Status 5','vars',{{'name','Right_CmddStop','var_name','PMC_Right_Status5','bit_number',6},{'name','Right_UserStop','var_name','PMC_Right_Status5','bit_number',7},{'name','Right_Cap1Active','var_name','PMC_Right_Status5','bit_number',8},{'name','Right_Cap2Active','var_name','PMC_Right_Status5','bit_number',9},{'name','Right_Cap3Active','var_name','PMC_Right_Status5','bit_number',10},{'name','Right_CmddPosLim','var_name','PMC_Right_Status5','bit_number',11},{'name','Right_CmddNegLim','var_name','PMC_Right_Status5','bit_number',12}});
dfs.plot('mpmcrsstatus6','label','Status 6','vars',{{'name','Right_AbsPosValid','var_name','PMC_Right_Status6','bit_number',0},{'name','Right_PosStopActive','var_name','PMC_Right_Status6','bit_number',1},{'name','Right_NegStopActive','var_name','PMC_Right_Status6','bit_number',2},{'name','Right_ConfigSelect','var_name','PMC_Right_Status6','bit_number',4},{'name','Right_BrakeCommand','var_name','PMC_Right_Status6','bit_number',5},{'name','Right_DigOut1','var_name','PMC_Right_Status6','bit_number',6},{'name','Right_DigOut2','var_name','PMC_Right_Status6','bit_number',7}});
dfs.plot('mpmcrg', 'label', 'PMC Right G', 'plots', {'mpmcrgg'});
dfs.plot('mpmcrgg','label','Gains','vars',{'PMC_Right_VL_Kp','PMC_Right_VL_Ki','PMC_Right_VL_Kd','PMC_Right_TCL_Kp','PMC_Right_TCL_Ki'});
dfs.end_tab;
dfs.start_tab('B3MB');
dfs.start_col;
dfs.plot('bmbbmbvb', 'label', 'B3MB 28V1 Batt', 'plots', {'bmbbmbvbvv','bmbbmbvbav','bmbbmbvbtv','bmbbmbvbs','bmbbmbvbf'});
dfs.plot('bmbbmbvbvv','label','Volts 28V1','vars',{'B3MB_28V1_Batt1_V','B3MB_28V1_Batt2_V','B3MB_28V1_Batt3_V','B3MB_28V1_Batt4_V','B3MB_28V1_Bus_V'});
dfs.plot('bmbbmbvbav','label','Amps 28V1','vars',{'B3MB_28V1_Batt1_I','B3MB_28V1_Batt2_I','B3MB_28V1_Batt3_I','B3MB_28V1_Batt4_I'});
dfs.plot('bmbbmbvbtv','label','Temp 28V1','vars',{'B3MB_28V1_T1','B3MB_28V1_T2','B3MB_28V1_T3','B3MB_28V1_T4','B3MB_28V1_T5'});
dfs.plot('bmbbmbvbs','label','Status','vars',{{'name','B3MB_28V1_B1S','var_name','B3MB_28V1_Cmd_S','bit_number',0},{'name','B3MB_28V1_B2S','var_name','B3MB_28V1_Cmd_S','bit_number',1},{'name','B3MB_28V1_B3S','var_name','B3MB_28V1_Cmd_S','bit_number',2},{'name','B3MB_28V1_B4S','var_name','B3MB_28V1_Cmd_S','bit_number',3},{'name','B3MB_28V1_Stat_LED','var_name','B3MB_28V1_LED_S','bit_number',0},{'name','B3MB_28V1_Fault_LED','var_name','B3MB_28V1_LED_S','bit_number',1},{'name','B3MB_28V1_ID_CPU','var_name','B3MB_28V1_LED_S','bit_number',2}});
dfs.plot('bmbbmbvbf','label','Fault','vars',{{'name','B3MB_28V1_B1F','var_name','B3MB_28V1_Cmd_S','bit_number',8},{'name','B3MB_28V1_B2F','var_name','B3MB_28V1_Cmd_S','bit_number',9},{'name','B3MB_28V1_B3F','var_name','B3MB_28V1_Cmd_S','bit_number',10},{'name','B3MB_28V1_B4F','var_name','B3MB_28V1_Cmd_S','bit_number',11}});
dfs.plot('bmbbmbvl', 'label', 'B3MB 28V1 Load', 'plots', {'bmbbmbvlvv','bmbbmbvlav','bmbbmbvls','bmbbmbvlf'});
dfs.plot('bmbbmbvlvv','label','Volts 28V1','vars',{'EngPort28_V','B3MB_28V1_Load2_V','EngStbd28_V','DataSys28_V'});
dfs.plot('bmbbmbvlav','label','Amps 28V1','vars',{'EngPort28_I','B3MB_28V1_Load2_I','EngStbd28_I','DataSys28_I'});
dfs.plot('bmbbmbvls','label','Status','vars',{{'name','EngPort28S','var_name','B3MB_28V1_Cmd_S','bit_number',4},{'name','B3MB_28V1_Load2S','var_name','B3MB_28V1_Cmd_S','bit_number',5},{'name','EngStbd28S','var_name','B3MB_28V1_Cmd_S','bit_number',6},{'name','DataSys28S','var_name','B3MB_28V1_Cmd_S','bit_number',7}});
dfs.plot('bmbbmbvlf','label','Fault','vars',{{'name','EngPort28F','var_name','B3MB_28V1_Cmd_S','bit_number',12},{'name','B3MB_28V1_Load2F','var_name','B3MB_28V1_Cmd_S','bit_number',13},{'name','EngStbd28F','var_name','B3MB_28V1_Cmd_S','bit_number',14},{'name','DataSys28F','var_name','B3MB_28V1_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb_b3mb_28v2_batt', 'label', 'B3MB 28V2 Batt', 'plots', {'b3mb_b3mb_28v2_battvv','b3mb_b3mb_28v2_battav','b3mb_b3mb_28v2_batttv','b3mb_b3mb_28v2_batts','b3mb_b3mb_28v2_battf'});
dfs.plot('b3mb_b3mb_28v2_battvv','label','Volts 28V2','vars',{'B3MB_28V2_Batt1_V','B3MB_28V2_Batt2_V','B3MB_28V2_Batt3_V','B3MB_28V2_Batt4_V','B3MB_28V2_Bus_V'});
dfs.plot('b3mb_b3mb_28v2_battav','label','Amps 28V2','vars',{'B3MB_28V2_Batt1_I','B3MB_28V2_Batt2_I','B3MB_28V2_Batt3_I','B3MB_28V2_Batt4_I'});
dfs.plot('b3mb_b3mb_28v2_batttv','label','Temp 28V2','vars',{'B3MB_28V2_T1','B3MB_28V2_T2','B3MB_28V2_T3','B3MB_28V2_T4','B3MB_28V2_T5'});
dfs.plot('b3mb_b3mb_28v2_batts','label','Status','vars',{{'name','B3MB_28V2_B1S','var_name','B3MB_28V2_Cmd_S','bit_number',0},{'name','B3MB_28V2_B2S','var_name','B3MB_28V2_Cmd_S','bit_number',1},{'name','B3MB_28V2_B3S','var_name','B3MB_28V2_Cmd_S','bit_number',2},{'name','B3MB_28V2_B4S','var_name','B3MB_28V2_Cmd_S','bit_number',3},{'name','B3MB_28V2_Stat_LED','var_name','B3MB_28V2_LED_S','bit_number',0},{'name','B3MB_28V2_Fault_LED','var_name','B3MB_28V2_LED_S','bit_number',1},{'name','B3MB_28V2_ID_CPU','var_name','B3MB_28V2_LED_S','bit_number',2}});
dfs.plot('b3mb_b3mb_28v2_battf','label','Fault','vars',{{'name','B3MB_28V2_B1F','var_name','B3MB_28V2_Cmd_S','bit_number',8},{'name','B3MB_28V2_B2F','var_name','B3MB_28V2_Cmd_S','bit_number',9},{'name','B3MB_28V2_B3F','var_name','B3MB_28V2_Cmd_S','bit_number',10},{'name','B3MB_28V2_B4F','var_name','B3MB_28V2_Cmd_S','bit_number',11}});
dfs.plot('b3mb_b3mb_28v2_load', 'label', 'B3MB 28V2 Load', 'plots', {'b3mb_b3mb_28v2_loadvv','b3mb_b3mb_28v2_loadav','b3mb_b3mb_28v2_loads','b3mb_b3mb_28v2_loadf'});
dfs.plot('b3mb_b3mb_28v2_loadvv','label','Volts 28V2','vars',{'B3MB_28V2_Load1_V','B3MB_28V2_Load2_V','B3MB_28V2_Load3_V','B3MB_28V2_Load4_V'});
dfs.plot('b3mb_b3mb_28v2_loadav','label','Amps 28V2','vars',{'B3MB_28V2_Load1_I','B3MB_28V2_Load2_I','B3MB_28V2_Load3_I','B3MB_28V2_Load4_I'});
dfs.plot('b3mb_b3mb_28v2_loads','label','Status','vars',{{'name','B3MB_28V2_Load1S','var_name','B3MB_28V2_Cmd_S','bit_number',4},{'name','B3MB_28V2_Load2S','var_name','B3MB_28V2_Cmd_S','bit_number',5},{'name','B3MB_28V2_Load3S','var_name','B3MB_28V2_Cmd_S','bit_number',6},{'name','B3MB_28V2_Load4S','var_name','B3MB_28V2_Cmd_S','bit_number',7}});
dfs.plot('b3mb_b3mb_28v2_loadf','label','Fault','vars',{{'name','B3MB_28V2_Load1F','var_name','B3MB_28V2_Cmd_S','bit_number',12},{'name','B3MB_28V2_Load2F','var_name','B3MB_28V2_Cmd_S','bit_number',13},{'name','B3MB_28V2_Load3F','var_name','B3MB_28V2_Cmd_S','bit_number',14},{'name','B3MB_28V2_Load4F','var_name','B3MB_28V2_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb_b3mb_100v1_batt', 'label', 'B3MB 100V1 Batt', 'plots', {'b3mb_b3mb_100v1_battvv','b3mb_b3mb_100v1_battav','b3mb_b3mb_100v1_batttv','b3mb_b3mb_100v1_batts','b3mb_b3mb_100v1_battf'});
dfs.plot('b3mb_b3mb_100v1_battvv','label','Volts 100V1','vars',{'B3MB_100V1_Batt1_V','B3MB_100V1_Bus_V'});
dfs.plot('b3mb_b3mb_100v1_battav','label','Amps 100V1','vars',{'B3MB_100V1_Batt1_I'});
dfs.plot('b3mb_b3mb_100v1_batttv','label','Temp 100V1','vars',{'B3MB_100V1_T1','B3MB_100V1_T2','B3MB_100V1_T3','B3MB_100V1_T4','B3MB_100V1_T5'});
dfs.plot('b3mb_b3mb_100v1_batts','label','Status','vars',{{'name','B3MB_100V1_B1S','var_name','B3MB_100V1_Cmd_S','bit_number',0},{'name','B3MB_100V1_Stat_LED','var_name','B3MB_100V1_LED_S','bit_number',0},{'name','B3MB_100V1_Fault_LED','var_name','B3MB_100V1_LED_S','bit_number',1},{'name','B3MB_100V1_ID_CPU','var_name','B3MB_100V1_LED_S','bit_number',2}});
dfs.plot('b3mb_b3mb_100v1_battf','label','Fault','vars',{{'name','B3MB_100V1_B1F','var_name','B3MB_100V1_Cmd_S','bit_number',8}});
dfs.plot('b3mb_b3mb_100v1_load', 'label', 'B3MB 100V1 Load', 'plots', {'b3mb_b3mb_100v1_loadvv','b3mb_b3mb_100v1_loadav','b3mb_b3mb_100v1_loads','b3mb_b3mb_100v1_loadf'});
dfs.plot('b3mb_b3mb_100v1_loadvv','label','Volts 100V1','vars',{'B3MB_100V1_Load1_V','B3MB_100V1_Load2_V','EngPort100_V','AscSec1_V'});
dfs.plot('b3mb_b3mb_100v1_loadav','label','Amps 100V1','vars',{'B3MB_100V1_Load1_I','B3MB_100V1_Load2_I','EngPort100_I','AscSec1_I'});
dfs.plot('b3mb_b3mb_100v1_loads','label','Status','vars',{{'name','B3MB_100V1_Load1S','var_name','B3MB_100V1_Cmd_S','bit_number',4},{'name','B3MB_100V1_Load2S','var_name','B3MB_100V1_Cmd_S','bit_number',5},{'name','EngPort100S','var_name','B3MB_100V1_Cmd_S','bit_number',6},{'name','AscSec1S','var_name','B3MB_100V1_Cmd_S','bit_number',7}});
dfs.plot('b3mb_b3mb_100v1_loadf','label','Fault','vars',{{'name','B3MB_100V1_Load1F','var_name','B3MB_100V1_Cmd_S','bit_number',12},{'name','B3MB_100V1_Load2F','var_name','B3MB_100V1_Cmd_S','bit_number',13},{'name','EngPort100F','var_name','B3MB_100V1_Cmd_S','bit_number',14},{'name','AscSec1F','var_name','B3MB_100V1_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb_b3mb_100v2_batt', 'label', 'B3MB 100V2 Batt', 'plots', {'b3mb_b3mb_100v2_battvv','b3mb_b3mb_100v2_battav','b3mb_b3mb_100v2_batttv','b3mb_b3mb_100v2_batts','b3mb_b3mb_100v2_battf'});
dfs.plot('b3mb_b3mb_100v2_battvv','label','Volts 100V2','vars',{'B3MB_100V2_Batt1_V','B3MB_100V2_Bus_V'});
dfs.plot('b3mb_b3mb_100v2_battav','label','Amps 100V2','vars',{'B3MB_100V2_Batt1_I'});
dfs.plot('b3mb_b3mb_100v2_batttv','label','Temp 100V2','vars',{'B3MB_100V2_T1','B3MB_100V2_T2','B3MB_100V2_T3','B3MB_100V2_T4','B3MB_100V2_T5'});
dfs.plot('b3mb_b3mb_100v2_batts','label','Status','vars',{{'name','B3MB_100V2_B1S','var_name','B3MB_100V2_Cmd_S','bit_number',0},{'name','B3MB_100V2_Stat_LED','var_name','B3MB_100V2_LED_S','bit_number',0},{'name','B3MB_100V2_Fault_LED','var_name','B3MB_100V2_LED_S','bit_number',1},{'name','B3MB_100V2_ID_CPU','var_name','B3MB_100V2_LED_S','bit_number',2}});
dfs.plot('b3mb_b3mb_100v2_battf','label','Fault','vars',{{'name','B3MB_100V2_B1F','var_name','B3MB_100V2_Cmd_S','bit_number',8}});
dfs.plot('b3mb_b3mb_100v2_load', 'label', 'B3MB 100V2 Load', 'plots', {'b3mb_b3mb_100v2_loadvv','b3mb_b3mb_100v2_loadav','b3mb_b3mb_100v2_loads','b3mb_b3mb_100v2_loadf'});
dfs.plot('b3mb_b3mb_100v2_loadvv','label','Volts 100V2','vars',{'AscRes1_V','AscPri1_V','B3MB_100V2_Load3_V','B3MB_100V2_Load4_V'});
dfs.plot('b3mb_b3mb_100v2_loadav','label','Amps 100V2','vars',{'AscRes1_I','AscPri1_I','B3MB_100V2_Load3_I','B3MB_100V2_Load4_I'});
dfs.plot('b3mb_b3mb_100v2_loads','label','Status','vars',{{'name','AscRes1S','var_name','B3MB_100V2_Cmd_S','bit_number',4},{'name','AscPri1S','var_name','B3MB_100V2_Cmd_S','bit_number',5},{'name','B3MB_100V2_Load3S','var_name','B3MB_100V2_Cmd_S','bit_number',6},{'name','B3MB_100V2_Load4S','var_name','B3MB_100V2_Cmd_S','bit_number',7}});
dfs.plot('b3mb_b3mb_100v2_loadf','label','Fault','vars',{{'name','AscRes1F','var_name','B3MB_100V2_Cmd_S','bit_number',12},{'name','AscPri1F','var_name','B3MB_100V2_Cmd_S','bit_number',13},{'name','B3MB_100V2_Load3F','var_name','B3MB_100V2_Cmd_S','bit_number',14},{'name','B3MB_100V2_Load4F','var_name','B3MB_100V2_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb_b3mb_100v3_batt', 'label', 'B3MB 100V3 Batt', 'plots', {'b3mb_b3mb_100v3_battvv','b3mb_b3mb_100v3_battav','b3mb_b3mb_100v3_batttv','b3mb_b3mb_100v3_batts','b3mb_b3mb_100v3_battf'});
dfs.plot('b3mb_b3mb_100v3_battvv','label','Volts 100V3','vars',{'B3MB_100V3_Batt1_V','B3MB_100V3_Bus_V'});
dfs.plot('b3mb_b3mb_100v3_battav','label','Amps 100V3','vars',{'B3MB_100V3_Batt1_I'});
dfs.plot('b3mb_b3mb_100v3_batttv','label','Temp 100V3','vars',{'B3MB_100V3_T1','B3MB_100V3_T2','B3MB_100V3_T3','B3MB_100V3_T4','B3MB_100V3_T5'});
dfs.plot('b3mb_b3mb_100v3_batts','label','Status','vars',{{'name','B3MB_100V3_B1S','var_name','B3MB_100V3_Cmd_S','bit_number',0},{'name','B3MB_100V3_Stat_LED','var_name','B3MB_100V3_LED_S','bit_number',0},{'name','B3MB_100V3_Fault_LED','var_name','B3MB_100V3_LED_S','bit_number',1},{'name','B3MB_100V3_ID_CPU','var_name','B3MB_100V3_LED_S','bit_number',2}});
dfs.plot('b3mb_b3mb_100v3_battf','label','Fault','vars',{{'name','B3MB_100V3_B1F','var_name','B3MB_100V3_Cmd_S','bit_number',8}});
dfs.plot('b3mb_b3mb_100v3_load', 'label', 'B3MB 100V3 Load', 'plots', {'b3mb_b3mb_100v3_loadvv','b3mb_b3mb_100v3_loadav','b3mb_b3mb_100v3_loads','b3mb_b3mb_100v3_loadf'});
dfs.plot('b3mb_b3mb_100v3_loadvv','label','Volts 100V3','vars',{'AscRes2_V','AscPri2_V','B3MB_100V3_Load3_V','B3MB_100V3_Load4_V'});
dfs.plot('b3mb_b3mb_100v3_loadav','label','Amps 100V3','vars',{'AscRes2_I','AscPri2_I','B3MB_100V3_Load3_I','B3MB_100V3_Load4_I'});
dfs.plot('b3mb_b3mb_100v3_loads','label','Status','vars',{{'name','AscRes2S','var_name','B3MB_100V3_Cmd_S','bit_number',4},{'name','AscPri2S','var_name','B3MB_100V3_Cmd_S','bit_number',5},{'name','B3MB_100V3_Load3S','var_name','B3MB_100V3_Cmd_S','bit_number',6},{'name','B3MB_100V3_Load4S','var_name','B3MB_100V3_Cmd_S','bit_number',7}});
dfs.plot('b3mb_b3mb_100v3_loadf','label','Fault','vars',{{'name','AscRes2F','var_name','B3MB_100V3_Cmd_S','bit_number',12},{'name','AscPri2F','var_name','B3MB_100V3_Cmd_S','bit_number',13},{'name','B3MB_100V3_Load3F','var_name','B3MB_100V3_Cmd_S','bit_number',14},{'name','B3MB_100V3_Load4F','var_name','B3MB_100V3_Cmd_S','bit_number',15}});
dfs.end_col;
dfs.start_col;
dfs.plot('b3mb_b3mb_100v4_batt', 'label', 'B3MB 100V4 Batt', 'plots', {'b3mb_b3mb_100v4_battvv','b3mb_b3mb_100v4_battav','b3mb_b3mb_100v4_batttv','b3mb_b3mb_100v4_batts','b3mb_b3mb_100v4_battf'});
dfs.plot('b3mb_b3mb_100v4_battvv','label','Volts 100V4','vars',{'B3MB_100V4_Batt1_V','B3MB_100V4_Bus_V'});
dfs.plot('b3mb_b3mb_100v4_battav','label','Amps 100V4','vars',{'B3MB_100V4_Batt1_I'});
dfs.plot('b3mb_b3mb_100v4_batttv','label','Temp 100V4','vars',{'B3MB_100V4_T1','B3MB_100V4_T2','B3MB_100V4_T3','B3MB_100V4_T4','B3MB_100V4_T5'});
dfs.plot('b3mb_b3mb_100v4_batts','label','Status','vars',{{'name','B3MB_100V4_B1S','var_name','B3MB_100V4_Cmd_S','bit_number',0},{'name','B3MB_100V4_Stat_LED','var_name','B3MB_100V4_LED_S','bit_number',0},{'name','B3MB_100V4_Fault_LED','var_name','B3MB_100V4_LED_S','bit_number',1},{'name','B3MB_100V4_ID_CPU','var_name','B3MB_100V4_LED_S','bit_number',2}});
dfs.plot('b3mb_b3mb_100v4_battf','label','Fault','vars',{{'name','B3MB_100V4_B1F','var_name','B3MB_100V4_Cmd_S','bit_number',8}});
dfs.plot('b3mb_b3mb_100v4_load', 'label', 'B3MB 100V4 Load', 'plots', {'b3mb_b3mb_100v4_loadvv','b3mb_b3mb_100v4_loadav','b3mb_b3mb_100v4_loads','b3mb_b3mb_100v4_loadf'});
dfs.plot('b3mb_b3mb_100v4_loadvv','label','Volts 100V4','vars',{'B3MB_100V4_Load1_V','B3MB_100V4_Load2_V','EngStbd100_V','AscSec2_V'});
dfs.plot('b3mb_b3mb_100v4_loadav','label','Amps 100V4','vars',{'B3MB_100V4_Load1_I','B3MB_100V4_Load2_I','EngStbd100_I','AscSec2_I'});
dfs.plot('b3mb_b3mb_100v4_loads','label','Status','vars',{{'name','B3MB_100V4_Load1S','var_name','B3MB_100V4_Cmd_S','bit_number',4},{'name','B3MB_100V4_Load2S','var_name','B3MB_100V4_Cmd_S','bit_number',5},{'name','EngStbd100S','var_name','B3MB_100V4_Cmd_S','bit_number',6},{'name','AscSec2S','var_name','B3MB_100V4_Cmd_S','bit_number',7}});
dfs.plot('b3mb_b3mb_100v4_loadf','label','Fault','vars',{{'name','B3MB_100V4_Load1F','var_name','B3MB_100V4_Cmd_S','bit_number',12},{'name','B3MB_100V4_Load2F','var_name','B3MB_100V4_Cmd_S','bit_number',13},{'name','EngStbd100F','var_name','B3MB_100V4_Cmd_S','bit_number',14},{'name','AscSec2F','var_name','B3MB_100V4_Cmd_S','bit_number',15}});
dfs.end_tab;
dfs.end_col;
dfs.resize(context_level);
dfs.set_connection('127.0.0.1', 1080);
if nargout > 0
  dfs_out = dfs;
end