%Francois Mertil
%Construct the top-down functions to solve the generic ODEConstruct the top-down functions to solve the generic ODE
% func --> function is taken by user
% like dydt=@(t,y) 4*exp(0.8*t) - 0.5*y;
  

clc;
clear all;
% dydt=@(t,y) 4*exp(0.8*t) - 0.5*y;
% [t,y] = eulode(dydt,[0 4],2,1)

dydt = input('Enter Function in terms of @(x,t): ');
ti= input('Enter Lower Limit: ');
tf = input('Enter Upper Limit: ');
y0 = input('Enter the initial value of dependent variable: ');
h = input('Enter step size: ');
[t,y] = eulode(dydt,[ti tf],y0,h);

%display  solution
L=[t y]';
fprintf('%18s %18s\r\n', 't',  'Euler' ) 
fprintf('%18.10f %18.10f\n', L)



function [t,y] = eulode(dydt,tspan,y0,h,varargin)


if nargin<4,error('at least 4 input arguments required'),end
ti = tspan(1);tf = tspan(2);
if ~(tf>ti),error('upper limit must be greater than lower'),end 
t = (ti:h:tf)'; n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
if t(n)<tf
t(n+1) = tf;
n = n+1; end
y = y0*ones(n,1); %preallocate y to improve efficiency 
for i = 1:n-1 %implement Euler's method
y(i+1) = y(i) + dydt(t(i),y(i),varargin{:})*(t(i+1)-t(i));
end
end