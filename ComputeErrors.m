%% Compute Errors
% Calcolo degli errori e del tempo
%%
function [errorSol, t, errorQR, errorSolOriginal] = ComputeErrors(method, A, xOriginal, b)
tic
[Q, R] = method(A);
x = QRSystemResolution(Q, R, b);
t = toc;

%verifica fattorizzazione
errorQR = norm(A - (Q * R)); %indica quanto la fatt. è precisa


%calcolo dell'errore relativo (più evidenti se avessimo più di una
%soluzione)
errorSol = norm(A*x - b)/norm(x);
errorSolOriginal = norm(xOriginal-x)/norm(xOriginal);

end