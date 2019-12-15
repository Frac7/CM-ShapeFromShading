function U = intnormals(N,r,s,h)

P = reshape(-N(1,:)./N(3,:),s,r);
Q = reshape(-N(2,:)./N(3,:),s,r);

F = zeros(s,r);
F(2:s-1,2:r-1)  = (P(2:s-1,3:r)-P(2:s-1,1:r-2)+Q(3:s,2:r-1)-Q(1:s-2,2:r-1))/2/h;
U = poisdir(F,h);



function [U,A] = poisdir(F,h)
% Poisson solver with homogeneous Dirichlet boundary conditions

[n m] = size(F);
m = m-2;
n = n-2;

%T = sparse(toeplitz([-4 1 zeros(1,n-2)]));
T = spdiags(ones(n,1)*[1 -4 1],[-1,0,1],n,n);
In = speye(n);
Im = speye(m);
%S = sparse(toeplitz([0 1 zeros(1,m-2)]));
S = spdiags(ones(m,2),[-1,1],m,m);
A = kron(Im,T)+kron(S,In);

f = reshape(F(2:n+1,2:m+1),m*n,1);
u = A\f;
u = h^2*u;
U = zeros(n+2,m+2);
U(2:n+1,2:m+1) = reshape(u,n,m);

