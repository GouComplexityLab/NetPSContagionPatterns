clear all
close all
clc

beta = 0.01; nu = 0.2; gamma = 1 / 7; 

N = 13.36;
I = 3.0;
S = N - I;
x0 = [S; I];
dt = 0.01; tspan = [0:dt:600];
[sol_t, sol_x] = ode45(@(t,x) OdeSISystem(t,x,beta,nu,gamma), tspan, x0);
endingS = sol_x(end,1);
endingI = sol_x(end,2);

Nc = 13.36;
Ip = (beta*(nu.*Nc - 1) + sqrt((beta+beta*nu.*Nc).^2-4*beta*nu*gamma))./(2*beta*nu);
Im = (beta*(nu.*Nc - 1) - sqrt((beta+beta*nu.*Nc).^2-4*beta*nu*gamma))./(2*beta*nu);

figure
set(gcf,'Position', [100 300 630 420])
axes('Position',[0.15 0.15 0.745 0.775]);
set(gca,'Color','none')
hold on
plot(sol_t, sol_x(:,2),'LineWidth',2.0,'LineStyle','-','Color','k');

ax = gca; 
ax.XTick = [0:100:tspan(end)]; 
ax.XTickLabel = [0:100:tspan(end)]; 
ax.XAxis.FontName = 'Times New Roman'; 
ax.TickLabelInterpreter = 'latex';

ax.YTick = [Im,3,6,Ip,10]; 
ax.YTickLabel = {'$I_{-}$','3','6','$I_{+}$', '10'};  
ax.YAxis.FontName = 'Times New Roman';
ax.TickLabelInterpreter = 'latex';

box on
xlim([0 600])
ylim([-0.5,10])

set(gca,'XColor','k','YColor','k','TickLength',...
    [0.02 0.02],'FontSize',24,'linewidth',2.0,'layer','top');

annotation('textbox',...
    [0.76768253968254 0.773809523809524 0.103746031746032 0.0990000000000025],...
    'String',{'$I(t)$'},...
    'Interpreter','latex',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none','BackgroundColor','none');


figure_name = ['./Figure16b.eps'];
saveas(gcf, figure_name, 'epsc');
