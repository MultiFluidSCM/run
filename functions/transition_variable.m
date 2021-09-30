function variable = transition_variable(name, value1, value2, transition_resolution)
% Creates a variable object which may be iterated over some range of values for e.g. sensitivity tests

variable.name = name;
variable.value1 = value1;
variable.value2 = value2;
variable.values = linspace(value1, value2, transition_resolution);
variable.transition_resolution = transition_resolution;

end