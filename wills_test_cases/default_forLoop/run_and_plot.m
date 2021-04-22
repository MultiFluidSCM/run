% Run the multi-fluid model over range of parameter values

clear

folders_default = get_folders("bin");

load("settings_10.mat");
if ~exist('settings', 'var')
    disp("No settings file detected, loading default settings as starting point.");
    settings = get_settings(folders_default);
end

bw = sensitivity_variable("mix detrain entrain bw", "bwMixDE", 0.5, 1.0, 3);
bt = sensitivity_variable("mix detrain entrain bt", "btMixDE", 0.5, 1.0, 3);
bq = sensitivity_variable("mix detrain entrain bq", "bqMixDE", 0.5, 1.0, 3);
bu = sensitivity_variable("mix detrain entrain bu", "buMixDE", 0.5, 1.0, 3);
bu = sensitivity_variable("mix detrain entrain bu", "buMixDE", 1.0, 1.0, 1);

bwD = sensitivity_variable("mix detrain bw", "bwMixD", 0.6, 1.0, 3);
btD = sensitivity_variable("mix detrain bt", "btMixD", 0.6, 1.0, 3);
bqD = sensitivity_variable("mix detrain bq", "bqMixD", 0.6, 1.0, 3);

bwE = sensitivity_variable("mix entrain bw", "bwMixE", 0.6, 1.0, 3);
btE = sensitivity_variable("mix entrain bt", "btMixE", 0.6, 1.0, 3);
bqE = sensitivity_variable("mix entrain bq", "bqMixE", 0.6, 1.0, 3);

bqE = sensitivity_variable("mix entrain bq", "bqMixE", 0.5, 0.525, 50);

% variables = [bwD, btD, bqD, bwE, btE, bqE];
% variables = [bw, bt, bq, bu];
% variables = [bu];
variables = [bqE];

settings = find_best_settings(settings, variables);



