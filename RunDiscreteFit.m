% Run first Variation


% this is for C1
% for  0.7038    0.6379 error 41.1107
pa2 = [0.0043,2];
g3b = @(x) fitDTnL(x,pa2, 0) + fitDTnH(x,pa2, 0);

A = []; b = [];
Aeq = []; beq = [];
lb = [0,0];
ub = [1,1];

x = zeros(81,2);
for j = 1:9
for i = 1:9
    x0 = [i/10, j/10];
[x(i+ 9*(j-1),:), y(i+ 9*(j-1))] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
end
end

%% this is be C2
%0.8014    0.7162 error 38.4438
%pa2 = [0.0043,1.61];
g3b = @(x) fitDTnL(x,pa2, 1) + fitDTnH(x,pa2, 1);

A = []; b = [];
Aeq = []; beq = [];
lb = [0,0];
ub = [1,1];
x = zeros(81,2);
for j = 1:9
for i = 1:9
    x0 = [i/10, j/10];
[x(i+ 9*(j-1),:), y(i+ 9*(j-1))] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
end
end



%% This is C3
% 0.9435    0.8549 Error 35.3020 
pa2 = [0.0043,2];
g3b = @(x) fitL(x,pa2,0) + fitDH(x,pa2,0);
A = []; b = [];
Aeq = []; beq = [];
lb = [0,0];
ub = [1,1];
x = zeros(81,2);
for j = 1:9
for i = 1:9
    x0 = [i/10, j/10];
[x(i+ 9*(j-1),:), y(i+ 9*(j-1))] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
end
end


%% fitting death C3
p2 = pa2;
 d= 0.05.*ones(24,1);
%p = [ 0.94, 0.85];
p = [ 0.91, 0.82];
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

        nn = sum(M((t-1),2:13) + Fe((t-1),2:13));
        [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);

        end
  
yy = (sum(sum(M(:,20:22))) - [32, 35,34, 17, 23]).^2 +  (sum(sum(Fe(:,20:22))) - [18 25 22 20 16]).^2;

%[sum(sum(Fe(:,20:22))) sum(sum(M(:,20:22)))]

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

        nn = sum(M((t-1),2:13) + Fe((t-1),2:13));
        [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyG2(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);

        end



%yy = (sum(sum(M(:,20:22))) - [32, 35,34, 17, 23]).^2 +  (sum(sum(Fe(:,20:22))) - [18 25 22 20 16]).^2;
yy = sum(yy)./3 + sum((sum(sum(M(:,20:22))) - [8 11 8 9 13]).^2 +  (sum(sum(Fe(:,20:22))) - [11 13 7 10 12]).^2)

%[sum(sum(Fe(:,20:22))) sum(sum(M(:,20:22)))]


%%  C1

 d= 0.05.*ones(24,1);
%p = [ 0.7    0.64];
p = [0.67 0.61];


 toG = 14;
tt = 20;

% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)







% In put daily death


km = p(1)  ;
kf =p(2) ;
% initial values 

dl =0;
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
  
%[sum(sum(Fe(:,14))) sum(M(:,14))]

yy = (sum(sum(M(:,14))) - [32, 35,34, 17, 23]).^2 +  (sum(sum(Fe(:,14))) - [18 25 22 20 16]).^2;

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



%yy = (sum(sum(M(:,14))) - [32, 35,34, 17, 23]).^2 +  (sum(sum(Fe(:,14))) - [18 25 22 20 16]).^2;
yy = sum(yy)./3 + sum((sum(sum(M(:,14))) - [8 11 8 9 13]).^2 +  (sum(sum(Fe(:,14))) - [11 13 7 10 12]).^2)
%[sum(sum(Fe(:,14))) sum(M(:,14))]

%%  C2

 d= 0.057.*ones(24,1);
%p = [0.8 0.72];
p = [ 0.91 0.82];


 toG = 17;
tt = 20;

% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)







% In put daily death


km = p(1)  ;
kf =p(2) ;
% initial values 

dl =0;
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
% [sum(sum(Fe(:,17))) sum(M(:,17))] 

