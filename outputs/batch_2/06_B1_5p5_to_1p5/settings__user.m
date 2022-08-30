%--------------------------------------------------------------------------------------------------%
% TEMPORAL DISCRETISATION 

% Simulation duration and timestep
settings.model.time.tstart = 0;
settings.model.time.tstop  = 3600;
settings.model.time.dt = 30;


%--------------------------------------------------------------------------------------------------%
% SPATIAL DISCRETISATION

% Domain limits
settings.model.grid.zbot = 0;
settings.model.grid.ztop = 3000;

% Number of levels
settings.model.grid.nz = 50;

% Stretch factor for grid
% Ratio of top layer thickness to lowest layer thickness
settings.model.grid.totstretch = 5.0;

%--------------------------------------------------------------------------------------------------%
% SOLVER SETTINGS

% Default number of quasi-Newton iterations
settings.model.solver.qn_iter_max_default = 4;

% Choose to use a different number of quasi-Newton iterations for the first few timesteps.
% The number of timesteps is determined by the integer below
settings.model.solver.qn_start_timesteps = 0;

% Number of iterations for thefirst few timesteps (based on qn_long_timesteps)
settings.model.solver.qn_iter_max_start  = 8;


%--------------------------------------------------------------------------------------------------%
% INITIAL CONDITIONS

% Initial potential temperature profile
settings.model.initial.theta.z = 0;
settings.model.initial.theta.f = 300;

% Initial moisture profile
settings.model.initial.qv.z = 0;
settings.model.initial.qv.f = 0;

% Initial velocity profiles
settings.model.initial.u.z = 0;
settings.model.initial.u.f = 0;
settings.model.initial.v.z = 0;
settings.model.initial.v.f = 0;
settings.model.initial.w.z = 0;
settings.model.initial.w.f = 0;

% Initial fluid 2 volume fraction profile
settings.model.initial.sigma.z = 0;
settings.model.initial.sigma.f = 0.001;

% Pressure at the surface
settings.model.surface_pressure = 100000;


%--------------------------------------------------------------------------------------------------%
% FORCINGS


% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct BOMEX values

% Geostrophic wind
settings.model.forcing.ug.z = 0;
settings.model.forcing.ug.f = 0;
settings.model.forcing.vg.z = 0;
settings.model.forcing.vg.f = 0;

% Subsidence
settings.model.forcing.wsub.z = 0;
settings.model.forcing.wsub.f = 0;

% Radiative cooling
settings.model.forcing.rad.z = 0;
settings.model.forcing.rad.f = 0;

% Moisture forcing
settings.model.forcing.q.z = 0;
settings.model.forcing.q.f = 0;

% Surface sensible heat flux
settings.model.forcing.sshf.t = 0;
settings.model.forcing.sshf.f = 0;
% Surface latent heat flux
settings.model.forcing.slhf.t = 0;
settings.model.forcing.slhf.f = 0;
% Domain top sensible heat flux
settings.model.forcing.tshf.t = 0;
settings.model.forcing.tshf.f = 0;
% Domain top latent heat flux
settings.model.forcing.tlhf.t = 0;
settings.model.forcing.tlhf.f = 0;


%--------------------------------------------------------------------------------------------------%
% PARAMETERISATION CHOICES

% Include buoyancy correlation terms in SG fluxes
settings.model.buoy_correl_eta = 0;
settings.model.buoy_correl_q   = 0;

settings.model.constants.param.sigma00    = 0.001;   % Background sigma2 when nothing is going on
settings.model.constants.param.cld_thresh = 0.002;   % Threshold for detecting cloud base and cloud height
settings.model.constants.param.confrac    = 0.10;    % Reference updraft mass fraction
settings.model.constants.param.zrough     = 0.1;     % Roughness length

% Factors to multiply the turbulent length scales by
settings.model.constants.param.Lfactor1 = 1.0;
settings.model.constants.param.Lfactor2 = 1.0;

% Use sigma-weighted TKE when calculating the turbulent length scales.
settings.model.constants.param.sigma_weighted_tke = false;

% Magic numbers - dimensional constants that are not constants
% of nature - to be deprecated and avoided if at all possible
% Minimum permitted tke (J / kg)
settings.model.constants.param.tke_min   = 1e-4 ;
% Minimum allowed boundary layer depth (m)
settings.model.constants.param.zstar_min = 50;

