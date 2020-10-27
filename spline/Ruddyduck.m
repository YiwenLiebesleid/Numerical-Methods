x = [0.9 1.3 1.9 2.1 2.6 3.0 3.9 4.4 4.7 5.0 6.0 7.0 8.0 9.2 10.5 11.3 ...
    11.6 12.0 12.6 13.0 13.3];

y = [1.3 1.5 1.85 2.1 2.6 2.7 2.4 2.15 2.05 2.1 2.25 2.3 2.25 1.95 1.4 0.9 ...
    0.7 0.6 0.5 0.4 0.25];

N = length(x);
h = diff(x);
a_coeff = y;

% Build A (size NxN), b (size Nx1)
A = zeros(N, N);
b = zeros(N, 1);
A(1, 1) = 1;
A(N, N) = 1;
for ind = 2:1:20
    A(ind, ind - 1) = h(ind-1);
    A(ind, ind) = 2 * (h(ind-1) + h(ind));
    A(ind, ind + 1) = h(ind);
end
for ind = 2:1:20
    b(ind, 1) = 3/h(ind)*(a_coeff(ind+1)-a_coeff(ind)) - 3/h(ind-1)*(a_coeff(ind)-a_coeff(ind-1));
end

% Solve for c_coeff
c_coeff = A\b;  % inv(A)*b

% Compute b_coeff and d_coeff
b_coeff = zeros(N-1,1);
d_coeff = zeros(N-1,1);
for j = 1:N-1
    b_coeff(j) = 1/h(j)*(a_coeff(j+1)-a_coeff(j))-h(j)/3*(2*c_coeff(j)+c_coeff(j+1));
    d_coeff(j) = (c_coeff(j+1)-c_coeff(j))/(3*h(j));
end

% Build spline
xeval = linspace(x(1),x(end),200);
S_val = zeros(size(xeval));
for i = 1:length(xeval)
    for ind = 1:N-1
        if ind ~= N-1
            if x(ind) <= xeval(i) && xeval(i) < x(ind + 1)
                S_val(i) = a_coeff(ind) + b_coeff(ind)*(xeval(i)-x(ind))...
                        + c_coeff(ind)*(xeval(i)-x(ind))^2 + d_coeff(ind)*(xeval(i)-x(ind))^3;
                break;
            else
                S_val(i) = a_coeff(ind) + b_coeff(ind)*(xeval(i)-x(ind))...
                        + c_coeff(ind)*(xeval(i)-x(ind))^2 + d_coeff(ind)*(xeval(i)-x(ind))^3;
            end
        end
    end
end

% Plot data
figure(1);
plot(x, y,'.k','MarkerSize',20); hold on;
plot(xeval, S_val,'-r','LineWidth',2); hold off;
legend({'points','cubic spline',},'Location', 'Southwest');
grid on;
set(gca,'FontSize',15);
cpos = get(gcf,'Position');
set(gcf,'Position',[0 cpos(2) 1450 cpos(4)]);
