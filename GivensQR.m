%% GivensQR:
% calcolo della fattorizzazione QR con givens
%%
function [Q, R] = GivensQR (A)
    [m, n]=size(A);
    R = A;
    G = eye(m); %matrice sparsa
    for k=1:n
        for i = k+1:m
            [c, s] = GivRot(R(k,k), R(i, k)); %calcolo c e s 
            for j = k:n
                t = c * R(k, j) + s * R(i, j);
                R(i, j) = -(s * R(k, j)) + (c * R(i, j));
                R(k, j) = t;
                %Gcor = GMatrix(c, s, i, j, m);
                G = GMatrix(c, s, i, j, m) * G; %aggiornamento G (Gm G m-1 G m-2 ...)
                
            end
        end
    end
    
    Q = G'; %Ottenogo Q da G trasposto
    
end

    

    