%{
  #include "scopex_can.h"

  #ifdef SERVER
    int subbus_quit() {
      return CAN->subbus_quit();
    }
  #endif
%}
%INTERFACE <subbus>

&command
 : BMM &BMM_ID &BMM_Switch &BMM_On_Off * {
     CAN->write_ack(($2<<8)+0x30, $3+$4);
   }
 ;
&BMM_ID <int>
  : 1 { $0 = 1; }
  : 2 { $0 = 2; }
  : 3 { $0 = 3; }
  ;
&BMM_Switch <int>
  : LED Status { $0 = 0; }
  : LED Fault { $0 = 2; }
  : Power { $0 = 4; }
  ;
&BMM_On_Off <int>
  : Off { $0 = 0; }
  : On { $0 = 1; }
  ;
  
