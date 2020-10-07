f = @(x) x^3-7*x^2+11*x-5;
a = 2;
b = 9;
tol = 1e-6;
maxiter = 100;
p0 = 2;
p1 = 7;

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
[p,iter,err,errtrack] = secant(f,p0,p1,tol,maxiter,errtrack);
disp("Secant:")
disp(['Approximate solution: ',num2str(p)])
disp(['Number of iterations: ',num2str(iter)])
disp(['Error: ',num2str(err)])
len = length(errtrack);
X = [1:length(errtrack)];

subplot(3,1,2)
plot(X, errtrack, '-b.')
xlabel('Nth iteration'), ylabel('Error'), title('Error over iteration for secant')

errtrack = [];
[p_1,p_2,it,relerr,errtrack] = bisection(f,a,b,tol,3,errtrack);
[p,iter,err,errtrack] = secant(f,p_2,p_1,tol,maxiter,errtrack);
disp("Quasi-Secant:")
disp(['Approximate solution: ',num2str(p)])
disp(['Number of iterations: ',num2str(iter + it)])
disp(['Error: ',num2str(err)])
len = length(errtrack);
X = [1:length(errtrack)];

subplot(3,1,3)
plot(X, errtrack, '-b.')
xlabel('Nth iteration'), ylabel('Error'), title('Error over iteration for quasi-Secant')
