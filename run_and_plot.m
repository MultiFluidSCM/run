function run_and_plot(case_study)
    clear
    
    if ~exist('case_study')
        case_study = "ARM";
    end
    
    % Add local folders containing source code to PATH
    addpath(genpath(pwd));
    
    % Read settings
    settings = get_settings(case_study);
    default
    
    % Run the 2FSCM
    two_fluid_scm(settings.model);
    
    % Plot diagnostics
    compare_scm_to_les(settings.plots);
end