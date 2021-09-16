%% Figure 1c
clear; close all; clc

% load Survival Data
SurvivalData

lowM = LD(:,1);
lowF = LD(:,2);
highM = HD(:,1);
highF = HD(:,2);

[~,b] = sort(lowF);
[~,b2] = sort(highF);
llow = [lowF' lowM'];

f1 = figure(1);
% Low density - individual
plot(1:20, lowF(b)./13,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
hold on
plot(1:20,lowM(b)./13,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
for i = 1:20    
    plot([i i] , [lowF(b(i))./13, lowM(b(i))./13], 'k')
end

% High density - individual
plot(22:34, highF(b2)./39,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot(22:34,highM(b2)./39,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
for i = 22:1:34
    plot([i i] , [highF(b2(i-21))./39, highM(b2(i-21))./39], 'k')
end

% Mean and median
plot([36, 38],[10.35/13 27.3/39] ,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([36, 38], [10.25/13 23.15/39] ,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot([40 42], [10/13 29/39] ,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([40 42], [10/13 22/39] ,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot([42 42], [29/39 22/39] ,'k')
plot([38 38], [27.1/39 23.3/39] ,'k')

plot([21,21], [0.2,1.3], 'k', 'LineWidth', 2.5)
plot([35 35], [0.2,1.3], 'k', 'LineWidth', 2.5)

axis([0.5,42.5, 0.3, 1.25])
set(gca,'FontSize', 18)
ylabel('Surival Proportion')
set(gca, 'Position', [0.0596    0.1624    0.905    0.8150])
s(35:38) = {'Low', 'High', 'Low', 'High'};

set(gca, 'XTick', [1:21, 23:35 36 38 40 42], 'XTickLabel', s)
xlabel('                                 Low Density                                                  High Density                 Mean   Median')
legend('Female','Male')
set(gcf,'Position',[100,100,1000,400])
