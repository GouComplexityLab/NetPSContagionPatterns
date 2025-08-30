function out = Nshapedsystem
out{1} = @init;
out{2} = @fun_eval;
out{3} = @jacobian;
out{4} = @jacobianp;
out{5} = @hessians;
out{6} = @hessiansp;
out{7} = @der3;
out{8} = [];
out{9} = [];

% --------------------------------------------------------------------------
function dydt = fun_eval(t,kmrgd,par_N)
dydt=[(par_N-kmrgd(1))^3-6.0*(par_N-kmrgd(1))^2+9.7*(par_N-kmrgd(1))+0.1-kmrgd(1);];

% --------------------------------------------------------------------------
function [tspan,y0,options] = init
handles = feval(Nshapedsystem);
y0=[0];
options = odeset('Jacobian',handles(3),'JacobianP',handles(4),'Hessians',handles(5),'HessiansP',handles(6));
tspan = [0 10];

% --------------------------------------------------------------------------
function jac = jacobian(t,kmrgd,par_N)
jac=[ 12*par_N - 12*kmrgd(1) - 3*(kmrgd(1) - par_N)^2 - 107/10 ];
% --------------------------------------------------------------------------
function jacp = jacobianp(t,kmrgd,par_N)
jacp=[ 12*kmrgd(1) - 12*par_N + 3*(kmrgd(1) - par_N)^2 + 97/10 ];
% --------------------------------------------------------------------------
function hess = hessians(t,kmrgd,par_N)
hess1=[ 6*par_N - 6*kmrgd(1) - 12 ];
hess(:,:,1) =hess1;
% --------------------------------------------------------------------------
function hessp = hessiansp(t,kmrgd,par_N)
hessp1=[ 6*kmrgd(1) - 6*par_N + 12 ];
hessp(:,:,1) =hessp1;
%---------------------------------------------------------------------------
function tens3  = der3(t,kmrgd,par_N)
tens31=[ -6 ];
tens3(:,:,1,1) =tens31;
%---------------------------------------------------------------------------
function tens4  = der4(t,kmrgd,par_N)
%---------------------------------------------------------------------------
function tens5  = der5(t,kmrgd,par_N)
