function pscopexpmcrv(varargin);
% pscopexpmcrv( [...] );
% PMC Right Voltage
h = timeplot({'PMC_Right_BusV'}, ...
      'PMC Right Voltage', ...
      'Voltage', ...
      {'PMC\_Right\_BusV'}, ...
      varargin{:} );
