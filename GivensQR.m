%% GivensQR:
% calcolo della fattorizzazione QR con givens
%%
function [Q, R] = GivensQR (A)
    
    [m, n]=size(A);
    
    R = A;
    
    G = eye(m); %matrice sparsa
    for k=1:n %negli appunti questa è la riga i-esima
        for i = k+1:m %negli appunti questa è la riga j-esima
            [c, s] = GivRot(R(k,k), R(i, k)); %calcolo c e s 
            for j = k:n %si scorrono le colonne
                t = c * R(k, j) + s * R(i, j);
                R(i, j) = (-s * R(k, j)) + (c * R(i, j));
                R(k, j) = t;
            end
            %la matrice G si aggiorna k * i volte, fuori dal ciclo j
            G = GMatrix(c, s, k, i, m) * G; %aggiornamento G (Gm G m-1 G m-2 ...)
            %vedi appunti (prodotto matrici G in caso m > n)
            %vedi anche algoritmo (passo 3, istruzione prima dell'output)
        end
    end
    
    Q = G'; %Ottenogo Q da G trasposto
    
end

    

    