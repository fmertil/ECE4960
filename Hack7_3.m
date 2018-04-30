%Francois Mertil

clc;
clear all;

a=0; b=4; n=40;
ua=2; ub=10;

function [x,U] = two_point(a,b,ua,ub,f,n)
%    a, b: Two end points.                                 
%    ua, ub: Dirichlet boundary conditions at a and b      
%    f: external function f(x).                            
%    n: number of grid points.                             
%   Output:                                                
%    x: x(1),x(2),...x(n-1) are grid points                
%    U: U(1),U(2),...U(n-1) are approximate solution at    
%    grid points    



h = (b-a)/n; h1=h*h;
A = sparse(n-1,n-1);
F = zeros(n-1,1);
for i=1:n-2,
  A(i,i) = -2/h1; A(i+1,i) = 1/h1; A(i,i+1)= 1/h1;
end
  A(n-1,n-1) = -2/h1;
for i=1:n-1,
  x(i) = a+i*h;
  F(i) = feval(f,x(i));
  end
  F(1) = F(1) - ua/h1;
  F(n-1) = F(n-1) - ub/h1;
U = A\F;
return
end 