clear all;
n=input('enter n:');
inverse_func(n)
sin_func(n)
exp_func(n)
detect_NINF(n)
detect_INF (n)

function inverse_func(n)
format long
inv=1.00/n;
fprintf('The inverse is:')
fprintf('%18.6f',inv)
end


function sin_func(n)
format long
z=sin (n);
fprintf('Sin is:')
fprintf('%18.6f',z)
end

function exp_func(n)
format long
z=exp(n);
fprintf('The exponential is:')
fprintf('%18.6f',z)
end

function detect_NINF(n)
format long
 NINF_generated = -1/0;
 INF_generated = 1.0/0.0;
if (n == NINF_generated && NINF_input ~=INF_generated)
    fprintf('True')
else
    fprintf('False')
end 
end


function detect_INF(n)
format long
 NINF_generated = -1/0;
 INF_generated = 1.0/0.0;
if (n ~= NINF_generated && n == INF_generated)
    fprintf('True')
else
    fprintf('False')
end 
end