function [Y, Ym, K,  g, cm, c] = discreteL3(X, Xm, Kin, par) 
% Variation C3

% Input:    X = females at time t-1
%           Xm = males at time t-1
%           Kin = resourece at time t-1

km = par.km; % maximum male transition
kf = par.kf; % maximum female transition
din = par.d; % death
a = par.a; % pre-factor in transition function
b = par.b; % exponent in transition function
q = par.q; % resource decay rate

growth = par.growth;
pre_g = par.pre_g;
N1 = par.N1;

% % defaults
% sl = [1 1];
% g = [1 0];
% nu = 0.5207;


if pre_g(1) ==0
    con1 = 0.5;
    con2 = 0.5;
end
if pre_g(2)==1
    hcon = 100;
    hill = par.hill;
end


% Current population
N = sum(Xm(2:13) + X(2:13));
N2 = N + sum(Xm(14:19) + X(14:19));


% Adjust population to avoid dividing by zero
N1 = N1 + 0.001;


% Death rate for  L1-4, and P
if length(din)==1
    d = din(1); % females
    dm = din(1); % males
elseif length(din)==2    
    d = din(1); % females
    dm = din(2); % males
end
if length(din)==3
    d = din(1); % females
    dm = din(2); % males
    % Female death is density dependent
    f = din(3);
    d = d.*(N2^hill + hcon)./(f^hill + N2^hill);
end

if growth == 1
	sl = par.sl;
    nu = par.nu;
    g = par.g;
    con1 = par.con1;
    con2 = par.con2;

% Growth function
K3 = [(Kin/N1)^sl(1)/((Kin/N1)^sl(1) + con1^sl(1)), (Kin/N1)^sl(2)/((Kin/N1)^sl(2) + con2^sl(2))];
% Transition to Larger weight
% g(1) is S -> M, g(2) is M -> L
g = g.*K3;
% Transition to Larger weight males
gm = g*nu;
else
    g = [0 0];
    gm = [0 0];
end

% Transition to new class 
cm = km./(1+ (a*N2)^b);
c = kf./(1+ (a*N2)^b);

% Resource function
K = Kin*exp(-q*N);

%% Initialize

Y = zeros(1,22);
Ym = zeros(1,22);

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

%%% First day in L4
%L4_1: + cL3_1 - L41
Y(8)  =  (1-d)*c*(1-g(1))*X(5) +  (1-d)*X(8)*(1-c);
Ym(8) =  (1-dm)*cm*(1-gm(1))*Xm(5) + (1-dm)*Xm(8)*(1-cm);
%L4_2: + gL3_1 + cL32 -L42
Y(9) =   (1-d)*c*g(1)*X(5) +   (1-d)*c*(1-g(2))*X(6) + (1-d)*X(9)*(1-c);
Ym(9) =  (1-dm)*cm*gm(1)*Xm(5) + (1-dm)*cm*(1-gm(2))*Xm(6) + (1-dm)*Xm(9)*(1-cm);
% L4_3: gL3_2 + L3_3 - L43
Y(10) =  (1-d)*X(7)*c  + (1-d)*c*g(2)*X(6)   +   (1-d)*X(10)*(1-c);
Ym(10) = (1-dm)*Xm(7)*cm + (1-dm)*cm*gm(2)*Xm(6)  + (1-dm)*Xm(10)*(1-cm);

% Second day in L4
%L4_1: + cL3_1 - L41
 Y(11) =  c*(1-d)*X(8);
Ym(11) =  cm*(1-dm)*Xm(8);
%L4_2: + gL3_1 + cL32 -L42
 Y(12) =  c*(1-d)*X(9);
Ym(12) =  cm*(1-dm)*Xm(9);
% L4_3: gL3_2 + L3_3 - L43
Y(13)  = (1-d)*X(10)*c;
Ym(13) = (1-dm)*Xm(10)*cm;
%%%%


%%%% Pupae
% First day in pupae
% P_1:
Y(14)  = (1-d)*(1-g(1))*X(11) + (1-d)*X(14)*(1-c);
Ym(14) = (1-dm)*(1-gm(1))*Xm(11) + (1-dm)*Xm(14)*(1-cm);
% P_2: gL4_1 + cL4_2 - P2
Y(15)  = (1-d)*X(11)*g(1) + (1-d)*(1-g(2))*X(12)+   (1-d)*X(15)*(1-c);
Ym(15) = (1-dm)*Xm(11)*gm(1) +(1-dm)*(1-gm(2))*Xm(12) + (1-dm)*Xm(15)*(1-cm);
% P_3: gL4_2 + cL4_3- P4
Y(16)  = (1-d)*g(2)*X(12) +  (1-d)*X(13) +   (1-d)*X(16)*(1-c);
Ym(16) = (1-dm)*gm(2)*Xm(12)+ (1-dm)*Xm(13) + (1-dm)*Xm(16)*(1-cm);

% Second day in pupae
% P_1:
Y(17)  = (1-d)*(c*X(14) + (1-c)*X(17));
Ym(17) = (1-dm)*(cm*Xm(14) + (1-cm)*Xm(17));
% P_2: gL4_1 + cL4_2 - P2
Y(18)  = (1-d)*(c*X(15) + (1-c)*X(18));
Ym(18) = (1-dm)*(cm*Xm(15) + (1-cm)*Xm(18));
% P_3: gL4_2 + cL4_3- P4
Y(19)  =  (1-d)*(c*X(16) + (1-c)*X(19));
Ym(19) = (1-dm)*(cm*Xm(16) + (1-cm)*Xm(19));

% female adults
Y(20) = c*(1-d)*X(17);
Y(21) = c*(1-d)*X(18);
Y(22) = c*(1-d)*X(19);

% male adults
Ym(20) = cm*(1-dm)*Xm(17);
Ym(21) = cm*(1-dm)*Xm(18);
Ym(22) = cm*(1-dm)*Xm(19);

end