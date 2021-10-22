function forcing = set_forcing()

% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct BOMEX values

% Geostrophic wind
forcing.ug_z = [  0.;  2500.];
forcing.ug   = [-10.;   -5.5];
% forcing.ug   = [0.;   0.];
forcing.vg_z = 0.0;
forcing.vg   = 0.0;

% Subsidence
% forcing.wsub_z = [0.;   1500.; 2500.];
% forcing.wsub   = [0.; -0.0065;    0.];

% Radiative cooling
% forcing.rad_z = [ 0.; 1500.; 2500.];
% forcing.rad   = [-2.;   -2.;    0.]/(24*60*60);


forcing.t   = [      0;    3600];
% Surface fluxes
forcing.shf = [      0;    8.04];
forcing.lhf = [      0; 130.052];
% Fluxes at the top of the domain (sensible and latent heat fluxes)
forcing.tshf = [  0;     0;];
forcing.tlhf = [  0;     0;];

% forcing.t   = 0;
% forcing.shf = 8.04;
% forcing.shf = 0;
% forcing.lhf = 130.052;
% forcing.lhf = 0;
% forcing.tshf = 0;
% forcing.tlhf = 0;

end

