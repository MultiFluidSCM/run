function [folders] = get_folders()
    %Git repository for plotting source code
    folders.plots = fullfile(pwd, '..', '..', 'plots');

    %Contains matlab script source files
    folders.src = fullfile(folders.plots, 'src');
    
    %Contains plotting source files
    folders.src_plots = fullfile(folders.src, 'plots');

    %Contains data from Large Eddy Simulations
    folders.data_les = fullfile(folders.plots, 'data_les');

    %Contains data from Single Column Model
    folders.data_scm = fullfile(pwd, 'data_scm');

    %Folder to save .fig files
    folders.figures = fullfile(pwd, 'figures');

    %Folder to save rendered figures as images
    folders.images = fullfile(pwd, 'images');
    
    %Folder to save rendered figures as images
    folders.settings = fullfile(pwd, 'settings');

    %Add folders to the MATLAB path for this session
    addpath(folders.settings);
    addpath(folders.plots);
    addpath(folders.src);
    addpath(folders.src_plots);
    addpath(folders.data_les);
    addpath(folders.data_scm);

    %Create folders if they do not exist
    if ~exist(folders.figures, 'dir')
       mkdir(folders.figures);
    end
    if ~exist(folders.images, 'dir')
       mkdir(folders.images);
    end
end