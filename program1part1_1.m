clear all;
n=input('enter n:');
facto(n)

function facto(n)
format long
fact=1;
if(n==0)
    fact=1;
end;
    for i=1:n
        fact=fact*i;
    end
fprintf('The factorial is:')
fprintf('%18.6f',fact)
end
