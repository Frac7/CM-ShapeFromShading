function [w, k, H] = HouseHolderMatrix(A)
n = size(A, 1);
sigma = norm(A);

if A(1) >= 0
    k = -sigma;
else
    k = sigma;
end

lambda = sqrt (2 * sigma * (sigma + abs(A(1))));

%conviene togliere k dalla prima componente e non se ne parla più

w = A;

w(1) = w(1) - k;

w = w / lambda;

if nargout > 2  
    H = eye(n) - 2 * (w * w');
end

end
