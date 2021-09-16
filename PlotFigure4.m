%% Plot Figure 4
clearvars; close all; clc

load('BestDdata.mat')
km = c3(1);
kf = c3(2);


for wh = 1:3

if(wh==1)
    d = pd1;
elseif(wh==2)
    d = pd2;
elseif(wh==3)
    d = pd3;
end


%% low density
tt = 20;
IC = 13;

if(wh==1) 
    VarD1
elseif(wh==2)
    VarD2
elseif(wh==3)
    VarD3
end

totF =  sum(sum(Fe(:,20:22)));
totM =  sum(sum(M(:,20:22)));

FsurvL = totF/13;
MsurvL = totM/13;

%% High density
tt = 45;
IC = 39;

if(wh==1) 
    VarD1
elseif(wh==2)
    VarD2
elseif(wh==3)
    VarD3
end


totF =  sum(sum(Fe(:,20:22)));
totM =  sum(sum(M(:,20:22)));

FsurvH = totF/39;
MsurvH = totM/39;

outH_F(wh) = FsurvH;
outL_F(wh) = FsurvL;
outH_M(wh) = MsurvH;
outL_M(wh) = MsurvL;

end


%% Data

Hd = [ 22    28    21    21    19    23    32    34    16    22    25    18    20]';
Ld = [9     8    10    10    14    14    12    11    10     5     7    11    10    10    12     7    12     9    13    11]';
Hdm = [ 29    31    18    35    29    25    25    22    23    34    35    32    17]';
Ldm = [8    16    10    10     9    11    14     9    12    13     8     9    12     9     7     8    13    10    11     8]';

% high density females 
meanH_F = mean(Hd)/39; 
stdH_F = std(Hd)/39;
medH_F = median(Hd)/39;
qH_F = quantile(Hd,[.25 .75])/39;

% low density females
meanL_F = mean(Ld)/13; 
stdL_F = std(Ld)/13;
medL_F = median(Ld)/13;
qL_F = quantile(Ld,[.25 .75])/13;

% high density males
meanH_M = mean(Hdm)/39; 
stdH_M = std(Hdm)/39;
medH_M = median(Hdm)/39;
qH_M = quantile(Hdm,[.25 .75])/39;

% low density males
meanL_M = mean(Ldm)/13; 
stdL_M = std(Ldm)/13;
medL_M = median(Ldm)/13;
qL_M = quantile(Ldm,[.25 .75])/13;

%% Low density plot
figure(1)

plot(1:3,outL_F,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
hold on
plot(1:3,outL_M,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
% female data
plot([4.05 5.05], [medL_F meanL_F],'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot([4.05 4.05], qL_F,'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot([5.05 5.05], [meanL_F-stdL_F meanL_F+stdL_F],'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
% male data
plot([3.95 4.95], [medL_M meanL_M],'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([3.95 3.95], qL_M,'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([4.95 4.95], [meanL_M-stdL_M meanL_M+stdL_M],'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
hold off
xlim([0 6])
ylim([0.45 1])
set(gca,'fontsize',18)
ylabel('Survival Proportion')
title('Low Density')
set(gca,'xtick',1:5,'xticklabel',{'D1','D2','D3','Median','Mean'})

%% High density plot

figure(2)

plot(1:3,outH_F,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
hold on
plot(1:3,outH_M,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
% female data
plot([4.05 5.05], [medH_F meanH_F],'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot([4.05 4.05], qH_F,'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot([5.05 5.05], [meanH_F-stdH_F meanH_F+stdH_F],'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
% male data
plot([3.95 4.95], [medH_M meanH_M],'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([3.95 3.95], qH_M,'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([4.95 4.95], [meanH_M-stdH_M meanH_M+stdH_M],'--', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
hold off
xlim([0 6])
ylim([0.45 1])
set(gca,'fontsize',18)
title('High Density')
legend('Female','Male')
set(gca,'xtick',1:5,'xticklabel',{'D1','D2','D3','Median','Mean'})

