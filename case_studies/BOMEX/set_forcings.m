function forcing = set_forcing()

% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct ARM values

% Geostrophic wind
forcing.ug = 10.0;
forcing.vg = 0.0;


forcing.t   = [      0;       1];
% Surface fluxes
forcing.shf = [   8.04;    8.04];
forcing.lhf = [130.052; 130.052];
% Fluxes at the top of the domain (sensible and latent heat fluxes)
forcing.tshf = [  0;     0;     0;     0;     0;     0;     0];
forcing.tlhf = [  0;     0;     0;     0;     0;     0;     0];

end

