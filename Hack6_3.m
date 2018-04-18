%Francois Mertil
%Hacker Practice 6.1

clear all;

syms x(t);

%Solve ODE
ode = diff(x,t) == 4*exp(0.8*t)-0.5*x;
cond = x(0) == 2;
ySol(t) = dsolve(ode, cond);




%Forward Euler
f= @(t,x) 4*exp(0.8*t)-0.5.*x;
g= @(t) (40.*exp(-t/2).*exp((13.*t)/10))/13 - (14.*exp(-t/2))/13;
xe=0:4;
ye=g(xe);

[a3,b3]=heun_iteration(f,[0 : 4], 2,4)
k1k4=comparerk4(f, [0:3])






% %Error for simulation1
E3=100*abs(ye-b3')./ye;



 L=[a3' ye' k1k4 b3 E3']';
fprintf('%18s %18s %18s %18s %18s %18s %18s %18s\r\n', 't', 'True',  'K1', 'K2', 'K3', 'K4', 'RK4', 'Error3') 
fprintf('%18.10f %18.10f  %18.10f %18.10f %18.10f %18.10f %18.10f %18.10f\n', L)



function k1k4=comparerk4(f, tspan) 
h=1;                                             % step size
%x = 0:h:3;
x=tspan
% Calculates upto y(3)
y = zeros(1,length(x)); 
H=zeros (length (x), length(x));
y(1) = 2;                                          % initial condition
                  % change the function as you desire

for i=1:(length(x))                              % calculation loop
    k_1 = f(x(i),y(i));
    k_2 = f(x(i)+0.5*h,y(i)+0.5*h*k_1);
    k_3 = f((x(i)+0.5*h),(y(i)+0.5*h*k_2));
    k_4 = f((x(i)+h),(y(i)+k_3*h));
    k=[k_1 k_2 k_3 k_4]
    for j = 1:(length(x))
            H(i, j, :) =  k(j);
             end
    
   
    end 

y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4)*h;  % main equation
k1k4=[zeros(1,4); H]
end


function [tp,yp] = heun_iteration(dydt,tspan,y0,h,varargin)


if nargin<4,error('at least 4 input arguments required'), 
end 
if any(diff(tspan)<=0),error('tspan not ascending order'), 
end
n = length(tspan);
ti = tspan(1);tf = tspan(n);
if n == 2
t = (ti:h:tf)'; n = length(t); if t(n)<tf
t(n+1) = tf;
n = n+1; end
else
t = tspan;
end
tt = ti; y(1,:) = y0;
np = 1; tp(np) = tt; yp(np,:) = y(1,:); i=1;
while(1)
tend = t(np+1);
hh = t(np+1) - t(np);
if hh>h,hh = h;
end 
while(1)
if tt+hh>tend,hh = tend-tt;end
k1 = dydt(tt,y(i,:),varargin{:})'; ymid = y(i,:) + k1.*hh./2;
k2 = dydt(tt+hh/2,ymid,varargin{:})'; ymid = y(i,:) + k2*hh/2;
k3 = dydt(tt+hh/2,ymid,varargin{:})'; yend = y(i,:) + k3*hh;
k4 = dydt(tt+hh,yend,varargin{:})'; phi = (k1+2*(k2+k3)+k4)/6;
y(i+1,:) = y(i,:) + phi*hh;
tt = tt+hh;
i=i+1;
if tt>=tend,break,
end
end
np = np+1; tp(np) = tt; yp(np,:) = y(i,:); 
if tt>=tf,
    break
end

end

end
 
 
 
 
 

% figure
% plot(T,log(E1),T,log(E2), 'LineWidth',5,...
%     'MarkerSize',5)
%     xlabel('Time'),ylabel('Error')
% title('Plot of Error Versus Time')
% legend ('Backward Euler', 'Trapezoidal Euler')
% 
% format short
% 
