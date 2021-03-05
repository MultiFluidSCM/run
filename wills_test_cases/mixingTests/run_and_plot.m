% Compare SCM results with LES

% Data are from LES of ARM case (Brown et al.)
% Dx=50m, Dz=20m, from a 19.2x19.2 km^2 domain using LEM.
% The simulation starts at 05:30 local time (11:30 UTC).

clear

% b_params = [0.5,0.6,0.7,0.8,0.9,1.0];
% b_params = [0.5,0.6,0.9,1.0];
bw_params = [0.5,0.8,1.0];
bt_params = [0.8,1.0];
bu_params = [0.8,1.0];
simulations = {};
rmses = [];

for i_bw=1:length(bw_params)
    for i_bt=1:length(bt_params)
        for i_bu=1:length(bu_params)
            bw = bw_params(i_bw);
            bt = bt_params(i_bt);
            bu = bu_params(i_bu);
            
            id_bw = strrep(num2str(bw), '.', 'p');
            id_bt = strrep(num2str(bt), '.', 'p');
            id_bu = strrep(num2str(bu), '.', 'p');
            
            id = join(['bw_',id_bw,'_bt_',id_bt,'_bu_',id_bu]);
            
            display(join(['Starting simulation for ',id]));
            pause(1);
            
            folders = get_folders(id);
            
            % Set up model parameters for this simulation
            settings = get_settings(folders);
            settings.model.constants.param.mix.bentrainw = bw;
            settings.model.constants.param.mix.bdetrainw = bw;
            settings.model.constants.param.mix.bentraint = bt;
            settings.model.constants.param.mix.bdetraint = bt;
            settings.model.constants.param.mix.bentrainu = bu;
            settings.model.constants.param.mix.bdetrainu = bu;
            
            % Run the model and plot the outputs
            try
                pause('off');
                multi_fluid_model(settings.model);
                pause('on');
            catch
                display(datetime('now'));
                display(join(['Simulation failed to complete: ',id]));
                pause(1);
            end
            
            if isfile(fullfile(folders.data_scm, "SCM_results.mat"))
                rmse_cloud = compare_scm_to_les(settings.plots);
                
                display(datetime('now'));
                display(join(["RMSE for cloud base and top: ", num2str(rmse_cloud)]));
                simulations{end+1} = id;
                rmses(end+1) = rmse_cloud;
            end
        end
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