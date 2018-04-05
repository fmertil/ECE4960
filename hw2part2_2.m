f1=@(x) x.^3;
f1prime=@(x) 3*x.^2;
f1second=@(x) 6*x;

diffex(f1,f1prime,f1second,1,36)



function diffex(func,dfunc,ddfunc,x,n) 
format long
dftrue=dfunc(x);
h=2^-4;
H(1)=h; 
D(1)=((func(x+2*h)-func(x))/(2*h)) + h*ddfunc(x); 
E(1)=abs(dftrue-D(1));
for i=1:n 
    h=h/2; 
    H(i)=h;
    D(i)=((func(x+2*h)-func(x))/(2*h))  + h*ddfunc(x);
    E(i)=abs(dftrue-D(i));
end

L=[H' D' E']';
fprintf(' step size finite difference') 
fprintf('%18.10f %16.14f %16.13f\n',L); 
loglog(H,E),xlabel('Step Size'),ylabel('Error')
title('Plot of Error Versus Step Size')
format short
end 
