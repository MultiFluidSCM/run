function forcing = set_forcing()

% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct BOMEX values

% Geostrophic wind
forcing.ug_z = [  0.;  2500.];
forcing.ug   = [-10.;   -5.5];
forcing.vg_z = 0.0;
forcing.vg   = 0.0;

% Subsidence
forcing.wsub_z = [0.;   1500.; 2500.];
forcing.wsub   = [0.; -0.0065;    0.];

% Radiative cooling
forcing.rad_z = [ 0.; 1500.; 2500.];
forcing.rad   = [-2.;   -2.;    0.]/(24*60*60);

% Moisture forcing
forcing.q_z = [     0.;    300.;  500.];
forcing.q   = [-1.2e-8; -1.2e-8;    0.];

% Forcing also used in the LES
forcing.t   = 0;
% Surface fluxes
forcing.shf = 8.04;
forcing.lhf = 130.052;
% Fluxes at the top of the domain (sensible and latent heat fluxes)
forcing.tshf = 0;
forcing.tlhf = 0;

% Alternative with 5-minute spin-up which helps avoid persistent problem
% of the model crashing in the first couple of timesteps.
forcing.t   = [0;120];
forcing.shf = [0;8.04];
forcing.lhf = [0;130.052];
forcing.tshf = [0;0];
forcing.tlhf = [0;0];

end

