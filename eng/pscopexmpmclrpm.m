function pscopexmpmclrpm(varargin);
% pscopexmpmclrpm( [...] );
% PMC Left RPM
h = timeplot({'PMC_Left_RPM_SP','PMC_Left_RPM_Demand','PMC_Left_RPM'}, ...
      'PMC Left RPM', ...
      'RPM', ...
      {'PMC\_Left\_RPM\_SP','PMC\_Left\_RPM\_Demand','PMC\_Left\_RPM'}, ...
      varargin{:} );