function pasbmgnssh(varargin);
% pasbmgnssh( [...] );
% GNSS Heading
h = timeplot({'heading','Nav_Course'}, ...
      'GNSS Heading', ...
      'Heading', ...
      {'heading','Nav\_Course'}, ...
      varargin{:} );