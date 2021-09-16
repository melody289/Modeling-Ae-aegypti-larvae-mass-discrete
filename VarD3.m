% Variation D3

Fe = zeros(tt, 22);
M = zeros(tt, 22);
K = zeros(tt,1);

Fe(1,2) = IC;
M(1,2) = IC;
K(1,:) = 30; 

par.km = km;
par.kf = kf;
par.a = abpar(1);
par.b = abpar(2);
par.q = abpar(3);

par.pre_g = [0 1]; % don't include certain constants
par.growth = 0;  % exclude growth
par.d = d;
par.hill = abpar(4);


for t = 2:tt
	par.N1 = sum(M((t-1),2:13) + Fe((t-1),2:13));
    [Fe(t,:) , M(t,:),  K(t)] = discreteL3(Fe(t-1,:), M(t-1,:), K(t-1), par);
end
    
totF =  sum(sum(Fe(:,20:22)));
totM =  sum(sum(M(:,20:22)));