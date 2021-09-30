function forcing = set_forcing()

% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct ARM values

% Geostrophic wind
forcing.ug = 10.0;
forcing.vg = 0.0;


forcing.t   = [  0; 14400; 23400; 27000; 36000; 45000; 52200];
% Surface fluxes
forcing.shf = [-30;    90;   140;   140;   100;   -10;   -10];
forcing.lhf = [  5;   250;   450;   500;   420;   180;     0];
% Fluxes at the top of the domain (sensible and latent heat fluxes)
forcing.tshf = [  0;     0;     0;     0;     0;     0;     0];
forcing.tlhf = [  0;     0;     0;     0;     0;     0;     0];

end

