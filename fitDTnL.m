function y = fitDTnL(p,p2, wh)

mm = 3;
if wh ==0
    toG = 14;
else
    toG = 17;
    

end
% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)
tt = 20;

% + norm((modY(6:7)-Data(6:7))./Data(6:7))

% summed larvae values
Data  = [ 44    19    23    40    48     8     7];
% In put daily death
 d = [ 0.0385    0.0800    0.2609     zeros(1,18)    ];


km = p(1)  ;
kf =p(2) ;
% initial values 

dl =0;
Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 13;
M(1,2) =13;

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

% Norma 1/5
Mp = [0     0     0     0     0     0     0     0     4     4 zeros(1,10)];
Fp = [ 0     0     0     0     0     0     0     0     3     3     1 zeros(1,9)];

if( mm == 1)
y =   norm((modY-Data)./Data);
elseif(mm == 2)
y =   norm([Mp,Fp] - [M(:,end)', Fe(:,end)']);
else
y2 = (modY(1:5)-Data(1:5))./Data(1:5);  
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =   y2;
end


% 2nd data set




Data  = [ 43    23    24    71    66     8    11];
% In put daily death
 d = [ 0.0385         0         0         0         0    0.0800    0.0435, zeros(1,14) ];



% initial values 

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 13;
M(1,2) = 13;

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

% Norma 2/5
Mp = [0     0     0     0     0     0     0     0     6     2  zeros(1,10)];
Fp = [ 0     0     0     0     0     0     0     0     3     8  zeros(1,10)];

if( mm == 1)
y = y+   norm((modY-Data)./Data);
elseif(mm == 2)
y =  y+  norm([Mp,Fp] - [M(:,end)', Fe(:,end)']);
else
y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
end



% Third

Data  = [42    26    21    64    71    11    13];
% In put daily death
 d = [ 0         0         0    0.0385, zeros(1,17)  ];



% initial values 

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 13;
M(1,2) = 13;

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
Fp = [0     0     0     0     0     0     0     0     7     4     1     0     0     1 zeros(1,6)];
Mp = [ 0     0     0     0     0     0     0     0     8     3 zeros(1,10)];

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


% Data 4

Data  = [48    30    13    43    47   ];
% In put daily death
 d = [0 0 0.230769231 0.05 zeros(1,20) ];



% initial values 


Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 13;
M(1,2) = 13;

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
Fp = [0	0	0	0	0	0	0	0	7	0	2 zeros(1,9)];
Mp = [ 0	0	0	0	0	0	0	1	7	0	2 zeros(1,9)];

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


Data  = [49    23    9    66    56  ];
% In put daily death

 d = zeros(1,(tt+1));

% initial values 

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 13;
M(1,2) = 13;

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
Fp = [0	0	0	0	0	0	0	6	7 zeros(1,11)];
Mp = [ 0	0	0	0	0	0	0	0 12 zeros(1,11)];

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