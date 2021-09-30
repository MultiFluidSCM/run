function settings = model_settings(folders)
    settings.folders = folders;
    
    % Spatial discretisation
    settings.grid = set_grid();
    
    % Temporal discretisation and limits
    settings.time = set_time(0);
    
    % Case study specific settings such as vertical profiles, fluxes and wind speeds
    settings.forcing       = set_forcings();
    settings.initial_rv    = set_initial_rv();
    settings.initial_theta = set_initial_theta();
    settings.initial_sigma = set_initial_sigma();
    
    % Physical constants and parameterisation settings
    settings.constants = set_constants(settings.grid);
    
    
    
    % Model switches
    settings.switches = set_approximations();
    
    % Continue a previous simulation using the restart file saved at the end of a model run
    settings.restart_simulation = false;
    settings.restart_simulation_name = 'restart_00001740';
    
    % Include buoyancy correlation terms in SG fluxes
    settings.buoy_correl_eta = 0;
    settings.buoy_correl_q   = 0;
    
    % Times at which vertical profiles should be saved for LES comparison
    settings.output_times = 1800*(1:12);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Additional switches for on-the-fly plots %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Master switch - set to 0 for much faster simulation time
    settings.switches.plot = 0;
    
    % Type of plot output
    % 0 = output to screen
    % 1 = save image file
    settings.switches.plottype = 1;
    
    % Switches for individual plot groups
    settings.switches.plot_basic_fields    = 0;
    settings.switches.plot_time_series     = 0;
    settings.switches.plot_budgets         = 1;
    settings.switches.plot_turbulence      = 0;
    settings.switches.plot_ED              = 0;
    settings.switches.plot_adiabats        = 0;
    settings.switches.plot_std             = 0;
    settings.switches.plot_cloud_frac      = 0;
    settings.switches.plot_T_turb          = 0;
    settings.switches.plot_var_tend        = 0;
    settings.switches.plot_bflux           = 0;
    settings.switches.plot_bc_flux         = 0;
    settings.switches.plot_var_budgets     = 0;
    settings.switches.plot_res_time_series = 0;
    settings.switches.plot_ql_var          = 0;
    settings.switches.plot_theta_flux      = 0;
    settings.switches.plot_q_flux          = 0;
    settings.switches.plot_covariances     = 0;
    
    % Switches for individual plots
    settings.switches.plot_budgets_mass      = 0;
    settings.switches.plot_budgets_w         = 0;
    settings.switches.plot_budgets_entropy   = 0;
    settings.switches.plot_budgets_water     = 0;
    settings.switches.plot_budgets_tke       = 0;
    settings.switches.plot_budgets_transfers = 1;
end