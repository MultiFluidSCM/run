function variable = gradient_variable(name, id, variable_min, variable_max, variable_init, gradient_init)
% Creates a variable object which may be used for gradient descent optimisation

variable.name = name;
variable.id = id;
variable.min = variable_min;
variable.max = variable_max;
variable.value = variable_init;
variable.gradient = gradient_init;

variable.range = abs(variable.max - variable.min);

end