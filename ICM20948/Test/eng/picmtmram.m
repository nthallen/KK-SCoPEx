function picmtmram(varargin);
% picmtmram( [...] );
% T Mbase RAM
h = timeplot({'memused'}, ...
      'T Mbase RAM', ...
      'RAM', ...
      {'memused'}, ...
      varargin{:} );