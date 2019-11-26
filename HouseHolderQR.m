%% Householder QR
%Calcolo della fattorizzazione QR con matrici di Householder
%%
function [Q R] = HouseHolderQR(R)

[m, n] = size(R);    
    
Q = eye(m);

for i = 1 : n %n al posto di n-1 per matrice rettangolare
    X = R (i: m, i); %minDim passi
    [w, k, Ht] = HouseHolderMatrix(X); %Ht per dire Htilde che � grande quanto x
    H = [eye(i-1) zeros(i-1, m-i+1); zeros(m-i+1, i-1) Ht];
    
    R = H * R; %questo dovrebbe aggiungere una colonna di zeri
    
    %debugging: inserire pause qua, per avere un invio per vedere il
    %risultato di A in quel momento
    %pause
    
    Q = Q * H; %questo aggiunge H a destra della Q
end

end