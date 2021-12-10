%--------------------------------------------------------------------------------------------------%
% TEMPORAL DISCRETISATION

% Simulation duration and timestep
settings.model.time.tstart = 0;
settings.model.time.tstop  = 6*3600;
settings.model.time.dt = 30;


%--------------------------------------------------------------------------------------------------%
% SPATIAL DISCRETISATION

% Domain limits
settings.model.grid.zbot = 0;
settings.model.grid.ztop = 3000;

% Number of levels
settings.model.grid.nz = 50;

% Stretch factor for grid
% Ratio of top layer thickness to lowest layer thickness
settings.model.grid.totstretch = 5.0;


%--------------------------------------------------------------------------------------------------%
% INITIAL CONDITIONS 

% Initial potential temperature profile
settings.model.initial.theta.z = [    0;   520;  1480;  2000;   3000];
settings.model.initial.theta.f = [298.7; 298.7; 302.4; 308.2; 311.85];

% Initial moisture profile
settings.model.initial.qv.z = [      0;     520;    1480;   2000;   3000];
settings.model.initial.qv.f = [17.0e-3; 16.3e-3; 10.7e-3; 4.2e-3; 3.0e-3];

% Initial velocity profiles
settings.model.initial.u.z = [   0.;  700.; 3000.];
settings.model.initial.u.f = [-8.75; -8.75; -4.61];
settings.model.initial.v.z = 0;
settings.model.initial.v.f = 0;

% Initial fluid 2 volume fraction profile
settings.model.initial.sigma.z = 0;
settings.model.initial.sigma.f = 0.001;

% Pressure at the surface
settings.model.surface_pressure = 100000;


%--------------------------------------------------------------------------------------------------%
% FORCINGS 

% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct BOMEX values

% Geostrophic wind
settings.model.forcing.ug.z = [   0;   2500];
settings.model.forcing.ug.f = [-10.;   -5.5];
settings.model.forcing.vg.z = [0];
settings.model.forcing.vg.f = [0];

% Subsidence
settings.model.forcing.wsub.z = [0.;   1500.; 2500.];
settings.model.forcing.wsub.f = [0.; -0.0065;    0.];

% Radiative cooling
settings.model.forcing.rad.z = [ 0.; 1500.; 2500.];
settings.model.forcing.rad.f = [-2.;   -2.;    0.]/(24*60*60);

% Moisture forcing
settings.model.forcing.q.z = [     0.;    300.;  500.];
settings.model.forcing.q.f = [-1.2e-8; -1.2e-8;    0.];

% Alternative BOMEX surface fluxes with 2-minute spin-up which helps avoid persistent problem
% of the model crashing in the first couple of timesteps.
% Surface sensible heat flux
settings.model.forcing.sshf.t = [0; 120];
settings.model.forcing.sshf.f = [0; 8.04];
% Surface latent heat flux
settings.model.forcing.slhf.t = [0; 120];
settings.model.forcing.slhf.f = [0; 130.052];


%--------------------------------------------------------------------------------------------------%
% PARAMETERISATION CHOICES

% Magic numbers - dimensional constants that are not constants
% of nature - to be deprecated and avoided if at all possible
% Minimum permitted tke (J / kg)
settings.model.constants.param.tke_min   = 1e-3 ;


%--------------------------------------------------------------------------------------------------%
% POST-PROCESSING PLOTTING

% Select LES data set ID to compare results with
settings.plots.test_case = "BOMEX_MONC";

% Which snapshots to output from the 2FSCM
settings.model.output_times = 3600*(1:6);
% Which snapshots to plot vs LES
settings.plots.times_to_plot = 3600*(1:6);

% Top of plots
settings.plots.zplottop = 2500;