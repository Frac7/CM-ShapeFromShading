%% SECONDA PARTE
% Calcolo di N tramite SVD matlab

%%
addpath Functions/
format short e

%ora ho L M N r s

tic

Lps=pinv(L);

Ntrasp = M * Lps;

Nsvdtest = Ntrasp';

timeSvd = toc;

% errore nella fattorizzazione 1
% errore sulle normali 2
% errore relativo sulle normali 3
% riga vuota (non ci serve confrontare con matlab N come con QR)
% time 5
errorSvd = [(norm(Nsvdtest'*L-M, inf)); (norm(N - Nsvdtest, inf)); (norm(N - Nsvdtest, inf)/ norm(N, inf)); NaN; (timeSvd)];
%%

clear timeSvd