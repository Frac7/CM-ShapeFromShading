%% PrintShape
% ricotruzione della superficie data la U calcolata da un'altra funzione.
% Tale funzione PrintShape ha il compito di stampare e visualizzare la sup
% ricostruita e rendere una mesh.
function [] = PrintShape(U, aspectRatio, V)
    
    I = mat2gray(U);

    b = im2double(I);

    imshow(b);

    shading interp
    
    colormap(hot)  
    
    if nargin > 2
        J = mat2gray(V);
        
        c = im2double(J);
        
        mesh(b - c)
        %mesh(c - b)
    else
        mesh(b)
    end 
    
    colorbar
    
    daspect(aspectRatio)
    
    %daspect([100 100 1]) %conchiglia
    %daspect([3 3 10^-12]) %differenza conchiglia
    %daspect([10 10 1]) %superficie1
    %daspect([1 1 10^-16]) %differenza superficie1
end

