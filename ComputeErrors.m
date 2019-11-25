%% Compute Errors
% Calcolo degli errori e del tempo
%%

function [e, t] = ComputeError(method, A, xOriginal, b)

%Per ora calcoliamo l'errore assoluto come valore assoluto della differenza
%tra il risultato ottenuto e quello atteso

tic
[Q, R] = method(A);
x = QRSystemResolution(Q, R, b);
t = toc;

e = norm(xOriginal - x)/norm(xOriginal);

end