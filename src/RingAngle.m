%% RingAngle
%  Compute the sum of the angle of each vertex
%
%  Syntax
%
%  Descriptions
%
%%
function S = RingAngle(F, V)
Fnum = size(F, 1);
Vnum = size(V, 1);
A = zeros(Fnum, 3);

% Compute the vector of edge
Vki = V(F(:, 1), :) - V(F(:, 3), :);
Vjk = V(F(:, 3), :) - V(F(:, 2), :);
Vij = V(F(:, 2), :) - V(F(:, 1), :);

% Compute the squre of length of edge
Eki = sqrt( sum(Vki.^2, 2) );
Ejk = sqrt( sum(Vjk.^2, 2) );
Eij = sqrt( sum(Vij.^2, 2) );

% Compute the angle in each triangle
A(:,1) = acos((Eki.^2 + Ejk.^2 - Eij.^2) ./ (2.*Eki.*Ejk));
A(:,2) = acos((Eki.^2 + Eij.^2 - Ejk.^2) ./ (2.*Eki.*Eij));
A(:,3) = acos((Ejk.^2 + Eij.^2 - Eki.^2) ./ (2.*Ejk.*Eij));

% Compute the sum of two angle which is not neighborhood of such vertex
K = sparse(F, F(:, [2, 3, 1]), A, Vnum, Vnum);
K = K + K.';
S = sum(K, 2);

% Use c = pi-a-b to compute the angle we need
G = VertexFaceAdjacency(F);
S = sum(G, 2)*pi - S;

