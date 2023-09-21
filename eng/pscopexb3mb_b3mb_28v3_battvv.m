function pscopexb3mb_b3mb_28v3_battvv(varargin);
% pscopexb3mb_b3mb_28v3_battvv( [...] );
% B3MB 28V3 Batt Volts 28V3
h = timeplot({'B3MB_28V3_Batt1_V','B3MB_28V3_Batt2_V','B3MB_28V3_Batt3_V','B3MB_28V3_Batt4_V','B3MB_28V3_Bus_V'}, ...
      'B3MB 28V3 Batt Volts 28V3', ...
      'Volts 28V3', ...
      {'B1V','B2V','B3V','B4V','BusV'}, ...
      varargin{:} );
