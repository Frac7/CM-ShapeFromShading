%%GMatrix
%Calcolo della G matrix
%%
function [G] = GMatrix(c, s, i, j, n)
    G = speye(n);
    G(i, i) = c;
    G(i, j) = s;
    G(j, j) = -s;
    G(j, i) = c;
end

