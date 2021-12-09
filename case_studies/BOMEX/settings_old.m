%--------------------------------------------------------------------------------------------------%
%-TEMPORAL-DISCRETISATION--------------------------------------------------------------------------%
%--------------------------------------------------------------------------------------------------%

settings.tstart = 0;
settings.tstop  = 14.5*3600;

% Timestep
settings.dt = 30;


%--------------------------------------------------------------------------------------------------%
%-SPATIAL-DISCRETISATION---------------------------------------------------------------------------%
%--------------------------------------------------------------------------------------------------%

% Domain limits
settings.zbot = 0;
settings.ztop = 3000;

% Number of levels
settings.nz = 50;

% Stretch factor for grid
% Ratio of top layer thickness to lowest layer thickness
settings.totstretch = 5.0;


%--------------------------------------------------------------------------------------------------%
%-INITIAL-CONDITIONS-------------------------------------------------------------------------------%
%--------------------------------------------------------------------------------------------------%

% Initial potential temperature profile
settings.theta_z = [    0;   520;  1480;  2000;   3000];
settings.theta_f = [298.7; 298.7; 302.4; 308.2; 311.85];

% Initial moisture profile
settings.qv_z = [      0;     520;    1480;   2000;   3000];
settings.qv_f = [17.0e-3; 16.3e-3; 10.7e-3; 4.2e-3; 3.0e-3];

% Initial velocity profiles
settings.u_z = [   0.;  700.; 3000.];
settings.u_f = [-8.75; -8.75; -4.61];
settings.v_z = [0];
settings.v_f = [0];
settings.w_z = [0];
settings.w_f = [0];

% Initial fluid 2 volume fraction profile
settings.sigma_z = [0];
settings.sigma_f = [0.001];

%--------------------------------------------------------------------------------------------------%
%-FORCINGS-----------------------------------------------------------------------------------------%
%--------------------------------------------------------------------------------------------------%

% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct BOMEX values

% Geostrophic wind
settings.ug_z = [   0;   2500];
settings.ug_f = [-10.;   -5.5];
settings.vg_z = [0];
settings.vg_f = [0];

% Subsidence
settings.wsub_z = [0.;   1500.; 2500.];
settings.wsub_f = [0.; -0.0065;    0.];

% Radiative cooling
settings.rad_z = [ 0.; 1500.; 2500.];
settings.rad_f = [-2.;   -2.;    0.]/(24*60*60);

% Moisture forcing
settings.q_z = [     0.;    300.;  500.];
settings.q_f = [-1.2e-8; -1.2e-8;    0.];

% Alternative with 5-minute spin-up which helps avoid persistent problem
% of the model crashing in the first couple of timesteps.
settings.shf_t = [0; 120];
settings.shf_f = [0; 8.04];
settings.lhf_t = [0; 120];
settings.lhf_f = [0; 130.052];
settings.tshf_t = [0; 120];
settings.tshf_f = [0; 0];
settings.tlhf_t = [0; 120];
settings.tlhf_f = [0; 0];
