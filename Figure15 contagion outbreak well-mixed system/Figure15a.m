clear all
close all
clc

beta = 0.01; nu = 0.2; gamma = 1 / 7; 

Max_N = 20;
disp(['judge ' num2str(gamma/beta - 1/nu)])
N_1 = 2*sqrt(gamma/beta/nu)-1/nu;
N_2 = gamma/beta;

N_sn = linspace(0,N_2,1000);
I_0 = zeros(size(N_sn));

N_zheng = linspace(N_1,Max_N,500);
N_fu = linspace(N_1,N_2,500);
I_1 = (beta*(nu.*N_zheng - 1) + sqrt((beta+beta*nu.*N_zheng).^2-4*beta*nu*gamma))./(2*beta*nu);
I_2 = (beta*(nu.*N_fu - 1) - sqrt((beta+beta*nu.*N_fu).^2-4*beta*nu*gamma))./(2*beta*nu);

Nc = 13.36;
Ip = (beta*(nu.*Nc - 1) + sqrt((beta+beta*nu.*Nc).^2-4*beta*nu*gamma))./(2*beta*nu);
Im = (beta*(nu.*Nc - 1) - sqrt((beta+beta*nu.*Nc).^2-4*beta*nu*gamma))./(2*beta*nu);

gwLineWidth = 1.5;
figure
set(gcf,'Position', [100 300 500 420])
axes('Position',[0.15 0.15 0.745 0.775]);
set(gca,'Color','none')

hold on

plot(linspace(0,Max_N,500),linspace(0,Max_N,500),'Color',[0.5 0.5 0.5],'LineWidth',gwLineWidth)

plot(real(N_fu),real(I_2),'k--','LineWidth',gwLineWidth);
plot(N_sn,I_0,'k-','LineWidth',gwLineWidth);

plot(linspace(N_2,Max_N,100+1),zeros(size(linspace(N_2,Max_N,100+1))),'k--','LineWidth',gwLineWidth);

plot(N_zheng,real(I_1),'k-','LineWidth',gwLineWidth);

plot(N_2,0,'r.','MarkerSize',18,'LineWidth',2.0);
plot(N_1,real(I_1(1)),'b.','MarkerSize',18,'LineWidth',2.0);

plot(13.36, Im, 'ko', 'MarkerSize', 7, 'LineWidth', 2, 'MarkerFaceColor', 'w'); 
plot(13.36, Ip, 'ko', 'MarkerSize', 7, 'LineWidth', 2, 'MarkerFaceColor', 'k'); 
plot(13.36, 3, 'kp', 'MarkerSize', 7, 'LineWidth', 2, 'MarkerFaceColor', 'k'); 

% set(gca, 'YAxisLocation', 'right');
ax = gca; 
ax.XTick = [10,13.36,17,20]; 
ax.XTickLabel = {'10', '13.36', '17', '20'}; 
ax.XAxis.FontName = 'Times New Roman';
ax.TickLabelInterpreter = 'latex';


ax.YTick = [Im,3,6,Ip,10]; 
ax.YTickLabel = {'$I_{-}$','3','6','$I_{+}$', '10'};  
ax.YAxis.FontName = 'Times New Roman';
ax.TickLabelInterpreter = 'latex';

ax.TickDir = 'in';

annotation('arrow',[0.4 0.4],[0.45 0.728571428571429],...
    'LineWidth',2,'HeadWidth',12,'HeadLength',15);

annotation('textbox',...
    [0.178 0.80952380952381 0.081 0.090666666666667],'String',{'$I^{*}$'},...
    'Interpreter','latex',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none','BackgroundColor','none');

annotation('textbox',...
    [0.73852380952381 0.189285714285714 0.12747619047619 0.101142857142858],...
    'String',{'$\langle N\rangle$'},...
    'Interpreter','latex',...
    'FontSize',24,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none','BackgroundColor','none');

box on
xlim([10 20])
ylim([-0.5,10])
set(gca,'linewidth',3,'FontSize',30)


set(gca,'XColor','k','YColor','k','TickLength',...
    [0.02 0.02],'FontSize',24,'linewidth',gwLineWidth,'layer','top');

figure_name = ['./Figure16a.eps'];
saveas(gcf, figure_name, 'epsc');
