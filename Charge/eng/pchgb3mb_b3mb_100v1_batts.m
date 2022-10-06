function pchgb3mb_b3mb_100v1_batts(varargin);
% pchgb3mb_b3mb_100v1_batts( [...] );
% B3MB 100V1 Batt Status
h = ne_dstat({
  'B3MB_100V1_B1S', 'B3MB_100V1_Cmd_S', 0; ...
	'B3MB_100V1_Stat_LED', 'B3MB_100V1_LED_S', 0; ...
	'B3MB_100V1_Fault_LED', 'B3MB_100V1_LED_S', 1; ...
	'B3MB_100V1_ID_CPU', 'B3MB_100V1_LED_S', 2 }, 'Status', varargin{:} );
