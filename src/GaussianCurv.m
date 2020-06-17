%% GaussianCurvature
% Compute the gaussian curvature
%
%  Syntax
%
%  Descriptions
%
%%
function GC = GaussianCurv(F, V)
MA = VoronoiArea(F, V);
S = RingAngle(F, V);
GC = (2*pi - S) ./ MA;

