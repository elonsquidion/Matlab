clear
clc

x1 = linspace(0,1,100)
x2 = 1
T0 = 24

while 1
    P = psat(x1, T0);
    if abs(P) < 0.00001
        T1 = T0;
        break
    else
        dP = psat(x1+ 0.00001, T0);
        turunan = (dP - P)/0.00001;
        T1 = T0 - P/dP;
        T0 = T1;
    end
end

plot(T1,x1)    

function P = psat(x, T)
 P =x* 10^(6.90565 - 1211.033/(220.790 + T))-(1-x)*10^(6.95344-1343.343-(T +219.377));
end

