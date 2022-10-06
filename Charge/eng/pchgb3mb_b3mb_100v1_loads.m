function pchgb3mb_b3mb_100v1_loads(varargin);
% pchgb3mb_b3mb_100v1_loads( [...] );
% B3MB 100V1 Load Status
h = ne_dstat({
  'B3MB_100V1_Load1S', 'B3MB_100V1_Cmd_S', 4; ...
	'B3MB_100V1_Load2S', 'B3MB_100V1_Cmd_S', 5; ...
	'B3MB_100V1_Load3S', 'B3MB_100V1_Cmd_S', 6; ...
	'B3MB_100V1_Load4S', 'B3MB_100V1_Cmd_S', 7 }, 'Status', varargin{:} );
