function pchgb3mb_b3mb_100v3_loadvv(varargin);
% pchgb3mb_b3mb_100v3_loadvv( [...] );
% B3MB 100V3 Load Volts 100V3
h = timeplot({'B3MB_100V3_Load1_V','B3MB_100V3_Load2_V','B3MB_100V3_Load3_V','B3MB_100V3_Load4_V'}, ...
      'B3MB 100V3 Load Volts 100V3', ...
      'Volts 100V3', ...
      {'L1V','L2V','L3V','L4V'}, ...
      varargin{:} );
