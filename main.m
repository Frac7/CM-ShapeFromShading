n = 5;
m = 6;

%generazione dati casuali
A = rand(m, n);
b = ones(m, 1);
x = A\b;

%primo esperimento con Matlab
[em, tm] = ComputeErrors(@qr, A, x, b);

%secondo esperimento con fattorizzazione Householder
[eh, th] = ComputeErrors(@HouseHolderQR, A, x, b);

%terzo esprimento con fattorizzazione Givens
[eg, tg] = ComputeErrors(@GivensQR, A, x, b);