yy = (sum(sum(M(:,17))) - [32, 35,34, 17, 23]).^2 +  (sum(sum(Fe(:,17))) - [18 25 22 20 16]).^2;


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
%[sum(sum(Fe(:,17))) sum(M(:,17))]

yy = sum(yy)./3 + sum((sum(sum(M(:,17))) - [8 11 8 9 13]).^2 +  (sum(sum(Fe(:,17))) - [11 13 7 10 12]).^2)
%% Finding AIC

% Es = AIC_C13([0.7 0.64, 0.051],0);
% Ep2 = AIC_C13([0.8 0.72, 0.05],1);
% Eg2 = AIC_C13([0.94, 0.85, 0.049],2);

% a= 0.001
Es = AIC_C13([ 0.63, 0.58 ,0.049],0);
Ep2 = AIC_C13([ 0.72,0.64, 0.049],1);
Eg2 = AIC_C13([ 0.87,0.77 0.048],2);

%a= 0.01
% Es = AIC_C13([ 0.92, 0.8 ,0.053],0);
% Ep2 = AIC_C13([ 0.99,0.88, 0.049],1);
% Eg2 = AIC_C13([ 1 0.99 0.049],2);

% % b= 1
% Es = AIC_C13([ 0.79, 0.71 ,0.051],0);
% Ep2 = AIC_C13([ 0.9,0.8, 0.048],1);
% Eg2 = AIC_C13([ 1 0.95 0.048],2);

% b= 2
% Es = AIC_C13([ 0.67, 0.61 ,0.05],0);
% Ep2 = AIC_C13([ 0.77,0.69, 0.051],1);
% Eg2 = AIC_C13([ 0.91 0.82 0.049],2);

k = 3; n = 10;

Es = n.*log10(Es/n) + 2*k + 2*k*(k+1)/(n-k-1)
Ep2 = n.*log10(Ep2/n) + 2*k + 2*k*(k+1)/(n-k-1)
Eg2 = n.*log10(Eg2/n) + 2*k + 2*k*(k+1)/(n-k-1)


%% Run second Variation D1- D3


% Survival Data
lowM =  [8 16 10 10  9 11 14  9 12 13  8  9 12  9  7 8   13 10 11  8];
lowF = [9  8 10 10 14 14 12 11 10  5  7 11 10 10 12  7 12 9 13 11];
highM = [29 31 18 35 29 25 25 22 23 34 35 32 17];
highF = [22 28 21 21 19 23 32 34 16 22 25 18 20];
%% 
[~,b] = sort(lowF);
[~,b2] = sort(highF);
llow = [lowF' lowM'];
%hh2 = figure;
%ax = gca;
%ax.XAxisLocation = 'origin';
%hold on

plot(1:20, lowF(b)./13,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
hold on
plot(1:20,lowM(b)./13,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])


for i = 1:20
    
    plot([i i] , [lowF(b(i))./13, lowM(b(i))./13], 'k')
    
end

hold on
plot(23:35, highF(b2)./39,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
hold on

plot(23:35,highM(b2)./39,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])


for i = 23:1:35
    
    plot([i i] , [highF(b2(i-22))./39, highM(b2(i-22))./39], 'k')
    
end


plot([37, 39],[ 10.35/13 27.3/39] ,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([37, 39], [ 10.25/13 23.15/39] ,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])


plot([41, 43],[ 10/13 29/39] ,'v', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [0.8500    0.3250    0.0980], 'MarkerFaceColor', [ 0.8500    0.3250    0.0980])
plot([41 43], [ 10/13 22/39] ,'^', 'LineWidth',1.7, 'MarkerSize', 11, 'Color', [ 0    0.4470    0.7410] , 'MarkerFaceColor', [ 0    0.4470    0.7410])
plot([43 43], [ 29/39 22/39] ,'k')
plot([39 39 ], [ 27.1/39 23.3/39] ,'k')

