function pscopexb3mb_100v4_loads(varargin);
% pscopexb3mb_100v4_loads( [...] );
% B3MB 100V4 Load Status
h = ne_dstat({
  'L1S', 'B3MB_100V4_Cmd_S', 4; ...
	'L2S', 'B3MB_100V4_Cmd_S', 5; ...
	'L3S', 'B3MB_100V4_Cmd_S', 6; ...
	'L4S', 'B3MB_100V4_Cmd_S', 7 }, 'Status', varargin{:} );
