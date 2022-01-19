function pchgb3mb_b3mb_100v4_loada(varargin);
% pchgb3mb_b3mb_100v4_loada( [...] );
% B3MB 100V4 Load Amps
h = timeplot({'B3MB_100V4_Load1_I','B3MB_100V4_Load2_I','B3MB_100V4_Load3_I','B3MB_100V4_Load4_I'}, ...
      'B3MB 100V4 Load Amps', ...
      'Amps', ...
      {'L1I','L1I','L1I','L1I'}, ...
      varargin{:} );