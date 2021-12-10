function run_2FSCM(case_study)
    
    if ~exist('case_study')
        case_study = "ARM";
    end
    
    % Add local folders containing source code to PATH
    addpath(genpath(pwd));
    
    % Read settings
    settings = get_settings(case_study);
    
    % Run the 2FSCM
    two_fluid_scm(settings.model);
end