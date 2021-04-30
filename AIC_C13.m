function y = AIC_C13(x, pic)
% finds AIC for variation C13
km = x(1)  ;
kf =x(2) ;
d = x(3).*ones(46,1);
tt =20;
mm = 3;
dl =0;
p2 = [0.0043,1.61];


if pic ==0
      toG = 14;
Fe = zeros(tt, toG);
M = zeros(tt, toG);

Fe(1,2) = 13;
M(1,2) = 13;

K = zeros(tt,1);
K(1:(dl+1),:) = 30; 

    for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end

modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));

    
    %%%%%%%%%
    %%%%%%%%%%%
    %%%%
elseif pic ==1
      toG = 17;
Fe = zeros(tt, toG);
M = zeros(tt, toG);

Fe(1,2) = 13;
M(1,2) = 13;

K = zeros(tt,1);
K(1:(dl+1),:) = 30; 


    for t = 2:tt
    [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end

    modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));

    
    
    %%%%%%%%%
    %%%%%%%%%%%%
    %%%%%
elseif pic == 2
sl = [1, 1];

g = [1 0.45];
gm = 7;


Fe = zeros(tt, 22);
M = zeros(tt, 22);


Fe(1,2) = 13;
M(1,2) =13;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
 
    
t = 2;
  nn = sum(M(1,2:13) + Fe(1,2:13));
  

      
      
      
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
  

   
        for t = 3:tt

        nn = sum(M((t-2),2:13) + Fe((t-2),2:13));
        [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);

        end
  
        modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:13) + M(:,8:13),2));
modY(5) = sum(sum(Fe(:,14:19) + M(:,14:19),2));
modY(6) = sum(sum(M(:,20:22),2));
modY(7) = sum(sum(Fe(:,20:22),2));

end






Data  = [ 44    19    23    40    48     8     7];



% Norma 1/5
Mp = [0     0     0     0     0     0     0     0     4     4 zeros(1,10)];
Fp = [ 0     0     0     0     0     0     0     0     3     3     1 zeros(1,9)];
 
if( mm == 1)
y =    norm((modY-Data)./Data);
elseif(mm == 2)
y =    norm([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)']);
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =    y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5); 
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =    y2;
    end
end



% 2nd data set




Data  = [ 43    23    24    71    66     8    11];


% Norma 2/5
Mp = [0     0     0     0     0     0     0     0     6     2  zeros(1,10)];
Fp = [ 0     0     0     0     0     0     0     0     3     8  zeros(1,10)];

if( mm == 1)
    
else
   if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
end
% Third

Data  = [42    26    21    64    71    11    13];


Fp = [0     0     0     0     0     0     0     0     7     4     1     0     0     1 zeros(1,6)];
Mp = [ 0     0     0     0     0     0     0     0     8     3 zeros(1,10)];

% Norma 3/3

if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
   
end


% fourth data

Data  = [48    30    13    43    47  ];


Fp = [0	0	0	0	0	0	0	0	7	0	2 zeros(1,9)];
Mp = [ 0	0	0	0	0	0	0	1	7	0	2 zeros(1,9)];

% Norma 4/5

if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
   
end


% fifth data 
Data  = [49    23    9    66    56  ];
% In put daily death


Fp = [0	0	0	0	0	0	0	6	7 zeros(1,11)];
Mp = [ 0	0	0	0	0	0	0	0 12 zeros(1,11)];

% Norma 5/5

if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
   
end


tt = 45;


if pic ==0
toG = 14;
Fe = zeros(tt, toG);
M = zeros(tt, toG);

Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);
K(1:(dl+1),:) = 30; 

     
    for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
    
    modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));

elseif pic == 1
      toG = 17;
Fe = zeros(tt, toG);
M = zeros(tt, toG);

Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);
K(1:(dl+1),:) = 30; 

    for t = 2:tt
    [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
    end
modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));


%%%%%%%%
%%%%%%%%%%%%%
%%%
elseif pic ==2
sl = [1, 1];

g = [1 0.45];

gm = 7;

dl =0;
Fe = zeros(tt, 22);
M = zeros(tt, 22);


Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 

 t = 2;
  nn = sum(M(1,2:13) + Fe(1,2:13));

      
      
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
  

   
        for t = 3:tt

        nn = sum(M((t-2),2:13) + Fe((t-2),2:13));
        [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);

        end
  
modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:13) + M(:,8:13),2));
modY(5) = sum(sum(Fe(:,14:19) + M(:,14:19),2));
modY(6) = sum(sum(M(:,20:22)));
modY(7) = sum(sum(Fe(:,20:22)));


end





Data  = [177   109    88   339   128    17    20];

Mp = [0     0, 0     0     0     0     0     0     7     8     0     1     0     0     0     1, zeros(1, 29)];
Fp = [0     0     0     0     0     0     0     0     3    10     6     1, zeros(1,33)];

% Norma 1/5
if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
end

% 2nd data set




Data  = [    160    79    67   531   168    32    18];

% Norma 2/4
Mp = [ 0     0     0     0     0     0     0     3    26     1     1     1, zeros(1, 33)];
Fp = [0     0     0     0     0     0     0     0    10     6     2 , zeros(1,34)];


if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
end


% Third

Data  = [   167    68    64   237   123    35    25];


Mp = [0     0     0     0     0     0     0    24     8     1     0     0     0     1     1  ,zeros(1,30)];
Fp = [0     0     0     0     0     0     0     4    12     5     3     1, zeros(1,33)];

% Norma 3/5


if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
end


% fourth


Data  = [ 156    63    71   273   238    34    22];

Mp = [   0     0     0     0     0     0     0    24     9     1  , zeros(1,35)];
Fp = [  0     0     0     0     0     0     0     1    17     4 , zeros(1,35)];

% Norma 4/5

if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
end


% Data 5


Data  = [ 183    56    30   103   97];

Mp = [  0	0	0	0	0	0	0	2	20	0	1	 zeros(1,34)];
Fp = [  0	0	0	0	0	0	0	0	12	0	2	0	1	0	0	0	1, zeros(1,28)];

% Norma 5/5

if( mm == 1)
    
else
    if pic ==2
    y2 = (modY(1:5)-Data(1:5))./Data(1:5);
    y2 =  sum(y2.^2) + sum((([Mp,Fp] - [sum(M(:,20:22),2)', sum(Fe(:,20:22),2)'])./4).^2);
   y =  y+  y2;
    else
        y2 = (modY(1:5)-Data(1:5))./Data(1:5);
   y2 =  sum(y2.^2) + sum((([Mp,Fp] - [M(:,end)', Fe(:,end)'])./4).^2);
   y =  y+  y2;
    end
end

 


end