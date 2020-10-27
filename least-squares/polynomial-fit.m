x = [4 4.2 4.5 4.7 5.1 5.5 5.9 6.3 6.8 7.1]';
y = [102.56 113.18 130.11 142.05 167.53 195.14 224.87 256.73 299.5 326.72]';

X1 = [ones(10,1) x];
theta1 = (X1'*X1)\(X1'*y);
f_1 = @(x) theta1(1) + theta1(2)*x;
disp("error1 = " + sum((y-f_1(x)).^2));

X2 = [ones(10,1) x x.^2];
theta2 = (X2'*X2)\(X2'*y);
f_2 = @(x) theta2(1) + theta2(2)*x + theta2(3)*x.^2;
disp("error2 = " + sum((y-f_2(x)).^2));

X3 = [ones(10,1) x x.^2 x.^3];
theta3 = (X3'*X3)\(X3'*y);
f_3 = @(x) theta3(1) + theta3(2)*x + theta3(3)*x.^2 + theta3(4)*x.^3;
disp("error3 = " + sum((y-f_3(x)).^2));


subplot(3,1,1);
plot(x, y,'.k','MarkerSize',16); hold on;
plot(3:.1:8,f_1(3:.1:8),'-r','LineWidth',1);
legend({'points', 'degree = 1'},'Location', 'Southeast');
grid on;

subplot(3,1,2);
plot(x, y,'.k','MarkerSize',16); hold on;
plot(3:.1:8,f_2(3:.1:8),'-r','LineWidth',1);
legend({'points', 'degree = 2'},'Location', 'Southeast');
grid on;

subplot(3,1,3);
plot(x, y,'.k','MarkerSize',16); hold on;
plot(3:.1:8,f_3(3:.1:8),'-r','LineWidth',1);
legend({'points', 'degree = 3'},'Location', 'Southeast');
grid on;
