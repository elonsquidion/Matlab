%NIM: 13022051
%Nama: Muhammad Dhafi Saniy Putra
%Deskripsi: Program ini dapat menghitung tekanan untuk menghasilkan daya
%minimum
function RunEfficientKompressor
P2opt = fminbnd(@FungsiW,200,900)
end
function W = FungsiW(P2)
%definisikan variabel tetap
k1 = 1.5;
P1 = 200;
P3 = 900;
V1 = 0.3;
%return W
W = k1/(k1-1)*P1*V1*((P2/P1)^((k1-1)/k1)+(P3/P2)^((k1-1)/k1)-2);
end