function pasbmpmcrt(varargin);
% pasbmpmcrt( [...] );
% PMC Right Temp
h = timeplot({'uDstbd_T1','uDstbd_T2'}, ...
      'PMC Right Temp', ...
      'Temp', ...
      {'uDstbd\_T1','uDstbd\_T2'}, ...
      varargin{:} );
