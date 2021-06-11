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

bwMixD = sensitivity_variable("mix detrain bw", "bwMixD", 1.1, 1.5, 5);
btMixD = sensitivity_variable("mix detrain bt", "btMixD", 1.5, 1.5, 1);
bqMixD = sensitivity_variable("mix detrain bq", "bqMixD", 0.6, 1.0, 3);
bwMixE = sensitivity_variable("mix entrain bw", "bwMixE", 1.1, 1.5, 5);
btMixE = sensitivity_variable("mix entrain bt", "btMixE", 1.5, 1.5, 1);
bqMixE = sensitivity_variable("mix entrain bq", "bqMixE", 0.6, 1.0, 3);

bwDwzD = sensitivity_variable("dwdz detrain bw", "bwDwzD", 1.5, 1.5, 1);
btDwzD = sensitivity_variable("dwdz detrain bt", "btDwzD", 1.5, 1.5, 1);
bqDwzD = sensitivity_variable("dwdz detrain bq", "bqDwzD", 0.5, 3.5, 31);
dwdzFacD = sensitivity_variable("dwdz detrain factor", "dwdzFacD", 1.0, 2.0, 11);

btInsE = sensitivity_variable("instab entrain bt", "btInsE", 0.8, 1.0, 3);
bqInsE = sensitivity_variable("instab entrain bq", "bqInsE", 0.5, 1.0, 6);

tkeFactorMix = sensitivity_variable("mix tkefactor", "tkeFactorMix", 0.1, 2.0, 20);

% variables = [bwD, btD, bqD, bwE, btE, bqE];
% variables = [bw, bt, bq, bu];
% variables = [bu];
variables = [tkeFactorMix];
% variables = [bwMixD, bwMixE];


% settings.model.constants.param.Lfactor1 = 1.;
% settings.model.constants.param.Lfactor2 = 1.;
% settings.model.constants.param.dwdz.detrain_factor = 0.5;
settings = find_best_settings(settings, variables);



