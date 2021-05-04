% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).

clear

folders = get_folders();

% Load settings and update directories so files are stored in this folder
load("settings.mat");
settings = update_all_settings(settings, folders, [], []);

multi_fluid_model(settings.model);

compare_scm_to_les(settings.plots);