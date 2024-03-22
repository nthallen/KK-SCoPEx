function pscopexb3mb28_b3mb_28v2_loadav(varargin);
% pscopexb3mb28_b3mb_28v2_loadav( [...] );
% B3MB 28V2 Load Amps 28V2
h = timeplot({'B3MB_28V2_Load1_I','B3MB_28V2_Load2_I','B3MB_28V2_Load3_I','B3MB_28V2_Load4_I'}, ...
      'B3MB 28V2 Load Amps 28V2', ...
      'Amps 28V2', ...
      {'L1I','L2I','L3I','L4I'}, ...
      varargin{:} );