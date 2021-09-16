% Variation C3

Fe = zeros(tt, 22);
M = zeros(tt, 22);

Fe(1,2) = IC;
M(1,2) = IC;


K = zeros(tt,1);
K(1,:) = 30; 

par.km = km;
par.kf = kf;
par.a = abpar(1);
par.b = abpar(2);
par.q = abpar(3);

par.pre_g = [0 0]; % don't require certain constants
par.growth = 0; % exclude growth

for t = 2:tt
    par.d = d(t-1);
    par.N1 = sum(M((t-1),2:13) + Fe((t-1),2:13));
    [Fe(t,:) , M(t,:),  K(t)] = discreteL3(Fe(t-1,:), M(t-1,:), K(t-1), par);
end

modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:13) + M(:,8:13),2));
modY(5) = sum(sum(Fe(:,14:19) + M(:,14:19),2));
modY(6) = sum(sum(M(:,20:22),2));
modY(7) = sum(sum(Fe(:,20:22),2));