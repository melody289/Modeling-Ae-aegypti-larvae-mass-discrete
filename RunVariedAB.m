%% Run fits for varying a, b (Figure S4)
clearvars; close all; clc

for iter = 1:5
    q = 0.01;
    if iter ==1
        a = 0.0043;
        b = 1.61;
    elseif iter==2
        a = 0.001;
        b = 1.61;
    elseif iter==3
        a = 0.01;
        b = 1.61;
    elseif iter==4
        a = 0.0043;
        b = 1;
    elseif iter==5
        a = 0.0043;
        b = 2;
    end
abpar = [a,b,q];


%% Variation C1
clearvars -except output iter abpar; 
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

c1 = x(id,:);

%% Variation C2
clearvars -except output iter abpar c1; 
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
% Output (x is parameters, y is error)
id = find(min(y)==y,1,'first');
disp(' ')
disp('Output for Variation C2:')
disp(sprintf('Parameters: km = %0.4f, kf = %0.4f',x(id,1),x(id,2)))
disp(sprintf('Error = %2.2f',y(id)))

c2 = x(id,:);

%% Variation C3
clearvars -except output iter abpar c1 c2;
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
% Output (x is parameters, y is error)
id = find(min(y)==y,1,'first');
disp(' ')
disp('Output for Variation C3:')
disp(sprintf('Parameters: km = %0.4f, kf = %0.4f',x(id,1),x(id,2)))
disp(sprintf('Error = %2.2f',y(id)))

c3 = x(id,:);


%%  fitting death for C1
clearvars -except output iter abpar c1 c2 c3;
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


%%  fitting death for C2
clearvars -except output iter abpar c1 c2 c3 d1;
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


%% fitting death C3
clearvars -except output iter abpar c1 c2 c3 d1 d2;
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

output(iter).c1 = c1;
output(iter).c2 = c2;
output(iter).c3 = c3;
output(iter).d1 = d1;
output(iter).d2 = d2;
output(iter).d3 = d3;

end
%{
%% This is for Fig S4a 
clear

 a = 0.001;
 b = 1.61;
 q = 0.01;
abpar = [a,b,q];

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
c3b = x(id,:);



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
km = c3b(1);
kf = c3b(2);

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

d3b = dvec(min(yyout)==yyout);




 a = 0.0043;
 b = 2;
 q = 0.01;
abpar = [a,b,q];

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

% Best Output: km = 0.9515, kf = 0.8491
c3c = x(id,:);



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
km = c3c(1);
kf = c3c(2);

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

d3c = dvec(min(yyout)==yyout);
%}