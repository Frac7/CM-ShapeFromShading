function [eG, eH, eM] = TestPhotoSystem(N, Ng, Nh, Nm)
    eG = norm(N - Ng);
    eH = norm(N - Nh);
    eM = norm(N - Nm);
    %TODO: plottare
    %aggiungere tempo?
end