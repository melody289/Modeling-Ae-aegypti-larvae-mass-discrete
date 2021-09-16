function y = fitDTnH(p,abpar,Cvar)
% Inputs:   p = [km kf] 
%           p2 = [a b]
%           wh = determines scenario

km = p(1);
kf = p(2);

tt = 45;
IC = 39;

%% First data set

% summed larvae values (Var C, row 103)
Data  = [177   109    88   339   128];
% Input daily death - calculated from columns P and R in Var C
% d = [  0.038462, 0.053333333333333,   0.098592   0.09375 , 0, 0,0.017241, 0, 0, 0.034483, 0, 0  0, 0,0.05   0.055555555556  0, 0.117647, .2, 0.0833333, 0,  0.181818181818182   0.222222222222222   0.142857142857143    , 0    0.1667,   0.2, 0.25        zeros(1,20)   ];
nd = [3     4	7	6	0	0	1	0	0	1	0	0	0	0	1	1	0	2	3	1	0	2	2	1	0	1	1	1	0];
n = [78     75	71	64	58	58	58	57	57	57	56	56	56	56	56	55	54	54	52	49	48	48	46	44	43	43	42	41	40];
adult = [0	0	0	0	0	0	0	0	10	28	34	36	36	36	36	37	37	37	37	37	37	37	37	37	37	37	37	37	37];
d = zeros(1,tt);
d(1:length(nd)) = nd./(n-adult);

if Cvar==1
    VarC1
elseif Cvar==2
    VarC2
end

% Daily males and females - Var C columns N and O
Mp = [0     0    0     0     0     0     0     0     7     8     0     1     0     0     0     1  zeros(1, 29)];
Fp = [0     0     0     0     0     0     0     0     3    10     6     1 zeros(1,33)];

% Calculating Error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);  
y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
y = y2;

%% Second data set

% summed larvae values (Var C, row 143)
Data  = [160    79    67   531   168];
% Input daily death - calculated from columns P and R in Var C
% d = [ 0,  0, 0, 0, 0.012820512820513   0.03896103896, 0.013514 0, 0, 0, 0, 0, 0   0.0434782609, 0,0, 0    0.045455   0.142857142857143   0.222222   0.1428571429   0.25   0.1111111   0.125    0 0, 0.14285714, 0  0.166667, 0, 0, 0, 0.2, 0 , 0.25,  zeros(1,35) ];
nd = [0     0	0	0	1	3	1	0	0	0	0	0	0	1	0	0	0	1	3	4	2	3	1	1	0	0	1	0	1	0	0	0	1	0	1	0	0];
n = [78	78	78	78	78	77	74	73	73	73	73	73	73	73	72	72	72	72	71	68	64	62	59	58	57	57	57	56	56	55	55	55	55	54	54	53	53];
adult = [0     0	0	0	0	0	0	3	39	46	49	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50	50];
d = zeros(1,tt);
d(1:length(nd)) = nd./(n-adult);

if Cvar==1
    VarC1
elseif Cvar==2
    VarC2
end

% Daily males and females - Var C columns N and O
Mp = [ 0     0     0     0     0     0     0     3    26     1     1     1, zeros(1, 33)];
Fp = [0     0     0     0     0     0     0     0    10     6     2 , zeros(1,34)];

% Calculating Error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);  
y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
y = y + y2;

%% Third data set

% summed larvae values (Var C, row 181)
Data  = [167    68    64   237   123];
% Input daily death - calculated from columns P and R in Var C
%d = [  0.0256    0.0263, 0    0.0676    0.0290, 0  0 0 0 0 0    0.3333 , 0, 0, 0, 0,  0, 0  0, 0,0,  0.2500    0.3333   0, 0, 0,  0   0.5, 0, zeros(1,30) 0  ];
nd = [2 	2	0	5	2	0	0	0	0	0	0	3	0	0	0	0	0	0	0	0	0	1	1	0	0	0	0	1	0	0	0	0	0   0   0];
n = [78 	76	74	74	69	67	67	67	67	67	67	67	64	64	64	64	64	64	64	64	64	64	63	62	62	62	62	62	61	61	61	61	61	61	61];
adult = [0	0	0	0	0	0	0	28	48	54	57	58	58	59	60	60	60	60	60	60	60	60	60	60	60	60	60	60	60	60	60	60	60	60	60];
d = zeros(1,tt);
d(1:length(nd)) = nd./(n-adult);

if Cvar==1
    VarC1
elseif Cvar==2
    VarC2
end

% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0    24     8     1     0     0     0     1     1  zeros(1,30)];
Fp = [0     0     0     0     0     0     0     4    12     5     3     1 zeros(1,33)];

% Calculating Error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);  
y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
y = y + y2;


%% Fourth data set

% summed larvae values (Var C, row 214)
Data  = [ 156    63    71   273   238];
% Input daily death - calculated from columns P and R in Var C
d3 = [  0.0128    0.0260    0.0133, 0   0.0541    0.0143, 0  0 0, 0 0,  0.0769, 0,   0.0833,  0 0, 0 0, 0  0, 0,  0.0909    0.1  0, 0.1111    0.1250, zeros(1,30) ];
nd = [1	2	1	0	4	1	0	0	0	0	0	1	0	1	0	0	0	0	0	0	0	1	1	0	1	1	0	0	0	0];
n = [78	77	75	74	74	70	69	69	69	69	69	69	68	68	67	67	67	67	67	67	67	67	66	65	65	64	63	63	63	63];
adult = [0	0	0	0	0	0	0	25	51	56	56	56	56	56	56	56	56	56	56	56	56	56	56	56	56	56	56	56	56	56];
d = zeros(1,tt);
d(1:length(nd)) = nd./(n-adult);

if Cvar==1
    VarC1
elseif Cvar==2
    VarC2
end

% Daily males and females - Var C columns N and O
Mp = [0     0     0     0     0     0     0    24     9     1   zeros(1,35)];
Fp = [0     0     0     0     0     0     0     1    17     4  zeros(1,35)];

% Calculating Error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);  
y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
y = y + y2;

%% Fifth data set

% summed larvae values (Var C, row 233)
Data  = [183	56	30	103	97];
% Input daily death - calculated from columns P and R in Var C
d3 = [ 0.0256	0.0263	0.4324	0	0.0238	0	0	0	0	0	0	zeros(1,40)];
nd = [2	2	32	0	1	0	0	0	0	0	0	0	0	0	0	0];
n = [78	76	74	42	42	41	41	41	41	41	41	41	41	41	41	41];
adult = [0	0	0	0	0	0	0	2	34	34	37	37	38	38	38	38];
d = zeros(1,tt);
d(1:length(nd)) = nd./(n-adult);

if Cvar==1
    VarC1
elseif Cvar==2
    VarC2
end

% Daily males and females - Var C columns N and O
Mp = [0	0	0	0	0	0	0	2	20	0	1	 zeros(1,34)];
Fp = [0	0	0	0	0	0	0	0	12	0	2	0	1	0	0	0	1 zeros(1,28)];


% Calculating Error
y2 = (modY(1:5)-Data(1:5))./Data(1:5);  
y2 = sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
y = y + y2;

end