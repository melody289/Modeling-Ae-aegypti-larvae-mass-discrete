function y = fitDTnH(p,p2,wh)

% time
tt = 45;

mm = 3;
if wh ==0
    toG = 14;
else
    toG = 17;
end
% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)


% + norm((modY(6:7)-Data(6:7))./Data(6:7))

% this is the summed larvae values
Data  = [177   109    88   339   128    17    20];
% In put daily death
 d = [  0.038462, 0.053333333333333,   0.098592   0.09375 , 0, 0,0.017241, 0, 0, 0.034483, 0, 0  0, 0,0.05   0.055555555556  0, 0.117647, .2, 0.0833333, 0,  0.181818181818182   0.222222222222222   0.142857142857143    , 0    0.1667,   0.2, 0.25        zeros(1,20)   ];


km = p(1)  ;
kf =p(2) ;
% initial values 

dl =1;
Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
    
    

   


if wh ==0
    for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
else
    for t = 2:tt
    [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
end
   
%    if(mod(t,5) ==0)
   %     K(t+dl) =  200;% K(t+1,1) + 500;
%     end
       % K(t+dl) = K(t+1,1);




modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));
Mp = [0     0, 0     0     0     0     0     0     7     8     0     1     0     0     0     1, zeros(1, 29)];
Fp = [0     0     0     0     0     0     0     0     3    10     6     1, zeros(1,33)];

% Norma 1/4
if( mm == 1)
y =    norm((modY-Data)./Data);
elseif(mm == 2)
y =    norm([Mp,Fp] - [M(:,end)', Fe(:,end)']);
else
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =   y2;
end

% 2nd data set




Data  = [    160    79    67   531   168    32    18];
% In put daily death
 d = [ 0,  0, 0, 0, 0.012820512820513   0.03896103896, 0.013514 0, 0, 0, 0, 0, 0   0.0434782609, 0,0, 0    0.045455   0.142857142857143   0.222222   0.1428571429   0.25   0.1111111   0.125    0 0, 0.14285714, 0  0.166667, 0, 0, 0, 0.2, 0 , 0.25,  zeros(1,35) ];



% initial values 

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
    
    

   

if wh ==0
    for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
else
    for t = 2:tt
    [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
end




modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));

% Norma 2/4
Mp = [ 0     0     0     0     0     0     0     3    26     1     1     1, zeros(1, 33)];
Fp = [0     0     0     0     0     0     0     0    10     6     2 , zeros(1,34)];

if( mm == 1)
y = y+   norm((modY-Data)./Data);
elseif(mm == 2)
y =  y+  norm([Mp,Fp] - [M(:,end)', Fe(:,end)']);
else
%y =  y+  norm((modY(1:5)-Data(1:5))./Data(1:5)) +  norm([Mp,Fp] - [M(:,end)', Fe(:,end)'])/5;
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
end


% Third

Data  = [   167    68    64   237   123    35    25];
% In put daily death
 d = [  0.0256    0.0263, 0    0.0676    0.0290, 0  0 0 0 0 0    0.3333 , 0, 0, 0, 0,  0, 0  0, 0,0,  0.2500    0.3333   0, 0, 0,  0   0.5, 0, zeros(1,30) 0  ];



% initial values 

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
    
    

   

if wh ==0
    for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
else
    for t = 2:tt
    [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
end



modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,toG));
modY(7) = sum(Fe(:,toG));
Mp = [0     0     0     0     0     0     0    24     8     1     0     0     0     1     1  ,zeros(1,30)];
Fp = [0     0     0     0     0     0     0     4    12     5     3     1, zeros(1,33)];

% Norma 3/5
if( mm == 1)
y = y+   norm((modY-Data)./Data);
elseif(mm == 2)
y =  y+  norm([Mp,Fp] - [M(:,end)', Fe(:,end)']);
else
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
end



% fourth


Data  = [ 156    63    71   273   238    34    22];
% In put daily death
 d = [  0.0128    0.0260    0.0133, 0   0.0541    0.0143, 0  0 0, 0 0,  0.0769, 0,   0.0833,  0 0, 0 0, 0  0, 0,  0.0909    0.1  0, 0.1111    0.1250, zeros(1,30) ];



% initial values 

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
    
    

   

if wh ==0
    for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
else
    for t = 2:tt
    [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
end




modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));
Mp = [   0     0     0     0     0     0     0    24     9     1  , zeros(1,35)];
Fp = [  0     0     0     0     0     0     0     1    17     4 , zeros(1,35)];

% Norma 4/5
if( mm == 1)
y = y+   norm((modY-Data)./Data);
elseif(mm == 2)
y =  y+  norm([Mp,Fp] - [M(:,end)', Fe(:,end)']);
else
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
end


% data 5


Data  = [ 183	56	30	103	97];
% In put daily death
 d = [ 0.0256	0.0263	0.4324	0	0.0238	0	0	0	0	0	0	zeros(1,40)];



% initial values 

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
    
    

   

if wh ==0
    for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
else
    for t = 2:tt
    [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
end




modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));
Mp = [  0	0	0	0	0	0	0	2	20	0	1	 zeros(1,34)];
Fp = [  0	0	0	0	0	0	0	0	12	0	2	0	1	0	0	0	1, zeros(1,28)];

% Norma 5/5
if( mm == 1)
y = y+   norm((modY-Data)./Data);
elseif(mm == 2)
y =  y+  norm([Mp,Fp] - [M(:,end)', Fe(:,end)']);
else
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
end

end