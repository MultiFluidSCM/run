function variable = sensitivity_variable(name, id, variable_min, variable_max, resolution)
% Creates a variable object which may be iterated over some range of values for e.g. sensitivity tests

variable.name = name;
variable.id = id;
variable.variable_min = variable_min;
variable.variable_max = variable_max;
variable.resolution = resolution;

variable.range = abs(variable_max - variable_min);
variable.values = linspace(variable_min, variable_max, resolution);

end