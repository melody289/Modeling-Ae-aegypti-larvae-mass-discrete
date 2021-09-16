%% Note: Should run sections individually.
clear
a = 0.0043;
b = 1.61;
q = 0.01;
%{
a = 0.001;
b = 1.61;
%
a = 0.01;
b = 1.61;
%
a = 0.0043;
b = 1;
%
a = 0.0043;
b = 2;
%}
abpar = [a,b,q];


%% Variation C1
clearvars -except abpar; 
clc;

g3b = @(x) fitDTnL(x,abpar,1) + fitDTnH(x,abpar,1);

A = []; b = [];
Aeq = []; beq = [];
lb = [0,0];
ub = [1,1];

x = zeros(81,2);
y = zeros(81,1);
for j = 1:9
    for i = 1:9
        x0 = [i/10, j/10];
        [x(i+9*(j-1),:), y(i+9*(j-1))] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
    end
end

% Output (x is parameters, y is error)
id = find(min(y)==y,1,'first');
disp('Output for Variation C1:')
disp(sprintf('Parameters: km = %0.4f, kf = %0.4f',x(id,1),x(id,2)))
disp(sprintf('Error = %2.2f',y(id)))
% Best output:  km = 0.7022, kf = 0.6442
c1 = x(id,:);

%% Variation C2
clearvars -except abpar c1; 
clc;

g3b = @(x) fitDTnL(x,abpar,2) + fitDTnH(x,abpar,2);

A = []; b = [];
Aeq = []; beq = [];
lb = [0,0];
ub = [1,1];

x = zeros(81,2);
y = zeros(81,1);
for j = 1:9
    for i = 1:9
        x0 = [i/10, j/10];
        [x(i+9*(j-1),:), y(i+9*(j-1))] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
    end
end

id = find(min(y)==y,1,'first');
% Output (x is parameters, y is error)id = find(min(y)==y,1,'first');
disp(' ')
disp('Output for Variation C2:')
disp(sprintf('Parameters: km = %0.4f, kf = %0.4f',x(id,1),x(id,2)))
disp(sprintf('Error = %2.2f',y(id)))
% Best Output: km = 0.8233, kf = 0.7346
c2 = x(id,:);

%% Variation C3
clearvars -except abpar c1 c2;
clc;

g3b = @(x) fitDL(x,abpar,0) + fitDH(x,abpar,0);

A = []; b = [];
Aeq = []; beq = [];
lb = [0,0];
ub = [1,1];

x = zeros(81,2);
y = zeros(81,1);
for j = 1:9
    for i = 1:9
        x0 = [i/10, j/10];
        [x(i+9*(j-1),:), y(i+9*(j-1))] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
    end
end

id = find(min(y)==y,1,'first');
% Output (x is parameters, y is error)id = find(min(y)==y,1,'first');
disp(' ')
disp('Output for Variation C3:')
disp(sprintf('Parameters: km = %0.4f, kf = %0.4f',x(id,1),x(id,2)))
disp(sprintf('Error = %2.2f',y(id)))
% Best Output: km = 0.9515, kf = 0.8491
c3 = x(id,:);


%%  fitting death for C1
clearvars -except abpar c1 c2 c3;
clc;

HighDensityData
Htots = [sum(HD1);sum(HD2);sum(HD3);sum(HD4);sum(HD5)];
mHdata = Htots(:,6)';
fHdata = Htots(:,7)';

LowDensityData
Ltots = [sum(LD1);sum(LD2);sum(LD3);sum(LD4);sum(LD5)];
mLdata = Ltots(:,6)';
fLdata = Ltots(:,7)';


dvec = 0.04:.001:0.2;
yyout = NaN(length(dvec),1);
for di = 1:length(dvec)

d = dvec(di)*ones(45,1);
km = c1(1);
kf = c1(2);

% high density
tt = 45;
IC = 39;
VarC1

yy = (sum(sum(M(:,14))) - mHdata).^2 +  (sum(sum(Fe(:,14))) - fHdata).^2;

% low density
tt = 20;
IC = 13;
VarC1

yy = sum(yy)./3 + sum((sum(sum(M(:,14))) - mLdata).^2 +  (sum(sum(Fe(:,14))) - fLdata).^2);

yyout(di) = yy;

end

