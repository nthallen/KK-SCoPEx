function pscopexb3mb_b3mb_100v6_batttv(varargin);
% pscopexb3mb_b3mb_100v6_batttv( [...] );
% B3MB 100V6 Batt Temp 100V6
h = timeplot({'B3MB_100V6_T1','B3MB_100V6_T2','B3MB_100V6_T3','B3MB_100V6_T4','B3MB_100V6_T5'}, ...
      'B3MB 100V6 Batt Temp 100V6', ...
      'Temp 100V6', ...
      {'T1','T2','T3','T4','T5'}, ...
      varargin{:} );
