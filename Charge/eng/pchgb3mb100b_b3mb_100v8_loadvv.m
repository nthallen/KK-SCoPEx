function pchgb3mb100b_b3mb_100v8_loadvv(varargin);
% pchgb3mb100b_b3mb_100v8_loadvv( [...] );
% B3MB 100V8 Load Volts 100V8
h = timeplot({'B3MB_100V8_Load1_V','B3MB_100V8_Load2_V','B3MB_100V8_Load3_V','B3MB_100V8_Load4_V'}, ...
      'B3MB 100V8 Load Volts 100V8', ...
      'Volts 100V8', ...
      {'L1V','L2V','L3V','L4V'}, ...
      varargin{:} );