d1 = dvec(min(yyout)==yyout);
disp(sprintf('Death for C1 = %0.4f',d1))
% Best Output: d = 0.106

%%  fitting death for C2
clearvars -except abpar c1 c2 c3 d1;
clc;

HighDensityData
Htots = [sum(HD1);sum(HD2);sum(HD3);sum(HD4);sum(HD5)];
mHdata = Htots(:,6)';
fHdata = Htots(:,7)';

LowDensityData
Ltots = [sum(LD1);sum(LD2);sum(LD3);sum(LD4);sum(LD5)];
mLdata = Ltots(:,6)';
fLdata = Ltots(:,7)';

dvec = 0.04:.001:0.06;
yyout = NaN(length(dvec),1);
for di = 1:length(dvec)

d = dvec(di)*ones(45,1);
km = c2(1);
kf = c2(2);

% high density
tt = 45;
IC = 39;
VarC2

yy = (sum(sum(M(:,17))) - mHdata).^2 +  (sum(sum(Fe(:,17))) - fHdata).^2;

% low density
tt = 20;
IC = 13;
VarC2

yy = sum(yy)./3 + sum((sum(sum(M(:,17))) - mLdata).^2 +  (sum(sum(Fe(:,17))) - fLdata).^2);

yyout(di) = yy;

end

d2 = dvec(min(yyout)==yyout);
disp(sprintf('Death for C2 = %0.4f',d2))  
% Best Output: d = 0.055

%% fitting death C3
clearvars -except abpar c1 c2 c3 d1 d2;
clc;

HighDensityData
Htots = [sum(HD1);sum(HD2);sum(HD3);sum(HD4);sum(HD5)];
mHdata = Htots(:,6)';
fHdata = Htots(:,7)';

LowDensityData
Ltots = [sum(LD1);sum(LD2);sum(LD3);sum(LD4);sum(LD5)];
mLdata = Ltots(:,6)';
fLdata = Ltots(:,7)';


dvec = 0.04:.001:0.06;
yyout = NaN(length(dvec),1);
for di = 1:length(dvec)

d = dvec(di)*ones(45,1);
km = c3(1);
kf = c3(2);

sl = [1, 1];
g = [1 0.45];
nu = 1;


% high density
tt = 45;
IC = 39;
VarC3

% output from high
yy = (sum(sum(M(:,20:22))) - mHdata).^2 +  (sum(sum(Fe(:,20:22))) - fHdata).^2;

% low density
tt = 20;
IC = 13;
VarC3

% output combining low and high (error)
yy = sum(yy)./3 + sum((sum(sum(M(:,20:22))) - mLdata).^2 +  (sum(sum(Fe(:,20:22))) - fLdata).^2);

yyout(di) = yy;
end

d3 = dvec(min(yyout)==yyout);
disp(sprintf('Death for C3 = %0.4f',d3))
% Best Output: d = 0.049


%% Finding AIC
clearvars -except abpar c1 c2 c3 d1 d2 d3;
clc

% Standard
Es = AIC_C13([c1 d1],0,abpar);% km kf d C1
Ep2 = AIC_C13([c2 d2],1,abpar); % km kf d C2
Eg2 = AIC_C13([c3 d3],2,abpar); % km kf d C3

k = 3; n = 10;

Es = n.*log10(Es/n) + 2*k + 2*k*(k+1)/(n-k-1);
Ep2 = n.*log10(Ep2/n) + 2*k + 2*k*(k+1)/(n-k-1);
Eg2 = n.*log10(Eg2/n) + 2*k + 2*k*(k+1)/(n-k-1);

disp('AIC values')
disp(sprintf('C1: %2.2f',Es))
disp(sprintf('C2: %2.2f',Ep2))
disp(sprintf('C3: %2.2f',Eg2))

%% Run second Variation D1- D3

% Survival Data - Var D
lowM =  [8 16 10 10  9 11 14  9 12 13  8  9 12  9  7 8   13 10 11  8];
lowF = [9  8 10 10 14 14 12 11 10  5  7 11 10 10 12  7 12 9 13 11];
highM = [29 31 18 35 29 25 25 22 23 34 35 32 17];
highF = [22 28 21 21 19 23 32 34 16 22 25 18 20];

