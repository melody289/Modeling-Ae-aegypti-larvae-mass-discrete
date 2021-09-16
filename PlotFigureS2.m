%% Figure S2
clearvars; close all; clc

hvec = [1 10 100 500 1000 2000];

muf = 0.0661;
f = 23.4982;

N = 0:.1:80;

for h1 = 1:length(hvec)
    h = hvec(h1);
    y = (N.^3+h)./(N.^3+f^3);
    plot(N,y,'linewidth',2)
    hold on
end
legend('1','10','100','500','1000','2000','location','southeast')
set(gca,'fontsize',14)
xlabel('Population (N)')
ylabel('Death Proportion')