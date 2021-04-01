% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).

clear

b_params = [0.5,0.6,0.7,0.8,0.9,1.0];

simulations = {};
rmses = [];

for i_b=1:length(b_params)
    b = b_params(i_b);
        
    id_b = strrep(num2str(b), '.', 'p');
    
    id = join(['b_',id_b]);
    
    display(join(['Starting simulation for ',id]));
    pause(1);
    
    folders = get_folders(id);
    
    % Set up model parameters for this simulation
    settings = get_settings(folders);
    settings.model.constants.param.instab.bentrainw = b;
    settings.model.constants.param.instab.bentraint = b;
    settings.model.constants.param.instab.bentrainq = b;
    % settings.model.constants.param.instab.bdetrainu = b;
    
    % Run the model and plot the outputs
    try
        % Turn pause commands off to allow simulation to run continuously
        pause('off');
        multi_fluid_model(settings.model);
        pause('on');
    catch
        display(datetime('now'));
        display(join(['Simulation failed to complete: ',id]));
        pause(1);
    end
    
    % If the simulation was successful, store the rms error of the cloud properties
    if isfile(fullfile(folders.data_scm, "SCM_results.mat"))
        rmse_cloud = compare_scm_to_les(settings.plots);
        
        display(datetime('now'));
        display(join(["RMSE for cloud base and top: ", num2str(rmse_cloud)]));
        simulations{end+1} = id;
        rmses(end+1) = rmse_cloud;
    end
end

% Sort by lowest RMS error
[rmses_sorted, sort_indices] = sort(rmses);

% Write RMS errors to file in order of best result
fileID = fopen(fullfile(folders.root, 'rmse.dat'),'w');
for i=1:length(rmses)
    fprintf(fileID, '%30s %12f\n', simulations{sort_indices(i)}, rmses_sorted(i));
end
fclose(fileID);