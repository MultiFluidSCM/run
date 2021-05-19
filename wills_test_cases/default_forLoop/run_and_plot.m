% Run the multi-fluid model over range of parameter values

clear

folders_default = get_folders("bin");

% load("settings_0.mat");
if ~exist('settings', 'var')
    disp("No settings file detected, loading default settings as starting point.");
    settings = get_settings(folders_default);
end

% bw = sensitivity_variable("mix detrain entrain bw", "bwMixDE", 0.5, 1.0, 6);
% bt = sensitivity_variable("mix detrain entrain bt", "btMixDE", 0.5, 1.0, 6);
% bq = sensitivity_variable("mix detrain entrain bq", "bqMixDE", 0.5, 1.0, 6);
% bu = sensitivity_variable("mix detrain entrain bu", "buMixDE", 0.5, 1.0, 6);
% bu = sensitivity_variable("mix detrain entrain bu", "buMixDE", 1.0, 1.0, 1);

bwD = sensitivity_variable("mix detrain bw", "bwMixD", 0.6, 1.0, 3);
btD = sensitivity_variable("mix detrain bt", "btMixD", 0.6, 1.0, 3);
bqD = sensitivity_variable("mix detrain bq", "bqMixD", 0.6, 1.0, 3);
bwE = sensitivity_variable("mix entrain bw", "bwMixE", 0.6, 1.0, 3);
btE = sensitivity_variable("mix entrain bt", "btMixE", 0.6, 1.0, 3);
bqE = sensitivity_variable("mix entrain bq", "bqMixE", 0.6, 1.0, 3);

bwDwzD = sensitivity_variable("dwdz detrain bw", "bwDwzD", 0.7, 0.8, 2);
btDwzD = sensitivity_variable("dwdz detrain bt", "btDwzD", 0.7, 0.8, 2);
bqDwzD = sensitivity_variable("dwdz detrain bq", "bqDwzD", 0.8, 1.0, 3);
dwdzFacD = sensitivity_variable("dwdz detrain factor", "dwdzFacD", 1.0, 2.0, 11);

btInsE = sensitivity_variable("instab entrain bt", "btInsE", 0.8, 1.0, 3);
bqInsE = sensitivity_variable("instab entrain bq", "bqInsE", 0.5, 1.0, 6);

tkeFactorMix = sensitivity_variable("mix tkefactor", "tkeFactorMix", 0.2, 2.0, 19);

% variables = [bwD, btD, bqD, bwE, btE, bqE];
% variables = [bw, bt, bq, bu];
% variables = [bu];
% variables = [bqE];
variables = [tkeFactorMix];


% settings.model.constants.param.Lfactor1 = 1.;
% settings.model.constants.param.Lfactor2 = 1.;
% settings.model.constants.param.dwdz.detrain_factor = 0.5;
settings = find_best_settings(settings, variables);



