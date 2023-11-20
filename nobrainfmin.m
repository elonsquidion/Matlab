f = @(x) x(1)^2 - x(1)*x(2) + 4*x(1) + x(2)^2 - x(2); 

xopt = fminsearch(f, [0 0]);

disp(xopt);