%%GMatrix
%Calcolo della G matrix
%%
function [G] = GMatrix(c, s, i, j, n)
    G = speye(n);
    G(i, i) = c;
    G(i, j) = s;
    G(j, j) = c;
    G(j, i) = -s;
    
    %stampa di prova per confrontare con gli appunti
    %vedi lezione 02/04 dove si affronta il caso n x m
    %notare come sono ordinati gli indici delle matrici G nel prodotto
    %disp(strcat('ij: ', num2str(i), ' ', num2str(j)));
end
