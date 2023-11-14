% Delon Khaerun Alief
% 13022057
% Mencari nilai maksimum untuk fungsi 2sin(x)-x^2/10 antara 0-4

clear
clc

GR = (sqrt(5)-1)/2;
xb = 0;
xa = 4;
tol = 1e-15;

while abs(xb-xa) >= tol % mengecek konvergensi
    d = (xa-xb)*GR;
    x1 = xa - d;
    x2 = xb + d;
    if furuka(x1) > furuka(x2)
        xa = x2;
    else
        xb = x1;
    end
    xg = (xa+xb)/2;
end

xr = fminbnd(@(x) -furuka(x), 0, 4);

fprintf("Nilai x dengan metode golden ratio: %f\n", xg);
fprintf("Nilai x dengan fungsi bawaan MATLAB: %f\n", xr);

function f = furuka(x)
f = 2*sin(x) - x^2/10;
end
