%% Compute Errors
% Calcolo degli errori e del tempo
%%
function [errorSol, t, errorQR, errorQ, errorSolOriginal] = ComputeErrors(method, A, xOriginal, b)
tic
[Q, R] = method(A);

x = QRSystemResolution(Q, R, b);

t = toc;

%verifica fattorizzazione
errorQR = norm(A - (Q * R), inf); %indica quanto la fatt. è precisa
%verifica Q
[m, n] = size(Q);

errorQ = norm(((Q')*Q) - eye(m), inf);


%calcolo dell'errore relativo (più evidenti se avessimo più di una
%soluzione)
%errorSol = norm(A*x - b, inf)/norm(x, inf);

%questo diventa residuo relativo
errorSol = norm(A*x - b, inf)/norm(b, inf);

errorSolOriginal = norm(xOriginal-x, inf)/norm(xOriginal, inf);


end