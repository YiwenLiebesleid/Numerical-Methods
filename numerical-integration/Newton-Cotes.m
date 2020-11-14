X = [1.8, 2, 2.2, 2.4, 2.6];
Fval = [3.12014, 4.42569, 6.04241, 8.03014, 10.46675];
% plot(X, Fval,'.k','MarkerSize',16);
h = X(5)-X(1);

% closed NC
disp("Closed N-C:")

% n=1 Trapezoidal rule
% % raw
sum_c1 = h/2*(Fval(1) + Fval(5));
disp("n=1, Trapezoidal: " + sum_c1);
% % composite NC
sum_c1 = 0;
for ind = 1:1:4
    sum_c1 = sum_c1 + (h/4)/2*(Fval(ind) + Fval(ind+1));
end
disp("n=1, Trapezoidal, Composite: " + sum_c1);

% n=2 Simpson's rule
% % raw
sum_c2 = (h/2)/3*(Fval(1) + 4*Fval(3) + Fval(5));
disp("n=2, Simpson: " + sum_c2);
% % composite NC
sum_c2 = 0;
for ind = 1:2:3
    sum_c2 = sum_c2 + (h/2/2)/3*(Fval(ind) + 4*Fval(ind+1) + Fval(ind+2));
end
disp("n=2, Simpson, Composite: " + sum_c2);

% n=3 Simpson's 3-8 rule
disp("n=3, Simpson 3-8: not applicable");

% n=4
sum_c4 = (h/4)*2/45*(7*Fval(1) + 32*Fval(2) + 12*Fval(3) + 32*Fval(4) + 7*Fval(5));
disp("n=4: " + sum_c4);

% open NC
disp("Open N-C:")

% n=0 Midpoint rule
% % raw
sum_o0 = 2*(h/2)*Fval(3);
disp("n=0, Midpoint: " + sum_o0);
% % composite NC
sum_o0 = 0;
for ind = 1:2:3
    sum_o0 = sum_o0 + 2*((h/4*2)/2)*Fval(ind+1);
end
disp("n=0, Midpoint, Composite: " + sum_o0);

% n=1
disp("n=1: not applicable");

% n=2
sum_o2 = (h/4)*4/3*(2*Fval(2) - Fval(3) + 2*Fval(4));
disp("n=2: " + sum_o2);

% n=3
disp("n=3: not applicable");
