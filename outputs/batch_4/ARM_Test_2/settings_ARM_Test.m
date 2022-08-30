%--------------------------------------------------------------------------------------------------%
% TEMPORAL DISCRETISATION 

% Simulation duration and timestep
settings.model.time.tstart = 0;
settings.model.time.tstop  = 14.5*3600;
settings.model.time.dt = 30;


%--------------------------------------------------------------------------------------------------%
% SPATIAL DISCRETISATION

% Domain limits
settings.model.grid.zbot = 0;
settings.model.grid.ztop = 4400;

% Number of levels
settings.model.grid.nz = 80;

% Stretch factor for grid
% Ratio of top layer thickness to lowest layer thickness
settings.model.grid.totstretch = 5.0;


%--------------------------------------------------------------------------------------------------%
% INITIAL CONDITIONS

% Initial potential temperature profile
settings.model.initial.theta.z = [    0;    50;   350;    650;   700;   1300;  2500;  5500];
settings.model.initial.theta.f = [299.0; 301.5; 302.5; 303.53; 303.7; 307.13; 314.0; 343.2];

% Initial moisture profile
settings.model.initial.qv.z = [      0;       50;      350;      650;    700;    1300;   2500;   5500];
settings.model.initial.qv.f = [15.2e-3; 15.17e-3; 14.98e-3; 14.8e-3; 14.7e-3; 13.5e-3; 3.0e-3; 3.0e-3];

% Initial velocity profiles
settings.model.initial.u.z = 0;
settings.model.initial.u.f = 10;

% Pressure at the surface
settings.model.surface_pressure = 97000;


%--------------------------------------------------------------------------------------------------%
% FORCINGS

% Geostrophic wind for the ARM case
settings.model.forcing.ug.z = 0;
settings.model.forcing.ug.f = 10;
settings.model.forcing.vg.z = 0;
settings.model.forcing.vg.f = 0;

% Surface sensible heat flux
settings.model.forcing.sshf.t = [  0; 14400; 23400; 27000; 36000; 45000; 52200];
settings.model.forcing.sshf.f = [-30;    90;   140;   140;   100;   -10;   -10];

% Surface latent heat flux
settings.model.forcing.slhf.t = [  0; 14400; 23400; 27000; 36000; 45000; 52200];
settings.model.forcing.slhf.f = [  5;   250;   450;   500;   420;   180;     0];


%--------------------------------------------------------------------------------------------------%
% POST-PROCESSING PLOTTING

% Select LES data set ID to compare results with
settings.plots.test_case = "ARM_MONC";

% Which snapshots to output from the 2FSCM
settings.model.output_times = 3600*(1:14);
% Which snapshots to plot vs LES
settings.plots.times_to_plot = 3600*(9:11);