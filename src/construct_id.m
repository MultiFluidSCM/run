function id = construct_id(variables, values)
% Create an ID string from a list of variables and their respective values

id = join([variables(1).id, "_", strrep(num2str(values(1)), '.', 'p')], "");

if length(variables) > 1
	for i=2:length(variables)
		id = join([id, "_", variables(i).id, "_", strrep(num2str(values(i)), '.', 'p')], "");
	end
end

end