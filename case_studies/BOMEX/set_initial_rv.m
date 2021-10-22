function initial_rv = set_initial_rv()
%INITIAL_Q Set initial water vapour mixing ratio
%   Provides a water vapour as a function of height z

% BOMEX initial q profile
initial_rv.z  = [      0;     520;    1480;   2000;   3000];
initial_rv.qv = [17.0e-3; 16.3e-3; 10.7e-3; 4.2e-3; 3.0e-3];
initial_rv.rv = initial_rv.qv./(1-initial_rv.qv);

end