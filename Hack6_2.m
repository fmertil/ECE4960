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
[a1,b1]=euler_forward (f,0,2,4,4)
[a2,b2]=heun(f,0,2,4,4)
[a3,b3]=heun_iteration(f,[0 : 4], 2,4)






% %Error for simulation1
 E1=100*abs(ye-b1)./ye;
% %Error for simulation2
E2=100*abs(ye-b2)./ye;
% %Error for simulation3
E3=100*abs(ye-b3')./ye;



 L=[a1' ye' b1' E1' b2' E2' b3 E3']';
fprintf('%18s %18s %18s %18s %18s %18s %18s %18s\r\n', 't', 'True',  'Euler', 'Error1', 'Heun W/O', 'Error2', 'Heun W', 'Error3') 
fprintf('%18.10f %18.10f  %18.10f %18.10f %18.10f %18.10f %18.10f %18.10f\n', L)



%Heun Method 
function [x,y] = heun(f,xinit,yinit,xfinal,n)
h=(xfinal-xinit)/n;
        % Initialization of x and y as column vectors
        
        
x=[xinit zeros(1,n)]; y=[yinit zeros(1,n)];

for j=1:n
  k1 = feval(f,x(j),y(j));
  p  = y(j) + h*k1;
  x(j+1) = xinit + h*j;
  k2 = feval(f,x(j+1),p);
  y(j+1) = y(j) + h*(k1 + k2)/2;
end

end 

 function [x,y]=euler_forward(f,xinit,yinit,xfinal,n)
     
        % Calculation of h from xinit, xfinal, and n
        h=(xfinal-xinit)/n;
        % Initialization of x and y as column vectors
        x=[xinit zeros(1,n)]; y=[yinit zeros(1,n)];
        % Calculation of x and y
        for i=1:n
            x(i+1)=x(i)+h;
            y(i+1)=y(i)+h*f(x(i),y(i));
        end
 end
 
 function [x,y]=euler_modified(f,xinit,yinit,xfinal,n)
        % Euler approximation for ODE initial value problem
        % Euler modified method
        % File prepared by David Houcque - Northwestern U. - 5/11/2005
        % Calculation of h from xinit, xfinal, and n
        h=(xfinal-xinit)/n;
        % Initialization of x and y as column vectors
        x=[xinit zeros(1,n)]; y=[yinit zeros(1,n)];
   
% Calculation of x and y
        for i=1:n
            x(i+1)=x(i)+h;
            ynew=y(i)+h*f(x(i),y(i));
            y(i+1)=y(i)+(h/2)*(f(x(i),y(i))+f(x(i+1),ynew));
        end
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
