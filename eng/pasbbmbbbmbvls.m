function pasbbmbbbmbvls(varargin);
% pasbbmbbbmbvls( [...] );
% B3MB 100V5 Load Status
h = ne_dstat({
  'B3MB_100V5_Load1S', 'B3MB_100V5_Cmd_S', 4; ...
	'B3MB_100V5_Load2S', 'B3MB_100V5_Cmd_S', 5; ...
	'B3MB_100V5_Load3S', 'B3MB_100V5_Cmd_S', 6; ...
	'B3MB_100V5_Load4S', 'B3MB_100V5_Cmd_S', 7 }, 'Status', varargin{:} );