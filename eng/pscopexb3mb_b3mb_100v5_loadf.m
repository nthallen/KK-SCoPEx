function pscopexb3mb_b3mb_100v5_loadf(varargin);
% pscopexb3mb_b3mb_100v5_loadf( [...] );
% B3MB 100V5 Load Fault
h = ne_dstat({
  'B3MB_100V5_Load1F', 'B3MB_100V5_Cmd_S', 12; ...
	'B3MB_100V5_Load2F', 'B3MB_100V5_Cmd_S', 13; ...
	'B3MB_100V5_Load3F', 'B3MB_100V5_Cmd_S', 14; ...
	'B3MB_100V5_Load4F', 'B3MB_100V5_Cmd_S', 15 }, 'Fault', varargin{:} );
