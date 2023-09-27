function pchgb3mb_b3mb_100v8_loads(varargin);
% pchgb3mb_b3mb_100v8_loads( [...] );
% B3MB 100V8 Load Status
h = ne_dstat({
  'B3MB_100V8_Load1S', 'B3MB_100V8_Cmd_S', 4; ...
	'B3MB_100V8_Load2S', 'B3MB_100V8_Cmd_S', 5; ...
	'B3MB_100V8_Load3S', 'B3MB_100V8_Cmd_S', 6; ...
	'B3MB_100V8_Load4S', 'B3MB_100V8_Cmd_S', 7 }, 'Status', varargin{:} );
