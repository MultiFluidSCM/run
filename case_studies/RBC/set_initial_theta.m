function initial_theta = set_initial_theta()
%INITIAL_THETA Set initial potential temperature
%   Provides a potential temperature as a function of height z

% ARM initial theta profile
initial_theta.z     = [0; 1];
initial_theta.theta = [300; 300];


end