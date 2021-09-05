function settings = find_best_settings(settings, variables, best_setting_id)

simulations = variable_combinations(variables);
simulation_ids = {};
rmses = [];


for i=1:length(simulations)
	simulation_id = construct_id(variables, simulations(:,i));
	display(join(['Starting simulation for ', simulation_id]));
	pause(1);
	
    % Update settings
	folders = get_folders(simulation_id);
	settings = update_all_settings(settings, folders, variables, simulations(:,i));
	
	% Run the model, ignore errors if model crashes
	try_model(settings.model);
	
	% If the simulation was successful, store the rms error of the cloud properties
	if isfile(fullfile(folders.data_scm, "SCM_results.mat"))
		settings.plots.plot_individual_profiles = true;
        rmse_cloud = compare_scm_to_les(settings.plots);
		
		simulation_ids{end+1} = simulation_id;
		rmses(end+1) = rmse_cloud;
	end
    
    % clear functions;
end

% Sort by lowest RMS error and save list and settings
if length(rmses) > 0
	[rmses_sorted, sort_indices] = sort(rmses);
	disp(["Best result: ", simulation_ids{sort_indices(1)}, " with rmse ", num2str(rmses_sorted(1))]);
	
    if exist('best_setting_id')
        save_rmse_dat(fullfile(folders.root, join(['rmse_',best_setting_id,'.dat'], '')), simulation_ids, rmses, sort_indices);
    else
        save_rmse_dat(fullfile(folders.root, 'rmse.dat'), simulation_ids, rmses, sort_indices);
    end
    
	% Save settings of best performing scheme
	settings = update_all_settings(settings, folders, variables, simulations(:,sort_indices(1)));
	save(fullfile(folders.root, "settings.mat"), 'settings');
end

end