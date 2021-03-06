function pscopexb3mb_100v2_batts(varargin);
% pscopexb3mb_100v2_batts( [...] );
% B3MB 100V2 Batt Status
h = ne_dstat({
  'B1S', 'B3MB_100V2_Cmd_S', 0; ...
	'B2S', 'B3MB_100V2_Cmd_S', 1; ...
	'B3S', 'B3MB_100V2_Cmd_S', 2; ...
	'B4S', 'B3MB_100V2_Cmd_S', 3; ...
	'Stat_LED', 'B3MB_100V2_LED_S', 0; ...
	'Fault_LED', 'B3MB_100V2_LED_S', 0; ...
	'ID_CPU', 'B3MB_100V2_LED_S', 0 }, 'Status', varargin{:} );
