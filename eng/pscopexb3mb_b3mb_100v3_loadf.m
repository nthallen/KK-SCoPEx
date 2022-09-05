function pscopexb3mb_b3mb_100v3_loadf(varargin);
% pscopexb3mb_b3mb_100v3_loadf( [...] );
% B3MB 100V3 Load Fault
h = ne_dstat({
  'AscRes2F', 'B3MB_100V3_Cmd_S', 12; ...
	'AscPri2F', 'B3MB_100V3_Cmd_S', 13; ...
	'B3MB_100V3_Load3F', 'B3MB_100V3_Cmd_S', 14; ...
	'B3MB_100V3_Load4F', 'B3MB_100V3_Cmd_S', 15 }, 'Fault', varargin{:} );
