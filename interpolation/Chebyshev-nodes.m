N = 15;

dx    = 0.01;
xeval = xpts(1):dx:xpts(end);
yeval = 1 ./ (1 + 25 .* (xeval .^ 2));

temp = [1:1:N];
xpts = cos((2*temp-1).*pi./(2*N));
ypts = 1 ./ (1 + 25 .* (xpts .^ 2));
poly = lagrange(xpts,ypts,xeval);

l_2 = sum((yeval - poly) .^ 2) ^ 0.5;
l_inf = max(yeval - poly);
disp(['N = ', num2str(N)]);
disp(['l-2 = ', num2str(l_2)]);
disp(['l-inf = ', num2str(l_inf)]);

plot(xeval,poly,'-b','LineWidth',2); hold on;
plot(xpts,ypts,'.k','MarkerSize',20); hold on;
plot(xeval,yeval,'-r','LineWidth',2); hold off;
xlabel('x'), ylabel('y'), title('N=15 using Chebyshev nodes');
legend('P(x)','points','f(x)');
