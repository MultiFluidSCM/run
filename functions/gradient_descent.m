function gradient_descent(settings, variables, iterations)

% Ensure all settings are up-to-date
for v=1:length(variables)
    settings = update_all_settings(settings, get_folders("bin"), [variables(v)], [variables(v).value]);
end

iteration_ids = {};
rmses = [];

iteration_ids_all = {};
rmses_all = [];

total_simulations = 0;

for i=1:iterations+1
    iteration_id = join(["iteration", num2str(i-1)], "");

    % Update settings
    folders = get_folders(join([iteration_id,"_init"],""));
    settings = update_all_settings(settings, folders, [], []);

    % Run the model, ignore errors if model crashes
    try_model(settings.model);
    % multi_fluid_model(settings.model);

    % If the simulation was successful, store the rms error of the cloud properties
    if isfile(fullfile(folders.data_scm, "SCM_results.mat"))
        settings.plots.plot_individual_profiles = true;
        rmse_init = compare_scm_to_les(settings.plots);
        settings.plots.plot_individual_profiles = false;
        
        iteration_ids{end+1} = iteration_id;
        rmses(end+1) = rmse_init;
        
        % Save record of rms errors
        save_rmse_dat(fullfile(folders.root, 'rmse.dat'), iteration_ids, rmses, 1:length(rmses));
        
        % Save default settings for this iteration
        save_settings_dat(fullfile(folders.data_scm, join(["settings_",i-1,".dat"],"")), variables);
        save(fullfile(folders.data_scm, join(["settings_",i-1,".mat"],"")), 'settings');
    else
        error("Default simulation did not complete successfully");
    end
    
    if i > iterations
        return;
    end

    for v=1:length(variables)
        total_simulations = total_simulations + 1;
        variable = variables(v);
        
        % Random factor to ensure stochastic (random) element to prevent algorithm getting "stuck"
        stochastic = rand() * iterations/(i+iterations);
        
        % Change variable value with some limits
        variable_change = stochastic*min(max(-variable.gradient*variable.value, -0.2), 0.2);
        
        value_new = min(max(variable.value+variable_change, variable.min), variable.max);
        if value_new == variable.value
            variable_change = 0.05*stochastic;
            value_new = min(max(variable.value+variable_change, variable.min), variable.max);
            if value_new == variable.value
                variable_change = -0.05*stochastic;
                value_new = min(max(variable.value+variable_change, variable.min), variable.max);
            end
        end
        % Round to 4 decimal places as this is the precision saved in .mat files
        % value_new = round(value_new, 4);
        value_new = round(1e4*value_new)*1e-4;
        
        simulation_id = construct_id([variable], [value_new]);
        
        % Update settings
        job_id = sprintf('%04d', total_simulations);
        total_id = join([job_id,"_",iteration_id,"_",simulation_id],"");
        folders = get_folders(total_id);
        settings = update_all_settings(settings, folders, [variable], [value_new]);
        
        % Run the model, ignore errors if model crashes
        try_model(settings.model);

        % If the simulation was successful, store the rms error of the cloud properties
        if isfile(fullfile(folders.data_scm, "SCM_results.mat"))
            rmse = compare_scm_to_les(settings.plots);
        else
            rmse = 1e8;
        end
        
        variables(v).gradient = 5000*(rmse_init-rmse) / (variables(v).value - value_new);
        
        
        % Save record of rms error
        save_rmse_dat(fullfile(folders.data_scm, 'rmse.dat'), {total_id}, [rmse], [1]);
        
        % Update variable value to what it should be for the next iteration batch
        if rmse < rmse_init
            rmse_init = rmse;
            variables(v).value = value_new;
            
            iteration_ids_all{end+1} = total_id;
            rmses_all(end+1) = rmse;
            
            save_rmse_dat(fullfile(folders.root, 'rmse_all.dat'), iteration_ids_all, rmses_all, 1:length(rmses_all));
            save(fullfile(folders.data_scm, join(["settings_",i-1,".mat"],"")), 'settings');
        else
            % Return to original settings for next simulation
            settings = update_all_settings(settings, folders, [variable], [variable.value]);
        end
        
        
    end

    
end

end