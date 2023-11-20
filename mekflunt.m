xoptmin = fminbnd(@furuka,100,800);
xoptmax = fminbnd(@(x) -furuka(x), 100, 800);
disp(xoptmin);
disp(xoptmax);
disp(furuka(xoptmax))
function W = furuka(P2)
k = 1.4;
P1 = 100;
P3 = 800;
V1 = 0.1;
W = k/(k-1)*P1*V1*((P2/P1)^((k-1)/k) - (P3/P2)^((k-1)/k) - 2);
end