function [folder] = path_setup(case_study, folder_MultiFluidSCM)
    disp("Configuring paths");
    
    % Master folder
    if ~exist('folder_MultiFluidSCM')
        folder.MultiFluidSCM = fullfile(pwd, '..');
    else
        folder.MultiFluidSCM = folder_MultiFluidSCM;
    end
    
    % Root folder for the script
    folder.root = pwd;
    
    % Git repository for the test cases
    folder.test_cases = fullfile(folder.MultiFluidSCM, 'test_cases');
    
    % Git repository for the model source code
    folder.model = fullfile(folder.MultiFluidSCM, 'model');
    
    % Git repository for post-processing plotting source code
    folder.plots = fullfile(folder.MultiFluidSCM, 'plots');
    
    % Contains all outputs from the Two-Fluid Single Column Model
    folder.outputs = fullfile(folder.test_cases, 'outputs');
    
    % Contains case-study specific data from the 2FSCM (to be output)
    folder.data_scm = fullfile(folder.outputs, case_study);
    
    % Contains data from Large Eddy Simulations
    folder.data_les = fullfile(folder.plots, 'data_les');
    
    % Folder to save .fig files
    folder.figures = fullfile(folder.data_scm, 'figures');

    % Folder to save rendered figures as images
    folder.images = fullfile(folder.data_scm, 'images');
    
    % Folder with settings for model run and plots
    folder.settings = fullfile(folder.test_cases, 'settings');
    
    % Functions accessible for all test cases
	folder.src = fullfile(folder.test_cases, 'src');
    
    % The real-world case study used to initialise the simulation
    folder.case_study = fullfile(folder.test_cases, 'case_studies', case_study);

    % Add folder to the MATLAB path for this session
    addpath(genpath(folder.src));
    addpath(genpath(folder.settings));
    addpath(genpath(folder.model));
    addpath(genpath(folder.plots));
    addpath(genpath(folder.case_study));
    addpath(folder.data_les);
    addpath(folder.data_scm);

    % Create folder if they do not exist
    if ~exist(folder.data_scm, 'dir')
        mkdir(folder.data_scm);
    end
    
    if ~exist(folder.figures, 'dir')
        mkdir(folder.figures);
    end
    
    if ~exist(folder.images, 'dir')
        mkdir(folder.images);
    end
end