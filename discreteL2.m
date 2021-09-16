function [Y, Ym, K, cm, c] = discreteL2(X, Xm, Kin, par)
% Variation C2

% Input:    X = females at time t-1
%           Xm = males at time t-1
%           Kin = resourece at time t-1 

km = par.km; % maximum male transition
kf = par.kf; % maximum female transition
din = par.d; % death
a = par.a; % pre-factor in transition function
b = par.b; % exponent in transition function
q = par.q; % resource decay rate

% Current population
N = sum(Xm(2:16) + X(2:16));

% Death
d = din;
dm = din;

% Transition to Larger weight females
g = 0*ones(2,1); 

% Transition to Larger weight males
gm  = g;
  
% Transition to next class
c = kf./(1+ (a*N)^b);
cm = km./(1+ (a*N)^b);

% Resource function
K = Kin*exp(-q*N);


%% Initialize
Y = zeros(1,17);
Ym = zeros(1,17);


%% LARVAE/PUPAE
% L1_1:  +eggs -L11
Y(2) = (1-d)*X(2)*(1-c);
Ym(2) = (1-dm)*Xm(2)*(1-cm);
%%%%

%%%% L2
%L2_1: + L1_1 -L21 
Y(3) =  (1-d)*c*(1-g(1))*X(2) +  (1-d)*(X(3)*(1-c));
Ym(3) = (1-dm)*cm*(1-gm(1))*Xm(2) + (1-dm)*(Xm(3)*(1-cm));
%L2_2: + cL1_2 + gL1_1 -L22
Y(4) =   (1-d)*c*g(1)*X(2) +  (1-d)*(X(4)*(1-c));
Ym(4) =  (1-dm)*cm*gm(1)*Xm(2) + (1-dm)*(Xm(4)*(1-cm));
%%%%

%%%% L3
%L3_1: + cL2_1 -L3_1
Y(5)  =  (1-d)*c*(1-g(1))*X(3) +   (1-d)*X(5)*(1-c);
Ym(5) =  (1-dm)*cm*(1-gm(1))*Xm(3) + (1-dm)*Xm(5)*(1-cm);
%L3_2: + gL2_1 + cL2_2  -L32
Y(6) =   (1-d)*c*g(1)*X(3) +  (1-d)*c*(1-g(2))*X(4) +  (1-d)*X(6)*(1-c);
Ym(6) =  (1-dm)*cm*gm(1)*Xm(3) + (1-dm)*cm*(1-gm(2))*Xm(4)+ (1-dm)*Xm(6)*(1-cm);
%L3_3: + gL2_2 + cL2_3 -L33
Y(7) =   (1-d)*c*g(2)*X(4) +  (1-d)*X(7)*(1-c);
Ym(7) =  (1-dm)*cm*gm(2)*Xm(4) + (1-dm)*Xm(7)*(1-cm);
%%%%

%%% L4
%L4_1: + cL3_1 - L41
Y(8)  =  (1-d)*c*(1-g(1))*X(5) +  (1-d)*X(8)*(1-c);
Ym(8) =  (1-dm)*cm*(1-gm(1))*Xm(5) + (1-dm)*Xm(8)*(1-cm);
%L4_2: + gL3_1 + cL32 -L42
Y(9) =   (1-d)*c*g(1)*X(5) +   (1-d)*c*(1-g(2))*X(6) + (1-d)*X(9)*(1-c);
Ym(9) =  (1-dm)*cm*gm(1)*Xm(5) + (1-dm)*cm*(1-gm(2))*Xm(6) + (1-dm)*Xm(9)*(1-cm);
% L4_3: gL3_2 + L3_3 - L43
Y(10) =  (1-d)*X(7)*c  + (1-d)*c*g(2)*X(6)   +   (1-d)*X(10)*(1-c);
Ym(10) = (1-dm)*Xm(7)*cm + (1-dm)*cm*gm(2)*Xm(6)  + (1-dm)*Xm(10)*(1-cm);
%%%

%%%% Pupae
% P_1:
Y(11)  = (1-d)*(1-g(1))*X(8) + (1-d)*X(11)*(1-c);
Ym(11) = (1-dm)*(1-gm(1))*Xm(8) + (1-dm)*Xm(11)*(1-cm);
% P_2: gL4_1 + cL4_2 - P2
Y(12)  = (1-d)*X(8)*g(1) + (1-d)*(1-g(2))*X(9)+   (1-d)*X(12)*(1-c);
Ym(12) = (1-dm)*Xm(8)*gm(1) +(1-dm)*(1-gm(2))*Xm(9) + (1-dm)*Xm(12)*(1-cm);
% P_3: gL4_2 + cL4_3- P4
Y(13)  = (1-d)*g(2)*X(9) +  (1-d)*X(10) +   (1-d)*X(13)*(1-c);
Ym(13) = (1-dm)*gm(2)*Xm(9)+ (1-dm)*Xm(10) + (1-dm)*Xm(13)*(1-cm);
% Second day in pupae
% P_1:
Y(14) = c*(1-d)*X(11);
Ym(14) = (1-dm)*cm*Xm(11);
% P_2: gL4_1 + cL4_2 - P2
Y(15) = c*(1-d)*X(12);
Ym(15) = (1-dm)*cm*Xm(12);
% P_3: gL4_2 + cL4_3 - P3
Y(16) = c*(1-d)*X(13);
Ym(16) = (1-dm)*cm*Xm(13);
%%%%

% female adults
Y(17) =  c*(1-d)*(X(14) + X(15) + X(16));
% male adults
Ym(17) = cm*(1-dm)*(Xm(14) + Xm(15) + Xm(16));

end