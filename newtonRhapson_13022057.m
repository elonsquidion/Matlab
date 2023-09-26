% Newton Rhapson Method
% Nama : Delon Khaerun Alief
% NIM : 13022057
% Deskripsi : Mencari nilai x untuk persamaan
% x^2 - 2 = 0
% menggunakan metode Newton Raphson
      
ftol = input("Masukkan nilai ketelitian ftol: ");
xtol = input("Masukkan nilai ketelitian xtol: ");
x0 = input("Masukkan tebakan awal: ");
x1 = x0 - (fungsi(x0)/turunan(x0));
jawaban = newtonRhapson(x0, x1, ftol, xtol);
disp(jawaban);

function fx = fungsi(x)
    fx = x^2 - 2;
end

function dfx = turunan(x)
    dfx = (((x+eps(1))^2 -2) - (x^2 - 2))/(eps(1));
end

function answer = newtonRhapson(xx0, xx1, fftol, xxtol)
    while (abs(fungsi(xx1)) > fftol) && abs((xx1 - xx0)/xx1) > xxtol
        xx0 = xx1;
        xx1 = xx0 - (fungsi(xx0)/turunan(xx0));
    end
    answer = xx1;
end       