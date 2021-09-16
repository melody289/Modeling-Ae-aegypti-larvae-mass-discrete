%% Plotting for Figure S4
clear; close all; clc

%% Figure S4a

figure
PlotDataMaleFemale

subplot(2,2,1)
ylh = ylabel('Number Emerged');
ylh.Position(2) = -6; % change vertical position of ylabel

load('VaryAB.mat')

for j = [1 2 5]
    
    d3 = output(j).d3;
    c3 = output(j).c3;
    abpar = output(j).abpar;
    if j==1
        sg = sg3;
    elseif j==2
        sg = sg1;
    elseif j==5
        sg = sg2;
    end

% high density C3 
tt = 45;
IC = 39;
d = d3*ones(1,tt);
km = c3(1);
kf = c3(2);

VarC3

subplot(2,2,1)
plot(1:tt, sum(M(:,20:22),2), ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)
subplot(2,2,2)
plot(1:tt, sum(Fe(:,20:22),2), ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)

% low density 
clearvars Fe M
tt = 20;
IC = 13;

VarC3

subplot(2,2,3)
plot(1:tt, sum(M(:,20:22),2), ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)
subplot(2,2,4)
plot(1:tt, sum(Fe(:,20:22),2), ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)

end

subplot(2,2,2)
yyaxis right
ylabel('High Density')
set(gca,'ytick',[],'ycolor','k')

subplot(2,2,4)
yyaxis right
ylabel('Low Density');
set(gca,'ytick',[],'ycolor','k')



f2 = figure(2); % for separate legend
set(f2,'Position',[10 10 500 60])
plot(1:2,1:2, ls,'LineWidth', ss22, 'Color',  sg1,  'MarkerSize', ms, 'MarkerFaceColor', sg1)
hold on
plot(1:2,1:2, ls,'LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)
plot(1:2,1:2, ls,'LineWidth', ss22, 'Color',  sg3,  'MarkerSize', ms, 'MarkerFaceColor', sg3)
plot(1:2,1:2, '-o','LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold off
set(gca,'fontsize',14,'xtick','','ytick','')
xlim([5 10])
leg = {'a = 0.0043,\newlineb = 1.61','a = 0.001,\newlineb = 1.61','a = 0.0043,\newlineb = 2','Data'};
l = legend(leg,'Orientation','horizontal');
set(l,'box','off')

%% Figure S4b

figure
PlotDataMaleFemale

subplot(2,2,1)
ylh = ylabel('Number Emerged');
ylh.Position(2) = -6; % change vertical position of ylabel


load('VaryAB.mat')

c1 = output(3).c1;
c2 = output(3).c2;
c3 = output(3).c3;
d1 = output(3).d1;
d2 = output(3).d2;
d3 = output(3).d3;
abpar = output(3).abpar;


for var = 1:3

% high density C3 
tt = 45;
IC = 39;

if var ==1
    d = d1*ones(1,tt);
    km = c1(1);
    kf = c1(2);
    VarC1
    Mout = (M(:,end));
    Fout = (Fe(:,end));
    sg = sg1;
    ls = '-.o'; % line style
elseif var==2
    d = d2*ones(1,tt);
    km = c2(1);
    kf = c2(2);
    VarC2
    Mout = (M(:,end));
    Fout = (Fe(:,end));
    sg = sg2;
    ls = '--o'; % line style
elseif var==3
    d = d3*ones(1,tt);
    km = c3(1);
    kf = c3(2);
    VarC3
    Mout = sum(M(:,20:22),2);
    Fout = sum(Fe(:,20:22),2);
    sg = sg3;
    ls = '-o'; % line style
end

subplot(2,2,1)
plot(1:tt, Mout, ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)
subplot(2,2,2)
plot(1:tt, Fout, ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)


% low density 
tt = 20;
IC = 13;

if var ==1
    d = d1*ones(1,tt);
    km = c1(1);
    kf = c1(2);
    VarC1
    Mout = (M(:,end));
    Fout = (Fe(:,end));
    sg = sg1;
elseif var==2
    d = d2*ones(1,tt);
    km = c2(1);
    kf = c2(2);
    VarC2
    Mout = (M(:,end));
    Fout = (Fe(:,end));
    sg = sg2;
elseif var==3
    d = d3*ones(1,tt);
    km = c3(1);
    kf = c3(2);
    VarC3
    Mout = sum(M(:,20:22),2);
    Fout = sum(Fe(:,20:22),2);
    sg = sg3;
end

subplot(2,2,3)
plot(1:tt, Mout, ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)
subplot(2,2,4)
plot(1:tt, Fout, ls,'LineWidth', ss22, 'Color',  sg,  'MarkerSize', ms, 'MarkerFaceColor', sg)

end

subplot(2,2,2)
yyaxis right
ylabel('High Density')
set(gca,'ytick',[],'ycolor','k')

subplot(2,2,4)
yyaxis right
ylabel('Low Density');
set(gca,'ytick',[],'ycolor','k')

f4 = figure(4); % for separate legend
set(f4,'Position',[10 10 650 30])
plot(1:2,1:2,'-.o','LineWidth', ss22, 'Color',  sg1,  'MarkerSize', ms, 'MarkerFaceColor', sg1)
hold on
plot(1:2,1:2,'--o','LineWidth', ss22, 'Color',  sg2,  'MarkerSize', ms, 'MarkerFaceColor', sg2)
plot(1:2,1:2, '-o','LineWidth', ss22, 'Color',  sg3,  'MarkerSize', ms, 'MarkerFaceColor', sg3)
plot(1:2,1:2, '-o','LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold off
set(gca,'fontsize',14,'xtick','','ytick','')
xlim([5 10])
leg = {'Basic (C1)','Two pupae (C2)','Two L4, two pupae (C3)','Data'};
l = legend(leg,'Orientation','horizontal');
set(l,'box','off')

