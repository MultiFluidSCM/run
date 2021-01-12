function settings = model_settings(folders)
    settings.folders = folders;
    
    settings.grid = set_grid();
    
    settings.time = set_time(0);
    
    settings.switches = set_approximations();
    
    settings.constants = set_constants(settings.grid);
end