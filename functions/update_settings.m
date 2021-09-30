function settings = update_settings(settings, variable_name, value)

% Check if entrainment/detrainment coefficients need to be updated
entrain = contains(variable_name, "entrain");
detrain = contains(variable_name, "detrain");

if entrain | detrain
	if contains(variable_name, "mix")
		transfer = "mix";
        if contains(variable_name, "cloud")
            transfer = "mix_cloud";
        end
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
        if contains(variable_name, "instab") & contains(variable_name, "dwdz")
            settings.model.constants.param.instab.("bentrain"+coefficient) = value;
        end
	end
	if detrain & exist("transfer") & exist("coefficient")
		settings.model.constants.param.(transfer).("bdetrain"+coefficient) = value;
        if contains(variable_name, "instab") & contains(variable_name, "dwdz")
            settings.model.constants.param.instab.("bdetrain"+coefficient) = value;
        end
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

% Check mixing tke coefficient
if contains(variable_name, "tke1factor")
    settings.model.constants.param.mix.tke1_factor = value;
end
if contains(variable_name, "tke2factor")
    settings.model.constants.param.mix.tke2_factor = value;
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

if contains(variable_name, "MYNN")
    if contains(variable_name, "A1")
        settings.model.constants.param.MYNN.A1 = value;
    end
    if contains(variable_name, "A2")
        settings.model.constants.param.MYNN.A2 = value;
    end
    if contains(variable_name, "B1")
        settings.model.constants.param.MYNN.B1 = value;
    end
    if contains(variable_name, "B2")
        settings.model.constants.param.MYNN.B2 = value;
    end
    if contains(variable_name, "C1")
        settings.model.constants.param.MYNN.C1 = value;
    end
    if contains(variable_name, "C2")
        settings.model.constants.param.MYNN.C2 = value;
    end
    if contains(variable_name, "C3")
        settings.model.constants.param.MYNN.C3 = value;
    end
    if contains(variable_name, "C4")
        settings.model.constants.param.MYNN.C4 = value;
    end
    if contains(variable_name, "C5")
        settings.model.constants.param.MYNN.C5 = value;
    end
end

end