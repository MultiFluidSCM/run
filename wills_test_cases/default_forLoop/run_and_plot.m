% Run the multi-fluid model over range of parameter values

clear

case_study = "ARM";

folders_default = get_folders("bin", case_study);

% load("settings_0.mat");
if ~exist('settings', 'var')
    disp("No settings file detected, loading default settings as starting point.");
    settings = get_settings(folders_default);
end

bwMixD = for_loop_variable("mix detrain bw", "bwMixD", 0.6, 1.0, 3);
btMixD = for_loop_variable("mix detrain bt", "btMixD", 0.2, 1.4, 4);
bqMixD = for_loop_variable("mix detrain bq", "bqMixD", 0.6, 1.0, 3);
bwMixE = for_loop_variable("mix entrain bw", "bwMixE", 0.6, 1.0, 3);
btMixE = for_loop_variable("mix entrain bt", "btMixE", 0.2, 1.4, 4);
bqMixE = for_loop_variable("mix entrain bq", "bqMixE", 0.6, 1.0, 3);

bwMicD = for_loop_variable("mix cloud detrain bw", "bwMicD", 0.6, 1.0, 3);
btMicD = for_loop_variable("mix cloud detrain bt", "btMicD", 0.2, 1.4, 4);
bqMicD = for_loop_variable("mix cloud detrain bq", "bqMicD", 0.6, 1.0, 3);
bwMicE = for_loop_variable("mix cloud entrain bw", "bwMicE", 0.6, 1.0, 3);
btMicE = for_loop_variable("mix cloud entrain bt", "btMicE", 0.2, 1.4, 4);
bqMicE = for_loop_variable("mix cloud entrain bq", "bqMicE", 0.6, 1.0, 3);

bwDwzD = for_loop_variable("dwdz detrain bw", "bwDwzD", 0.6, 1.0, 3);
btDwzD = for_loop_variable("dwdz detrain bt", "btDwzD", 0.6, 1.4, 5);
bqDwzD = for_loop_variable("dwdz detrain bq", "bqDwzD", 0.6, 1.0, 3);
% dwdzFacD = for_loop_variable("dwdz detrain factor", "dwdzFacD", 1.0, 2.0, 11);

bwInsE = for_loop_variable("instab entrain bw", "bwInsE", 0.6, 1.0, 3);
btInsE = for_loop_variable("instab entrain bt", "btInsE", 0.6, 1.4, 5);
bqInsE = for_loop_variable("instab entrain bq", "bqInsE", 0.6, 1.0, 3);

% tke1FactorMix = for_loop_variable("mix tke1factor", "tke1FactorMix", 0.1, 2.0, 20);
% tke2FactorMix = for_loop_variable("mix tke2factor", "tke2FactorMix", 0.1, 0.5, 9);


% variables = [bwD, btD, bqD, bwE, btE, bqE];
% variables = [bw, bt, bq, bu];
% variables = [bu];
% variables = [bwMixD, bwMixE];
variables = [bwMixE, btMixE, bqMixE, bwMixD, btMixD, bqMixD, bwMicE, btMicE, bqMicE, bwMicD, btMicD, bqMicD, btInsE, bwInsE, bqInsE, bwDwzD, btDwzD, bqDwzD];


% settings.model.constants.param.Lfactor1 = 1.;
% settings.model.constants.param.Lfactor2 = 1.;
% settings.model.constants.param.dwdz.detrain_factor = 0.5;
% settings = find_best_settings(settings, variables, 'best_rmse', case_study);


% settings = find_best_settings(settings, variables, 'best_rmse', case_study);
for i=1:length(variables)
    find_best_settings(settings, [variables(i)], variables(i).id, case_study);
end


