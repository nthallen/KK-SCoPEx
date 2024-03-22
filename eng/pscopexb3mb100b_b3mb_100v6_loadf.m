function pscopexb3mb100b_b3mb_100v6_loadf(varargin);
% pscopexb3mb100b_b3mb_100v6_loadf( [...] );
% B3MB 100V6 Load Fault
h = ne_dstat({
  'B3MB_100V6_Load1F', 'B3MB_100V6_Cmd_S', 12; ...
	'B3MB_100V6_Load2F', 'B3MB_100V6_Cmd_S', 13; ...
	'B3MB_100V6_Load3F', 'B3MB_100V6_Cmd_S', 14; ...
	'B3MB_100V6_Load4F', 'B3MB_100V6_Cmd_S', 15 }, 'Fault', varargin{:} );