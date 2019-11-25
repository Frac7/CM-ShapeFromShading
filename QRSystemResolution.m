function x = QRSystemResolution(Q, R, b)

%Qc = b;
c = Q' * b;

%Rx = c;
x = R' * c;