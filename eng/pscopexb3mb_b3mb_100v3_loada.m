function pscopexb3mb_b3mb_100v3_loada(varargin);
% pscopexb3mb_b3mb_100v3_loada( [...] );
% B3MB 100V3 Load Amps
h = timeplot({'AscRes2_I','AscPri2_I','B3MB_100V3_Load3_I','B3MB_100V3_Load4_I'}, ...
      'B3MB 100V3 Load Amps', ...
      'Amps', ...
      {'L1I','L1I','L1I','L1I'}, ...
      varargin{:} );
