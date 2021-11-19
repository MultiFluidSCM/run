function settings = plot_settings(folders)
    settings.folders = folders;
    
    % Select LES data set to compare results with
    settings.test_case = "ARM_MONC";
    
    % Gravitational acceleration
    settings.gravity = 9.806;

    % Figure font size
    settings.fs = 18;

    % Top of plots
    settings.zplottop = 4000;
    
    % Plot original set of figures from September 2020
    % Feature to be removed once other features optimised
    settings.plot_original_figures = false;
    
    % Plot every vertical profile (long computation)
    settings.plot_individual_profiles = true;
    
    % Save figures as .fig files?
    settings.save_figures = true;
    
    % Save figures as .png files?
    settings.save_images = true;
    
    % Render tile-based plots composed of multiply figures?
    settings.plot_combinations = true;
    
    % Indicate location of cloud base in 1D profiles?
    settings.indicate_cloud_base = true;
    
    % Times at which SCM is plotted against LES data
    settings.times_to_plot = [32400];
    
    % Choose sigma weighting to minimise influence of cloud top
    settings.sigma_weighted_rmse = false;
    
    % Weights of variables towards the total RMSE calculation
    settings.weights         = struct();
    settings.weights.sigma_2 = 1;
    settings.weights.b_2     = 0;
    settings.weights.w_2     = 0;
    settings.weights.ww_res2 = 0;
    settings.weights.ww_sg2  = 0;
    settings.weights.e_2     = 0;
    settings.weights.e_res2  = 0;
    settings.weights.e_sg2   = 0;
    settings.weights.q_2     = 0;
    settings.weights.qv_2    = 0;
    settings.weights.ql_2    = 0;
    settings.weights.cloud   = 0;
    
    % File containing SCM data
    settings.scm_data = fullfile(folders.data_scm, 'SCM_results.mat');

end
