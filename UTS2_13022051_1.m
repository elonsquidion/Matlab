%NIM: 13022051
%Nama: Muhammad Dhafi Saniy Putra
%Deskripsi: Program ini dapat menghitung dan menunjukkan distribusi 
% konsentrasi suatu reaksi menggunakan function ode23
function RunReaktorKompleks
C0 = [2 0 0 0];
TSpan = [0 10]; %Laju reaksi dalam satuan menit
[t,C] = ode23(@FReaksi,TSpan,C0);
%Plot data dalam grafik
plot(t,C)
xlabel = ({'Waktu reaksi','(Menit)'})
ylabel = ({'Konsentrasi Komponen','mol/L'})
end
function LajuKonsentrasi = FReaksi(t,C) % Definisikan Fungsi Laju Reaksi
%LajuReaksi
r = [0.4*(C(1)^2) 0.45*C(1) 0.25*C(3) 0.65*(C(2)^(1.5)) 0.1*C(2)];
%Persamaan yang akan diterima ode23
dCAdt = -r(1)-r(2);
dCBdt = r(1)+r(3)-r(4)-r(5);
dCCdt = r(2)-r(3)+r(4);
dCDdt = r(5);
LajuKonsentrasi = [dCAdt dCBdt dCCdt dCDdt]'; %fungsi ode23 hanya menerima
                                            % vektor kolom
end
