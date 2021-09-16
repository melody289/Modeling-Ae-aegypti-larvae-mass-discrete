%% Plot Figure S3
clearvars; close all; clc

load('VaryHill.mat')

%%

Hd = [ 22    28    21    21    19    23    32    34    16    22    25    18    20]';
Ld = [9     8    10    10    14    14    12    11    10     5     7    11    10    10    12     7    12     9    13    11]';
Hdm = [ 29    31    18    35    29    25    25    22    23    34    35    32    17]';
Ldm = [8    16    10    10     9    11    14     9    12    13     8     9    12     9     7     8    13    10    11     8]';

% high density females 
medH_F = median(Hd)/39;

% low density females
medL_F = median(Ld)/13;

% high density males
medH_M = median(Hdm)/39;

% low density males
medL_M = median(Ldm)/13;

plot(1:6, FsurvL, 'd', 'MarkerSize', 15, 'MarkerFaceColor', [0    0.4470    0.7410])
hold on
plot(1:6, MsurvL, 'd', 'MarkerSize', 15, 'MarkerFaceColor', [0.8500    0.3250    0.0980])
plot(1:6, FsurvH, 'd', 'MarkerSize', 15, 'MarkerFaceColor', [0.9290    0.6940    0.1250])
plot(1:6, MsurvH, 'd', 'MarkerSize', 15, 'MarkerFaceColor', [0.4940    0.1840    0.556])

axis([0 7 0.5 1])
plot([0,7], [medL_F, medL_F], 'Color' ,[0    0.4470    0.7410])
hold on

plot([0,7], [medL_M, medL_M],'--', 'Color' ,[0.8500    0.3250    0.098])
plot([0,7], [medH_F, medH_F], '--','Color', [0.9290    0.6940    0.1250])
plot([0,7], [medH_M, medH_M],'--', 'Color', [0.4940    0.1840    0.556])

ylabel('Survival Proportion')
xlabel('Density Dependent Death Exponent')
legend('Female Low Density', 'Male Low Density', 'Female High Density', 'Male High Density', 'Orientation', 'Horizontal', 'NumColumns', 2)

set(gca,'xtick',1:6,'xticklabel',{'1','2','3','4','5','10'})
set(gca,'FontSize', 18)