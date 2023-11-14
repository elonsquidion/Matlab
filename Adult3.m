% Fungsi Finite Method

clear 
clc

n = 10;
h = 1/n;
A = zeros(n,n);
x = 0:h:1-h;
x = x';
ex = 0:h:1-h;

for i = 1:n
    A(i,i) = -(2 + 0.1^2);
    a = x(i);
    x(i) = -a*0.1^2;
end

for i = 2:n
    A(i, i-1) = 1;
    A(i-1, i) = 1;
end

y = A\x;

plot(ex,y)
