function pchgbmbbmbvls(varargin);
% pchgbmbbmbvls( [...] );
% B3MB 28V1 Load Status
h = ne_dstat({
  'B3MB_28V1_Load1S', 'B3MB_28V1_Cmd_S', 4; ...
	'B3MB_28V1_Load2S', 'B3MB_28V1_Cmd_S', 5; ...
	'B3MB_28V1_Load3S', 'B3MB_28V1_Cmd_S', 6; ...
	'B3MB_28V1_Load4S', 'B3MB_28V1_Cmd_S', 7 }, 'Status', varargin{:} );
