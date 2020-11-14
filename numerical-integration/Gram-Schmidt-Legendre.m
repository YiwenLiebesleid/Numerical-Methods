L0 = @ones;
L0 = L0();
w = @ones;
w = w();

B1_0 = @(x) x.*w.*L0.^2;
B1_0val = integral(B1_0,-1,1, 'ArrayValued',true);
B1_1 = @(x) w.*L0.^2;
B1_1val = integral(B1_1,-1,1, 'ArrayValued',true);
B1 = (B1_0val) / (B1_1val);
L1 = @(x) x - B1;

B_0 = @(x) x.*w.*L1(x).^2;
B_0val = integral(B_0,-1,1, 'ArrayValued',true);
B_1 = @(x) w.*L1(x).^2;
B_1val = integral(B_1,-1,1, 'ArrayValued',true);
B2 = (B_0val) / (B_1val);
C_0 = @(x) x.*w.*L1(x).*L0;
C_0val = integral(C_0,-1,1, 'ArrayValued',true);
C_1 = @(x) w.*L0.^2;
C_1val = integral(C_1,-1,1, 'ArrayValued',true);
C2 = (C_0val) / (C_1val);
L2 = @(x) (x - B2).* L1(x) - C2.*L0;

B_0 = @(x) x.*w.*L2(x).^2;
B_0val = integral(B_0,-1,1, 'ArrayValued',true);
B_1 = @(x) w.*L2(x).^2;
B_1val = integral(B_1,-1,1, 'ArrayValued',true);
B3 = (B_0val) / (B_1val);
C_0 = @(x) x.*w.*L2(x).*L1(x);
C_0val = integral(C_0,-1,1, 'ArrayValued',true);
C_1 = @(x) w.*L1(x).^2;
C_1val = integral(C_1,-1,1, 'ArrayValued',true);
C3 = (C_0val) / (C_1val);
L3 = @(x) (x - B3).* L2(x) - C3.*L1(x);

X = [-1:0.01:1];
figure(1);
plot(X, X.^0,'-k','LineWidth',2); hold on;
plot(X, L1(X),'-r','LineWidth',2); hold on;
plot(X, L2(X),'-b','LineWidth',2); hold on;
plot(X, L3(X),'-g','LineWidth',2); hold off;
ylim([-1, 1.5]);
legend({'L0','L1','L2','L3'},'Location', 'Southeast');
