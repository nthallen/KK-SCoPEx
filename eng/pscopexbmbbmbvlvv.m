function pscopexbmbbmbvlvv(varargin);
% pscopexbmbbmbvlvv( [...] );
% B3MB 28V1 Load Volts 28V1
h = timeplot({'EngPort28_V','B3MB_28V1_Load2_V','EngStbd28_V','DataSys28_V'}, ...
      'B3MB 28V1 Load Volts 28V1', ...
      'Volts 28V1', ...
      {'L1V','L2V','L3V','L4V'}, ...
      varargin{:} );