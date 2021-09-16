%% Plot Figure S1

clearvars; close all; clc


%% Figure S1a
c1vec = [0.03 0.5 0.69];
c2vec = [0.03 0.5 0.69];

load('VaryCon.mat')
ProportionData




count1 = 1;
for cc1 = 1:3
    for cc2 = 1:3
        

abpar = Cout(cc1,cc2).abpar;
sl = Cout(cc1,cc2).e1(3:4);
g = Cout(cc1,cc2).e1(1:2);
nu = 0.52;


km = Cout(cc1,cc2).c3(1);
kf = Cout(cc1,cc2).c3(2);
con1 = Cout(cc1,cc2).c3(3);
con2 = Cout(cc1,cc2).c3(4);
d = Cout(cc1,cc2).pd3;
% low density
tt = 20;
IC = 13;
VarE

LowP(count1,:) = [Lm Mm Hm];

% high density
tt = 45;
IC = 39;
VarE

HighP(count1,:) = [Lm Mm Hm];
count1 = count1+1;

    end
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
cvec = {'0.3','0.5','0.69'};
set(gca,'fontsize',14,'xticklabel',cvec)
ylabel('Proportion of females emerged')
xlabel('c1 = 0.3                   c1 = 0.5                  c1 = 0.69')
title('Low Density')

figure(12)
bar(HighP,'stacked')
hold on
for j = 1:3
plot([0 10],[Hmean(j) Hmean(j)],'k--','Linewidth',2)
end
hold off
xlim([0.5 9.5])
set(gca,'fontsize',14,'xticklabel',cvec)
xlabel('c1 = 0.3                   c1 = 0.5                  c1 = 0.69')
title('High Density')
count1 = count1+1;


%% Figure S1b - Data

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

figure(4)
plot([0 0],[1 1],'k--')
hold on

%% Figure S1b - Model

load('VaryCon.mat')

newcolors = [  0    0.4470    0.7410;   0    0.4470    0.7410; 0.8500    0.3250    0.0980; 0.9290    0.6940    0.1250; ...
    0.4940    0.1840    0.5560; 0.4660    0.6740    0.1880; 0.3010    0.7450    0.9330; 0.6350    0.0780    0.1840;...
    183/255 70/255 1; 143/255 224/255 85/255];
         

count1 = 1;
for cc1 = 1:3
    for cc2 = 1:3

abpar = Cout(cc1,cc2).abpar;
sl = Cout(cc1,cc2).e1(3:4);
g = Cout(cc1,cc2).e1(1:2);
nu = 0.52;


km = Cout(cc1,cc2).c3(1);
kf = Cout(cc1,cc2).c3(2);
con1 = Cout(cc1,cc2).c3(3);
con2 = Cout(cc1,cc2).c3(4);
d = Cout(cc1,cc2).pd3;
% low density
tt = 20;
IC = 13;
VarE

smallF = Fe(:,20)/totm;
medF = Fe(:,21)/totm;
largeF = Fe(:,22)/totm;
figure(3)
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
count1 = count1+1;

figure(4)
plot(largeF,'o-','linewidth',2)
hold on

    end
end

figure(3)
colororder(newcolors)
figure(4)
colororder(newcolors)

%%
figure(3)
subplot(2,3,6)
yyaxis right
ylabel('Low Density');
set(gca,'ytick',[],'ycolor','k')

subplot(2,3,3)
yyaxis right
ylabel('High Density');
set(gca,'ytick',[],'ycolor','k')

f4 = figure(4); % for legend
set(f4,'Position',[100 100 1200 50])
leg0 = 'Data';
leg1 = {'c1 = 0.3,\newlinec2 = 0.3','c1 = 0.3,\newlinec2 = 0.5','c1 = 0.3,\newlinec2 = 0.69'};
leg2 = {'c1 = 0.5,\newlinec2 = 0.3','c1 = 0.5,\newlinec2 = 0.5','c1 = 0.5,\newlinec2 = 0.69'};
leg3 = {'c1 = 0.69,\newlinec2 = 0.3','c1 = 0.69,\newlinec2 = 0.5','c1 = 0.69,\newlinec2 = 0.69'};
l = legend([leg0 leg1 leg2 leg3],'Orientation','horizontal');
set(l,'box','off')
xlim([100 200])
set(gca,'fontsize',14,'xtick',[],'ytick',[])
%}