function settings = update_all_settings(settings, folders, variables, values)

% Update settings based on variable list
for j=1:length(variables)
	settings = update_settings(settings, variables(j).name, values(j));
end

settings.folders = folders;
settings.model.folders = folders;
settings.plots.folders = folders;
settings.plots.scm_data = fullfile(folders.data_scm, 'SCM_results.mat');

end