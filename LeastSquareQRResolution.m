%% LeastSquareQRResolution
% Risoluzione QR minimi quadrati
%%
function [x, c2] = LeastSquareQRResolution(Q, R, A, n, m)
    c = Q' * A;
    
    c1 = c(1:n,:);
    c2 = c(n+1:m,:);
    
    R1 = R(1:n,:);
    x = R1\c1;
end