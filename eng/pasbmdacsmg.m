function pasbmdacsmg(varargin);
% pasbmdacsmg( [...] );
% uDACS Max G
h = timeplot({'uDport_max_g','uDstbd_max_g'}, ...
      'uDACS Max G', ...
      'Max G', ...
      {'uDport\_max\_g','uDstbd\_max\_g'}, ...
      varargin{:} );
