%Francois Mertil
%Hacker Practice 6.1

clear all;

% syms x(t);
% ode = diff(x,t) == -x;
% cond = x(0) == 1;
% ySol(t) = dsolve(ode, cond)
% 
% for t=0:20
%     ySol(t);
% end


dt=0.5;
%Backward Euler
z=@(a)  (1/(1+dt))*(exp(-(a+dt)));
%Trapezoidal
y=@ (a) ((2-dt)/(2+dt))*(exp(-(a+dt)));
T(1)=1;
%Ground Truth
H(1)=exp(0);
Z(1)=z(0);
Y(1)=y(0);
%Error for simulation1
E1(1)=abs(H(1)-Z(1));
%Error for simulation2
E2(1)=abs(H(1)-Y(1));


format long
for t=2:20;
    i=t-1;
    H(t)=exp(-i);
    T(t)= t;
    
    Z(t)=z(i);
    E1(t)=(exp(-i)-z(i));
    Y(t)=y(i);
    E2(t)=(exp(-i)-y(i));
end
L=[T' H' Z' Y' E1' E2']'; 
fprintf('%18s %18s %18s %18s %18s %18s\r\n', 'Time', 'Truth',  'Backward Euler', 'Trapezoidal', 'Error1', 'Error2') 
fprintf('%18.10f %18.10f  %18.10f %18.10f %18.10f %18.10f\n', L)
figure
plot(T,log(E1),T,log(E2), 'LineWidth',5,...
    'MarkerSize',5)
    xlabel('Time'),ylabel('Error')
title('Plot of Error Versus Time')
legend ('Backward Euler', 'Trapezoidal Euler')

format short

