%% LaplaceBel
%  Laplace Beltrami operator
%
%  Syntax
%
%  Descriptions
%
%%
function L = LaplaceBel(F, V)
Fnum = size(F, 1);
Vnum = size(V, 1);
W = zeros(Fnum, 3);

% Compute the cotangent in triangle
Vki = V(F(:, 1), :) - V(F(:, 3), :);
Vjk = V(F(:, 3), :) - V(F(:, 2), :);
Vij = V(F(:, 2), :) - V(F(:, 1), :);

% Compute Wij = cot(k) which is the cotangent of 3 vertex in triangle
W(:, 1) = -sum(Vki.*Vjk, 2) ./ sqrt( sum(cross(Vki, Vjk).^2, 2) );
W(:, 2) = -sum(Vij.*Vki, 2) ./ sqrt( sum(cross(Vij, Vki).^2, 2) );
W(:, 3) = -sum(Vjk.*Vij, 2) ./ sqrt( sum(cross(Vjk, Vij).^2, 2) );

% K is the weighted adjacency matrix
K = sparse(F, F(:, [2, 3, 1]), W, Vnum, Vnum);
K = 0.5*(K+K.');

% L is the discrete Laplaci-Beltrami operator
L = diag( sum(K, 2) ) - K;