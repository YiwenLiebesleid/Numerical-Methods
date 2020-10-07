A = [4 1 -1 1;1 4 -1 -1;-1 -1 5 1;1 -1 1 3];
b = [-2; -1; 0; 1];
D = [4 0 0 0; 0 4 0 0; 0 0 5 0; 0 0 0 3];
L = [0 0 0 0; -1 0 0 0; 1 1 0 0; -1 1 -1 0];
U = [0 -1 1 -1; 0 0 1 1; 0 0 0 -1; 0 0 0 0];
X_0 = [0; 0; 0; 0];


% Jacobi's method
TJ = inv(D)*(L+U);
CJ = inv(D)*b;
X_n = X_0;
X_n1 = TJ*X_n + CJ;
iter = 1;
while max(abs(X_n1 - X_n)) >= 0.00001
    X_n = X_n1;
    X_n1 = TJ*X_n + CJ;
    iter = iter + 1;
end
disp("Jacobi's method:")
disp('Approximate solution: ')
disp (X_n1)
disp(['Number of iterations: ',num2str(iter)])

% G-S method
TGS = inv(D-L)*U;
CGS = inv(D-L)*b;
X_n = X_0;
X_n1 = TGS*X_n + CGS;
iter = 1;
while max(abs(X_n1 - X_n)) >= 0.00001
    X_n = X_n1;
    X_n1 = TGS*X_n + CGS;
    iter = iter + 1;
end
disp("G-S method:")
disp('Approximate solution: ')
disp (X_n1)
disp(['Number of iterations: ',num2str(iter)])
