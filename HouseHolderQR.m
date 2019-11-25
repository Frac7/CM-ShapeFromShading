%% Householder QR
%Calcolo della fattorizzazione QR con matrici di Householder
%%

function [Q A] = HouseHolderQR(A)

[m, n] = size(A);    
    
Q = eye(m);

for i = 1 : n %n al posto di n-1 per matrice rettangolare
    X = A (i: m, i); %minDim passi
    [w, k, Ht] = HouseHolderMatrix(X); %Ht per dire Htilde che è grande quanto x
    H = [eye(i-1) zeros(i-1, m-i+1); zeros(m-i+1, i-1) Ht];
    
    A = H * A; %questo dovrebbe aggiungere una colonna di zeri
    
    %debugging: inserire pause qua, per avere un invio per vedere il
    %risultato di A in quel momento
    %pause
    
    Q = Q * H; %questo aggiunge H a destra della Q
end

end