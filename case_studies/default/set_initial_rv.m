function initial_rv = set_initial_rv()
%INITIAL_Q Set initial water vapour mixing ratio
%   Provides a water vapour as a function of height z

% ARM initial q profile
initial_rv.z  = [0; 1];
initial_rv.rv = [0; 0];

end