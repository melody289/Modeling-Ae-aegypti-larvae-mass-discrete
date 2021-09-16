function y = fitDL(p,abpar,pic)
% Fit low density data for Variation C3
km = p(1);
kf = p(2);

% Low Density
tt = 20;
IC = 13;

sl = [1 1];
g = [1 1];
nu = 1;


%% First data set

% summed larvae values (Var C, row 13)
Data  = [ 44    19    23    40    48];
% Input daily death - calculated from columns P and R in Var C
d = [ 0.0385    0.0800    0.2609     zeros(1,18)];
% d = [1/26 2/25 6/23 zeros(1,18)];

VarC3


% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0     0     4     4   zeros(1,10)];
Fp = [0     0     0     0     0     0     0     0     3     3   1   zeros(1,9)];

% Calculating error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
y = y2;

%% Second data set

% summed larvae values (Var C, row 30)
Data  = [ 43    23    24    71    66];
% Input daily death - calculated from columns P and R in Var C
d = [ 0.0385         0         0         0         0    0.0800    0.0435    zeros(1,14) ];
%d = [1/26      0   0   0   0   2/25    1/23 zeros(1,14)]


VarC3


% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0     0     6     2  zeros(1,10)];
Fp = [0     0     0     0     0     0     0     0     3     8  zeros(1,10)];

% Calculating error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
y = y + y2;

%% Third data set

% summed larvae values (Var C, row 46)
Data  = [42    26    21    64    71];
% Input daily death - calculated from columns P and R in Var C
d = [ 0         0         0    0.0385      zeros(1,17) ];
% d = [ 0   0   0   1/26 zeros(1,17)]

Fe = zeros(tt, 22);
M = zeros(tt, 22);

VarC3


% Daily males and females - Var C columns N and O
Fp = [0     0     0     0     0     0     0     0     7     4     1     0     0     1 zeros(1,6)];
Mp = [ 0     0     0     0     0     0     0     0     8     3 zeros(1,10)];

% Calculating error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
y = y + y2;


%% Fourth data set

% summed larvae values (Var C, row 59)
Data  = [48    30    13    43    47];
% Input daily death - calculated from columns P and R in Var C
d = [0     0   0.230769231     0.05    zeros(1,17) ];
% d = [ 0   0   6/26    1/20    zeros(1,20)]; 


VarC3


% Daily males and females - Var C columns N and O
Fp = [0     0	0	0	0	0	0	0	7	0	2 zeros(1,9)];
Mp = [0 	0	0	0	0	0	0	1	7	0	2 zeros(1,9)];

% Calculating error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
y = y + y2;

%% Fifth data set

% summed larvae values (Var C, row 70)
Data  = [49    23    9    66    56 ];
% Input daily death - calculated from columns P and R in Var C
d = zeros(1,(tt+1));


VarC3


% Daily males and females - Var C columns N and O
Mp = [0     0	0	0	0	0	0	6	7 zeros(1,11)];
Fp = [0 	0	0	0	0	0	0	0   12 zeros(1,11)]; 

% Calculating error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
y = y + y2;

end