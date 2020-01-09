%% CoreRisolver
% Script che si occupa di richiamare i test per la seconda parte della
% relazione e chiamare la funzione intnormals e la relativa stampa delle
% superfici. E' stato creato perchè deve essere richiamato per superficie1 e
% conchiglia.
addpath Functions/

%% Creazione dei dati, calcolo degli errori, relativo all'esperimento con QR
test2PartWithQR

%% parametro h : lunghezza reale del lato orizzontale della scena inquadrata < foto
h = 1/r-1;

%%
figure()

%%
%calcolo di U dato n 
U = intnormals(N, r, s, h);

figure
%subplot(3, 2, 1);
%stampa della superficie
%PrintShape(U);
PrintShape(U, [], false);

title('\fontsize{8} Ricostruzione superficie')

%%
Um = intnormals(Nmatlab, r, s, h);

figure
%subplot(3, 2, 2);

%PrintShape(Um);
PrintShape(Um, [], false);

title("\fontsize{8} Ricostruzione superficie Matlab")

%%
Ug = intnormals(Nqrtestg, r, s, h);

figure
%subplot(3, 2, 3);

%PrintShape(Ug);
PrintShape(Ug, [], false);

title("\fontsize{8} Ricostruzione superficie data da risoluzione OLS con QR generata tramite Givens")

%%
Uh = intnormals(Nqrtesth, r, s, h);

figure
%subplot(3, 2, 4);

%PrintShape(Uh);
PrintShape(Uh, [], false);

title("\fontsize{8} Ricostruzione superficie data da risoluzione OLS con QR generata tramite Householder")

%% Creazione dei dati, calcolo degli errori, relativo all'esperimento con SVD
test2PartWithSVD

Usvd = intnormals(Nsvdtest, r, s, h);

figure
%subplot(3, 2, 5);

%PrintShape(Usvd);
PrintShape(Usvd, [], false);

title("\fontsize{8} Ricostruzione superficie data da risoluzione SVD")

%% stampa shape error
figure()

%subplot(2, 2, 1);

%PrintShape(U - Um);
PrintShape(U, Um, true);

title("\fontsize{8} Ricostruzione errore N vs Matlab")

%%
figure %subplot(2, 2, 2);

%PrintShape(U - Ug);
PrintShape(U, Ug, true);

title("\fontsize{8} Ricostruzione errore N vs Givens")

%%
figure %subplot(2, 2, 3);

%PrintShape(U - Uh);
PrintShape(U, Uh, true);

title("\fontsize{8} Ricostruzione errore N vs HouseHolder")

%%
figure %subplot(2, 2, 4);

%PrintShape(U - Usvd);
PrintShape(U, Usvd, true);

title("\fontsize{8} Ricostruzione errore N vs Svd")

%%
%aggiungo a date (mega matrice dei dati prodotta da test3partWithQR) la
%colonna relativa al svd (prodotta da test2PartWithSvd)
[m, n] = size(date);

date(:, n+1) = errorSvd;

clear m n 

clear errorSvd