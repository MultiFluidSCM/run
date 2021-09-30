function initial_theta = set_initial_theta()
%INITIAL_THETA Set initial potential temperature
%   Provides a potential temperature as a function of height z

% ARM initial theta profile
initial_theta.z     = [    0;    50;   350;    650;   700;   1300;  2500;  5500];
initial_theta.theta = [299.0; 301.5; 302.5; 303.53; 303.7; 307.13; 314.0; 343.2];


end