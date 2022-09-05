function pscopexb3mb_b3mb_100v4_battv(varargin);
% pscopexb3mb_b3mb_100v4_battv( [...] );
% B3MB 100V4 Batt Volts
h = timeplot({'B3MB_100V4_Batt1_V','B3MB_100V4_Bus_V'}, ...
      'B3MB 100V4 Batt Volts', ...
      'Volts', ...
      {'B1V','BusV'}, ...
      varargin{:} );
