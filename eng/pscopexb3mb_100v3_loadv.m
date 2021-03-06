function pscopexb3mb_100v3_loadv(varargin);
% pscopexb3mb_100v3_loadv( [...] );
% B3MB 100V3 Load Volts
h = timeplot({'B3MB_100V3_Load1_V','B3MB_100V3_Load2_V','B3MB_100V3_Load3_V','B3MB_100V3_Load4_V'}, ...
      'B3MB 100V3 Load Volts', ...
      'Volts', ...
      {'L1V','L2V','L3V','L4V'}, ...
      varargin{:} );
