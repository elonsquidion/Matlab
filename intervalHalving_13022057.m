% Interval Halving Method
% Nama : Delon Khaerun Alief
% NIM : 13022057
% Deskripsi : Mencari nilai x untuk persamaan
% x^2 - 2 = 0
% menggunakan metode interval halving

xr = input("Masukkan nilai xr: ");
xl = input("Masukkan nilai xl: ");
ftol = input("Masukkan nilai ketelitian: ");

% menghitung nilai x yang memenuhi menggunakan fungsi yang telah dibuat
x = intervalHalving(xr,xl,ftol);

if (string(x) == "Tidak dapat diselesaikan")
    disp("Tidak dapat diselesaikan dikarenakan kesalahan dalam pemilihan xr dan xl.");
else
    fprintf("Nilai x yang memenuhi persamaan adalah %f\n", x);
end

% membuat fungsi untuk persamaan x^2 - 2 = 0
function f = fungsi(x)
    f = x^2 - 2;
end

% fungsi untuk menemukan nilai x menggunakan interval halving
function answer = intervalHalving(r, l, tol)
    fr = fungsi(r);
    fl = fungsi(l);
    if (fr * fl) < 0  % fr dan fl berbeda tanda
        while true
            xm = (r + l)/2;
            fm = fungsi(xm);
            if (fm == 0) || (abs(fm) <= tol)
                answer = xm;
                break;
            else
                if (fm * fr < 0)
                    l = xm;
                    fl = fm;
                else
                    r = xm;
                    fr = fm;
                end
            end
        end
    elseif (fr == 0)
        answer = r;
    elseif (fl == 0)
        answer = l;
    else
        answer = "Tidak dapat diselesaikan";
    end
end