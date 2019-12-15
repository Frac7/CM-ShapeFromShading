%% SECONDA PARTE
% Grazie ai dati prestati dal docente, verifichiamo prima con risoluzione di
% un sistema con fattorizzazione QR, se riusciamo ad ottenere una N
% (superfici normali) di buona qualità.
%%
addpath Functions/
format short e

%ora ho L M N r s

%ottenere sistema L’ N = M’
Ltrasp = L';

Mtrasp = M';

%% con HouseHolder
tic

%fatt QR di Ltrasp risoluzione sist minimi quadrati QR

[Qh, Rh] = HouseHolderQR(Ltrasp);

Nqrtesth = QRSystemResolution(Qh, Rh, Mtrasp);

timeH = toc;

%% con Givens

%fatt QR di Ltrasp risoluzione sist minimi quadrati QR

tic
[Qg, Rg] = GivensQR(Ltrasp);

Nqrtestg = QRSystemResolution(Qg, Rg, Mtrasp);

timeG = toc;

%% matlab
tic

Nmatlab = Ltrasp\Mtrasp;

timeM = toc;
%% errore nella fattorizzazione - normale, householder, givens, matlab

disp('')

errFatt = [norm(N'*L-M, inf), norm(Nqrtesth'*L-M, inf), norm(Nqrtestg'*L-M, inf), norm(Nmatlab'*L-M, inf)];

%% errore assoluto sulle normali - normale, householder, givens, matlab

errN = [NaN, norm(N - Nqrtesth, inf), norm(N - Nqrtestg, inf), norm(N - Nmatlab, inf)]; 

%% errore relativo sulle normali - normale, householder, givens, matlab

errNRel = [NaN, (norm(N - Nqrtesth, inf)/ norm(N, inf)), (norm(N - Nqrtestg, inf)/ norm(N, inf)), (norm(N - Nmatlab, inf)/ norm(N, inf))]; 

% come se stessimo prendendo per buona quella di matlab

errNmathRel = [NaN, (norm(Nmatlab - Nqrtesth, inf) / norm(Nmatlab, inf)), (norm(Nmatlab - Nqrtestg, inf) / norm(Nmatlab, inf)), NaN];

%% salvataggio dei tempi
timeAll = [NaN, timeH, timeG, timeM];

%% creazione di una unica matrice (ogni colonna corrisponde ad un metodo)
date=[errFatt; errN; errNRel; errNmathRel; timeAll];

%% stampa
figure
title('Relative Error, Normals');
xlabel('Resolution Methods');
ylabel('Relative Error');
    
bar(categorical({'Householder', 'Givens', 'Matlab'}), [date(3, 2), date(3, 3), date(3, 4)]);

legend('error');

% preserve your memory lol
clear errFatt errN errNmath errNRel errNmathRel timeAll

clear timeH timeG timeM




