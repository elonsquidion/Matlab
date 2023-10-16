h = 0.2;
y0 = 1;
x0 = 0;

for i = 0.2:0.2:10
    y1 = y0 + h*(dydx(x0, y0));
    x1 = h + x0;
    x0 = x1;
    y0 = y1;
end


function df = dydx(x, y)
    df = y - 2*sin(x);
end
