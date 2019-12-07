%% TestPhotoSystem
% Calcolo dell'errore delle normali ricavate con le 3 fattorizzazioni QR
%%
function [eG, eH, eM] = TestPhotoSystem(N, Ng, Nh, Nm)
    eG = norm(N - Ng);
    eH = norm(N - Nh);
    eM = norm(N - Nm);
    
    figure
    title('Relative Error, Normals');
    xlabel('QR factorization method');
    ylabel('Error');
    
    bar(categorical({'Matlab', 'Givens', 'Householder'}),[eM eG eH]);
    legend('error');
end