%% 0.7281    0.6781, . .8770    0.7580 0.7187    0.6687



h1 = figure;

% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)


% + norm((modY(6:7)-Data(6:7))./Data(6:7))



 

% 2nd

Data1 = [78     0     0     0     0     0     0;
    55    23     0     0     0     0     0;
    27    41    10     0     0     0     0;
     0    14    45    19     0     0     0;
     0     1     4    73     0     0     0;
     0     0     2    72     3     0     0;
     0     0     1    29    44     0     0;
     0     0     1    22    47     3     0;
     0     0     1    21    12    26    10;
     0     0     1    21     5     1     6;
     0     0     1    20     3     1     2;
     0     0     1    20     2     1     0;
     0     0     0    21     2     0     0;
     0     0     0    21     2     0     0;
     0     0     0    20     2     0     0;
     0     0     0    20     2     0     0;
     0     0     0    20     2     0     0;
     0     0     0    20     2     0     0;
     0     0     0    19     2     0     0;
     0     0     0    16     2     0     0;
     0     0     0    12     2     0     0;
     0     0     0    10     2     0     0;
     0     0     0     7     2     0     0;
     0     0     0     6     2     0     0;
     0     0     0     5     2     0     0;
     0     0     0     5     2     0     0;
     0     0     0     5     2     0     0;
     0     0     0     4     2     0     0;
     0     0     0     4     2     0     0;
     0     0     0     3     2     0     0;
     0     0     0     3     2     0     0;
     0     0     0     3     2     0     0;
     0     0     0     3     2     0     0;
     0     0     0     2     2     0     0;
     0     0     0     2     2     0     0;
     0     0     0     1     2     0     0;
     0     0     0     1     2     0     0;
     0     0     0     1     2     0     0];

 tt = length(Data1);

 MM = sum(Data1(:,6));
 FF = sum(Data1(:,7));
 %h2 = figure;
