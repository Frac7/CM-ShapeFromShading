%% main
% Script in cui vengono richiamati altri script allo scopo di svolgere
% l'esperimento relativo alla tesina per CM.
% in particolare, viene prima effettuata la parte relativa a part1, dove
% vengono testate le metodologie QR di householder e givens e poi si
% procede con la seconda fase, ovvero verificarne la bont√† in un problema
% di shape by shading con dati prestati dal professor Rodriguez.
% per risolvere tale parte, viene richiamato lo script coreResolvere sia
% per i dati di superficie1 sia per conchiglia.

addpath Functions/
addpath data/

format short e

%% part one - verifica implementazione QR, householder e givens

test1Part

%% part two - verifica risoluzione della matrice N (normali) con QR e SVD
disp('Superficie1')

load superficie1.mat

[n, m] = size(M);

%stampa delle foto
figure()
for i=1:m
    I = mat2gray(reshape(M(:, i), r, s));
    subplot(2, 4, i)
    imshow(I);
end

%title('Immagini originali di Superificie1')

dataset = 0;
%serve una variabile nel workspace per capire su quale dataset stiamo lavorando
%0 Ë superficie1 mentre 1 Ë conchiglia
%con questa variabile si puÚ impostare la scala personalizzata in base al
%grafico

%richiamo del risolutore della seconda parte.
coreResolver

%% stampa dei risultati
errorsName = {'errore fattorizzazione', 'errore assoluto della normale', 'errore relativo della normale', 'errore relativo della normale matlab','tempi'}; 

disp('Errori nelle normali superficie1')

tableErrorNsup = table(errorsName', date(:,1), date(:,2), date(:,3), date(:,4), date(:,5), 'VariableNames', {'Tipo','Normale','HouseHolder','Givens', 'Matlab', 'SVD'});

disp(tableErrorNsup)

clear date

%% stesso procedimento verr√† applicato ai dati relativi a conchiglia
disp('Conchiglia')

load conchiglia.mat

[n, m] = size(M);

figure()

for i=1:m
    I = mat2gray(reshape(M(:, i), s, r));
    subplot(5, 4, i)
    imshow(I);
end

%title('Immagini originali conchiglia')

dataset = 1;

coreResolver

clear dataset

%%
disp('Errori nelle normali conchiglia')

tableErrorNconch = table(errorsName', date(:,1), date(:,2), date(:,3), date(:,4), date(:,5), 'VariableNames', {'Tipo','Normale','HouseHolder','Givens', 'Matlab', 'SVD'});

disp(tableErrorNconch)

clear date

clear errosName

clear r s