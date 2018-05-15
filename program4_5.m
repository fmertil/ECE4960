%Francois Mertil

clc;
clear all;


k= 0.7; 
Vth = 1;
VDD = 5;
RG = 10000;
RL = 10000;
C1 =1e-9;
C2 = 1e-9;
v1(1) =2.5;
v2(1) = 2.5; 
i=[0, [0.0001*ones(1,10)],[zeros(1,9)]];
I=repmat(i,[1,5]);

[t, y]= rk4sys(@dvdt,[0 50], [2.5 2.5],.01)

figure
plot(t,y(:,1),t,y(:,2),'--')
legend('V1(t)','V2(t))')
%KCL equation 
function dy = dvdt(t, v)
VDD = 5;
RG = 10000;
RL = 10000;
C1 =1e-9;
C2 = 1e-9;
v1(1)=2.5;
v2(1)= 2.5; 
i=[0, [0.0001*ones(1,10)],[zeros(1,9)]];
I=repmat(i,[1,5]);

dy = [-v1(1)/(RG*C1)+ t/(RG*C1);-Id_model(v1(1),v2(1))/(C2)-v2(1)/(RL*C2)+VDD/(RL*C2)];
%;(v(1)-v(2))/(R2*C2)-v(2)/R3];
         
end  


function vol=Id_model (VGS, VDS)
k= 0.7; 
Vth = 1;
Vt=0.0026;
Is = 5*1e-6;
vol=Is*log(1+exp(k*(VGS-Vth)/(2*Vt)))^2 - Is*log(1+exp((k*(VGS-Vth)-VDS)/2/Vt))^2;
end
 