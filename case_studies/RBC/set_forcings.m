function forcing = set_forcing()

% Set information needed for forcing
% Set time (x) and sensible (shf) - latent heat fluxes (lhf) in W m-2
% These are the correct ARM values

% Geostrophic wind
forcing.ug = 0.0;
forcing.vg = 0.0;

forcing.t   = [0; 3600];
% Surface fluxes (sensible and latent heat fluxes)
forcing.shf = [0; 5];
forcing.lhf = [0; 0];
% Fluxes at the top of the domain
forcing.tshf = [0; -5];
forcing.tlhf = [0; 0];

end

