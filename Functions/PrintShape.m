%% PrintShape
% ricotruzione della superficie data la U calcolata da un'altra funzione.
% Tale funzione PrintShape ha il compito di stampare e visualizzare la sup
% ricostruita e rendere una mesh.
function [] = PrintShape(U, V, flag)
    
    I = mat2gray(U);

    b = im2double(I);
    
    if flag
        I2 = mat2gray(V);
        b2 = im2double(I2);
        b2 = 1 - b2;
    else
        b2 = 0;
    end

    imshow(b);

    shading flat
    
    colormap(hot)
    
    b = 1 - b;
    
    %mesh(b - b2)
    mesh(b2 - b)
    
    colorbar
end

