% Francois Mertil


clc;
clear all;

syms f(x)  
f(x)=10.*(x^(-0.5))

x=rand(1,10)
y=f(x)

%noise
noise=0.10*x;
x_mes=x+noise