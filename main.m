m = 30;
n = 20;

%generazione dati casuali
A = rand(m, n);
x = rand(n,1);
b = A * x;

%primo esperimento con Matlab
[errorSolm, tm, errorQRm, errorQm, errorSolOriginalm] = ComputeErrors(@qr, A, x, b);

%secondo esperimento con fattorizzazione Householder
[errorSolh, th, errorQRh, errorQh, errorSolOriginalh] = ComputeErrors(@HouseHolderQR, A, x, b);

%terzo esperimento con fattorizzazione Givens
[errorSolg, tg, errorQRg, errorQg, errorSolOriginalg] = ComputeErrors(@GivensQR, A, x, b);

%quarto esperimento con SVD
[U,S,V] = svd(A);
errorSVD = norm(A - (U*S*V'));