plot([22,22], [0.2,1.3], 'k', 'LineWidth', 2.5)
plot([36 36], [0.2,1.3], 'k', 'LineWidth', 2.5)
axis([0.5,43.5, 0.3, 1.25])
set(gca,'FontSize', 18)
ylabel('Surival Proportion')
set(gca, 'Position', [0.0596    0.1624    0.905    0.8150])
s = string([2:2:20 ,2:2:13]);
s(17:20) = {  'Low', 'High', 'Low', 'High'};

set(gca, 'XTick', [2:2:20, 24:2:35 37 39, 41 43], 'XTickLabel', s)




%% Single Constant fit

g3b = @(x) fitDeath( x, 0);


A = []; b =[];
Aeq = []; beq = [];


lb =  0.001 ;  
ub = 0.5;
x = zeros(12,1);
y = zeros(12,1);


for i = 1:12
    x0 = i/32;
[x(i,:), y(i)] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
end



% Ubiquitous 0.0507 (first)
% 0.0383 (2nd) 
% 0.042 (3rd diff)




%% two constants fit together       fitDeath( [ 0.0556    0.0459 ], 1)   
%[0.0423    0.0348]   (2nd)
%[   0.0454    0.0376]  (3rd diff)   0.042

g3b = @(x) fitDeath( x, 1);


A = []; b =[];
Aeq = []; beq = [];

%Aeq = [0 0  1 -1  0 0 ]; beq = 0;

lb = [ 0.001  0.001 ];  % 
ub = [ 0.5 0.5]; % 
x = zeros(81,2);
y = zeros(81,1);

for j = 1:9
for i = 1:9
    x0 = [ j/25,  i/25];
[x((i + (j-1)*9),:), y(i + (j-1)*9)] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
%[x(i,:), y(i)] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
end

end




%% fit female density and male constant together .

% old  0.0488, 0.0324 12 25
% 0.0744    0.0337 9 23 (1st)   
%  0.066    0.025   24              (3rd diff)  
g3b = @(x) fitDeath( x, 2);

%A = [ 0 0    1 -1 ]; b = 0;
Aeq = []; beq = [];


lb = [ 0.001  0.001 1  ];  % 0.001 0.001 0.5 0.5
ub = [ 0.5 0.5 100 ]; % 1 100
x = zeros(81,3);
y = zeros(81,1);

for j = 1:9
for i = 1:9
    x0 = [ j/50, i/50,   (mod(j,4)*3 + mod(i,7)*2 + 10)];
[x((i + (j-1)*9),:), y(i + (j-1)*9)] = fmincon(g3b,x0,Aeq,beq,Aeq,beq,lb,ub);
%[x(i,:), y(i)] = fmincon(g3b,x0,A,b,Aeq,beq,lb,ub);
end

end

%% . AIC    0.066    0.025   24              (3rd diff)  [   0.045    0.038]  (3rd diff)   0.042


m1 = fitDeath(  0.042, 0); %3rd
m2 = fitDeath( [ 0.045    0.038 ], 1);
md = fitDeath( [  0.066    0.025   24  ], 2); % other
%  -130.8659 -129.1319 -127.1076,   -141.2445 -139.3207 -137.857 ,  -141.2445 -139.3207 -137.1641
n = 66;
m1 = n*log10(m1/n) + 2 + 2*2/(n-2);
m2 = n*log10(m2/n) + 2*2 + 2*2*3/(n-3);
md = n*log10(md/n) + 2*2 + 2*2*3/(n-3);
%md = n*log10(md/n) + 2*3 + 2*3*4/(n-4);
[ m1 m2 md]


%% Variation E: growth fit


A = []; b = [];
Aeq = []; beq = [];

lb = [0 0 0.5 0.5];

ub = [1 1  12 12];
x = zeros(80,4);
y = zeros(80,1);

for j = 1:13
for i = 1:13
    x0 = [ i/10, j/20, (mod(i+1,6)+1), (mod(j+1,8) +1) ];
    
[x((i + (j-1)*9),:), y(i + (j-1)*9)] = fmincon(@fitStar,x0,A,b,Aeq,beq,lb,ub);
end

end

