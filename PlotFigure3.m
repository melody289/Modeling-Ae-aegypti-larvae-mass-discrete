%% Figure 3
clearvars; close all; clc


%% Figure 3a
figure(1)
PlotDataMaleFemale

subplot(2,2,1)
ylh = ylabel('Number Emerged');
ylh.Position(2) = -6; % change vertical position of ylabel

load('BestCdata.mat')
sl = [ 1, 1];
g = [1 0.46];
nu = 1;

% high density C1
tt = 45;
IC = 39;

d = d1*ones(1,tt);
km = c1(1);
kf = c1(2);

VarC1

subplot(2,2,1)
plot(1:tt, M(:,end),'-.o','LineWidth', ss22, 'Color',  sg1,  'MarkerSize', ms, 'MarkerFaceColor', sg1)
subplot(2,2,2)
plot(1:tt, Fe(:,end),'-.o','LineWidth', ss22, 'Color',  sg1,  'MarkerSize', ms, 'MarkerFaceColor', sg1)

% high density C2
d = d2*ones(1,tt);
km = c2(1);
kf = c2(2);

VarC2

subplot(2,2,1)
plot(1:tt, M(:,end),'--o','LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)
subplot(2,2,2)
plot(1:tt, Fe(:,end),'--o','LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)

% high density C3
d = d3*ones(1,tt);
km = c3(1);
kf = c3(2);

VarC3

subplot(2,2,1)
plot(1:tt, sum(M(:,20:22),2),'-o','LineWidth', ss22, 'Color',  sg3,  'MarkerSize', ms, 'MarkerFaceColor', sg3)
subplot(2,2,2)
plot(1:tt, sum(Fe(:,20:22),2),'-o','LineWidth', ss22, 'Color',  sg3,  'MarkerSize', ms, 'MarkerFaceColor', sg3)
yyaxis right
ylabel('High Density')
set(gca,'ytick',[],'ycolor','k')


% low density 
tt = 20;
IC = 13;

% low density C1
d = d1*ones(1,tt);
km = c1(1);
kf = c1(2);

VarC1

subplot(2,2,3)
plot(1:tt, M(:,end),'-.o','LineWidth', ss22, 'Color',  sg1,  'MarkerSize', ms, 'MarkerFaceColor', sg1)
subplot(2,2,4)
plot(1:tt, Fe(:,end),'-.o','LineWidth', ss22, 'Color',  sg1,  'MarkerSize', ms, 'MarkerFaceColor', sg1)

% low density C2
d = d2*ones(1,tt);
km = c2(1);
kf = c2(2);

VarC2

subplot(2,2,3)
plot(1:tt, M(:,end),'--o','LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)
subplot(2,2,4)
plot(1:tt, Fe(:,end),'--o','LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)

% low density C3
d = d3*ones(1,tt);
km = c3(1);
kf = c3(2);

VarC3

subplot(2,2,3)
plot(1:tt, sum(M(:,20:22),2),'-o','LineWidth', ss22, 'Color',  sg3,  'MarkerSize', ms, 'MarkerFaceColor', sg3)
subplot(2,2,4)
plot(1:tt, sum(Fe(:,20:22),2),'-o','LineWidth', ss22, 'Color',  sg3,  'MarkerSize', ms, 'MarkerFaceColor', sg3)

yyaxis right
ylabel('Low Density');
set(gca,'ytick',[],'ycolor','k')

f2 = figure(2); % for separate legend
set(f2,'Position',[10 10 520 30])
plot(1:2,1:2,'-.o','LineWidth', ss22, 'Color',  sg1,  'MarkerSize', ms, 'MarkerFaceColor', sg1)
hold on
plot(1:2,1:2,'--o','LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)
plot(1:2,1:2,'-o','LineWidth', ss22, 'Color',  sg3,  'MarkerSize', ms, 'MarkerFaceColor', sg3)
plot(1:2,1:2,'-o','LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold off
set(gca,'xtick','','ytick','')
xlim([5 10])
leg = {'Basic (C1)','Two pupae (C2)','Two L4, two pupae (C3)','Data'};
l = legend(leg,'Orientation','horizontal');
set(l,'box','off')



%% Figure 3b

figure(3)
PlotDataByStage
set(gcf,'Position',[10 10 1500 500])

subplot(2,6,1)
ylh = ylabel('Number Emerged');
ylh.Position(2) = -6; % change vertical position of ylabel

subplot(2,6,6)
yyaxis right
ylabel('High Density');
set(gca,'ytick',[],'ycolor','k')

subplot(2,6,12)
yyaxis right
ylabel('Low Density');
set(gca,'ytick',[],'ycolor','k')

load('BestCdata.mat')

sl = [ 1, 1];
g = 0*[1 0.46];
nu = 1;

d = d3*ones(1,45);
km = c3(1);
kf = c3(2);

%% high density C3 - Model
tt = 45;
IC = 39;
VarC3

subplot(2,6,1)
plot(1:tt, Fe(:,2) + M(:,2) + sum(Fe(:,3:4) + M(:,3:4),2), sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6,2)
plot(1:tt, sum(Fe(:,5:7) + M(:,5:7),2),sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6,3)
plot(1:tt, sum(Fe(:,8:13) + M(:,8:13),2),sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6,4)
plot(1:tt, sum(Fe(:,14:19) + M(:,14:19),2), sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6,5)
plot(1:tt, sum(M(:,20:22),2),sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6,6)
plot(1:tt, sum(Fe(:,20:22),2),sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)


%% low density C3 - Model
tt = 20;
IC = 13;
VarC3

subplot(2, 6, 7)
plot(1:tt, Fe(:,2) + M(:,2) + sum(Fe(:,3:4) + M(:,3:4),2),  sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6, 8)
plot(1:tt, sum(Fe(:,5:7) + M(:,5:7),2), sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6, 9)
plot(1:tt, sum(Fe(:,8:13) + M(:,8:13),2), sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6, 10)
plot(1:tt, sum(Fe(:,14:19) + M(:,14:19),2), sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6, 11)
plot(1:tt, sum(M(:,20:22),2), sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)

subplot(2,6, 12)
plot(1:tt, sum(Fe(:,20:22),2), sg,'Color', sg2, 'LineWidth',1.7, 'MarkerSize', 4, 'MarkerFaceColor', sg2)


ss11 = 0.7.*[1  1 1]; % line color - gray
ss = '-o';

f4 = figure(4); % for separate legend
set(f4,'Position',[10 10 280 30])
plot(1:2,1:2, ss,'LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)
hold on
plot(1:2,1:2, ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold off
set(gca,'xtick','','ytick','')
xlim([5 10])
leg = {'Two L4, two pupae (C3)','Data'};
l = legend(leg,'Orientation','horizontal');
set(l,'box','off')

