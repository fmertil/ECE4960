clc;
clear all;
t   = 0:pi/16:pi/2;
g_t = 0;
g_a = sin(t); %given
B = 10;
    for n = 1:20
        h = 2*B*t-n;
        g_t = g_t + (n/(2*B)).*g_a.*(1-abs(2*B*t-n));
    end
figure(1);
hold on;
box on;
plot(t,g_t,'r');
plot(t,g_a,'b');
ylabel('amplitude g(t)');
xlabel('time t');
title('sync waveform reconstruction');
