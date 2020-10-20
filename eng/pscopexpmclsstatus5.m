function pscopexpmclsstatus5(varargin);
% pscopexpmclsstatus5( [...] );
% PMC Left S Status 5
h = ne_dstat({
  'CmddStop', 'PMC_Left_Status5', 6; ...
	'UserStop', 'PMC_Left_Status5', 7; ...
	'Cap1Active', 'PMC_Left_Status5', 8; ...
	'Cap2Active', 'PMC_Left_Status5', 9; ...
	'Cap3Active', 'PMC_Left_Status5', 10; ...
	'CmddPosLim', 'PMC_Left_Status5', 11; ...
	'CmddNegLim', 'PMC_Left_Status5', 12 }, 'Status 5', varargin{:} );
