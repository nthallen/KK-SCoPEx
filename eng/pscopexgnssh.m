function pscopexgnssh(varargin);
% pscopexgnssh( [...] );
% GNSS Heading
h = timeplot({'Track','heading'}, ...
      'GNSS Heading', ...
      'Heading', ...
      {'Track','heading'}, ...
      varargin{:} );
