function pasbmgnssav(varargin);
% pasbmgnssav( [...] );
% GNSS Ang Vel
h = timeplot({'angular_velocity_x','angular_velocity_y','angular_velocity_z'}, ...
      'GNSS Ang Vel', ...
      'Ang Vel', ...
      {'angular\_velocity\_x','angular\_velocity\_y','angular\_velocity\_z'}, ...
      varargin{:} );