% Constants in Mellor-Yamada_Nakanishi-Niino clousures
settings.model.constants.param.MYNN.A1 = 0.7;
settings.model.constants.param.MYNN.A2 = 0.7;
settings.model.constants.param.MYNN.B1 = 1.5;
settings.model.constants.param.MYNN.B2 = 0.5;
settings.model.constants.param.MYNN.C1 = 0;
settings.model.constants.param.MYNN.C2 = 0;
settings.model.constants.param.MYNN.C3 = 0;
settings.model.constants.param.MYNN.C4 = 0;
settings.model.constants.param.MYNN.C5 = 0;

% INSTABILITY ENTRAINMENT (Surface)
%-----------------------------------------------%
% Transfer properties based on the PDFs
settings.model.constants.param.instab.use_pdf = false;
% Entrainment/detrainment switches and strengths. 
settings.model.constants.param.instab.entrain = true;
settings.model.constants.param.instab.detrain = false;
settings.model.constants.param.instab.entrain_factor = 0.25;
settings.model.constants.param.instab.detrain_factor = 0;
% Factors for transferred properties 
% Vertical velocity, eta, water, and u & v.
settings.model.constants.param.instab.bentrainw = 0.6;
settings.model.constants.param.instab.bentraint = 1.0;
settings.model.constants.param.instab.bentrainq = 0.8;
settings.model.constants.param.instab.bentrainu = 1.0;
settings.model.constants.param.instab.bdetrainw = 1.0; 
settings.model.constants.param.instab.bdetraint = 1.0;
settings.model.constants.param.instab.bdetrainq = 1.0;
settings.model.constants.param.instab.bdetrainu = 1.0;
%-----------------------------------------------%

% DRY TURBULENT MIXING (Boundary layer)
%-----------------------------------------------%
% Transfer properties based on the PDFs
settings.model.constants.param.mix.use_pdf = false;
% Entrainment/detrainment switches and strengths. 
settings.model.constants.param.mix.entrain = true;
settings.model.constants.param.mix.detrain = true;
settings.model.constants.param.mix.tke1_factor = 0;
settings.model.constants.param.mix.tke2_factor = 0.5;
% Factors for transferred properties 
% Vertical velocity, eta, water, and u & v.
settings.model.constants.param.mix.bentrainw = 1.0;
settings.model.constants.param.mix.bentraint = 0.6;
settings.model.constants.param.mix.bentrainq = 0.3;
settings.model.constants.param.mix.bentrainu = 1.0;
settings.model.constants.param.mix.bdetrainw = 1.0; 
settings.model.constants.param.mix.bdetraint = 0.6;
settings.model.constants.param.mix.bdetrainq = 1.0;
settings.model.constants.param.mix.bdetrainu = 1.0;
%-----------------------------------------------%

% MOIST TURBULENT MIXING (Cloud layer)
%-----------------------------------------------%
% Transfer properties based on the PDFs
settings.model.constants.param.mix_cloud.use_pdf = false;
% Entrainment/detrainment switches and strengths. 
settings.model.constants.param.mix_cloud.entrain = true;
settings.model.constants.param.mix_cloud.detrain = true;
% Factors for transferred properties 
% Vertical velocity, eta, water, and u & v.
settings.model.constants.param.mix_cloud.bentrainw = 1.2;
settings.model.constants.param.mix_cloud.bentraint = 1.5;
settings.model.constants.param.mix_cloud.bentrainq = 1.5;
settings.model.constants.param.mix_cloud.bentrainu = 1.0;
settings.model.constants.param.mix_cloud.bdetrainw = 1.0; 
settings.model.constants.param.mix_cloud.bdetraint = 1.5;
settings.model.constants.param.mix_cloud.bdetrainq = 0.9;
settings.model.constants.param.mix_cloud.bdetrainu = 1.0;
%-----------------------------------------------%

% FORCED DETRAINMENT (Cloud and BL top)
%-----------------------------------------------%
% Transfer properties based on the PDFs
settings.model.constants.param.dwdz.use_pdf = false;
% Entrainment/detrainment switches and strengths. 
settings.model.constants.param.dwdz.entrain = false;
settings.model.constants.param.dwdz.detrain = true;
settings.model.constants.param.dwdz.entrain_factor = 1;
settings.model.constants.param.dwdz.detrain_factor = 1;
% Factors for transferred properties 
% Vertical velocity, eta, water, and u & v.
settings.model.constants.param.dwdz.bentrainw = 0.5;
settings.model.constants.param.dwdz.bentraint = 1.0;
settings.model.constants.param.dwdz.bentrainq = 1.0;
settings.model.constants.param.dwdz.bentrainu = 1.0;
settings.model.constants.param.dwdz.bdetrainw = 0.5; 
settings.model.constants.param.dwdz.bdetraint = 1.0;
settings.model.constants.param.dwdz.bdetrainq = 0.9;
settings.model.constants.param.dwdz.bdetrainu = 1.0;
%-----------------------------------------------%

