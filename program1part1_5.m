%Signed zero: Observe signed zero handling by performing 

syms x 
f1=log(x);
f2 = sin(x)/x;
f3=sin(x)/(abs(x))
limit(f2,x,0,'right')
limit(f2,x,0,'left')
limit(f1,x,0,'right')
limit(f1,x,0,'left')
limit(f3,x,0,'right')
limit(f3,x,0,'left')