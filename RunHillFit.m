%% Run variation in Hill exponent

load('BestCdata.mat')
clearvars -except abpar c3;

km = c3(1);
kf = c3(2);

expp = [1:5,10];
for ii = 1:6
    
abpar(4) = expp(ii);
g3b = @(x) fitDeath(x,abpar,c3,3);

Aeq = []; beq = [];
lb = [ 0.001  0.001 1  ];
ub = [ 0.5 0.5 100 ]; 

x = zeros(40,3);
y = zeros(40,1);
for j = 1:7
    for i = 1:7
        x0 = [ j/50, i/50,   (mod(j,4)*3 + mod(i,7)*2 + 10)];
        [x((i + (j-1)*7),:), y(i + (j-1)*7)] = fmincon(g3b,x0,Aeq,beq,Aeq,beq,lb,ub);
    end
end

% Output (x is parameters, y is error)
id = find(min(y)==y,1,'first');
pd3 = x(id,:);
d = pd3;

% low density
tt = 20;
IC = 13;
VarD3

totF =  sum(sum(Fe(:,20:22)));
totM =  sum(sum(M(:,20:22)));

FsurvL(ii) = totF/13;
MsurvL(ii) = totM/13;

% High density
tt = 45;
IC = 39;
VarD3

totF =  sum(sum(Fe(:,20:22)));
totM =  sum(sum(M(:,20:22)));

FsurvH(ii) = totF/39;
MsurvH(ii) = totM/39;

end

save('VaryHill.mat','FsurvH','MsurvH','FsurvL','MsurvL')