function initial_sigma = set_initial_sigma()
%INITIAL_SIGMA Set initial volume fraction of fluid 2
%   Provides a volume fraction as a function of height z

% ARM initial sigma profile
initial_sigma.z     = [0; 1];
initial_sigma.sigma2 = [0.5; 0.5];


end