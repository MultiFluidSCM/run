function initial_rv = set_initial_rv()
%INITIAL_Q Set initial water vapour mixing ratio
%   Provides a water vapour as a function of height z

% ARM initial q profile
initial_rv.z  = [      0;       50;      350;      650;    700;    1300;   2500;   5500];
initial_rv.rv = [15.2e-3; 15.17e-3; 14.98e-3; 14.8e-3; 14.7e-3; 13.5e-3; 3.0e-3; 3.0e-3];

end