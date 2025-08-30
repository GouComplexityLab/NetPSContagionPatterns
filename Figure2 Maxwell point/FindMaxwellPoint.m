clear all
close all
clc

ds = 1.5; di = 1; 

% defien N-shaped function
a = -6.0; b = 9.7; c = 0.1;

% f = @(u,v) u.^3 + a*u.^2 + b*u + c - v;

p_star = 14.8714809;  % =

P_u = 6.77541214906364;
P_d = 6.22458785093636;
p_star = (P_u + P_d)/2;

p_star_values = linspace(P_d, P_u, 500);
abs_values = zeros(1,length(p_star_values));

syms q

for i=1:length(p_star_values)

    p_star = p_star_values(i);
    disp(['i = ' num2str(i)])

    fun_g = @(q) ((p_star+q)/2/ds).^3 + a*((p_star+q)/2/ds).^2 + b*((p_star+q)/2/ds) + c - (p_star-q)/2/di;
    solutions = solve(fun_g, q);
    q_points = double(solutions)';
    q_points = sort(q_points);
    
    Hamilton = @(q) 1/4*((p_star+q)/2/ds).^4*2*ds + a/3*((p_star+q)/2/ds).^3*2*ds + b/2*((p_star+q)/2/ds).^2*2*ds + c*q ...
                           + 1/2*((p_star-q)/2/di).^2*2*di;
    
    h_points = Hamilton(q_points);
    abs_values(i) = abs(h_points(1) - h_points(3));

end

figure
hold on
plot(p_star_values,abs_values,'r-')

[v p] = min(abs_values);
MaxwellPoint = p_star_values(p);
