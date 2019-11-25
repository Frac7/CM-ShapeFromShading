%% Compute Errors
% Calcolo degli errori e del tempo
%%

function [e, t] = ComputeErrors(method, A, xOriginal, b)

tic
[Q, R] = method(A);
x = QRSystemResolution(Q, R, b);
t = toc;

%calcolo dell'errore relativo
e = norm(xOriginal - x)/norm(xOriginal);

end