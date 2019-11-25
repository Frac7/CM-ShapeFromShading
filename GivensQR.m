%% GivensQR:
% calcolo della fattorizzazione QR con givens
%%
function [Q, R] = GivensQR (A)
    [m, n]=size(A);
    G = speye(m); %matrice sparsa
    for k=1:n
        for i = k+1:m
            [c, s] = GivRot(A(k,k), A(i, k)); %calcolo c e s 
            for j = k:n
                t = c * A(k, j) + s * A(i, j);
                A(i, j) = -(s * A(k, j)) + (c * A(i, j));
                A(k, j) = t;
                G = GMatrix(c, s, i, j, n) * G; %aggiornamento G (Gm G m-1 G m-2 ...)
            end
        end
    end
    
    R = G * A; %Calcolo R
    
    Q = G'; %Ottenogo Q da G trasposto
    
end

    

    