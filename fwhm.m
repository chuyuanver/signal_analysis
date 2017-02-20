function [ dw ] = fwhm(x,y)

% my: max of y; myi: max of y index
[my,myi] = max(y);
l = length(y);
k = 1;
while k < l
    if (k - myi) < 0
        if y(k) - my/2 < 0
            n1 = k;
            k = k + 1;
        else
            k = k + 1;
        end
    else
        if y(k) - my/2 > 0
            n2 = k;
            k = k + 1;
        else
            k = k + 1;
        end
    end
end

dw = abs(x(n2)- x(n1));

end