tmcbase = base.tmc
Module Nav mode=types
swsbase = scopex.sws
swsbase = pmc.sws
cmdbase = scopex.cmd
cmdbase = B3MB_map.cmd
cmdbase = cmd_tx.cmd
genuibase = scopex.genui

Module Version src=scopex.ver
Module TMbase mode=ignore Panel=Main:
Module Command_SN Panel=Cmd:

Module PropMtr ID=Left  IDX=0 ADDR=63 FAST=2 SLOW=1 HOME=700 mode=types Panel=Motors:
# Will try  RPMSGN=:*(-1) to make RPM positive. Works for ui_, not for rt_ yet
Module PropMtr ID=Right IDX=1 ADDR=62 FAST=2 SLOW=1 HOME=2830 DAT= Panel=Motors:
Module PropMtr mode=groups RT1= RT2= Panel=Motors:

# B3MB Configuration as per Under Link 20220813 Rev 2
Module B3MB mode=types
Module B3MB mode=V28  ID=28V1  CAN_ID=11 Panel=B3MB: \
          L1=EngPort28 L3=EngStbd28 L4=DataSys28 \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V28  ID=28V2  CAN_ID=12 Panel=B3MB:
<<<<<<< HEAD
Module B3MB mode=V28  ID=28V3  CAN_ID=13 Panel=B3MB: \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V1 CAN_ID=1 Panel=B3MB: \
          L3=EngPort100 L4=AscSec1 \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V2 CAN_ID=2 Panel=B3MB: \
          L1=AscRes1 L2=AscPri1 \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V3 CAN_ID=3 Panel=B3MB: \
          L1=AscRes2 L2=AscPri2 \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V4 CAN_ID=4 Panel=B3MB: \
          L3=EngStbd100 L4=AscSec2 \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V5 CAN_ID=5 Panel=B3MB: \
          T1=# DT1= LT1="" T1L=/* T1R=*/ \
          T3=# DT3= LT3="" T3L=/* T3R=*/ \
          T4=# DT4= LT4="" T4L=/* T4R=*/ \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V6 CAN_ID=6 Panel=B3MB: \
          T2=# DT2= LT2="" T2L=/* T2R=*/ \
          T3=# DT3= LT3="" T3L=/* T3R=*/ \
          T4=# DT4= LT4="" T4L=/* T4R=*/ \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V7 CAN_ID=7 Panel=B3MB: \
          T2=# DT2= LT2="" T2L=/* T2R=*/ \
          T3=# DT3= LT3="" T3L=/* T3R=*/ \
          T4=# DT4= LT4="" T4L=/* T4R=*/ \
          T5=# DT5= LT5="" T5L=/* T5R=*/
Module B3MB mode=V100 ID=100V8 CAN_ID=8 Panel=B3MB: \
          T2=# DT2= LT2="" T2L=/* T2R=*/ \
          T3=# DT3= LT3="" T3L=/* T3R=*/ \
          T4=# DT4= LT4="" T4L=/* T4R=*/ \
          T5=# DT5= LT5="" T5L=/* T5R=*/
tmcbase = B3MB_cal.tmc

# Module scopexsim
Module PropMtrSim
Module SerIn
Module Sat
Module SpatialDual FAST=10 Panel=Main:
Module Ascender Panel=Main:
# Module RFDio
Module Nav

TGTDIR = /home/scopex
IGNORE = "*.o" "*.exe" "*.stackdump" Makefile
DISTRIB = interact services USB.id
IGNORE = B3MB_gen_cal.asv
IGNORE = SWData.cmd SWData.h SWData.tmc SWData_col.tmc
OBJ = SWData.cmd SWData.h SWData.tmc SWData_col.tmc

scopexcol : -lsubbuspp
scopexsrvr : CAN.oui -lsubbuspp
scopextxsrvr :
scopexclt :
scopexdisp : $extbase Summary.tbl scopex.tbl B3MB_28V.tbl B3MB_100V.tbl B3MB_100V_2.tbl SpatialDual.tbl Housekeeping.tbl
scopexalgo : scopex.tma pmc.tma pmc_Left.tma pmc_Right.tma $swsbase
scopexjsonext : $extbase $genuibase
# B3MBrawext : B3MBraw.cdf
# tmserioext : tmserio.tmc tmserio.cc tmserio.oui
doit : scopex.doit
#Simdoit : Sim.doit
#SimSockdoit : SimSock.doit
%%
CXXFLAGS+=-g
