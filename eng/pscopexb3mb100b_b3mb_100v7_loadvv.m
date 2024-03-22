function pscopexb3mb100b_b3mb_100v7_loadvv(varargin);
% pscopexb3mb100b_b3mb_100v7_loadvv( [...] );
% B3MB 100V7 Load Volts 100V7
h = timeplot({'B3MB_100V7_Load1_V','B3MB_100V7_Load2_V','B3MB_100V7_Load3_V','B3MB_100V7_Load4_V'}, ...
      'B3MB 100V7 Load Volts 100V7', ...
      'Volts 100V7', ...
      {'L1V','L2V','L3V','L4V'}, ...
      varargin{:} );