 % Run the multi-fluid model over range of parameter values

clear

case_study = "ARM";

folders_default = get_folders("bin", case_study);

% load("settings_5.mat");
if ~exist('settings', 'var')
    disp("No settings file detected, loading default settings as starting point.");
    settings = get_settings(folders_default);
    
    % Use sigma-weighted profiles to calculate the RMSE. Prevents high weight to cloud top.
    settings.plots.sigma_weighted_rmse = true;
end

bwMixE = settings.model.constants.param.mix.bentrainw;
btMixE = settings.model.constants.param.mix.bentraint;
bqMixE = settings.model.constants.param.mix.bentrainq;
buMixE = settings.model.constants.param.mix.bentrainu;
bwMixD = settings.model.constants.param.mix.bdetrainw;
btMixD = settings.model.constants.param.mix.bdetraint;
bqMixD = settings.model.constants.param.mix.bdetrainq;
buMixD = settings.model.constants.param.mix.bdetrainu;
bwMicE = settings.model.constants.param.mix_cloud.bentrainw;
btMicE = settings.model.constants.param.mix_cloud.bentraint;
bqMicE = settings.model.constants.param.mix_cloud.bentrainq;
buMicE = settings.model.constants.param.mix_cloud.bentrainu;
bwMicD = settings.model.constants.param.mix_cloud.bdetrainw;
btMicD = settings.model.constants.param.mix_cloud.bdetraint;
bqMicD = settings.model.constants.param.mix_cloud.bdetrainq;
buMicD = settings.model.constants.param.mix_cloud.bdetrainu;
bwInsE = settings.model.constants.param.instab.bentrainw;
btInsE = settings.model.constants.param.instab.bentraint;
bqInsE = settings.model.constants.param.instab.bentrainq;
buInsE = settings.model.constants.param.instab.bentrainu;
bwDwzD = settings.model.constants.param.dwdz.bdetrainw;
btDwzD = settings.model.constants.param.dwdz.bdetraint;
bqDwzD = settings.model.constants.param.dwdz.bdetrainq;
buDwzD = settings.model.constants.param.dwdz.bdetrainu;
insFacE = settings.model.constants.param.instab.entrain_factor;
dwdzFacD = settings.model.constants.param.dwdz.detrain_factor;
tke1FactorMix = settings.model.constants.param.mix.tke1_factor;
tke2FactorMix = settings.model.constants.param.mix.tke2_factor;
mynnA1 = settings.model.constants.param.MYNN.A1;
mynnA2 = settings.model.constants.param.MYNN.A2;
mynnB1 = settings.model.constants.param.MYNN.B1;
mynnB2 = settings.model.constants.param.MYNN.B2;


variables = {};
% variables{end+1} = gradient_variable("mix entrain bw",       "bwMixE", 0., 1.0, bwMixE, -0.1);
variables{end+1} = gradient_variable("mix entrain bt",       "btMixE", 0.1, 0.7, btMixE, -0.1);
variables{end+1} = gradient_variable("mix entrain bq",       "bqMixE", 0.1, 0.6, bqMixE, -0.1);
% variables{end+1} = gradient_variable("mix detrain bw",       "bwMixD", 0., 1.0, bwMixD, -0.1);
variables{end+1} = gradient_variable("mix detrain bt",       "btMixD", 0.5, 0.9, btMixD, -0.1);
variables{end+1} = gradient_variable("mix detrain bq",       "bqMixD", 0.7, 1.0, bqMixD, -0.1);
% variables{end+1} = gradient_variable("mix cloud entrain bw", "bwMicE", 0., 1.0, bwMicE, -0.1);
variables{end+1} = gradient_variable("mix cloud entrain bt", "btMicE", 0., 1.0, btMicE, -0.1);
variables{end+1} = gradient_variable("mix cloud entrain bq", "bqMicE", 0.1, 0.8, bqMicE, -0.1);
% variables{end+1} = gradient_variable("mix cloud detrain bw", "bwMicD", 0., 1.0, bwMicD, -0.1);
variables{end+1} = gradient_variable("mix cloud detrain bt", "btMicD", 0.7, 1.5, btMicD, -0.1);
% variables{end+1} = gradient_variable("mix cloud detrain bq", "bqMicD", 0.5, 1.0, bqMicD, -0.1);
% variables{end+1} = gradient_variable("instab entrain bw",    "bwInsE", 0., 1.0, bwInsE, -0.1);
variables{end+1} = gradient_variable("instab entrain bt",    "btInsE", 0.3, 0.8, btInsE, -0.1);
variables{end+1} = gradient_variable("instab entrain bq",    "bqInsE", 0.3, 0.6, bqInsE, -0.1);
variables{end+1} = gradient_variable("dwdz detrain bt",    "btDwzD", 0., 2.0, btDwzD, -0.1);
% variables{end+1} = gradient_variable("instab entrain factor", "insFacE", 0., 3.0, insFacE, -0.1);
% variables{end+1} = gradient_variable("dwdz detrain factor", "dwdzFacD", 1.0, 2.0, dwdzFacD, -0.1);
% variables{end+1} = gradient_variable("MYNN A ALL",           "mynnA", 0.,  5.0, mynnA2, -0.1);
% variables{end+1} = gradient_variable("MYNN B ALL",           "mynnB", 0., 50.0, mynnB1, -0.1);
% variables{end+1} = gradient_variable("MYNN A1",              "mynnA1", 0., 5.0, mynnA1, -0.1);
% variables{end+1} = gradient_variable("MYNN A2",              "mynnA2", 0., 5.0, mynnA2, -0.1);
% variables{end+1} = gradient_variable("MYNN B1",              "mynnB1", 0., 50.0, mynnB1, -0.1);
% variables{end+1} = gradient_variable("MYNN B2",              "mynnB2", 0., 50.0, mynnB2, -0.1);
% variables{end+1} = gradient_variable("mix tke2factor", "tke2FactorMix", 0.1, 2.0, tke2FactorMix, -0.1);



iterations = 100;
gradient_descent(settings, variables, iterations, case_study);
