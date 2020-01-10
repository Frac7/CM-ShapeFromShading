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
%figure()
if(dataset == 0)
    aspectRatio = [[10; 10; 1]; [1; 1; 10^-16]]; %[superficie differenza]
else
    aspectRatio = [[100; 100; 1]; [3; 3; 10^-12]]; %[superficie differenza]
end

%%
%calcolo di U dato n 
U = intnormals(N, r, s, h);

figure
%subplot(3, 2, 1);
%stampa della superficie
PrintShape(1 - U, aspectRatio(1:3));

title('\fontsize{8} Ricostruzione superficie')

%%
Um = intnormals(Nmatlab, r, s, h);

figure
%subplot(3, 2, 2);

PrintShape(1 - Um, aspectRatio(1:3));

title("\fontsize{8} Ricostruzione superficie Matlab")

%%
Ug = intnormals(Nqrtestg, r, s, h);

figure
%subplot(3, 2, 3);

PrintShape(1 - Ug, aspectRatio(1:3));

title("\fontsize{8} Ricostruzione superficie data da risoluzione OLS con QR generata tramite Givens")

%%
Uh = intnormals(Nqrtesth, r, s, h);

figure
%subplot(3, 2, 4);

PrintShape(1 - Uh, aspectRatio(1:3));

title("\fontsize{8} Ricostruzione superficie data da risoluzione OLS con QR generata tramite Householder")

%% Creazione dei dati, calcolo degli errori, relativo all'esperimento con SVD
test2PartWithSVD

Usvd = intnormals(Nsvdtest, r, s, h);

figure
%subplot(3, 2, 5);

PrintShape(1 - Usvd, aspectRatio(1:3));

title("\fontsize{8} Ricostruzione superficie data da risoluzione SVD")

%% stampa shape error
figure()

%subplot(2, 2, 1);

PrintShape(1 - U, aspectRatio(4:6), 1 - Um);

title("\fontsize{8} Ricostruzione errore N vs Matlab")

%%
figure %subplot(2, 2, 2);

PrintShape(1 - U, aspectRatio(4:6), 1 - Ug);

title("\fontsize{8} Ricostruzione errore N vs Givens")

%%
figure %subplot(2, 2, 3);

PrintShape(1 - U, aspectRatio(4:6), 1 - Uh);

title("\fontsize{8} Ricostruzione errore N vs HouseHolder")

%%
figure %subplot(2, 2, 4);

PrintShape(1 - U, aspectRatio(4:6), 1 - Usvd);

title("\fontsize{8} Ricostruzione errore N vs Svd")

%%
%aggiungo a date (mega matrice dei dati prodotta da test3partWithQR) la
%colonna relativa al svd (prodotta da test2PartWithSvd)
[m, n] = size(date);

date(:, n+1) = errorSvd;

clear m n 

clear errorSvd

clear aspectRatio