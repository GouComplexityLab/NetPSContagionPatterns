clear all;
close all;
clc;

load data_Nvalues N1 N2 N3 Nm Np

x_vals = linspace(0, 100.5, 1000);

% defien N-shaped function
a = -6.0; b = 9.7; c = 0.1;

% f = @(x) m*x.^3 + a*x.^2 + b*x + c;
f = @(x,y) x.^3 + a*x.^2 + b*x + c - y;

fN = @(N,y) (N-y).^3 + a*(N-y).^2 + b*(N-y) + c - y;

syms x_sym
f_sym = x_sym^3 + a*x_sym^2 + b*x_sym + c;
f_prime = diff(f_sym, x_sym);
f_prime_num = matlabFunction(f_prime);

eqn = f_prime == -1;
solutions = solve(eqn, x_sym);
x_points = double(solutions)

figure('Position', [100, 100, 600, 600]);

set(gcf, 'Color', 'w');
hold on;

% lim = [0 7.5 0 7.5];
% fimplicit(f,lim)

lim = [0 10 0 10];
fimplicit(fN,lim)

% lim = [0 Np 0 10];
% fimplicit(fN,lim)

axis equal
xlim([0, 10]);
ylim([0, 7]);

xline(N1,'r-')
xline(N2,'r--')
xline(N3,'k-')

xline(Nm,'b-')
xline(Np,'b--')

load data_NShapedSystem

plot(x1(2,:),x1(1,:),'r--')

% % % figure('Position', [100, 200, 600, 600]);
% % % set(gcf, 'Color', 'w');
% % % hold on;
% % % lim = [0 7.5 0 7.5];
% % % fimplicit(f,lim)
% % % % lim = [0 7.5 0 7.5];
% % % % fimplicit(fN,lim)
% % % axis equal
% % % xlim([0, 7.5]);
% % % ylim([0, 7.5]);



