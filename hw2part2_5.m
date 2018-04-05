f1=@(x) x.^3;
f1prime=@(x) 3*x.^2;
f1second=@(x) 6*x;

R(f1,f1prime,f1second,1,36)



function R(func,dfunc,ddfunc,x,n) 
format long
h=2^-4;
H(1)=h; 
D(1)= (((func(x+4*h)-func(x))/(4*h))-((func(x+2*h)-func(x))/(2*h)))/(((func(x+2*h)-func(x))/(2*h))-((func(x+h)-func(x))/(h))); 
for i=1:n 
    h=h/2; 
    H(i)=h;
    D(i)=(((func(x+4*h)-func(x))/(4*h))-((func(x+2*h)-func(x))/(2*h)))/(((func(x+2*h)-func(x))/(2*h))-((func(x+h)-func(x))/(h)));
    
end

L=[H' D']';
fprintf(' H  R(h)') 
fprintf('%18.10f %16.14f\n',L); 

end 