% PDF SORTING DETRAINMENT (Cloud and BL top)
%-----------------------------------------------%
% Entrainment/detrainment switches and strengths. 
settings.model.constants.param.sort.entrain = false;
settings.model.constants.param.sort.detrain = false;
settings.model.constants.param.sort.entrain_factor = 1;
settings.model.constants.param.sort.detrain_factor = 1;
% Factors for transferred properties
settings.model.constants.param.dwdz.bentrainu = 1.0;
settings.model.constants.param.dwdz.bdetrainu = 1.0;
%-----------------------------------------------%

%--------------------------------------------------------------------------------------------------%
% PHYSICAL CONSTANTS

% Gravity
settings.model.constants.phys.gravity  = 9.806;
% von Karman constant  
settings.model.constants.phys.k        = 0.4;
% Roughness length for diffusion
settings.model.constants.phys.zrough   = 0.035;
% Reference pressure for potential temperature
settings.model.constants.phys.p00      = 100000;
% Coriolis parameter
settings.model.constants.phys.coriolis = 8.5e-5;


%--------------------------------------------------------------------------------------------------%
% THERMODYNAMIC CONSTANTS

% Gas constant for dry air
settings.model.constants.therm.Rd = 287.00;
% Gas constant for water vapour
settings.model.constants.therm.Rv = 461.00;
settings.model.constants.therm.epsilon = settings.model.constants.therm.Rd/settings.model.constants.therm.Rv;
% Specific heat capacity at constant pressure, dry air
settings.model.constants.therm.Cpd = 1004.0;
% Specific heat capacity at constant pressure, vapour
settings.model.constants.therm.Cpv = 1885.0;
% Specific heat capacity of liquid water
settings.model.constants.therm.Cl = 4186.0;
% Specific heat capacity of frozen water
settings.model.constants.therm.Cf = 2106.0;
settings.model.constants.therm.Cvd = settings.model.constants.therm.Cpd - settings.model.constants.therm.Rd;
settings.model.constants.therm.Cvv = settings.model.constants.therm.Cpv - settings.model.constants.therm.Rv;
settings.model.constants.therm.kappa = settings.model.constants.therm.Rd/settings.model.constants.therm.Cpd;
% Specific latent heat of vaporization at T0 and p0d [p0v]
settings.model.constants.therm.L0 = 2.501e6;
% Specific latent heat of sublimation at T0 and p0d [p0v] (L0f = L0s - L0 = 0.333e6)
settings.model.constants.therm.L0s = 2.834e6;
% Specific volume of liquid water
settings.model.constants.therm.alpha0 = 0.001;
% Specific volume of frozen water
settings.model.constants.therm.alpha0f = 0.0011;
% Reference pressure for dry air
settings.model.constants.therm.p0d = 100000.0;
% Reference pressure for vapour, equal to saturation vapour pressure at T0
settings.model.constants.therm.p0v = 611.657;
% Reference pressure for vapour over ice, equal to saturation vapour pressure at T0
settings.model.constants.therm.p0vf = 611.657;
% Reference temperature
settings.model.constants.therm.T0 = 273.16;
% Specific latent heat of vaporization extrapolated to 0K and p = 0
settings.model.constants.therm.L00 = settings.model.constants.therm.L0 ...
    - (settings.model.constants.therm.Cpv - settings.model.constants.therm.Cl)*...
    settings.model.constants.therm.T0 + settings.model.constants.therm.alpha0*settings.model.constants.therm.p0v;
% Specific latent heat of sublimation extrapolated to 0K and p = 0
settings.model.constants.therm.L00s = settings.model.constants.therm.L0s ...
    - (settings.model.constants.therm.Cpv - settings.model.constants.therm.Cf)*...
    settings.model.constants.therm.T0 + settings.model.constants.therm.alpha0f*settings.model.constants.therm.p0v;


%--------------------------------------------------------------------------------------------------%
% SWITCHES

