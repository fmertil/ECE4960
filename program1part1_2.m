clear all;
n=input('enter n:');
divbyzero(n)

function divbyzero(n)
format long
div=n/0;
fprintf('The result is:')
fprintf('%18.6f',div)
end
