function pchgb3mb_b3mb_100v3_battav(varargin);
% pchgb3mb_b3mb_100v3_battav( [...] );
% B3MB 100V3 Batt Amps 100V3
h = timeplot({'B3MB_100V3_Batt1_I'}, ...
      'B3MB 100V3 Batt Amps 100V3', ...
      'Amps 100V3', ...
      {'B1I'}, ...
      varargin{:} );
