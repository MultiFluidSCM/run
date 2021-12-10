% Transition the tunable parameters in the multi-fluid model between one model version and another
% The script will smoothly transition between settings_1.mat and settings2.mat
% The number of intermediate models is determined by transition_resolution

clear

folders = get_folders("bin");

transition_resolution = 25;

load("settings_v3.mat")
settings1 = load("settings_v3.mat");
settings2 = load("settings_vLES.mat");

% Get the tunable parameters from model version 1
bwMixE1 = settings1.settings.model.constants.param.mix.bentrainw;
btMixE1 = settings1.settings.model.constants.param.mix.bentraint;
bqMixE1 = settings1.settings.model.constants.param.mix.bentrainq;
buMixE1 = settings1.settings.model.constants.param.mix.bentrainu;
bwMixD1 = settings1.settings.model.constants.param.mix.bdetrainw;
btMixD1 = settings1.settings.model.constants.param.mix.bdetraint;
bqMixD1 = settings1.settings.model.constants.param.mix.bdetrainq;
buMixD1 = settings1.settings.model.constants.param.mix.bdetrainu;
bwMicE1 = settings1.settings.model.constants.param.mix_cloud.bentrainw;
btMicE1 = settings1.settings.model.constants.param.mix_cloud.bentraint;
bqMicE1 = settings1.settings.model.constants.param.mix_cloud.bentrainq;
buMicE1 = settings1.settings.model.constants.param.mix_cloud.bentrainu;
bwMicD1 = settings1.settings.model.constants.param.mix_cloud.bdetrainw;
btMicD1 = settings1.settings.model.constants.param.mix_cloud.bdetraint;
bqMicD1 = settings1.settings.model.constants.param.mix_cloud.bdetrainq;
buMicD1 = settings1.settings.model.constants.param.mix_cloud.bdetrainu;
bwInsE1 = settings1.settings.model.constants.param.instab.bentrainw;
btInsE1 = settings1.settings.model.constants.param.instab.bentraint;
bqInsE1 = settings1.settings.model.constants.param.instab.bentrainq;
buInsE1 = settings1.settings.model.constants.param.instab.bentrainu;
bwDwzD1 = settings1.settings.model.constants.param.dwdz.bdetrainw;
btDwzD1 = settings1.settings.model.constants.param.dwdz.bdetraint;
bqDwzD1 = settings1.settings.model.constants.param.dwdz.bdetrainq;
buDwzD1 = settings1.settings.model.constants.param.dwdz.bdetrainu;
dwdzFacD1 = settings1.settings.model.constants.param.dwdz.detrain_factor;
tke1FactorMix1 = settings1.settings.model.constants.param.mix.tke1_factor;
tke2FactorMix1 = settings1.settings.model.constants.param.mix.tke2_factor;

% Get the tunable parameters from model version 2
bwMixE2 = settings2.settings.model.constants.param.mix.bentrainw;
btMixE2 = settings2.settings.model.constants.param.mix.bentraint;
bqMixE2 = settings2.settings.model.constants.param.mix.bentrainq;
buMixE2 = settings2.settings.model.constants.param.mix.bentrainu;
bwMixD2 = settings2.settings.model.constants.param.mix.bdetrainw;
btMixD2 = settings2.settings.model.constants.param.mix.bdetraint;
bqMixD2 = settings2.settings.model.constants.param.mix.bdetrainq;
buMixD2 = settings2.settings.model.constants.param.mix.bdetrainu;
bwMicE2 = settings2.settings.model.constants.param.mix_cloud.bentrainw;
btMicE2 = settings2.settings.model.constants.param.mix_cloud.bentraint;
bqMicE2 = settings2.settings.model.constants.param.mix_cloud.bentrainq;
buMicE2 = settings2.settings.model.constants.param.mix_cloud.bentrainu;
bwMicD2 = settings2.settings.model.constants.param.mix_cloud.bdetrainw;
btMicD2 = settings2.settings.model.constants.param.mix_cloud.bdetraint;
bqMicD2 = settings2.settings.model.constants.param.mix_cloud.bdetrainq;
buMicD2 = settings2.settings.model.constants.param.mix_cloud.bdetrainu;
bwInsE2 = settings2.settings.model.constants.param.instab.bentrainw;
btInsE2 = settings2.settings.model.constants.param.instab.bentraint;
bqInsE2 = settings2.settings.model.constants.param.instab.bentrainq;
buInsE2 = settings2.settings.model.constants.param.instab.bentrainu;
bwDwzD2 = settings2.settings.model.constants.param.dwdz.bdetrainw;
btDwzD2 = settings2.settings.model.constants.param.dwdz.bdetraint;
bqDwzD2 = settings2.settings.model.constants.param.dwdz.bdetrainq;
buDwzD2 = settings2.settings.model.constants.param.dwdz.bdetrainu;
dwdzFacD2 = settings2.settings.model.constants.param.dwdz.detrain_factor;
tke1FactorMix2 = settings2.settings.model.constants.param.mix.tke1_factor;
tke2FactorMix2 = settings2.settings.model.constants.param.mix.tke2_factor;

