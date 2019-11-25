%% GivRot
% Calcolo c ed s
%%
function [c, s] = GivRot(xi, xj)
    if xj == 0 
        c = 1;
        s = 0;
    else
        if abs(xi)>abs(xj)
            t = xi/xj; 
            z = sqrt(1+t^2);
            s = 1/z;
            c = t*s;
        else
            t = xj/xi;
            z = sqrt(1+t^2);
            c = 1/z;
            s = t * c;
        end
    end
    