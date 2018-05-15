%Francois Mertil
clc;
clear all;
filename = '/Users/FJ/Downloads/outputNMOS.txt';

%fileID = dlmread(filename);
opts = detectImportOptions(filename);
T = readtable(filename,opts);
A=findgroups(T.Var1);
figure
gplotmatrix(T.Var2,T.Var3,A)
xlabel('Vds')
ylabel('Ids')
title('Ids VS Vds')
%legend('V_G_S = .5V','V_G_S = 1.0V','V_G_S = 1.5V','V_G_S = 2.0V','V_G_S = 2.5V','V_G_S = 3.0V','V_G_S = 3.5V','V_G_S = 4.0V','V_G_S = 4.5V','V_G_S = 5.0V')


% splitapply(@courbe, T.Var2, T.Var3, A)
% 
% function courbe(x,y)
% figure 
% plot(x,y)
% hold on
% title('Ids VS Vds')
% legend('Show')
% end 

