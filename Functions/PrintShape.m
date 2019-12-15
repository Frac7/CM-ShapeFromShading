%% PrintShape
% ricotruzione della superficie data la U calcolata da un'altra funzione.
% Tale funzione PrintShape ha il compito di stampare e visualizzare la sup
% ricostruita e rendere una mesh.
function FV = PrintShape(U)
    
    I = mat2gray(U);

    b = im2double(I);

    imshow(b);

    shading interp

    %colormap(hot)

    FV=mesh(b);
end