% Switch (a)
% 0 use fluid 1 thermodynamic equation;
% 1 replace fluid 1 thermodynamic equation by mean fluid
% thermodynamic equation
settings.model.switches.a = 0;

% Switch (b)
% 0 use sum of fluid 1 and fluid 2 subfilter-scale fluxes in the
%   implied mean fluid equations
% 1 use a mean fluid subfilter-scale flux in the implied mean
%   fluid equations
settings.model.switches.b = 0;

% Switch (c)
% 0 use full prognostic equations for fluid 2
% 1 neglect time derivatives in fluid 2 but retain full time
%   derivatives in mean fluid equations
settings.model.switches.c = 0;

% Switch (d)
% 0 retain subfilter-scale fluxes in fluid 2
% 1 neglect subfilter-scale fluxes in fluid 2 except at first p level
settings.model.switches.d = 0;

% Switch (e)
% 0 retain the full conditional filtering fluxes in the implied mean
%   fluid equation
% 1 make the small area approximation in the conditional filtering
%   fluxes in the implied mean fluid equation
settings.model.switches.e = 0;


% Additional switches for on-the-fly plots
% Master switch - set to 0 for much faster simulation time
settings.model.switches.plot = 0;

% Type of plot output
% 0 = output to screen
% 1 = save image file
settings.model.switches.plottype = 1;

% Switches for individual plot groups
settings.model.switches.plot_basic_fields    = 0;
settings.model.switches.plot_time_series     = 0;
settings.model.switches.plot_budgets         = 0;
settings.model.switches.plot_turbulence      = 0;
settings.model.switches.plot_ED              = 0;
settings.model.switches.plot_adiabats        = 0;
settings.model.switches.plot_std             = 0;
settings.model.switches.plot_cloud_frac      = 0;
settings.model.switches.plot_T_turb          = 0;
settings.model.switches.plot_var_tend        = 0;
settings.model.switches.plot_bflux           = 0;
settings.model.switches.plot_bc_flux         = 0;
settings.model.switches.plot_var_budgets     = 0;
settings.model.switches.plot_res_time_series = 0;
settings.model.switches.plot_ql_var          = 0;
settings.model.switches.plot_theta_flux      = 0;
settings.model.switches.plot_q_flux          = 0;
settings.model.switches.plot_covariances     = 0;

% Switches for individual plots
settings.model.switches.plot_budgets_mass      = 0;
settings.model.switches.plot_budgets_w         = 0;
settings.model.switches.plot_budgets_entropy   = 0;
settings.model.switches.plot_budgets_water     = 0;
settings.model.switches.plot_budgets_tke       = 0;
settings.model.switches.plot_budgets_transfers = 0;


%--------------------------------------------------------------------------------------------------%
% POST-PROCESSING PLOTTING

% Select LES data set ID to compare results with
settings.plots.test_case = "default";

% Which snapshots to output from the 2FSCM
settings.model.output_times = 3600*(1:6);
% Which snapshots to plot vs LES
settings.plots.times_to_plot = 3600*(1:6);

% Gravitational acceleration
settings.plots.gravity = 9.806;

% Figure font size
settings.plots.fs = 18;

% Top of plots
settings.plots.zplottop = 4000;

% Plot every vertical profile (long computation)
settings.plots.plot_individual_profiles = true;

% Save figures as .fig files?
settings.plots.save_figures = true;

% Save figures as .png files?
settings.plots.save_images = true;

% Render tile-based plots composed of multiply figures?
settings.plots.plot_combinations = true;

% Indicate location of cloud base in 1D profiles?
settings.plots.indicate_cloud_base = true;

% Weights of variables towards the total RMSE calculation
settings.plots.weights.sigma_2 = 1;
settings.plots.weights.b_2     = 1;
settings.plots.weights.w_2     = 1;
settings.plots.weights.ww_res2 = 0;
settings.plots.weights.ww_sg2  = 0;
settings.plots.weights.e_2     = 0;
settings.plots.weights.e_res2  = 0;
settings.plots.weights.e_sg2   = 0;
settings.plots.weights.q_2     = 0;
settings.plots.weights.qv_2    = 1;
settings.plots.weights.ql_2    = 1;
settings.plots.weights.cloud   = 1;


%--------------------------------------------------------------------------------------------------%
% MISC
settings.model.id = settings.id;
settings.model.folders = settings.folders;

settings.plots.id = settings.id;
settings.plots.folders = settings.folders;

settings.model.restart_simulation = false;
settings.model.restart_simulation_name = 'restart_00001740';

