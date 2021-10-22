% Run the multi-fluid model over range of parameter values

clear

case_study = "ARM";

folders_default = get_folders("bin", case_study);

% load("settings_9.mat");
if ~exist('settings', 'var')
    disp("No settings file detected, loading default settings as starting point.");
    settings = get_settings(folders_default);
end

% List of fractional sensitivities relative to the default setting
sensitivities = [-0.001, 0.001, -0.005, 0., 0.005, -0.01, 0.01];
% sensitivities = [-0.001, 0.001];

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
dwdzFacD = settings.model.constants.param.dwdz.detrain_factor;
tke1FactorMix = settings.model.constants.param.mix.tke1_factor;
tke2FactorMix = settings.model.constants.param.mix.tke2_factor;

variables = {};
variables{end+1} = sensitivity_variable("mix detrain bw",       "bwMixD", bwMixD, sensitivities);
variables{end+1} = sensitivity_variable("mix detrain bt",       "btMixD", btMixD, sensitivities);
variables{end+1} = sensitivity_variable("mix detrain bq",       "bqMixD", bqMixD, sensitivities);
variables{end+1} = sensitivity_variable("mix detrain bu",       "buMixD", buMixD, sensitivities);
variables{end+1} = sensitivity_variable("mix entrain bw",       "bwMixE", bwMixE, sensitivities);
variables{end+1} = sensitivity_variable("mix entrain bt",       "btMixE", btMixE, sensitivities);
variables{end+1} = sensitivity_variable("mix entrain bq",       "bqMixE", bqMixE, sensitivities);
variables{end+1} = sensitivity_variable("mix entrain bu",       "buMixE", buMixE, sensitivities);
variables{end+1} = sensitivity_variable("mix cloud detrain bw", "bwMicD", bwMicD, sensitivities);
variables{end+1} = sensitivity_variable("mix cloud detrain bt", "btMicD", btMicD, sensitivities);
variables{end+1} = sensitivity_variable("mix cloud detrain bq", "bqMicD", bqMicD, sensitivities);
variables{end+1} = sensitivity_variable("mix cloud detrain bu", "buMicD", buMicD, sensitivities);
variables{end+1} = sensitivity_variable("mix cloud entrain bt", "btMicE", btMicE, sensitivities);
variables{end+1} = sensitivity_variable("mix cloud entrain bq", "bqMicE", bqMicE, sensitivities);
variables{end+1} = sensitivity_variable("mix cloud entrain bu", "buMicE", buMicE, sensitivities);
variables{end+1} = sensitivity_variable("instab entrain bw",    "bwInsE", bwInsE, sensitivities);
variables{end+1} = sensitivity_variable("instab entrain bt",    "btInsE", btInsE, sensitivities);
variables{end+1} = sensitivity_variable("instab entrain bq",    "bqInsE", bqInsE, sensitivities);
variables{end+1} = sensitivity_variable("instab entrain bu",    "buInsE", buInsE, sensitivities);
variables{end+1} = sensitivity_variable("dwdz detrain bw",      "bwDwzD", bwDwzD, sensitivities);
variables{end+1} = sensitivity_variable("dwdz detrain bt",      "btDwzD", btDwzD, sensitivities);
variables{end+1} = sensitivity_variable("dwdz detrain bq",      "bqDwzD", bqDwzD, sensitivities);
variables{end+1} = sensitivity_variable("dwdz detrain bu",      "buDwzD", buDwzD, sensitivities);
variables{end+1} = sensitivity_variable("dwdz detrain factor",  "dwdzFacD", dwdzFacD, sensitivities);
variables{end+1} = sensitivity_variable("mix tke1factor",  "tke1FactorMix", tke1FactorMix, sensitivities);
variables{end+1} = sensitivity_variable("mix tke2factor",  "tke2FactorMix", tke2FactorMix, sensitivities);

% settings.model.constants.param.Lfactor1 = 1.;
% settings.model.constants.param.Lfactor2 = 1.;

for i=1:length(variables)
    find_best_settings(settings, [variables{i}], variables{i}.id, case_study);
end


