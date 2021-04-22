function save_rmse_dat(filename, variables)

% Write RMS errors to file in order of best result
fileID = fopen(filename, 'w');
for i=1:length(variables)
    fprintf(fileID, '%30s %12f\n', variables(i).name, variables(i).value);
end
fclose(fileID);

end