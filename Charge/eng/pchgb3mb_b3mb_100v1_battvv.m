function pchgb3mb_b3mb_100v1_battvv(varargin);
% pchgb3mb_b3mb_100v1_battvv( [...] );
% B3MB 100V1 Batt Volts 100V1
h = timeplot({'B3MB_100V1_Batt1_V','B3MB_100V1_Bus_V'}, ...
      'B3MB 100V1 Batt Volts 100V1', ...
      'Volts 100V1', ...
      {'B1V','BusV'}, ...
      varargin{:} );
