%Francois Mertil
%Hack 5.2

clc;
clear all;



f= @(x) exp(100*x)-1;
df=@(x) 100*exp(100*x);
x=1:10;
for i=1:10
D(1,i)=-f(i)/df(i);
fx(i)=f(i);
end 

fprintf('%8s %8s %8s\r\n', 'X', 'D', 'f(x)')
L=[x'  D'  fx'];
fprintf('%8.8f %8.8f %8.8f\n', L')
