clear all
close all
clc

gwLineWidth = 1.0;
gwcolors = lines(6);

ICn = [1];

Netname = 'Delta12';
mat_name = ['./SeriesDataStep2LocalizedSeeding' Netname '.mat'];
load(mat_name, 'pvalues','ending_averagedI','ICns')

ending_averagedIDelta12 = ending_averagedI(ICn,:);

Netname = 'Poisson12';
mat_name = ['./SeriesDataStep2LocalizedSeeding' Netname '.mat'];
load(mat_name, 'pvalues','ending_averagedI','ICns')

ending_averagedIPoisson12 = ending_averagedI(ICn,:);

Netname = 'Powerlaw12';
mat_name = ['./SeriesDataStep2LocalizedSeeding' Netname '.mat'];
load(mat_name, 'pvalues','ending_averagedI','ICns')

ending_averagedIPowerlaw12 = ending_averagedI(ICn,:);

%%

pvalues(end) = 0.019;

%%
% close all

figure
set(gcf,'Position', [100 300 600 360])
axes('Position',[0.148333333333333 0.243055555555556 0.795 0.706944444444444]);
set(gca,'Color','none')
hold on

p1=plot(pvalues,ending_averagedIDelta12,'MarkerSize',24,'Marker','.', ...
    'LineWidth',gwLineWidth,'LineStyle','--',...
    'Color','r');
p2=plot(pvalues,ending_averagedIPoisson12,'MarkerSize',24,'Marker','.', ...
    'LineWidth',gwLineWidth,'LineStyle','--',...
    'Color','m');

p3=plot(pvalues,ending_averagedIPowerlaw12,'MarkerSize',24,'Marker','.', ...
    'LineWidth',gwLineWidth,'LineStyle','--',...
    'Color','b');

xlim([0 0.021])
ylim([-0.5 12])

ax = gca;
% xticks = xticks(ax);
xticks = [0.001,0.005:0.005:0.015,0.019];
xticks_set = [0.001,0.005:0.005:0.015,0.3];
xticklabels = arrayfun(@(x) sprintf('%.3f', x), xticks_set, 'UniformOutput', false);
xticklabels(find(xticks==0)) = {'0'};
% xticklabels(end) = {'$b$'};
set(gca, 'xtick', xticks);
set(gca, 'xticklabel', xticklabels);

% yticks = yticks(ax);
yticks = [0:4:12];
yticklabels = arrayfun(@(x) sprintf('%.0f', x), yticks, 'UniformOutput', false);
yticklabels(find(yticks==0)) = {'0'};
% yticklabels(end) = {'$a$'};
set(gca, 'ytick', yticks);
set(gca, 'yticklabel', yticklabels);

ax_FontSize = 24;
ax.XAxis.FontSize = ax_FontSize;  % 设置Y轴刻度标签的字体大小
ax.XAxis.FontName = 'Times New Roman';  % 设置Y轴刻度标签的字体类型
ax.XAxis.TickDirection = 'in';
ax.XAxis.TickLabelInterpreter = 'latex';


ax.YAxis.FontSize = ax_FontSize;  % 设置Y轴刻度标签的字体大小
ax.YAxis.FontName = 'Times New Roman';  % 设置Y轴刻度标签的字体类型
ax.YAxis.TickDirection = 'in';
ax.YAxis.TickLabelInterpreter = 'latex';

% h = breakxaxis([38 40]);


mainYLim = get(ax,'YLim');

theta = linspace(0,4*pi,100);
splitWidth = 0.003;
yPoints = linspace(mainYLim(1),mainYLim(2),100);
amp = splitWidth/2 * 0.3;
s = 0.017;
xPoints1 = amp * sin(theta) + s;
xPoints2 = amp * sin(theta) + s + 0.001;
patchPointsX = [xPoints1 xPoints2(end:-1:1) xPoints1(1)];
patchPointsY = [yPoints  yPoints(end:-1:1)  yPoints(1)];
patch('YData',patchPointsY,'XData',patchPointsX,'LineWidth',1,...
    'LineStyle','--', 'FaceColor','w', 'EdgeColor','none');
line('xData',xPoints1,'ydata',yPoints,'LineStyle','-');
line('xData',xPoints2,'ydata',yPoints,'LineStyle','-');



% text(0.015,1.5,'$p$','FontName','Times New Roman','FontSize',ax_FontSize,'Interpreter','latex')

legend1 = legend([p1,p2,p3],'Delta', 'Poisson', 'Power-law');
set(legend1,'Position',[0.146725349934192 0.479644674866162 0.322926094593822 0.333888884120517],...
    'Interpreter','latex',...
    'FontSize',ax_FontSize,'FontName','Informal Roman',...
    'EdgeColor','none','Color','none');

box on

xlabel('$p$','FontName','Times New Roman','FontSize',24,'Interpreter','latex');
ylabel('$\langle I\rangle(T)$','FontName','Times New Roman','FontSize',24,'Interpreter','latex');

set(gca,'TickLength',...
    [0.01 0.02],'linewidth',gwLineWidth,'layer','top');

figure_name = ['./Step2 Localized Seeding.eps'];
saveas(gcf, figure_name, 'epsc');


