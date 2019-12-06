function [Ng, Nh, Nm] = PhotoSystem(L, M)
    %L'N = M'
    Lpi = PseudoInverse(L);
    Mpi = PseudoInverse(M);

    [Q, R] = GivensQR(Lpi);
    Ng = QRSystemResolution(Q, R, Mpi);
    
    [Q, R] = HouseHolderQR(Lpi);
    Nh = QRSystemResolution(Q, R, Mpi);
    
    [Q, R] = qr(Lpi);
    Nm = QRSystemResolution(Q, R, Mpi);
end