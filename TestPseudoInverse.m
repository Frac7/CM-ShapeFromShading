%% TestPseudoInverse
% Calcolo dell'errore della pseudoinversa
%%
function [e] = TestPseudoInverse(A)
    e = norm(pinv(A) - PseudoInverse(A));
end