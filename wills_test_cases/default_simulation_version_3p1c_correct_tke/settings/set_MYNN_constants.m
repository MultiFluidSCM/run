function MYNN = set_MYNN_constants()

% Set coefficients in MYNN closures

% A1 = l1 / L              Quasi-dissipation length scale modelling part of deviatoric
%                          p-correlation term in Mij equation
% A2 = l2 / L              Quasi-dissipation length scale modelling part of p-correlation
%                          term in scalar flux equation
% B1 = Lambda1 / L         Effective length scale for molecular dissipation in
%                          Mij / tke equations
% B2 = Lambda2 / L         Effective length scale for molecular dissipation in
%                          variance and covariance equations
% C1                       Factor multiplying rate of strain in modelling part of
%                          deviatoric p-correlation term in Mij equation
% C2                       Factor multiplying g_j H_i in modelling part of
%                          deviatoric p-correlation term in Mij equation
% C3                       Factor modifying buoyancy correlation terms to model
%                          effect of p-correlation in scalar flux equation
% C4                       Factor multiplying Mij.grad u in modelling part of
%                          deviatoric p-correlation term in Mij equation
% C5                       Factor multiplying flux . grad u terms to model
%                          effect of p-correlation in scalar flux equation

% Mellor-Yamada 1982
% MYNN.A1 = 0.78;
% MYNN.A2 = 0.78;
% MYNN.B1 = 15.0;
% MYNN.B2 =  8.0;
% MYNN.C1 = 0.056;
% MYNN.C2 = 0;
% MYNN.C3 = 0;
% MYNN.C4 = 0;
% MYNN.C5 = 0;

% Nakanishi-Niino 2009
% MYNN.A1 = 1.18;
% MYNN.A2 = 0.665;
% MYNN.B1 = 24.0;
% MYNN.B2 = 15.0;
% MYNN.C1 = 0.137;
% MYNN.C2 = 0.75;
% MYNN.C3 = 0.352;
% MYNN.C4 = 0;
% MYNN.C5 = 0.2;

% SCM July 2021
% Note that we do not model the deviatoric part of Mij, so
% A1 is effectively infinite while C1 = C2 = C4 = 0.
MYNN.A1 = 0.2; %0.25*sqrt(0.5);
MYNN.A2 = 0.2; %0.25*sqrt(0.5);
MYNN.B1 = 6.0; %0.5*sqrt(8); %24.0;
MYNN.B2 = 4.0; %0.5*sqrt(8);
MYNN.C1 = 0;
MYNN.C2 = 0;
MYNN.C3 = 0;
MYNN.C4 = 0;
MYNN.C5 = 0;








end