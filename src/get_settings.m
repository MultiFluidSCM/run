function settings = get_settings(case_study)
    disp(join(["Setting up 2FSCM for",case_study]));
    
    if ~exist('case_study')
        case_study = "ARM";
    end
    
    settings.id = case_study;
    
    settings.folders = path_setup(case_study);
    
    % Load default settings configuration file
    % NOTE: The clear operation is absolutely critical to get Matlab to consistently update
    % the settings (issue present even between different sessions and PC restarts).
    % See: https://uk.mathworks.com/matlabcentral/answers/29096-stale-files-used-instead-of-updated-files
    filename_settings__default = fullfile(settings.folders.settings, 'settings__default.m');
    clear(filename_settings__default);
    run(filename_settings__default);
    
    % Load user-specified changes to default configuration
    % This will overwrite some existing settings from settings__default
    filename_settings__user    = fullfile(settings.folders.settings, 'settings__user.m');
    if exist(filename_settings__user)
        clear(filename_settings__user);
        run(filename_settings__user);
    else
        copyfile(filename_settings__default, filename_settings__user);
    end
    
    % Load case study specific settings such as initial profiles and forcings
    % This will overwrite some existing settings from settings__default and settings__user
    settings_case_study = join(['settings_',case_study], '');
    filename_settings__case_study = fullfile(settings.folders.settings, join([settings_case_study,'.m'], ''));
    if exist(settings_case_study)
        clear(filename_settings__case_study);
        run(filename_settings__case_study);
    else
        warning("Case study settings file (%s) not found", settings_case_study);
    end
    
    % Copy settings files to output folder for easy reproducability
    copyfile(filename_settings__default,    settings.folders.data_scm);
    copyfile(filename_settings__user,       settings.folders.data_scm);
    copyfile(filename_settings__case_study, settings.folders.data_scm);
end