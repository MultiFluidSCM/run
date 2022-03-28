function settings = find_best_settings(settings, variables, best_setting_id, case_study)

simulations = variable_combinations(variables);
simulation_ids = {};
rmses = [];
mean_cloud_fractions = [];
mean_cloud_lifetimes = [];
mean_cloud_variations = [];
mean_cloud_base_ws = [];
mean_cloud_bases = [];
mean_cloud_tops = [];

for i=1:length(simulations)
	simulation_id = construct_id(variables, simulations(:,i));
	display(join(['Starting simulation for ', simulation_id]));
	pause(1);
	
    % Update settings
	folders = get_folders(simulation_id, case_study);
	settings = update_all_settings(settings, folders, variables, simulations(:,i));
	
	% Run the model, ignore errors if model crashes
	% try_model(settings.model);
	
	% If the simulation was successful, store the rms error of the cloud properties
	if isfile(fullfile(folders.data_scm, "SCM_results.mat"))
		% settings.plots.plot_individual_profiles = true;
		settings.plots.plot_individual_profiles = false;
        summary = compare_scm_to_les(settings.plots);
		
		simulation_ids{end+1} = simulation_id;
		rmses(end+1)                 = summary.rmse;
		mean_cloud_fractions(end+1)  = summary.mean_cloud_fraction;
		mean_cloud_lifetimes(end+1)  = summary.total_t_cloud;
		mean_cloud_variations(end+1) = summary.variation_cloud_top;
		mean_cloud_base_ws(end+1)    = summary.mean_w_cloud_base;
		mean_cloud_bases(end+1)      = summary.mean_z_cloud_base;
		mean_cloud_tops(end+1)       = summary.mean_z_cloud_top;
	end
    
    % clear functions;
end

% Sort by lowest RMS error and save list and settings
if length(rmses) > 0
	[rmses_sorted, sort_indices] = sort(rmses);
	disp(["Best result: ", simulation_ids{sort_indices(1)}, " with rmse ", num2str(rmses_sorted(1))]);
	
    save_rmse_dat(fullfile(folders.root, join(['rmse_',best_setting_id,'.dat'], '')), simulation_ids, rmses, sort_indices);
    
	% Save settings of best performing scheme
	settings = update_all_settings(settings, folders, variables, simulations(:,sort_indices(1)));
	save(fullfile(folders.root, "settings.mat"), 'settings');
    
    indices = 1:length(rmses);
    save_rmse_dat(fullfile(folders.root, join(['mean_cloud_fractions_',best_setting_id,'.dat'], '')), simulation_ids, mean_cloud_fractions, indices);
    save_rmse_dat(fullfile(folders.root, join(['mean_cloud_lifetimes_',best_setting_id,'.dat'], '')), simulation_ids, mean_cloud_lifetimes, indices);
    save_rmse_dat(fullfile(folders.root, join(['mean_cloud_variations_',best_setting_id,'.dat'], '')), simulation_ids, mean_cloud_variations, indices);
    save_rmse_dat(fullfile(folders.root, join(['mean_cloud_base_ws_',best_setting_id,'.dat'], '')), simulation_ids, mean_cloud_base_ws, indices);
    save_rmse_dat(fullfile(folders.root, join(['mean_cloud_bases_',best_setting_id,'.dat'], '')), simulation_ids, mean_cloud_bases, indices);
    save_rmse_dat(fullfile(folders.root, join(['mean_cloud_tops_',best_setting_id,'.dat'], '')), simulation_ids, mean_cloud_tops, indices);
end



end