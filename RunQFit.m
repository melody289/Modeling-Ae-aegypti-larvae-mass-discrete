clear
close all
clc

%%
qvec = [0.0005 0.001 0.005 0.0075 0.01 0.015 0.02 0.025 0.05];
for q1 = 1:length(qvec)
a = 0.0043;
b = 1.61;
q = qvec(q1);
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


%% Variation C3
clearvars -except abpar c1 c2 q1 qoutL qoutH qvec qout
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
% Output - gets overwritten for each variation
% x is parameters
% y is error
id = find(min(y)==y,1,'first');
disp(' ')
disp('Output for Variation C3:')
disp(sprintf('Parameters: km = %0.4f, kf = %0.4f',x(id,1),x(id,2)))
disp(sprintf('Error = %2.2f',y(id)))
% Best Output: 0.9435 0.8549
% km = 0.9515, kf = 0.8491

c3 = x(id,:);

%% Variation D3 - fit female density and male constant together .
clearvars -except pd1 pd2 abpar c3 q1  qoutL qoutH qvec qout
% old  0.0488, 0.0324 12 25
% 0.0744    0.0337 9 23 (1st)   
%  0.066    0.025   24              (3rd diff)  
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

% Output - gets overwritten for each variation
% x is parameters
% y is error

id = find(min(y)==y,1,'first');
pd3 = x(id,:);

disp(' ')
disp('Output for Variation D3:')
disp(sprintf('Parameters: mu_f = %0.4f, mu_m = %0.4f, f = %0.4f',x(id,1),x(id,2),x(id,3)))
disp(sprintf('Error = %2.2f',y(id)))


%% Variation E: growth fit
clearvars -except abpar c3 pd3 q1 qoutL qoutH qvec qout
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
d = pd3;

% low density
tt = 20;
IC = 13;
VarE

qout(q1).FeL = Fe;
qout(q1).ML = M;
qoutL(q1,:) = [Lm Mm Hm];

% high density
tt = 45;
IC = 39;
VarE

qout(q1).FeH = Fe;
qout(q1).MH = M;
qoutH(q1,:) = [Lm Mm Hm];

% parameters of importance
qout(q1).abpar = abpar;
qout(q1).c3 = c3;
qout(q1).pd3 = pd3;
qout(q1).e1 = e1;

end

save('VaryQ.mat','qout','qoutL','qoutH')
