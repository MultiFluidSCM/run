function try_model(settings)
% Try to run the model and let the user know if the model fails

try
	% Turn pause commands off to allow simulation to run continuously
	pause('off');
	multi_fluid_model(settings);
	pause('on');
catch
	display(datetime('now'));
	display('Simulation failed to complete');
	pause(1);
end

end