variables = [...
	transition_variable("mix detrain bw",       bwMixD1, bwMixD2, transition_resolution), ...
	transition_variable("mix detrain bt",       btMixD1, btMixD2, transition_resolution), ...
	transition_variable("mix detrain bq",       bqMixD1, bqMixD2, transition_resolution), ...
	transition_variable("mix detrain bu",       buMixD1, buMixD2, transition_resolution), ...
	transition_variable("mix entrain bw",       bwMixE1, bwMixE2, transition_resolution), ...
	transition_variable("mix entrain bt",       btMixE1, btMixE2, transition_resolution), ...
	transition_variable("mix entrain bq",       bqMixE1, bqMixE2, transition_resolution), ...
	transition_variable("mix entrain bu",       buMixE1, buMixE2, transition_resolution), ...
    transition_variable("mix cloud detrain bw", bwMicD1, bwMicD2, transition_resolution), ...
	transition_variable("mix cloud detrain bt", btMicD1, btMicD2, transition_resolution), ...
	transition_variable("mix cloud detrain bq", bqMicD1, bqMicD2, transition_resolution), ...
	transition_variable("mix cloud detrain bu", buMicD1, buMicD2, transition_resolution), ...
	transition_variable("mix cloud entrain bw", bwMicE1, bwMicE2, transition_resolution), ...
	transition_variable("mix cloud entrain bt", btMicE1, btMicE2, transition_resolution), ...
	transition_variable("mix cloud entrain bq", bqMicE1, bqMicE2, transition_resolution), ...
	transition_variable("mix cloud entrain bu", buMicE1, buMicE2, transition_resolution), ...
    transition_variable("instab entrain bw",    bwInsE1, bwInsE2, transition_resolution), ...
	transition_variable("instab entrain bt",    btInsE1, btInsE2, transition_resolution), ...
	transition_variable("instab entrain bq",    bqInsE1, bqInsE2, transition_resolution), ...
	transition_variable("instab entrain bu",    buInsE1, buInsE2, transition_resolution), ...
    transition_variable("dwdz detrain bw",      bwDwzD1, bwDwzD2, transition_resolution), ...
	transition_variable("dwdz detrain bt",      btDwzD1, btDwzD2, transition_resolution), ...
	transition_variable("dwdz detrain bq",      bqDwzD1, bqDwzD2, transition_resolution), ...
	transition_variable("dwdz detrain bu",      buDwzD1, buDwzD2, transition_resolution), ...
	transition_variable("dwdz detrain factor",  dwdzFacD1, dwdzFacD2, transition_resolution), ...
	transition_variable("mix tke1factor",  tke1FactorMix1, tke1FactorMix2, transition_resolution), ...
	transition_variable("mix tke2factor",  tke2FactorMix1, tke2FactorMix2, transition_resolution)
];

settings.model.constants.param.MYNN.A1 = 0.3;
settings.model.constants.param.MYNN.A2 = 0.3;
settings.model.constants.param.MYNN.B1 = 5.0;
settings.model.constants.param.MYNN.B2 = 5.0;

iteration_ids = {};
rmses = [];
for j=1:transition_resolution
    for i=1:length(variables)
        settings = update_all_settings(settings, folders, [variables(i)], [variables(i).values(j)]);
    end
    
    % Update folder settings for new simulation
    name = join(["iteration_", j], "");
    folders = get_folders(name);
    settings = update_all_settings(settings, folders, [], []);
    try_model(settings.model);
    
    if isfile(fullfile(folders.data_scm, "SCM_results.mat"))
        settings.plots.plot_individual_profiles = true;
        rmse_init = compare_scm_to_les(settings.plots);
        settings.plots.plot_individual_profiles = false;
        
        iteration_ids{end+1} = j;
        rmses(end+1) = rmse_init;
        
        % Save record of rms errors
        save_rmse_dat(fullfile(folders.root, 'rmse.dat'), iteration_ids, rmses, 1:length(rmses));
        
        % Save default settings for this iteration
        save(fullfile(folders.data_scm, join(["settings_",j,".mat"],"")), 'settings');
    else
        disp("Simulation did not complete successfully");
    end
end


