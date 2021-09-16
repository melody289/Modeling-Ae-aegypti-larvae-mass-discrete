%% Plot male and female temporal Data
clearvars; clc

%% colors

% data
ss11 = 0.7.*[1  1 1]; % line color - gray
ss22 = 0.5; % line width
ls = '-o'; % line style
ms = 5; % markersize

% model
% sg = '-o'; % line style
sg1 = [0.4660, 0.6740, 0.1880]; %[0.3010, 0.7450, 0.9330];
sg2 = [0.6350, 0.0780, 0.1840];
sg3 = [0    0.4470    0.7410]; % line color - blue

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


subplot(2,2,3)
plot(1:tt, (data(:,6)), ls,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,2,4)
plot(1:tt, (data(:,7)), ls,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

end

subplot(2,2,3)
set(gca, 'FontSize', 18)
xlabel('Day')
axis([0,15,0,12])

subplot(2,2,4)
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


subplot(2,2,1)
plot(1:tt, (data(:,6)), ls,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

subplot(2,2,2)
plot(1:tt, (data(:,7)), ls,'LineWidth', ss22, 'Color',  ss11,  'MarkerSize', ms, 'MarkerFaceColor', ss11)
hold on

end


subplot(2,2,1)
set(gca, 'FontSize', 18)
title('Male')
axis([0,15,0,30])

subplot(2,2,2)
set(gca, 'FontSize', 18)
title('Female')
axis([0,15,0,30])


