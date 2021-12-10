function variable = sensitivity_variable(name, id, value, sensitivities)
% Creates a variable object which may be iterated over some range of values for e.g. sensitivity tests

variable.name = name;
variable.id = id;
variable.value_default = value;
variable.sensitivities = sensitivities;

for i=1:length(sensitivities)
    variable.values(i) = (1 + sensitivities(i))*variable.value_default;
end

end