function pscopexbmbbmbsbus_28v(varargin);
% pscopexbmbbmbsbus_28v( [...] );
% B3MB Spread Bus 28V
h = timeplot({'B3MB_28V_Bus_V_mean','B3MB_28V_Bus_V_min','B3MB_28V_Bus_V_max'}, ...
      'B3MB Spread Bus 28V', ...
      'Bus 28V', ...
      {'mean','min','max'}, ...
      varargin{:} );