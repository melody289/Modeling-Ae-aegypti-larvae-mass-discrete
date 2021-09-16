% Variation C2

Fe = zeros(tt, 17);
M = zeros(tt, 17);

Fe(1,2) = IC;
M(1,2) = IC;

par.km = km;
par.kf = kf;
par.a = abpar(1);
par.b = abpar(2);
par.q = abpar(3);

K = zeros(tt,1);
K(1,:) = 30; 

for t = 2:tt
    par.d = d(t-1);
    [Fe(t,:), M(t,:), K(t,1)] = discreteL2(Fe(t-1,:), M(t-1,:), K(t-1), par);
end

modY = zeros(1,7);
modY(1) = sum(Fe(:,2) + M(:,2));
modY(2) = sum(sum(Fe(:,3:4) + M(:,3:4),2));
modY(3) = sum(sum(Fe(:,5:7) + M(:,5:7),2));
modY(4) = sum(sum(Fe(:,8:10) + M(:,8:10),2));
modY(5) = sum(sum(Fe(:,11:(end-1)) + M(:,11:(end-1)),2));
modY(6) = sum(M(:,end));
modY(7) = sum(Fe(:,end));