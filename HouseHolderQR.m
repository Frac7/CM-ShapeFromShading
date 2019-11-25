function [Q A] = HouseHolderQR(A)

[m, n] = size(A);

Q = eye(n);

for i = 1 : n %n al posto di n-1 per matrice rettangolare
    X = A (i: n, i);
    [w, k, Ht] = HouseMatrix(X); %Ht per dire htilde per dire che è grande quanto x
    H = [eye(i-1) zeros(i-1, n-i+1); zeros(n-i+1, i-1) Ht];
    
    A = H * A; %questo dovrebbe aggiungere una colonna di zeri
    
    %debugging: inserire pause qua, per avere un invio per vedere il
    %risultato di A in quel momento
    %pause
    
    Q = Q * H; %questo aggiunge H a destra della Q
end

end

function [w, k, H] = HouseMatrix(A)
n = size(A, 1);
sigma = norm(A);

if A(1) >= 0
    k = -sigma;
else
    k = sigma;
end

lambda = sqrt (2 * sigma * (sigma + abs(A(1))));

%conviene togliere k dalla prima componente e non se ne parla più

w = A;

w(1) = w(1) - k;

w = w / lambda;

if nargout > 2  
    H = eye(n) - 2 * (w * w');
end
end
