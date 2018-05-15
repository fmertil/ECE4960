%Francois Mertil
%Hack 5.1

clc;
clear all;

% define function
% syms 'f(x)'
% f(x)=;
f= @(x)  exp(x)-1
a=find_bisection(f, -5,10 ,0.001)

%bisection function

function mid=find_bisection(f,xlow,xup, e, varargin )
% f = name of function
% xlow, xup = lower and upper guesses
% e = desired relative error (default = 0.0001%)
test=f(xlow)*f(xup)
if test >=0
    fprintf('Your estimation is not right')
else 
    
while (1)

        % Find middle point
        mid = (xlow+xup)/2;
        fl=f(xlow);
        fu=f(xup);
        fm=f(mid);
        
         % Check if middle point is root
        if (f(mid) == 0.0)
            break;
        else
        
        % Decide the side to repeat the steps
         if (f(mid)*f(xlow) < 0)
            xup = mid;
        else
            xlow = mid;
           
         end 
        
        end
  fprintf('\n %8s  %4.4f %8s  %4.4f %4s  %4.4f %8s  %4.4f %8s  %4.4f \r \n', 'Lower =', xlow, 'Upper = ', xup, 'midpoint = ', mid, 'f(mid) = ', f(mid))      
end

end

    fprintf('\n The value of root is : %2.4f', mid)
    


end 





