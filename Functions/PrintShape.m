function FV = PrintShape(U)
    
    I = mat2gray(U);

    b = im2double(I);

    %imshow(b);

    shading interp

    colormap(hot)

    FV=mesh(b);
end

