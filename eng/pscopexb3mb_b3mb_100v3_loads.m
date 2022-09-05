function pscopexb3mb_b3mb_100v3_loads(varargin);
% pscopexb3mb_b3mb_100v3_loads( [...] );
% B3MB 100V3 Load Status
h = ne_dstat({
  'AscRes2S', 'B3MB_100V3_Cmd_S', 4; ...
	'AscPri2S', 'B3MB_100V3_Cmd_S', 5; ...
	'B3MB_100V3_Load3S', 'B3MB_100V3_Cmd_S', 6; ...
	'B3MB_100V3_Load4S', 'B3MB_100V3_Cmd_S', 7 }, 'Status', varargin{:} );
