function fig = gscopexgnss(varargin);
% gscopexgnss(...)
% GNSS
ffig = ne_group(varargin,'GNSS','pscopexgnsss','pscopexgnssf','pscopexgnssd','pscopexgnssp','pscopexgnssv','pscopexgnssa','pscopexgnssattitude','pscopexgnssav','pscopexgnssstd');
if nargout > 0 fig = ffig; end
