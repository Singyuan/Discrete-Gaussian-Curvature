%% VoronoiArea
%  Compute the Voronoi Area
%
%  Syntax
%
%  Descriptions
%
%%
function VA = VoronoiArea(F, V)
L = LaplaceBel(F, V);
Vnum = size(V, 1); 

for i = 1:Vnum
    edgei = sum((repmat(V(i, :), Vnum, 1)-V).^2, 2);
    VA(i, 1) = -L(i, :)*edgei/4;
end