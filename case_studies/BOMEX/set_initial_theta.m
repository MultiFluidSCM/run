function initial_theta = set_initial_theta()
%INITIAL_THETA Set initial potential temperature
%   Provides a potential temperature as a function of height z

% ARM initial theta profile
initial_theta.z     = [    0;   520;  1500;  2000;  3000];
initial_theta.theta = [298.7; 298.7; 302.4; 308.2; 311.85];


end