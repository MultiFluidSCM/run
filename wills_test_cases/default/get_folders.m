function [folders] = get_folders(test_case_name)
    % Git repository for the model source code
    folders.model = fullfile(pwd, '..', '..', '..', 'model');

    % Contains matlab script source files
    folders.model_src = fullfile(folders.model, 'src');
    
    % Git repository for plotting source code
    folders.plots = fullfile(pwd, '..', '..', '..', 'plots');

    % Contains matlab script source files
    folders.plots_src = fullfile(folders.plots, 'src');
    
    % Contains plotting source files
    folders.plots_src_plots = fullfile(folders.plots_src, 'plots');

    % Contains data from Large Eddy Simulations
    folders.data_les = fullfile(folders.plots, 'data_les');

    % Contains data from Single Column Model
    folders.data_scm = fullfile(pwd, 'data_scm');
    
    % Folder to save .fig files
    folders.figures = fullfile(pwd, 'figures');

    % Folder to save rendered figures as images
    folders.images = fullfile(pwd, 'images');
    
    % Folder with settings for model run and plots
    folders.settings = fullfile(pwd, 'settings');
    
    % Folder containing entrainment and detrainment properties
    folders.settings_transfer_properties = fullfile(folders.settings, 'transfer_properties');

    % Add folders to the MATLAB path for this session
    addpath(folders.settings);
    addpath(folders.settings_transfer_properties);
    addpath(folders.model);
    addpath(folders.model_src);
    addpath(folders.plots);
    addpath(folders.plots_src);
    addpath(folders.plots_src_plots);
    addpath(folders.data_les);
    addpath(folders.data_scm);
    addpath(fullfile(folders.model_src, 'physics'));
    addpath(fullfile(folders.model_src, 'numerics'));
    addpath(fullfile(folders.model_src, 'plots'));
    addpath(fullfile(folders.model_src, 'checks'));
    addpath(fullfile(folders.model_src, 'tests'));
    addpath(fullfile(folders.model_src, 'utilities'));

    % Create folders if they do not exist
    if ~exist(folders.figures, 'dir')
        mkdir(folders.figures);
    end
    
    if ~exist(folders.images, 'dir')
        mkdir(folders.images);
    end
end