function combinations = variable_combinations(variables)
% Get variable values from all variables and make a 2D matrix where each column
% is a different combination of the variable values.
% REQUIRES combvec FROM THE MATLAB DEEP LEARNING TOOLBOX

combinations = variables(1).values;

if length(variables) > 1
	for i=2:(length(variables))
		combinations = combvec(combinations, variables(i).values);
	end
end

end