%% Plot Figure 6

%%% NOTE: FIGURE 6A IS MISSING %%%

clearvars; close all; clc



%% Figure 6b
qvec = [0.0005 0.001 0.005 0.0075 0.01 0.015 0.02 0.025 0.05];
load('VaryQ.mat')
ProportionData



for j = 1:9

abpar = qout(j).abpar;
sl = qout(j).e1(3:4);
g = qout(j).e1(1:2);
nu = 0.52;
con1 = 0.5;
con2 = 0.5;


km = qout(j).c3(1);
kf = qout(j).c3(2);
d = qout(j).pd3;
% low density
tt = 20;
IC = 13;
VarE

LowK(j,:) = K;
LowP(j,:) = [Lm Mm Hm];

% high density
tt = 45;
IC = 39;
VarE

HighK(j,:) = K;
HighP(j,:) = [Lm Mm Hm];

end

Lmean(1) = sum(mean(Lsmall));
Lmean(2) = sum(mean(Lmed))+Lmean(1);
Lmean(3) = sum(mean(Llarge))+Lmean(2);
Hmean(1) = sum(mean(Hsmall));
Hmean(2) = sum(mean(Hmed))+Hmean(1);
Hmean(3) = sum(mean(Hlarge))+Hmean(2);


figure(11)
bar(LowP,'stacked')
hold on
for j = 1:2
plot([0 10],[Lmean(j) Lmean(j)],'k--','Linewidth',2)
end
hold off
xlim([0.5 9.5])
set(gca,'fontsize',14,'xticklabel',qvec)
ylabel('Proportion of females emerged')
xlabel('q')
title('Low Density')

figure(12)
bar(HighP,'stacked')
hold on
for j = 1:3
plot([0 10],[Hmean(j) Hmean(j)],'k--','Linewidth',2)
end
hold off
xlim([0.5 9.5])
set(gca,'fontsize',14,'xticklabel',qvec)
xlabel('q')
title('High Density')

%% Figure 6a

qvec = [0.0005 0.001 0.005 0.0075 0.01 0.015 0.02 0.025 0.05];

newcolors = [  0    0.4470    0.7410; 0.8500    0.3250    0.0980; 0.9290    0.6940    0.1250; ...
    0.4940    0.1840    0.5560; 0.4660    0.6740    0.1880; 0.3010    0.7450    0.9330; 0.6350    0.0780    0.1840;...
    183/255 70/255 1; 143/255 224/255 85/255];
         
colororder(newcolors)

f1 = figure(1);
plot(LowK'/30,'linewidth',2)
xlabel('Days')
ylabel('Resource')
set(gca,'fontsize',14)
ylim([0 1])
xlim([0 15])
title('Low Density')

f2 = figure(2);
plot(HighK'/30,'linewidth',2)
xlabel('Days')
set(gca,'fontsize',14,'ytick','')
ylim([0 1])
xlim([0 15])
title('High Density')

%%
f6 = figure(6); % separate legend
colororder(newcolors(2:10,:))
for j = 1:9
    plot(1:2,1:2,'-','LineWidth', 2,'MarkerSize', 0.5)
    hold on
end

set(f6,'Position',[10 10 880 30])
hold off
set(gca,'fontsize',14,'xtick','','ytick','')
xlim([5 10])
leg = {'0.0005','0.001','0.005','0.0075','0.01','0.015','0.02','0.025','0.05'};
l = legend(leg,'Orientation','horizontal');
set(l,'box','off')


%% Figure 6c - Data

ProportionData
d1 = '--'; %line style for data
d2 = 2; % line width for data
d3 = 'k'; % color for data

f3 = figure(3);
clf
set(f3,'Position',[10 10 1200 500])

subplot(2,3,1)
plot(5:22,mean(Hsmall), d1, 'LineWidth', d2, 'Color', d3)

subplot(2,3,2)
plot(5:22,mean(Hmed), d1, 'LineWidth', d2, 'Color', d3)

subplot(2,3,3)
plot(5:22,mean(Hlarge), d1, 'LineWidth', d2, 'Color', d3)

subplot(2,3,4)
plot(5:15,[mean(Lsmall) 0 0], d1, 'LineWidth', d2, 'Color', d3)

subplot(2,3,5)
plot(5:15,[mean(Lmed) 0 0], d1, 'LineWidth', d2, 'Color', d3)

subplot(2,3,6)
plot(5:15,[mean(Llarge) 0 0], d1, 'LineWidth', d2, 'Color', d3)

for j = 1:6
    subplot(2,3,j)
    xlim([5 15])
    ylim([0 0.3])
    set(gca,'fontsize',18)
    hold on
    if j>3
        xlabel('Day')
    end
end

subplot(2,3,1)
ylh = ylabel('Proportion of Females Emerged');
ylh.Position(2) = -.1; % change vertical position of ylabel



%% Figure 6c - Model

load('VaryQ.mat')
newcolors = [  0    0.4470    0.7410;   0    0.4470    0.7410; 0.8500    0.3250    0.0980; 0.9290    0.6940    0.1250; ...
    0.4940    0.1840    0.5560; 0.4660    0.6740    0.1880; 0.3010    0.7450    0.9330; 0.6350    0.0780    0.1840;...
    183/255 70/255 1; 143/255 224/255 85/255];
         
colororder(newcolors)

for j = 1:9

abpar = qout(j).abpar;
sl = qout(j).e1(3:4);
g = qout(j).e1(1:2);
nu = 0.52;

km = qout(j).c3(1);
kf = qout(j).c3(2);
d = qout(j).pd3;


% low density
tt = 20;
IC = 13;
VarE

smallF = Fe(:,20)/totm;
medF = Fe(:,21)/totm;
largeF = Fe(:,22)/totm;

subplot(2,3,4)
plot(smallF,'o-','linewidth',2)

subplot(2,3,5)
plot(medF,'o-','linewidth',2)

subplot(2,3,6)
plot(largeF,'o-','linewidth',2)

% high density
tt = 45;
IC = 39;
VarE

smallF = Fe(:,20)/totm;
medF = Fe(:,21)/totm;
largeF = Fe(:,22)/totm;

subplot(2,3,1)
plot(smallF,'o-','linewidth',2)

subplot(2,3,2)
plot(medF,'o-','linewidth',2)

subplot(2,3,3)
plot(largeF,'o-','linewidth',2)

end


subplot(2,3,6)
yyaxis right
ylabel('Low Density');
set(gca,'ytick',[],'ycolor','k')

subplot(2,3,3)
yyaxis right
ylabel('High Density');
set(gca,'ytick',[],'ycolor','k')

%%
f4 = figure(4); % separate legend
colororder(newcolors(2:10,:))
for j = 1:9
    plot(1:2,1:2,'-o','LineWidth', 2,'MarkerSize', 0.5)
    hold on
end
plot(1:2,1:2,'k--','LineWidth', 2)

set(f4,'Position',[10 10 960 30])
hold off
set(gca,'fontsize',14,'xtick','','ytick','')
xlim([5 10])
leg = {'0.0005','0.001','0.005','0.0075','0.01','0.015','0.02','0.025','0.05','Data'};
l = legend(leg,'Orientation','horizontal');
set(l,'box','off')


