%% Figure 5
clearvars; close all; clc

%% Figure 5a
load('BestEdata.mat')
f1 = figure(1);
clf
set(f1,'Position',[10 10 1200 500])


con1 = 0.5;
con2 = 0.5;
nu = 0.52;
g = e1(1:2);
sl = e1(3:4);
d = pd3;

tt = 20;
km = c3(1);
kf = c3(2);

% Low density 
tl =[ 9   2  10   7  14   1   9   0  10   5    9   10   11;
      0   6   0   3   0  13   3  11   0   0    1    0    1;
      0   0   0   0   0   0   0   0   0   0    0    0    0];
tl =  tl./sum(tl);
Hd = tl(1,:); Md = tl(2,:); Ld = tl(3,:);

IC = 13;
VarE

subplot(1,2,1)
plot(median(Ld), 1.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [  0.4940    0.1840    0.5560])
hold on
plot([Lm Mm Hm], 1:3,'d', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4660    0.6740    0.1880] , 'MarkerFaceColor', [0.4660    0.6740    0.1880])

% Mean of small
plot(mean(Ld), 0.75 ,'^', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.3010    0.7450    0.9330] , 'MarkerFaceColor', [ 0.3010    0.7450    0.9330])
plot([(mean(Ld) + std(Ld)) (mean(Ld) - std(Ld))], [0.75 0.75], '--', 'LineWidth',1,  'Color', [0.3010    0.7450    0.9330] )
% Mean of medium
plot(mean(Md), 1.75,'^', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.3010    0.7450    0.9330] , 'MarkerFaceColor', [ 0.3010    0.7450    0.9330])
plot([(mean(Md) + std(Md)) (mean(Md) - std(Md))], [1.75 1.75],'--', 'LineWidth',1,  'Color', [ 0.3010    0.7450    0.9330] )
% Mean of large
plot(mean(Hd), 2.75 ,'^', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [0.3010    0.7450    0.9330] , 'MarkerFaceColor', [0.3010    0.7450    0.9330])
plot([(mean(Hd) + std(Hd)) (mean(Hd) - std(Hd))], [2.75 2.75],'--', 'LineWidth',1,  'Color', [ 0.3010    0.7450    0.9330] )
% Median of small
plot(median(Ld), 1.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [  0.4940    0.1840    0.5560])
plot(quantile(Ld, [0.25,  0.75]), [1.25 1.25],'--', 'LineWidth',1,  'Color', [ 0.4940    0.1840    0.5560] )
% Median of medium
plot(median(Md), 2.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [  0.4940    0.1840    0.5560])
plot(quantile(Md, [0.25,  0.75]), [2.25 2.25],'--', 'LineWidth',1,  'Color', [ 0.4940    0.1840    0.5560] )
% Median of large
plot(median(Hd), 3.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [0.4940    0.1840    0.5560])
plot(quantile(Hd, [0.25,  0.75]), [3.25 3.25],'--', 'LineWidth',1,  'Color', [ 0.4940    0.1840    0.5560] )

title('Low Density')
set(gca, 'YTick', 1:3, 'YTickLabel', {'Small', 'Medium', 'Large'})
xlabel('Proportion of Females Emerged')
set(gca,'FontSize', 18)

% High density 
th =[   0   0   0   0   0   0    0    0;
        0   2  15   0   4  16    8    3;
        21  25   6  21  15   7   24   31];
th =  th./sum(th);
Hd = th(1,:); Md = th(2,:); Ld = th(3,:); 

IC = 39;
VarE

subplot(1,2,2)
plot(median(Ld), 1.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [  0.4940    0.1840    0.5560])
hold on
plot([Lm Mm Hm], 1:3,'d', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4660    0.6740    0.1880] , 'MarkerFaceColor', [0.4660    0.6740    0.1880])
% Mean of small
plot(mean(Ld), 0.75 ,'^', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.3010    0.7450    0.9330] , 'MarkerFaceColor', [ 0.3010    0.7450    0.9330])
plot([(mean(Ld) + std(Ld)) (mean(Ld) - std(Ld))], [0.75 0.75], '--', 'LineWidth',1,  'Color', [0.3010    0.7450    0.9330] )
% Mean of medium
plot(mean(Md), 1.75,'^', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.3010    0.7450    0.9330] , 'MarkerFaceColor', [ 0.3010    0.7450    0.9330])
plot([(mean(Md) + std(Md)) (mean(Md) - std(Md))], [1.75 1.75],'--', 'LineWidth',1,  'Color', [ 0.3010    0.7450    0.9330] )
% Mean of large
plot(mean(Hd), 2.75 ,'^', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [0.3010    0.7450    0.9330] , 'MarkerFaceColor', [0.3010    0.7450    0.9330])
plot([(mean(Hd) + std(Hd)) (mean(Hd) - std(Hd))], [2.75 2.75],'--', 'LineWidth',1,  'Color', [ 0.3010    0.7450    0.9330] )
% Median of small
plot(median(Ld), 1.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [  0.4940    0.1840    0.5560])
plot(quantile(Ld, [0.25,  0.75]), [1.25 1.25],'--', 'LineWidth',1,  'Color', [ 0.4940    0.1840    0.5560])
% Median of medium
plot(median(Md), 2.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [  0.4940    0.1840    0.5560])
plot(quantile(Md, [0.25,  0.75]), [2.25 2.25],'--', 'LineWidth',1,  'Color', [ 0.4940    0.1840    0.5560] )
% Median of large
plot(median(Hd), 3.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [0.4940    0.1840    0.5560])
plot(quantile(Hd, [0.25,  0.75]), [3.25 3.25],'--', 'LineWidth',1,  'Color', [ 0.4940    0.1840    0.5560] )

