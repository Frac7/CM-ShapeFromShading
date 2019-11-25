%% GivensQR:
% calcolo della fattorizzazione QR con givens
%%
function [Q, A] = GivensQR (A)
    [m, n]=size(A);
    G = eye(m); %matrice sparsa
    for k=1:n %negli appunti questa è la riga i-esima
        for i = k+1:m %negli appunti questa è la riga j-esima
            [c, s] = GivRot(A(k,k), A(i, k)); %calcolo c e s 
            for j = k:n %si scorrono le colonne
                t = c * A(k, j) + s * A(i, j);
                A(i, j) = -(s * A(k, j)) + (c * A(i, j));
                A(k, j) = t;
            end
            %la matrice G si aggiorna k * i volte, fuori dal ciclo j
            G = GMatrix(c, s, k, i, m) * G; %aggiornamento G (Gm G m-1 G m-2 ...)
            %vedi appunti (prodotto matrici G in caso m > n)
            %vedi anche algoritmo (passo 3, istruzione prima dell'output)
        end
    end
    
    Q = G'; %Ottenogo Q da G trasposto
    
end

    

    