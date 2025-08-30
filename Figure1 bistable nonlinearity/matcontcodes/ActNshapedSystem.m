clear all
close all
clc

N = 15;
x0 = 0.3;
hls=feval(@Nshapedsystem);
options=odeset('RelTol',1e-8);
[t,y]=ode45(hls{2},[0:0.1:100],x0,options, N);


figure
plot(t,y)

%%
initial_x0 = y(end,:)';


figure
hold on

xlabel('N','FontSize',18,'Interpreter','latex')
ylabel('$y$','FontSize',18,'Interpreter','latex')

box on
set(gca,'XColor','k','YColor','k','TickLength',...
    [0.02 0.05],'FontSize',18,'linewidth',1.0,'layer','top');


plot(N, initial_x0, 'r*')

MaxStepsize_ = 1e-3;

p=[N]; ap=[1];
[x0,v0]=init_EP_EP(@Nshapedsystem,initial_x0,p,ap);
opt=contset;
opt=contset(opt,'VarTolerance',1e-3);
opt=contset(opt,'FunTolerance',1e-3);
opt=contset(opt,'MaxStepsize',MaxStepsize_);
opt=contset(opt,'MaxNumPoints',3000);
opt=contset(opt,'Singularities',1);
opt=contset(opt,'TSearchOrder',1);
opt=contset(opt,'Backward',1);
[x1,v1,s1,h1,f1]=cont(@equilibrium,x0,[],opt);
gwcplanim2(x1,v1,s1,'b',[2,1]);

save data_NShapedSystem x1 v1 s1 h1 f1

















