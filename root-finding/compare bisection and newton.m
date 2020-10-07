f = @(x) sin(x) - cos(x);
a = -1;
b = 3;
tol = 1e-6;
maxiter = 100;
p0 = 2;

errtrack = [];
[p,p_1,iter,relerr,errtrack] = bisection(f,a,b,tol,maxiter,errtrack);
disp("Bisection:")
disp(['Approximate solution: ',num2str(p)])
disp(['Number of iterations: ',num2str(iter)])
disp(['Relative error: ',num2str(relerr)])
len = length(errtrack);
X = [1:length(errtrack)];

subplot(3,1,1)
plot(X, errtrack, '-b.')
xlabel('Nth iteration'), ylabel('Error'), title('Error over iteration for bisection')

errtrack = [];
[p,iter,err,errtrack] = newton(f,p0,tol,maxiter,errtrack);
disp("Newton:")
disp(['Approximate solution: ',num2str(p)])
disp(['Number of iterations: ',num2str(iter)])
disp(['Error: ',num2str(err)])
len = length(errtrack);
X = [1:length(errtrack)];

subplot(3,1,2)
plot(X, errtrack, '-b.')
xlabel('Nth iteration'), ylabel('Error'), title('Error over iteration for Newton')

errtrack = [];
[p1,p_1,it,relerr,errtrack] = bisection(f,a,b,tol,2,errtrack);
[p,iter,err,errtrack] = newton(f,p1,tol,maxiter,errtrack);
disp("Quasi-Newton:")
disp(['Approximate solution: ',num2str(p)])
disp(['Number of iterations: ',num2str(iter + it)])
disp(['Error: ',num2str(err)])
len = length(errtrack);
X = [1:length(errtrack)];

subplot(3,1,3)
plot(X, errtrack, '-b.')
xlabel('Nth iteration'), ylabel('Error'), title('Error over iteration for quasi-Newton')

