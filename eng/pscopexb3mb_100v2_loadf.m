function pscopexb3mb_100v2_loadf(varargin);
% pscopexb3mb_100v2_loadf( [...] );
% B3MB 100V2 Load Fault
h = ne_dstat({
  'L1F', 'B3MB_100V2_Cmd_S', 12; ...
	'L2F', 'B3MB_100V2_Cmd_S', 13; ...
	'L3F', 'B3MB_100V2_Cmd_S', 14; ...
	'L4F', 'B3MB_100V2_Cmd_S', 15 }, 'Fault', varargin{:} );
