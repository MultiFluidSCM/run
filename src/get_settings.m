function settings = get_settings(case_study)
    disp(join(["Setting up 2FSCM for",case_study]));
    
    settings.id = case_study;
    
    settings.folders = path_setup(case_study);
    
    settings__default
    
    if case_study == "ARM"
        settings_ARM
    elseif case_study == "BOMEX"
        settings_BOMEX
    end
    
end