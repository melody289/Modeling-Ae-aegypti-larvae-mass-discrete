% Variation E

Fe = zeros(tt, 22);
M = zeros(tt, 22);

K = zeros(tt,1);

Fe(1,2) = IC;
M(1,2) = IC;
K(1,:) = 30; 

pre_g = [1 1];

par.km = km;
par.kf = kf;
par.a = abpar(1);
par.b = abpar(2);
par.q = abpar(3);

par.sl = sl;
par.pre_g = pre_g;
par.growth = 1;  % include growth
par.nu = nu;
par.g = g;
par.hcon = 100;
par.hill = 3;
par.con1 = con1;
par.con2 = con2;
par.d = d;

for t = 2:tt
    par.N1 = sum(M((t-1),2:19) + Fe((t-1),2:19));
    [Fe(t,:) , M(t,:),  K(t)] = discreteL3(Fe(t-1,:), M(t-1,:), K(t-1), par);
end


% proportion of those that pupate by  size
totm =  sum(sum(Fe(:,20:22)));
Lm = sum(Fe(:,20))./totm;
Mm = sum(Fe(:,21))./totm;
Hm = sum(Fe(:,22))./totm;
