x0 = 5;

xnobrain = fzero(@setimbang, x0);
fprintf("Hasil perhitungan no brain %f\n", xnobrain);
x1 = x0;

while abs(setimbang(x1)) >= 1e-6
    x0 = x1;
    x1 = x0 - setimbang(x0)/dsetimbang(x0);
end

fprintf("Hasil perhitungan megamind %f\n", x1);

function df = dsetimbang(x)
    h = 1e-6;
    df = (setimbang(x+h) - setimbang(x))/h;
end

function f = setimbang(x)
    nao = 10;
    K = 4;
    P = 1;
    ya = (nao-x)/(nao+x);
    yb = 2*x/(nao+x);
    f = K-yb^2/ya*P;
end