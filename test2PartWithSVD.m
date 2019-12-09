%% SECONDA PARTE
% Calcolo di N tramite SVD matlab
%%
addpath Functions/
%load conchiglia.mat
load superficie1.mat
format short e

%ora ho L M N r s

Lps=pinv(L);

Ntrasp = M * Lps;

Nsvdtest = Ntrasp';

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
disp([errNsvd])

%% errore relativo sulle normali
errNRelsvd = norm(N - Nsvdtest, inf)/ norm(N, inf);

disp('')
disp('errore relativo sulle normali')
disp([errNRelsvd])


%%