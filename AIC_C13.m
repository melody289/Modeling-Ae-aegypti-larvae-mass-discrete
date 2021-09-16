function y = AIC_C13(x,pic,abpar)
% finds AIC for variation C13
km = x(1);
kf = x(2);
d = x(3).*ones(46,1);




% Low density
tt = 20;
IC = 13;
if pic ==0
	VarC1
elseif pic ==1
    VarC2
elseif pic == 2
    VarC3
end

%% First data set

% summed larvae values (Var C, row 13)
Data  = [ 44    19    23    40    48];
% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0     0     4     4   zeros(1,10)];
Fp = [0     0     0     0     0     0     0     0     3     3   1   zeros(1,9)];


Data  = [ 44    19    23    40    48     8     7];


if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y =  y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5); 
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y =  y2;
end

%% Second data set

% summed larvae values (Var C, row 30)
Data  = [ 43    23    24    71    66];
% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0     0     6     2  zeros(1,10)];
Fp = [0     0     0     0     0     0     0     0     3     8  zeros(1,10)];


if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5); 
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end

%% Third data set

% summed larvae values (Var C, row 46)
Data  = [42    26    21    64    71];
% Daily males and females - Var C columns N and O
Fp = [0     0     0     0     0     0     0     0     7     4     1     0     0     1 zeros(1,6)];
Mp = [ 0     0     0     0     0     0     0     0     8     3 zeros(1,10)];

if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5); 
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end

%% Fourth data set

% summed larvae values (Var C, row 59)
Data  = [48    30    13    43    47];
% Daily males and females - Var C columns N and O
Fp = [0     0	0	0	0	0	0	0	7	0	2 zeros(1,9)];
Mp = [0 	0	0	0	0	0	0	1	7	0	2 zeros(1,9)];

if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5); 
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end

%% Fifth data set

% summed larvae values (Var C, row 70)
Data  = [49    23    9    66    56 ];
% Daily males and females - Var C columns N and O
Mp = [0     0	0	0	0	0	0	6	7 zeros(1,11)];
Fp = [0 	0	0	0	0	0	0	0   12 zeros(1,11)]; 

Fp = [0	0	0	0	0	0	0	6	7 zeros(1,11)];
Mp = [ 0	0	0	0	0	0	0	0 12 zeros(1,11)];

if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5); 
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end

%% High density
tt = 45;
IC = 39;

if pic ==0
    VarC1
elseif pic == 1
    VarC2
elseif pic ==2
    VarC3
end


%% First data set

% summed larvae values (Var C, row 103)
Data  = [177   109    88   339   128];
% Daily males and females - Var C columns N and O
Mp = [0     0    0     0     0     0     0     0     7     8     0     1     0     0     0     1  zeros(1, 29)];
Fp = [0     0     0     0     0     0     0     0     3    10     6     1 zeros(1,33)];


if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end

%% Second data set

% summed larvae values (Var C, row 143)
Data  = [160    79    67   531   168];
% Daily males and females - Var C columns N and O
Mp = [ 0     0     0     0     0     0     0     3    26     1     1     1, zeros(1, 33)];
Fp = [0     0     0     0     0     0     0     0    10     6     2 , zeros(1,34)];

if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end


%% Third data set

% summed larvae values (Var C, row 181)
Data  = [167    68    64   237   123];
% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0    24     8     1     0     0     0     1     1  zeros(1,30)];
Fp = [0     0     0     0     0     0     0     4    12     5     3     1 zeros(1,33)];

if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end


%% Fourth data set

% summed larvae values (Var C, row 214)
Data  = [ 156    63    71   273   238];
% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0    24     9     1   zeros(1,35)];
Fp = [0     0     0     0     0     0     0     1    17     4  zeros(1,35)];

if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end

%% Fifth data set

% summed larvae values (Var C, row 233)
Data  = [183	56	30	103	97];
% Daily males and females - Var C columns N and O
Mp = [0	0	0	0	0	0	0	2	20	0	1	 zeros(1,34)];
Fp = [0	0	0	0	0	0	0	0	12	0	2	0	1	0	0	0	1 zeros(1,28)];

if pic ==2
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
	y2 = sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
	y = y + y2;
else
	y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
    y = y + y2;
end


end