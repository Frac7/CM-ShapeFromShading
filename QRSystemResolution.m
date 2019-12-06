function [x] = QRSystemResolution(Q, R, b)
    C = Q' * b;
    x = R\C;
end