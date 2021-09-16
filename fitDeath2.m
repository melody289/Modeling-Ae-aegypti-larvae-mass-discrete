function y = fitDeath2(x,abpar,p,varD)
% Fits D1 when varD = 1, D2 when varD = 2, D3 when varD = 3

% Load Survival Data - VarD
SurvivalData

Hd = HD(:,2)';
Hdm = HD(:,1)';
Ld = LD(:,2)';
Ldm = LD(:,1)';

d = x;

km = p(1);
kf = p(2);


% Low density
tt = 20;
IC = 13;


VarD3b


y = ((totF-Ld)).^2;
y = sum((y+ ((totM-Ldm)).^2));

% High density
tt = 45;
IC = 39;
  

VarD3b


y2 = ((totF-Hd)).^2 ;
y2 = sum((y2+ ((totM-Hdm)).^2))/4;
y = y + y2;

end