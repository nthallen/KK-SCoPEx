function pchgb3mb100a_b3mb_100v4_loadf(varargin);
% pchgb3mb100a_b3mb_100v4_loadf( [...] );
% B3MB 100V4 Load Fault
h = ne_dstat({
  'B3MB_100V4_Load1F', 'B3MB_100V4_Cmd_S', 12; ...
	'B3MB_100V4_Load2F', 'B3MB_100V4_Cmd_S', 13; ...
	'B3MB_100V4_Load3F', 'B3MB_100V4_Cmd_S', 14; ...
	'B3MB_100V4_Load4F', 'B3MB_100V4_Cmd_S', 15 }, 'Fault', varargin{:} );