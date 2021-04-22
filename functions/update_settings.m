function settings = update_settings(settings, variable_name, value)

% Check if entrainment/detrainment coefficients need to be updated
entrain = contains(variable_name, "entrain");
detrain = contains(variable_name, "detrain");

if entrain | detrain
	if contains(variable_name, "mix")
		transfer = "mix";
	end
	if contains(variable_name, "instab")
		transfer = "instab";
	end
	if contains(variable_name, "sort")
		transfer = "sort";
	end
	if contains(variable_name, "dwdz")
		transfer = "dwdz";
	end

	if contains(variable_name, "bw")
		coefficient = "w";
	end
	if contains(variable_name, "bt")
		coefficient = "t";
	end
	if contains(variable_name, "bq")
		coefficient = "q";
	end
	if contains(variable_name, "bu")
		coefficient = "u";
	end

	if entrain & exist("transfer") & exist("coefficient")
		settings.model.constants.param.(transfer).("bentrain"+coefficient) = value;
	end
	if detrain & exist("transfer") & exist("coefficient")
		settings.model.constants.param.(transfer).("bdetrain"+coefficient) = value;
	end
end

% Check if entrainment/detrainment magnitudes need to be updated
dwdz = contains(variable_name, "dwdz");
entrain_factor = contains(variable_name, "entrain factor");
detrain_factor = contains(variable_name, "detrain factor");

if dwdz & entrain_factor
	settings.model.constants.param.dwdz.entrain_factor = value;
end
if dwdz & detrain_factor
	settings.model.constants.param.dwdz.detrain_factor = value;
end

% Check if turbulent length scale magnitudes need to be updated
if contains(variable_name, "Lfactor ")
	settings.model.constants.param.Lfactor1 = value;
	settings.model.constants.param.Lfactor2 = value;
end
if contains(variable_name, "Lfactor1")
	settings.model.constants.param.Lfactor1 = value;
end
if contains(variable_name, "Lfactor2")
	settings.model.constants.param.Lfactor2 = value;
end

end