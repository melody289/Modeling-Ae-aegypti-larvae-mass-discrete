%% Plot the Data by stage
clearvars; clf; clc

%% colors

% data
ss11 = 0.7.*[1  1 1]; % line color - gray
ss22 = 0.5; % line width
ss = '-o'; % line style
ms = 5; % markersize

% model
sg = '-o'; % line style
sg2 = [0    0.4470    0.7410]; % line color - blue


%% Plot Low Density Data

LowDensityData

for j = 1:5
    
    if j==1
        data = LD1;
    elseif j==2
        data = LD2;
    elseif j==3
        data = LD3;
    elseif j==4
        data = LD4;
    elseif j==5
        data = LD5;
    end
    data(end+1,:) = 0;
    tt = length(data);


subplot(2,6,7)
plot(1:tt, sum(data(:,1:2),2), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,6,8)
plot(1:tt, data(:,3), ss, 'LineWidth', ss22,'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11);
hold on

subplot(2,6,9)
plot(1:tt, data(:,4), ss, 'LineWidth', ss22,'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11);
hold on

subplot(2,6,10)
plot(1:tt, (data(:,5)), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,6,11)
plot(1:tt, (data(:,6)), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,6,12)
plot(1:tt, (data(:,7)), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

end

subplot(2,6,7)
set(gca, 'FontSize', 18)
xlabel('Day')
axis([0,15,0,30])

subplot(2,6,8)
set(gca, 'FontSize', 18)
xlabel('Day')
axis([0,15,0,30])

subplot(2,6,9)
set(gca, 'FontSize', 18)
xlabel('Day')
axis([0,15,0,30])

subplot(2,6,10)
set(gca, 'FontSize', 18)
xlabel('Day')
axis([0,15,0,30])

subplot(2,6,11)
set(gca, 'FontSize', 18)
xlabel('Day')
axis([0,15,0,12])

subplot(2,6,12)
set(gca, 'FontSize', 18)
xlabel('Day')
axis([0,15,0,12])

%% Plot High Density Data

HighDensityData

for j = 1:5
    
    if j==1
        data = HD1;
    elseif j==2
        data = HD2;
    elseif j==3
        data = HD3;
    elseif j==4
        data = HD4;
    elseif j==5
        data = HD5;
    end
    data(end+1,:) = 0;
    tt = length(data);


subplot(2,6,1)
plot(1:tt, sum(data(:,1:2),2), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,6,2)
plot(1:tt, data(:,3), ss, 'LineWidth', ss22,'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11);
hold on

subplot(2,6,3)
plot(1:tt, data(:,4), ss, 'LineWidth', ss22,'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11);
hold on

subplot(2,6,4)
plot(1:tt, (data(:,5)), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,6,5)
plot(1:tt, (data(:,6)), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,6,6)
plot(1:tt, (data(:,7)), ss,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

end

subplot(2,6,1)
set(gca, 'FontSize', 18)
title('Larvae 1 and 2')
axis([0,20,0,80])

subplot(2,6,2)
set(gca, 'FontSize', 18)
title('Larvae 3')
axis([0,20,0,80])

subplot(2,6,3)
set(gca, 'FontSize', 18)
title('Larvae 4')
axis([0,25,0,80])

subplot(2,6,4)
set(gca, 'FontSize', 18)
title('Pupae')
axis([0,20,0,60])

subplot(2,6,5)
set(gca, 'FontSize', 18)
title('Male')
axis([0,20,0,30])

subplot(2,6,6)
set(gca, 'FontSize', 18)
title('Female')
axis([0,20,0,30])


