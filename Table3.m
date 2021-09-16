%% Table 3
clearvars; close all; clc
load('VaryAB.mat')

%% Finding AIC
for j = 1:5
c1 = output(j).c1;
c2 = output(j).c2;
c3 = output(j).c3;
d1 = output(j).d1;
d2 = output(j).d2;
d3 = output(j).d3;
abpar = output(j).abpar;

% Standard
Es = AIC_C13([c1 d1],0,abpar);% km kf d C1
Ep2 = AIC_C13([c2 d2],1,abpar); % km kf d C2
Eg2 = AIC_C13([c3 d3],2,abpar); % km kf d C3

k = 3; n = 10;

Es = n.*log10(Es/n) + 2*k + 2*k*(k+1)/(n-k-1);
Ep2 = n.*log10(Ep2/n) + 2*k + 2*k*(k+1)/(n-k-1);
Eg2 = n.*log10(Eg2/n) + 2*k + 2*k*(k+1)/(n-k-1);

disp('AIC values')
disp(abpar)
disp(sprintf('C1: %2.2f',Es))
disp(sprintf('C2: %2.2f',Ep2))
disp(sprintf('C3: %2.2f',Eg2))
disp(' ')

end