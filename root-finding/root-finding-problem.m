format compact
format long
syms x;
f(x) = pi + 0.5 * sin(x / 2);
g = matlabFunction(f(x));
tolerance = 0.01;

for p_0 = [0, pi/4, pi/2, pi*3/4, pi, pi*5/4, pi*3/2, pi*7/4, 2*pi]
    n = 0;
    p_n = p_0;
    
    while abs(g(p_n) - p_n) >= 0.01
        p_n = g(p_n);
        n = n + 1;
    end
    disp("p0 = " + num2str(p_0) + ", p = "+ num2str(p_n) + ", n = " + num2str(n));
    disp("========")
end
