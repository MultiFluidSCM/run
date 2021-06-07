% Run the multi-fluid model over range of parameter values

clear

folders_default = get_folders("bin");

% load("settings_0.mat");
% load("settings_10.mat");
% load("settings_11.mat");
if ~exist('settings', 'var')
    disp("No settings file detected, loading default settings as starting point.");
    settings = get_settings(folders_default);
end


% variables = [...
	% gradient_variable("mix detrain bw",    "bwMixD", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("mix detrain bt",    "btMixD", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("mix detrain bq",    "bqMixD", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("mix detrain bu",    "buMixD", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("mix entrain bw",    "bwMixE", 0.5, 1.0, 0.5,  0.1), ...
	% gradient_variable("mix entrain bt",    "btMixE", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("mix entrain bq",    "bqMixE", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("mix entrain bu",    "buMixE", 0.5, 1.0, 1.0, -0.1), ...
    % gradient_variable("instab entrain bw", "bwInsE", 0.5, 1.0, 0.5,  0.1), ...
	% gradient_variable("instab entrain bt", "btInsE", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("instab entrain bq", "bqInsE", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("instab entrain bu", "buInsE", 0.5, 1.0, 1.0, -0.1), ...
    % gradient_variable("dwdz detrain bw",   "bwDwzD", 0.5, 1.0, 0.5,  0.1), ...
	% gradient_variable("dwdz detrain bt",   "btDwzD", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("dwdz detrain bq",   "bqDwzD", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("dwdz detrain bu",   "buDwzD", 0.5, 1.0, 1.0, -0.1), ...
	% gradient_variable("dwdz detrain factor", "dwdzFacD", 1.0, 1.0, 1.0, 0.1)
% ];

bwMixE = settings.model.constants.param.mix.bentrainw;
btMixE = settings.model.constants.param.mix.bentraint;
bqMixE = settings.model.constants.param.mix.bentrainq;
buMixE = settings.model.constants.param.mix.bentrainu;
bwMixD = settings.model.constants.param.mix.bdetrainw;
btMixD = settings.model.constants.param.mix.bdetraint;
bqMixD = settings.model.constants.param.mix.bdetrainq;
buMixD = settings.model.constants.param.mix.bdetrainu;
bwInsE = settings.model.constants.param.instab.bentrainw;
btInsE = settings.model.constants.param.instab.bentraint;
bqInsE = settings.model.constants.param.instab.bentrainq;
buInsE = settings.model.constants.param.instab.bentrainu;
bwDwzD = settings.model.constants.param.dwdz.bdetrainw;
btDwzD = settings.model.constants.param.dwdz.bdetraint;
bqDwzD = settings.model.constants.param.dwdz.bdetrainq;
buDwzD = settings.model.constants.param.dwdz.bdetrainu;
dwdzFacD = settings.model.constants.param.dwdz.detrain_factor;

% bwMixE = 0.5;
% btMixE = 1.0;
% bqMixE = 0.8;
% bwMixD = 0.5;
% btMixD = 1.0;
% bqMixD = 0.8;

% bwInsE = 0.9;
% btInsE = 1.0;
% bqInsE = 0.8;

% bwDwzD = 0.75;
% btDwzD = 1.0;
% bqDwzD = 0.8;
% dwdzFacD = 1.5;


% variables = [...
	% gradient_variable("mix detrain bw",    "bwMixD", 0., 1.0, bwMixD, -0.1), ...
	% gradient_variable("mix detrain bt",    "btMixD", 0., 1.0, btMixD, -0.1), ...
	% gradient_variable("mix detrain bq",    "bqMixD", 0., 1.0, bqMixD, -0.1), ...
	% gradient_variable("mix detrain bu",    "buMixD", 0., 1.0, buMixD, -0.1), ...
	% gradient_variable("mix entrain bw",    "bwMixE", 0., 1.0, bwMixE,  0.1), ...
	% gradient_variable("mix entrain bt",    "btMixE", 0., 1.0, btMixE, -0.1), ...
	% gradient_variable("mix entrain bq",    "bqMixE", 0., 1.0, bqMixE, -0.1), ...
	% gradient_variable("mix entrain bu",    "buMixE", 0., 1.0, buMixE, -0.1), ...
    % gradient_variable("instab entrain bw", "bwInsE", 0., 1.0, bwInsE,  0.1), ...
	% gradient_variable("instab entrain bt", "btInsE", 0., 1.0, btInsE, -0.1), ...
	% gradient_variable("instab entrain bq", "bqInsE", 0., 1.0, bqInsE, -0.1), ...
	% gradient_variable("instab entrain bu", "buInsE", 0., 1.0, buInsE, -0.1), ...
    % gradient_variable("dwdz detrain bw",   "bwDwzD", 0., 1.0, bwDwzD,  0.1), ...
	% gradient_variable("dwdz detrain bt",   "btDwzD", 0., 1.0, btDwzD, -0.1), ...
	% gradient_variable("dwdz detrain bq",   "bqDwzD", 0., 1.0, bqDwzD, -0.1), ...
	% gradient_variable("dwdz detrain bu",   "buDwzD", 0., 1.0, buDwzD, -0.1), ...
	% gradient_variable("dwdz detrain factor", "dwdzFacD", 1.0, 2.0, dwdzFacD, 0.1)
% ];

variables = [...
	gradient_variable("mix detrain bw",    "bwMixD", 0.2, 1.0, bwMixD, -0.1), ...
	gradient_variable("mix detrain bt",    "btMixD", 0.6, 1.0, btMixD, -0.1), ...
	gradient_variable("mix detrain bq",    "bqMixD", 0.7, 1.0, bqMixD, -0.1), ...
	gradient_variable("mix detrain bu",    "buMixD", 0.5, 1.0, buMixD, -0.1), ...
	gradient_variable("mix entrain bw",    "bwMixE", 0.3, 1.0, bwMixE,  0.1), ...
	gradient_variable("mix entrain bt",    "btMixE", 0.6, 1.0, btMixE, -0.1), ...
	gradient_variable("mix entrain bq",    "bqMixE", 0.3, 1.0, bqMixE, -0.1), ...
	gradient_variable("mix entrain bu",    "buMixE", 0.5, 1.0, buMixE, -0.1), ...
    gradient_variable("instab entrain bw", "bwInsE", 0.5, 1.0, bwInsE,  0.1), ...
	gradient_variable("instab entrain bt", "btInsE", 0.5, 1.0, btInsE, -0.1), ...
	gradient_variable("instab entrain bq", "bqInsE", 0.3, 1.0, bqInsE, -0.1), ...
	gradient_variable("instab entrain bu", "buInsE", 0.5, 1.0, buInsE, -0.1), ...
    gradient_variable("dwdz detrain bw",   "bwDwzD", 0.4, 1.0, bwDwzD,  0.1), ...
	gradient_variable("dwdz detrain bt",   "btDwzD", 0.9, 1.0, btDwzD, -0.1), ...
	gradient_variable("dwdz detrain bq",   "bqDwzD", 0.8, 1.0, bqDwzD, -0.1), ...
	gradient_variable("dwdz detrain bu",   "buDwzD", 0.5, 1.0, buDwzD, -0.1), ...
	gradient_variable("dwdz detrain factor", "dwdzFacD", 1.0, 2.0, dwdzFacD, 0.1)
];

variables = [...
	gradient_variable("mix detrain bw",    "bwMixD", 0.2, 1.0, bwMixD, -0.1), ...
	gradient_variable("mix detrain bq",    "bqMixD", 0.5, 1.0, bqMixD, -0.1), ...
	gradient_variable("mix entrain bw",    "bwMixE", 0.3, 1.0, bwMixE,  0.1), ...
	gradient_variable("mix entrain bq",    "bqMixE", 0.3, 1.0, bqMixE, -0.1), ...
	gradient_variable("instab entrain bw", "bwInsE", 0.5, 1.0, bwInsE,  0.1), ...
	gradient_variable("instab entrain bq", "bqInsE", 0.3, 1.0, bqInsE, -0.1), ...
    gradient_variable("dwdz detrain bw",   "bwDwzD", 0.4, 1.0, bwDwzD,  0.1), ...
	gradient_variable("dwdz detrain bq",   "bqDwzD", 0.5, 1.0, bqDwzD, -0.1), ...
	gradient_variable("mix tkefactor", "tkeFactorMix", 0.5, 1.5, 0.8, -0.1)
];



iterations = 100;
gradient_descent(settings, variables, iterations);
