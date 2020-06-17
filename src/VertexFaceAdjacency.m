function G = VertexFaceAdjacency(F)
Fno = size(F, 1);
Vno = max(F(:));
Fid = 1:Fno;
Fid = repmat(Fid, 1, 3);
G = sparse(F, Fid, 1, Vno, Fno);