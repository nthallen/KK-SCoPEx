function pchgb3mb_b3mb_28v2_battav(varargin);
% pchgb3mb_b3mb_28v2_battav( [...] );
% B3MB 28V2 Batt Amps 28V2
h = timeplot({'B3MB_28V2_Batt1_I','B3MB_28V2_Batt2_I','B3MB_28V2_Batt3_I','B3MB_28V2_Batt4_I'}, ...
      'B3MB 28V2 Batt Amps 28V2', ...
      'Amps 28V2', ...
      {'B1I','B2I','B3I','B4I'}, ...
      varargin{:} );