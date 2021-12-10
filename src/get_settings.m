function settings = get_settings(case_study)
    disp(join(["Setting up 2FSCM for",case_study]));
    
    if ~exist('case_study')
        case_study = "ARM";
    end
    
    settings.id = case_study;
    
    settings.folders = path_setup(case_study);
    
    % Load default settings configuration file
    settings__default
    
    % Load user-specified changes to default configuration
    % This will overwrite some existing settings from settings__default
    if exist('settings__user')
        settings__user
    else
        filename_settings__default = fullfile(settings.folders.settings, 'settings__default.m');
        filename_settings__user    = fullfile(settings.folders.settings, 'settings__user.m');
        copyfile(filename_settings__default, filename_settings__user);
    end
    
    % Load case study specific settings such as initial profiles and forcings
    % This will overwrite some existing settings from settings__default and settings__user
    settings_case_study = join(['settings_',case_study], '');
    if exist(settings_case_study)
        custom_settings = str2func(settings_case_study);
        custom_settings();
    else
        warning("Case study settings file (%s) not found", settings_case_study);
    end
end