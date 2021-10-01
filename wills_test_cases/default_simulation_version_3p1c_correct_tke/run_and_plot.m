% Compare SCM results with LES

clear

case_study = "ARM";

folders = get_folders("data_scm", case_study);

settings = get_settings(folders);

%multi_fluid_model(settings.model);

compare_scm_to_les(settings.plots);