x = [4 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1]';
y = [102.56 113.18 130.11 142.05 167.53 195.14 224.87 256.73 299.5 326.72]';
lnx = log(x);
lny = log(y);

X1 = [ones(10,1) x];
theta1 = (X1'*X1)\(X1'*lny);
f_1 = @(x) theta1(1) + theta1(2)*x;

X2 = [ones(10,1) lnx];
theta2 = (X2'*X2)\(X2'*lny);
f_2 = @(x) theta2(1) + theta2(2)*x;

f_1_1 = @(x) exp(theta1(1))*exp(theta1(2)*x);
f_2_1 = @(x) exp(theta2(1))*x.^(theta2(2));
disp("error of y=be^(ax) is " + sum((y-f_1_1(x)).^2));
disp("error of y=bx^a is " + sum((y-f_2_1(x)).^2));

subplot(2,1,1);
plot(x, y,'.k','MarkerSize',16); hold on;
plot(3:.1:8,f_1_1(3:.1:8),'-r','LineWidth',1);
legend({'points', 'y=be^{ax}'},'Location', 'Southeast');
grid on;

subplot(2,1,2);
plot(x, y,'.k','MarkerSize',16); hold on;
plot(3:.1:8,f_2_1(3:.1:8),'-r','LineWidth',1);
legend({'points', 'y=bx^a'},'Location', 'Southeast');
grid on;
