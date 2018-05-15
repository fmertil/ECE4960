clc;
clear all;

% Step 3 Plotting original data
filename = '/Users/FJ/Downloads/outputNMOS.txt';


opts = detectImportOptions(filename);
T = readtable(filename,opts);

Vgs=T.Var1;
Vds=T.Var2;
Ids=T.Var3;




% EKV model
function Id_model (VGS, VDS, Vth, Vt,k)
Is*log(1+exp(k*(VGS-Vth)/2/Vt))^2 - Is*log(1+exp((k*(VGS-Vth)-VDS)/2/Vt))^2;
end 

function V=cal_v( K,Vth, Is) 
for i = 0:1010
    idModel =Id_Model(Vgs(i), Vds(i), K, Vth, Is);
    idMeasured = Ids(i);
    V = V+(idModel - idMeasured) * (idModel - idMeasured);
    end
end

  
% %% Step 7 Plotting the model data
% % For Task 3 with the quasi-Newton method, generate the plots of log(ID) vs. VGS with two VDS, and ID vs. VDS with the 10 values of VGS for both IDmeasured and IDmodel.
% 
% % Get the value of Is, k, Vth that was calculated by quasi-Newton method in step 4.
% %[Is, k, Vth] = textread('MeasuredData.txt','%f %f %f', 1);
% Vt = 0.026;
% j=1;
% one=1;
% four=1;
% prev=Vgs(1);
% error = 0;
% 
% % The four-terminal MOSFET device operation EKV (Enz-Krummenacher-Vittoz) model
% V = @(VGS,VDS) Is*log(1+exp(k*(VGS-Vth)/2/Vt))^2 - Is*log(1+exp((k*(VGS-Vth)-VDS)/2/Vt))^2;
% 
% % dId_dVgs / dIf_dVds
% dId_dVgs_dIf_dVds = @(VGS, VDS) (V(VGS*1.0001,VDS)-V(VGS*0.9999,VDS)) / (V(VGS,VDS*1.0001)-V(VGS,VDS*0.9999));
% 
% count = 0;
% figure
% xlabel('V_D_S')
% for i=1:1010
%     Id(i) = Is*log(1+exp(k*(Vgs(i)-Vth)/2/Vt))^2 - Is*log(1+exp((k*(Vgs(i)-Vth)-Vds(i))/2/Vt))^2;
%     
%     % Begin validation checks
%     if Vgs(i) < Vth && k < 1
%         if dId_dVgs_dIf_dVds(Vgs(i),Vds(i)) < 15 % some large number
%             fprintf('Error: V_GS<V_th and k<1 but I_D is too sensitive to V_DS\n')
%             dId_dVgs_dIf_dVds(Vgs(i),Vds(i)) % display the ratio
%             error=1;
%         end
%     end
%     
%     V_Dsat = (k*(Vgs(i)-Vth));
%     
%     if Vgs(i) > Vth && Vds(i) > V_Dsat
%         if dId_dVgs_dIf_dVds(Vgs(i),Vds(i)) < 15 % some large number
%             fprintf('Error: V_GS>V_th and V_DS>V_DSAT but I_D is too sensitive to V_DS\n')
%             dId_dVgs_dIf_dVds(Vgs(i),Vds(i)) % display the ratio
%             error=1;
%         end
%     end
%     
%     if Vgs(i) > Vth && Vds(i) < V_Dsat
%         
%         if dId_dVgs_dIf_dVds(Vgs(i),Vds(i)) > 10 % some large number
%             % This test fails about 16% of the time due to noise, but I_D
%             % model is quadratic to both V_G_S and V_D_S more than 80% of the time.
%             count = count + 1;
%             if count > 30 % if it is not quadratic for more than 30/189 = 16% of the time
%                 fprintf('Error: V_GS>V_th and V_DS>V_DSAT but I_D is too sensitive to V_DS\n')
%                 dId_dVgs_dIf_dVds(Vgs(i),Vds(i)) % display the ratio
%                 error=1;
%             end
%         end
%         
%     end
%     % End validation checks
%     
%     
%     % log(I_D) vs. V_GS with two V_DS: 1.0, 4.0 (randomly chosen values)
%     if Vds(i)==1
%         logIDone(one) = log(Id(i));
%         VgsOne(one) = Vgs(i);
%         one=one+1;
%     elseif Vds(i)==4
%         logIDfour(four) = log(Id(i));
%         Vgsfour(four) = Vgs(i);
%         four=four+1;
%     end
%     
%     % I_D vs. V_DS with the 10 values of V_GS for I_Dmeasured and I_Dmodel
%     if prev==Vgs(i) && i<1010
%         tempVds(j) = Vds(i);
%         tempIds(j) = Id(i);
%         j = j + 1;
%     else
%         prev=Vgs(i);
%         plot(tempVds,tempIds);
%         hold on
%         j = 1;
%         tempVds(j) = Vds(i);
%         tempIds(j) = Id(i);
%     end
% end
% ylabel('I_D model')
% legend('V_G_S = .5V','V_G_S = 1.0V','V_G_S = 1.5V','V_G_S = 2.0V','V_G_S = 2.5V','V_G_S = 3.0V','V_G_S = 3.5V','V_G_S = 4.0V','V_G_S = 4.5V','V_G_S = 5.0V')
% title('Quasi-newton: I_D vs. V_D_S with the 10 values of V_G_S for I_D model')
% 
% if ~error
%     fprintf('All valdiation checks passed!\n')
% end
% 
% figure(3)
% subplot(2,1,1)
% plot(VgsOne,logIDone)
% xlabel('V_G_S')
% ylabel('log(I_D) model')
% subplot(2,1,2)
% plot(Vgsfour,logIDfour)
% xlabel('V_G_S')
% ylabel('log(I_D) model')
% suplabel('log(I_D) measured vs. V_G_S with two V_D_S')