function save_rmse_dat(filename, simulation_ids, rmses, sort_indices)

% Write RMS errors to file in order of best result
fileID = fopen(filename, 'w');
for i=1:length(rmses)
    fprintf(fileID, '%30s %12f\n', simulation_ids{sort_indices(i)}, rmses(sort_indices(i)));
end
fclose(fileID);

end