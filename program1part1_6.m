%Floating point gradual underflow: Perform (x ? y), (x/y) 
%and  with careful selection of x and y,
a=input('Enter the first value')
b=input('Enter the second value')
perform(a,b)

function perform(a,b)
format long
c=a-b;
d=a/b;
syms x 
f2 = sin(a*x)/x;
limit(f2,x,0,'right')
limit(f2,x,0,'left')

fprintf('a-b is :')
fprintf('%18.30f',c)
fprintf('a/b is :')
fprintf('%18.30f',d)
end


