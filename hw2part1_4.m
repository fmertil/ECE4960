f1=@(x) x.^2+10^8;
f1prime=@(x) 2*x;

diffex(f1,f1prime,1,18)



function diffex(func,dfunc,x,n) 
format long
dftrue=dfunc(x);
h=1;
H(1)=h; 
D(1)=(func(x+h)-func(x))/(h); 
E(1)=abs(dftrue-D(1));
for i=2:n 
    h=h/10; 
    H(i)=h;
    D(i)=(func(x+h)-func(x))/(h);
    E(i)=abs(dftrue-D(i));
end

L=[H' D' E']';
fprintf(' step size finite difference') 
fprintf('%18.10f %16.14f %16.13f\n',L); 
loglog(H,E),xlabel('Step Size'),ylabel('Error')
title('Plot of Error Versus Step Size')
format short
end 
