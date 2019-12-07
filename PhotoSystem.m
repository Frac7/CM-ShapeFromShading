%% PhotoSystem
% Calcolo delle normali con le 3 fattorizzazioni QR
%%
function [Ng, Nh, Nm] = PhotoSystem(L, M)
    %L'N = M'
    %Lpi = PseudoInverse(L);
    Lpi = pinv(L);
    %Mpi = PseudoInverse(M);
    Mpi = pinv(M);

    [n, m] = size(Lpi);

    [Qg, Rg] = GivensQR(Lpi);
    [Ng, ~] = LeastSquareQRResolution(Qg, Rg, Mpi, n, m);

    [Qh, Rh] = HouseHolderQR(Lpi);
    [Nh, ~] = LeastSquareQRResolution(Qh, Rh, Mpi, n, m);

    [Qm, Rm] = qr(Lpi);
    [Nm, ~] = LeastSquareQRResolution(Qm, Rm, Mpi, n, m);
end