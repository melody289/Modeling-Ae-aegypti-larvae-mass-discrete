clear
close all
clc

%%
c1vec = [0.03 0.5 0.69];
c2vec = [0.03 0.5 0.69];
for cc1 = 1:length(c1vec)
    for cc2 = 1:length(c2vec)
a = 0.0043;
b = 1.61;
q = 0.01;

abpar = [a,b,q];


load('BestDdata.mat')

%% Variation E: growth fit
clearvars -except abpar c3 pd3 cc1 cc2 CoutL CoutH c1vec c2vec Cout
clc

c3(3) = c1vec(cc1);
c3(4) = c2vec(cc2);


g3b = @(x) fitStar(x,abpar,c3,pd3);

A = []; b = [];
Aeq = []; beq = [];
lb = [0 0 0.5 0.5];
ub = [1 1  12 12];

x = zeros(200,4);
y = zeros(200,1);
for j = 1:20
    for i = 1:10
        x0 = [ i/10, j/20, (mod(i+1,6)+1), (mod(j+1,8) +1) ];
        [x((i + (j-1)*10),:), y(i + (j-1)*10)] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
    end
end
% Output - gets overwritten for each variation
% x is parameters
% y is error


id = find(min(y)==y,1,'first');
e1 = x(id,:);

disp(' ')
disp('Output for Variation E:')
disp(sprintf('Parameters: g_1 = %0.4f, g_2 = %0.4f, n_1 = %0.4f, n_2 = %0.4f',x(id,1),x(id,2),x(id,3),x(id,4)))
disp(sprintf('Error = %2.2f',y(id)))

%% Output results

sl = e1(3:4);
g = e1(1:2);
nu = 0.52;

km = c3(1);
kf = c3(2);

con1 = c1vec(cc1);
con2 = c2vec(cc2);
d = pd3;

% low density
tt = 20;
IC = 13;
VarE

Cout(cc1,cc2).FeL = Fe;
Cout(cc1,cc2).ML = M;
CoutL(cc1,cc2,:) = [Lm Mm Hm];

% high density
tt = 45;
IC = 39;
VarE

Cout(cc1,cc2).FeH = Fe;
Cout(cc1,cc2).MH = M;
CoutH(cc1,cc2,:) = [Lm Mm Hm];

% parameters of importance
Cout(cc1,cc2).abpar = abpar;
Cout(cc1,cc2).c3 = c3;
Cout(cc1,cc2).pd3 = pd3;
Cout(cc1,cc2).e1 = e1;

    end
end

save('VaryCon.mat','Cout','CoutL','CoutH')
