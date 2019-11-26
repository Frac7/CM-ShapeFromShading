function [x] = QRSystemResolution(Q, R, b)
    c = Q' * b;
    x = R\c;
end