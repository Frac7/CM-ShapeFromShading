%% SECONDA PARTE
% Calcolo di N tramite SVD matlab
%%
addpath Functions/
format short e

%ora ho L M N r s

tic

Lps=pinv(L);

%N'*L = M
%N' = M * Lps

Ntrasp = M * Lps;

Nsvdtest = Ntrasp';

timeSvd = toc;

%% errore nella fattorizzazione
errFatt = norm(N'*L-M, inf);
errFattsvd = norm(Nsvdtest'*L-M, inf);
disp('')
disp('errore nella fattorizzazione')
disp([errFatt errFattsvd])

%% errore sulle noramli
errNsvd = norm(N - Nsvdtest, inf);

disp('')
disp('errore sulle normali')
disp(errNsvd)

%% errore relativo sulle normali
errNRelsvd = norm(N - Nsvdtest, inf)/ norm(N, inf);

disp('')
disp('errore relativo sulle normali')
disp(errNRelsvd)

disp('')
disp(timeSvd)


%%