subplot(2,2,1)
plot(1:tt, (Data1(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)
set(gca, 'FontSize', 18)

subplot(2,2,2)
plot(1:tt, (Data1(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)
set(gca, 'FontSize', 18)


% Third
Data2 = [  78     0     0     0     0     0     0;
    57    19     0     0     0     0     0;
    31    38     5     0     0     0     0;
     1     2    56    15     0     0     0;
     0     2     3    64     0     0     0;
     0     1     0    38    28     0     0;
     0     1     0    15    51     0     0;
     0     1     0    12    26    24     4;
     0     1     0     8    10     8    12;
     0     1     0     8     4     1     5;
     0     1     0     8     1     0     3;
     0     1     0     7     1     0     1;
     0     0     0     5     1     0     0;
     0     0     0     4     1     1     0;
     0     0     0     4     0     1     0;
     0     0     0     4     0     0     0;
     0     0     0     4     0     0     0;
     0     0     0     4     0     0     0;
     0     0     0     4     0     0     0;
     0     0     0     4     0     0     0;
     0     0     0     4     0     0     0;
     0     0     0     4     0     0     0;
     0     0     0     3     0     0     0;
     0     0     0     2     0     0     0;
     0     0     0     2     0     0     0;
     0     0     0     2     0     0     0;
     0     0     0     2     0     0     0;
     0     0     0     2     0     0     0;
     0     0     0     1     0     0     0;
     0     0     0     1     0     0     0;
     0     0     0     1     0     0     0;
     0     0     0     1     0     0     0;
     0     0     0     1     0     0     0;
     0     0     0     1     0     0     0;
     0     0     0     1     0     0     0;
     0     0     0     1     0     0     0];
tt = length(Data2);


 MM(2) = sum(Data2(:,6));
 FF(2) = sum(Data2(:,7));
 %h2 = figure;
subplot(2,2,1)
hold on
plot(1:tt, (Data2(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

subplot(2,2,2)
hold on
plot(1:tt, (Data2(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)





Data3 = [78     0     0     0     0     0     0;
    53    24     0     0     0     0     0;
    25    37    13     0     0     0     0;
     0     1    56    17     0     0     0;
     0     1     2    71     0     0     0;
     0     0     0    44    26     0     0;
     0     0     0    14    55     0     0;
     0     0     0    10    34    24     1;
     0     0     0    10     8     9    17;
     0     0     0    10     3     1     4;
     0     0     0     9     4     0     0;
     0     0     0     9     4     0     0;
     0     0     0     8     4     0     0;
     0     0     0     8     4     0     0;
     0     0     0     7     4     0     0;
     0     0     0     7     4     0     0;
     0     0     0     7     4     0     0;
     0     0     0     5     6     0     0;
     0     0     0     5     6     0     0;
     0     0     0     5     6     0     0;
     0     0     0     5     6     0     0;
     0     0     0     5     6     0     0;
     0     0     0     4     6     0     0;
     0     0     0     3     6     0     0;
     0     0     0     3     6     0     0;
     0     0     0     2     6     0     0;
     0     0     0     1     6     0     0;
     0     0     0     1     6     0     0;
     0     0     0     1     6     0     0;
     0     0     0     1     6     0     0;
     0     0     0     1     6     0     0];

 
  MM(3) = sum(Data3(:,6));
 FF(3) = sum(Data3(:,7));
 
tt = length(Data3);
subplot(2,2,1)
hold on
plot(1:tt, (Data3(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)
title('Male')

subplot(2,2,2)
hold on
plot(1:tt, (Data3(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

title('Female')





%tt = length(d);


% 1st data set
%

%

Data4 = [ 78     0     0     0     0     0     0;
    59    16     0     0     0     0     0;
    26    39     6     0     0     0     0;
    14    14    27     9     0     0     0;
     0     4    21    33     0     0     0;
     0     3     9    42     4     0     0;
     0     3     5    22    28     0     0;
     0     3     5    15    34     0     0;
     0     3     4    14    26     7     3;
     0     3     4    14     8     8    10;
     0     2     2    16     2     0     6;
     0     2     1    17     0     1     1;
     0     2     0    16     2     0     0;
     0     2     0    16     2     0     0;
     0     2     0    16     2     0     0;
     0     1     0    16     1     1     0;
     0     1     0    15     1     0     0;
     0     1     0    15     1     0     0;
     0     1     0    13     1     0     0;
     0     1     0    10     1     0     0;
     0     1     0     9     1     0     0;
     0     1     0     9     1     0     0;
     0     1     0     7     1     0     0;
     0     1     0     5     1     0     0;
     0     1     0     4     1     0     0;
     0     1     0     3     2     0     0;
     0     0     1     2     2     0     0;
     0     0     1     1     2     0     0;
     0     0     1     0     2     0     0;
     0     0     1     0     2     0     0];

 tt = length(Data4);
 
  MM(4) = sum(Data4(:,6));
 FF(4) = sum(Data4(:,7));
%
subplot(2,2,1)
hold on
plot(1:tt, (Data4(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

subplot(2,2,2)
hold on
plot(1:tt, (Data4(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)


% Final high density


Data5h = [  0	0	0	0	0	0	0	2	20	0	1	 zeros(1,7);   0	0	0	0	0	0	0	0	12	0	2	0	1	0	0	0	1 0];
tt = length(Data5h);
Data5h = [  zeros(tt,5), Data5h'];

 
%  MM(4) = sum(Data5h(:,1));
 %FF(4) = sum(Data5h(:,2));
%
subplot(2,2,1)
hold on
plot(1:tt, (Data5h(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

subplot(2,2,2)
hold on
plot(1:tt, (Data5h(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)



%%%%%
%%%%%%          LOW Density
%%%%%
%%%%%%
%%%%%
%%%%%%
%%%%%
%%%%%%
%%%%%
%%%%%%

Data5 = [  26     0     0     0     0     0     0;
    15    10     0     0     0     0     0;
     2    13    10     0     0     0     0;
     0     0    11    14     0     0     0;
     0     0     2    23     0     0     0;
     0     0     1    23     1     0     0;
     0     0     0     3    20     0     0;
     0     0     0     1    21     0     0;
     0     0     0     1    12     6     3;
     0     0     0     1     2     2     8;
     0     0     0     1     2     0     0;
     0     0     0     1     2     0     0;
     0     0     0     1     2     0     0;
     0     0     0     1     2     0     0;
     0     0     0     1     2     0     0];
 MM(5) = sum(Data5(:,6));
 FF(5) = sum(Data5(:,7));
 
tt = length(Data5);
subplot(2,2,3)
hold on
plot(1:tt, (Data5(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

subplot(2,2,4)
hold on
plot(1:tt, (Data5(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)




Data6 = [   26     0     0     0     0     0     0;
    13    13     0     0     0     0     0;
     3    12    11     0     0     0     0;
     0     1     8    17     0     0     0;
     0     0     1    24     0     0     0;
     0     0     1    19     5     0     0;
     0     0     0     1    24     0     0;
     0     0     0     1    24     0     0;
     0     0     0     1     9     8     7;
     0     0     0     1     2     3     4;
     0     0     0     0     2     0     1;
     0     0     0     0     2     0     0;
     0     0     0     0     2     0     0;
     0     0     0     0     1     0     1;
     0     0     0     0     1     0    0];
 tt = length(Data6) ;
  MM(6) = sum(Data6(:,6));
 FF(6) = sum(Data6(:,7));
subplot(2,2,3)
hold on
plot(1:tt, (Data6(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

subplot(2,2,4)
hold on
plot(1:tt, (Data6(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

set(gca,'FontSize', 18)
%
 
%
Data7 = [26     0     0     0     0     0     0;
    17     8     0     0     0     0     0;
     1    11    11     0     0     0     0;
     0     0    10     7     0     0     0;
     0     0     1    16     0     0     0;
     0     0     1    14     2     0     0;
     0     0     0     1    16     0     0;
     0     0     0     1    16     0     0;
     0     0     0     1     9     4     3;
     0     0     0     0     3     4     3;
     0     0     0     0     2     0     1;
     0     0     0     0     2     0  0];
  MM(7) = sum(Data7(:,6));
 FF(7) = sum(Data7(:,7));
 tt = length(Data7) ;
subplot(2,2,3)
hold on
plot(1:tt, (Data7(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)


subplot(2,2,4)
hold on
plot(1:tt, (Data7(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)


% DAta set 4 low


Data4l =   [0	0	0	0	0	0	0	0	7	0	2 0; 0	0	0	0	0	0	0	1	7	0	2 0];

 tt = length(Data4l) ;
 Data4l = [zeros(tt,5), Data4l'];
subplot(2,2,3)
hold on
plot(1:tt, (Data4l(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)


subplot(2,2,4)
hold on
plot(1:tt, (Data4l(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)

% Data set 5 low
Data5l =  [0	0	0	0	0	0	0	6	7 0; 0	0	0	0	0	0	0	0 12 0];

 tt = length(Data5l) ;
 Data5l = [zeros(tt,5), Data5l'];
subplot(2,2,3)
hold on
plot(1:tt, (Data5l(:,6)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)
set(gca, 'FontSize', 18)
xlabel('Days')

subplot(2,2,4)
hold on
plot(1:tt, (Data5l(:,7)), '-*','LineWidth',1, 'Color', [0.4660    0.6740    0.1880],  'MarkerSize', 4)
set(gca, 'FontSize', 18)
xlabel('Days')
box on



%%  simple
p2 = [0.0043,1.61];
 d= 0.046.*ones(24,1);
p = [ 0.69    0.63];


 toG = 14;
tt = 20;

% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)







% In put daily death


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
    
    
 for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
end
  
subplot(2,2,1) 
plot(1:tt, M(:,14), '-*','LineWidth',1.7, 'Color', [0    0.4470    0.7410],  'MarkerSize', 5)
set(gca, 'FontSize', 18)

subplot(2,2,2)
plot(1:tt,  Fe(:,14), '-*','LineWidth',1.7, 'Color', [0    0.4470    0.7410],  'MarkerSize', 5)
set(gca, 'FontSize', 18)


tots = [sum(Fe(:,14)), sum(M(:,14))];
Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 13;
M(1,2) =13;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
end


subplot(2,2,3) 
plot(1:tt, M(:,14), '-*','LineWidth',1.7, 'Color', [0    0.4470    0.7410],  'MarkerSize', 5)
set(gca, 'FontSize', 18)

subplot(2,2,4)
plot(1:tt,  Fe(:,14), '-*','LineWidth',1.7, 'Color', [0    0.4470    0.7410],  'MarkerSize', 5)
set(gca, 'FontSize', 18)

tots = [tots; sum(Fe(:,14)), sum(M(:,14))];


%%  p2

p2 = [0.0043,1.61];
 d= 0.045.*ones(24,1);
p = [ 0.78    0.70];


 toG = 17;
tt = 20;

% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)







% In put daily death


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
    
    
 for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
end
  
subplot(2,2,1) 
plot(1:tt, M(:,17), '-*','LineWidth',1.7, 'Color', [0.8500    0.3250    0.0980],  'MarkerSize', 5)
set(gca, 'FontSize', 18)

subplot(2,2,2)
plot(1:tt,  Fe(:,17), '-*','LineWidth',1.7, 'Color', [0.8500    0.3250    0.0980],  'MarkerSize', 5)
set(gca, 'FontSize', 18)

tots = [tots; sum(Fe(:,17)), sum(M(:,17))];

Fe = zeros(tt, toG);
M = zeros(tt, toG);


Fe(1,2) = 13;
M(1,2) =13;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
for t = 2:tt
     [Fe(t,:) , M(t,:),  K(t+dl,1)] = discreteLonlyp2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2));
end

subplot(2,2,3) 
plot(1:tt, M(:,17), '-*','LineWidth',1.7, 'Color', [0.8500    0.3250    0.0980],  'MarkerSize', 5)
set(gca, 'FontSize', 18)

subplot(2,2,4)
plot(1:tt,  Fe(:,17), '-*','LineWidth',1.7, 'Color', [0.8500    0.3250    0.0980],  'MarkerSize', 5)
set(gca, 'FontSize', 18)
tots = [tots; sum(Fe(:,17)), sum(M(:,17))];

%% G2

 d= 0.044.*ones(24,1);
p = [ 0.91, 0.84];

tt = 20;

% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)


sl = [1, 1];

g = [1 0.45];

gm = 7;




% In put daily death


km = p(1)  ;
kf =p(2) ;
% initial values 

dl =0;
Fe = zeros(tt, 22);
M = zeros(tt, 22);


Fe(1,2) = 39;
M(1,2) = 39;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
    
    
 t = 2;
  nn = sum(M(1,2:13) + Fe(1,2:13));

  
      
      
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
  

   
        for t = 3:tt

        nn = sum(M((t-2),2:13) + Fe((t-2),2:13));
        [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);

        end
  
subplot(2,2,1) 
plot(1:tt, sum(M(:,20:22),2), '-*','LineWidth',1.7, 'Color', [0.9290    0.6940    0.1250],  'MarkerSize', 5)
set(gca, 'FontSize', 18)
axis([5,20,0 27])

subplot(2,2,2)
plot(1:tt,  sum(Fe(:,20:22),2), '-*','LineWidth',1.7, 'Color', [0.9290    0.6940    0.1250],  'MarkerSize', 5)
set(gca, 'FontSize', 18)

axis([5,20,0 17])

tots = [tots; sum(sum(Fe(:,20:22),2)), sum(sum(M(:,20:22),2))];

Fe = zeros(tt, 22);
M = zeros(tt, 22);


Fe(1,2) = 13;
M(1,2) =13;

K = zeros(tt,1);

K(1:(dl+1),:) = 30; 
% 

%
    
    
t = 2;
  nn = sum(M(1,2:13) + Fe(1,2:13));
  
      
      
      
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
  

   
        for t = 3:tt

        nn = sum(M((t-2),2:13) + Fe((t-2),2:13));
        [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);

        end



subplot(2,2,3) 
plot(1:tt, sum(M(:,20:22),2), '-*','LineWidth',1.7, 'Color', [0.9290    0.6940    0.1250],  'MarkerSize', 5)
set(gca, 'FontSize', 18)
axis([5,15,0 8])

subplot(2,2,4)
plot(1:tt,  sum(Fe(:,20:22),2), '-*','LineWidth',1.7, 'Color', [0.9290    0.6940    0.1250],  'MarkerSize', 5)
set(gca, 'FontSize', 18)
axis([5,15,0 12])

tots = [tots; sum(sum(Fe(:,20:22),2)), sum(sum(M(:,20:22),2))];