%% Variation D1 - Single Constant fit
load('BestCdata.mat')
clearvars -except abpar c3;
clc;

g3b = @(x) fitDeath(x,abpar,c3,1);

A = []; b =[];
Aeq = []; beq = [];
lb =  0.001;  
ub = 0.5;

x = zeros(12,1);
y = zeros(12,1);
for i = 1:12
    x0 = i/32;
    [x(i,:), y(i)] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
end

id = find(min(y)==y,1,'first');
pd1 = x(id);

% Output (x is parameters, y is error)
disp(' ')
disp('Output for Variation D1:')
disp(sprintf('Parameters: mu = %0.4f',x(id,1)))
disp(sprintf('Error = %2.2f',y(id)))
% Best Output: mu = 0.0419

%% Variation D2 - two constants fit together
clearvars -except pd1 abpar c3
clc

g3b = @(x) fitDeath(x,abpar,c3,2);

A = []; b =[];
Aeq = []; beq = [];
lb = [ 0.001  0.001];
ub = [ 0.5 0.5];

x = zeros(81,2);
y = zeros(81,1);
for j = 1:9
    for i = 1:9
        x0 = [ j/25,  i/25];
        [x((i +(j-1)*9),:), y(i+(j-1)*9)] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
    end
end

id = find(min(y)==y,1,'first');
pd2 = x(id,:);

% Output (x is parameters, y is error)
disp(' ')
disp('Output for Variation D2:')
disp(sprintf('Parameters: mu_f = %0.4f, mu_m = %0.4f',x(id,1),x(id,2)))
disp(sprintf('Error = %2.2f',y(id)))
% Best Output: mu_f = 0.0454, mu_m = 0.0380


%% Variation D3 - fit female density and male constant together .
clearvars -except pd1 pd2 abpar c3

g3b = @(x) fitDeath(x,abpar,c3,3);

Aeq = []; beq = [];
lb = [ 0.001  0.001 1  ];
ub = [ 0.5 0.5 100 ]; 

x = zeros(81,3);
y = zeros(81,1);
for j = 1:9
    for i = 1:9
        x0 = [ j/50, i/50,   (mod(j,4)*3 + mod(i,7)*2 + 10)];
        [x((i + (j-1)*9),:), y(i + (j-1)*9)] = fmincon(g3b,x0,Aeq,beq,Aeq,beq,lb,ub);
    end
end

% Output (x is parameters, y is error)
id = find(min(y)==y,1,'first');
pd3 = x(id,:);

disp(' ')
disp('Output for Variation D3:')
disp(sprintf('Parameters: mu_f = %0.4f, mu_m = %0.4f, f = %0.4f',x(id,1),x(id,2),x(id,3)))
disp(sprintf('Error = %2.2f',y(id)))
% Best Output: mu_f = 0.0661, mu_m = 0.0381, f = 23.4982

%%  AIC for D variations
clearvars -except pd1 pd2 pd3 abpar c3

clc

m1 = fitDeath(pd1,abpar,c3,1); 
m2 = fitDeath(pd2,abpar,c3,2);
md = fitDeath(pd3,abpar,c3,3); 

n = 66;
k = 1;
m1 = n*log10(m1/n) + 2*k + 2*k*(k+1)/(n-k-1);
k = 2;
m2 = n*log10(m2/n) + 2*k + 2*k*(k+1)/(n-k-1);
k = 3;
md = n*log10(md/n) + 2*k + 2*k*(k+1)/(n-k-1);

disp('AIC values')
disp(sprintf('D1: %2.2f',m1))
disp(sprintf('D2: %2.2f',m2))
disp(sprintf('D3: %2.2f',md))


%% Variation E: growth fit
clearvars -except abpar c3 pd3
load('BestDdata.mat')
clc

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

% Output (x is parameters, y is error)
id = find(min(y)==y,1,'first');
e1 = x(id,:);

disp(' ')
disp('Output for Variation E:')
disp(sprintf('Parameters: g_1 = %0.4f, g_2 = %0.4f, n_1 = %0.4f, n_2 = %0.4f',x(id,1),x(id,2),x(id,3),x(id,4)))
disp(sprintf('Error = %2.2f',y(id)))
% Best Output: g_1 = 1.0000, g_2 = 0.5024, n_1 = 3.0970, n_2 = 8.0961