title('High Density')
set(gca,'Ytick',[])
xlabel('Proportion of Females Emerged')
set(gca,'FontSize', 18)


%%
f3 = figure(3); % separate legend
set(f3,'Position',[100 100 350 40])
plot(median(Ld), 1.25,'v', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4940    0.1840    0.5560] , 'MarkerFaceColor', [  0.4940    0.1840    0.5560])
hold on
plot([Lm Mm Hm], 1:3,'d', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.4660    0.6740    0.1880] , 'MarkerFaceColor', [0.4660    0.6740    0.1880])
plot(mean(Ld), 0.75 ,'^', 'LineWidth',1.7, 'MarkerSize', 15, 'Color', [ 0.3010    0.7450    0.9330] , 'MarkerFaceColor', [ 0.3010    0.7450    0.9330])
hold off
set(gca,'fontsize',18,'xtick','','ytick','')
xlim([1 2])
leg ={'Median','Model','Mean'};
l = legend(leg,'Orientation','horizontal');
set(l,'box','off')



%% Figure 5b

ProportionData
f2 = figure(2);
clf
set(f2,'Position',[10 10 1200 500])

s1 = '-o'; s5 = 0.5; s2 = [ 1 1 1].*0.7; s3 = 4; s4 = s2;

subplot(2,3,1)
plot(5:22, Hsmall, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
subplot(2,3,2)
plot(5:22, Hmed, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
subplot(2,3,3)
h1 = plot(5:22, Hlarge, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4);

subplot(2,3,4)
plot(5:13, Lsmall, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
subplot(2,3,5)
plot(5:13, Lmed, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
subplot(2,3,6)
plot(5:13, Llarge, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)

for j = 1:6
    subplot(2,3,j)
    hold on
    xlim([6 14])
    ylim([0 0.8])
end


%% Model output
s1 = '-o'; s5 = 1.7;
s2 = [0    0.4470    0.7410]; s3 = 5; s4 = s2;

nu = 0.52;

% High density
IC = 39;
VarE

subplot(2,3,1)
set(gca,'FontSize', 18)
title('Small')
plot(Fe(1:14,20)./totm, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
axis([6,14, 0,0.8])

subplot(2,3,2)
set(gca,'FontSize', 18)
title('Medium')
set(gca, 'YTick', -5, 'YTickLabel', 1)
plot(Fe(1:14,21)./totm, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
axis([6,14, 0,0.8])

subplot(2,3,3)
hold on 
h2 = plot(Fe(1:14,22)./totm, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4);
axis([6,14, 0,0.8])
set(gca, 'YTick', -5, 'YTickLabel', 1)
legend([h1(1) h2], {'Model', 'Data'})
title('Large')
set(gca,'FontSize', 18)


% Low density
IC = 13;
VarE

subplot(2,3,4)
axis([6,14, 0,0.8])
set(gca,'FontSize', 18)
plot(Fe(1:14,20)./totm, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
xlabel('Day')


subplot(2,3,5)
axis([6,14, 0,0.8])
plot(Fe(1:14,21)./totm, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
set(gca,'FontSize', 18)
set(gca, 'YTick', -5, 'YTickLabel', 1)
xlabel('Day')

subplot(2,3,6)
plot(Fe(1:14,22)./totm, s1, 'LineWidth', s5, 'Color', s2, 'MarkerSize', s3, 'MarkerFaceColor', s4)
axis([6,14, 0,0.8])
set(gca, 'YTick', -5, 'YTickLabel', 1)
xlabel('Day')
set(gca,'FontSize', 18)

%%
yyaxis right
ylabel('Low Density');
set(gca,'ytick',[],'ycolor','k')

subplot(2,3,3)
yyaxis right
ylabel('High Density');
set(gca,'ytick',[],'ycolor','k')

%%
subplot(2,3,1)
ylh = ylabel('Proportion Emerged');
ylh.Position(2) = -.25; % change vertical position of ylabel


