function settings = get_settings(case_study)
    disp(join(["Setting up 2FSCM for",case_study]));
    
    settings.id = case_study;
    
    settings.folders = path_setup(case_study);

    settings.model = model_settings(case_study, settings.folders);
    
    settings.plots = plot_settings(case_study, settings.folders);
    
end