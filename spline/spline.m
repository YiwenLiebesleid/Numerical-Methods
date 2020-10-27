
% Use the data points (0,1), (1,e), (2,e^2), (3,e^3) to form a natural
% cubic spline S(x) that approximates f(x) = e^x

% Data points
xpts = 0:2;
ypts = xpts;

N = length(xpts); % number of data points N = n+1

h = diff(xpts);  % h values (step sizes between nodes)
a_coeff = ypts;  % a_j spline coefficients

% Build A (size NxN), b (size Nx1)
A = [1 0 0; ...
    h(1) 2*(h(1)+h(2)) h(2); ...
    0 0 1];

b = [0; ...
    3/h(2)*(a_coeff(3)-a_coeff(2)) - 3/h(1)*(a_coeff(2)-a_coeff(1)); ...
    0];

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
xeval = linspace(xpts(1),xpts(end),200);
S_val = zeros(size(xeval));
for i = 1:length(xeval)
    if ( xpts(1) <= xeval(i) && xeval(i) < xpts(2) )
        S_val(i) = a_coeff(1) + b_coeff(1)*(xeval(i)-xpts(1))...
            + c_coeff(1)*(xeval(i)-xpts(1))^2 + d_coeff(1)*(xeval(i)-xpts(1))^3;
    elseif ( xpts(2) <= xeval(i) && xeval(i) <= xpts(3) )
        S_val(i) = a_coeff(2) + b_coeff(2)*(xeval(i)-xpts(2))...
            + c_coeff(2)*(xeval(i)-xpts(2))^2 + d_coeff(2)*(xeval(i)-xpts(2))^3;
    end
end

% quadratic spline
Q_val = zeros(size(xeval));
for i = 1:length(xeval)
    if ( xpts(1) <= xeval(i) && xeval(i) < xpts(2) )
        Q_val(i) = -xeval(i)^2 + 2 * xeval(i);
    elseif ( xpts(2) <= xeval(i) && xeval(i) <= xpts(3) )
        Q_val(i) = xeval(i)^2 - 2 * xeval(i) + 2;
    end
end


% Plot data, resulting spline
figure(1);
plot(xeval,S_val,'-b','LineWidth',4); hold on;
plot(xeval, xeval, '-g','LineWidth',2); hold on;
plot(xeval, Q_val, '-r','LineWidth',2); hold off;
set(gca,'FontSize',15);
legend({'cubic','linear','quadratic'},'Location', 'Northwest');
