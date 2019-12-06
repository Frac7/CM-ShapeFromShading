load superficie1.mat

%ora ho L M N r s

%ottenere sistema L’ N = M’
Ltrasp = L';

Mtrasp = M';

%fatt QR di Ltrasp risoluzione sist minimi quadrati QR
[Q, R] = HouseHolderQR(Ltrasp);

C = Q' * Mtrasp;

Nqrtest= R\C;

%matlab
Nmatlab = Ltrasp\Mtrasp;

%err confronto Nqrtest vs N 
errorNqrN= norm(N - Nqrtest);
%err confronto Nmatlab vs N-prof
errorNmatN= norm(N - Nmatlab);
%err confronto Nqrtest vs Nmatlab
errorNqrNmat= norm(Nmatlab - Nqrtest);