function [Q, R] = GivensQR (A)
    [m, n]=size(A);
    G = speye(m);
    for k=1:n
        for i = k+1:m
            [c, s] = GivRot(A(k,k), A(i, k));
            for j = k:n
                t = c * A(k, j) + s * A(i, j);
                A(i, j) = -(s * A(k, j)) + (c * A(i, j));
                A(k, j) = t;
                G = Gmatrix(c, s, i, j, n) * G;
            end
        end
    end
    
    R = G * A;
    
    Q = G';
end

    

    