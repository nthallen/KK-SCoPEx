function pscopexb3mb_b3mb_100v2_batts(varargin);
% pscopexb3mb_b3mb_100v2_batts( [...] );
% B3MB 100V2 Batt Status
h = ne_dstat({
  'B3MB_100V2_B1S', 'B3MB_100V2_Cmd_S', 0; ...
	'B3MB_100V2_Stat_LED', 'B3MB_100V2_LED_S', 0; ...
	'B3MB_100V2_Fault_LED', 'B3MB_100V2_LED_S', 1; ...
	'B3MB_100V2_ID_CPU', 'B3MB_100V2_LED_S', 2 }, 'Status', varargin{:} );
