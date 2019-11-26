m = 30;
n = 20;

%generazione dati casuali
A = rand(m, n);
x = rand(n,1);
b = A * x;

%primo esperimento con Matlab
[errorSolm, tm, errorQRm, errorSolOriginalm] = ComputeErrors(@qr, A, x, b);

%secondo esperimento con fattorizzazione Householder
[errorSolh, th, errorQRh, errorSolOriginalh] = ComputeErrors(@HouseHolderQR, A, x, b);

%terzo esprimento con fattorizzazione Givens
[errorSolg, tg, errorQRg, errorSolOriginalg] = ComputeErrors(@GivensQR, A, x, b);

