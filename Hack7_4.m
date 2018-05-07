%Francois Mertil
clear all;
syms x 
f(x)=sin(x);
x=0:pi/16:2*pi;
v=zeros(1, length(x));
% for i=1:8
%     if x(i-1)=<x(i)
%         v(i)=
v(abs(x) < 1) = 1- abs(x(abs(x)<1))
figure() %new figure
plot(x,v, x,f(x)) %plot
box off  %removing box
grid on  %adding grid
xlabel('x axis', 'FontSize', 15) %label of x axis
ylabel('y axis', 'FontSize', 15) %label of y axis
axis([x(1), x(end), 0, pi/2])  %axis limits
figure
triangleWaveform = repmat(v, [1 10]);
z = 0 : length(triangleWaveform)-1;
plot(z, triangleWaveform)