% X_0 = [1; 1; -1];
X_0 = [1; 0; -1];
X_n = X_0;

F = @(x)[3*x(1) - cos(x(2)*x(3)) - 1/2 ; x(1)^2 - 625*x(2)^2 - 1/4 ;
    exp(-x(1)*x(2)) + 20*x(3) + (10*pi-3)/3];
J = @(x)[3, x(3)*sin(x(2)*x(3)), x(2)*sin(x(2)*x(3));
    2*x(1), -1250*x(2), 0;
    -x(2)*exp(-x(1)*x(2)), -x(1)*exp(-x(1)*x(2)), 20];

y = J(X_n) \ F(X_n);
X_n1 = X_n + y;
iter = 1;
error = max(abs(X_n1 - X_n));
errtrack = [];
while error >= 0.00001
    X_n = X_n1;
    y = J(X_n) \ F(X_n);
    X_n1 = X_n + y;
    iter = iter + 1;
    error = max(abs(X_n1 - X_n));
    errtrack = cat(2, errtrack, error);
end

disp("Newton's method:")
disp('Approximate solution: ')
disp (X_n1)
disp(['Number of iterations: ',num2str(iter)])

plot([1:iter-1], errtrack);
xlabel('Nth iteration'), ylabel('Error'), title('Error over iteration for Newton')
