function [Y, Ym, K, cm, c] = discreteLonlyd(X, Xm,K2, km, kf, d, a, b3)
% This is C1


N = sum(Xm(2:13) + X(2:13));
%w2 = [0.125, fliplr(w1)];
Y = zeros(1,14);
Ym = zeros(1,14);


% death


%K3 = K2./N;
% Death rate for E, L1-4, and P
%d = d.*[  ones(1,11)./(K3+0.8), 1/(K3+0.8)];
 d = d.*ones(1,5);
% if N >15
%     d = d + 0.2.*(1-exp(-0.05*(N-15)));
%     dm = d;
% else 

 dm = d;
% end
% if(N > 65)
%     
%  % d = d.*(1.3 - 0.3.*exp(-0.0002*(N-1000)));
%  d = d + 0.05;
% elseif(N> 50)
%     d = d + 0.025;
%  
% end



% births

%b3 =1.61;
%a =   0.0043;


%c = [ 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 1 ];
 % Transition to Larger weight, this is currently fixed at 50%
g = .5.*ones(7,1); 


% This is to make sure that transition + death <= 1 
% we have a smoother transition and that growth is inhibited by less
% resources as well.
if(K2(2) < 15)
if(K2(2)  < 12)
   kf = kf*exp(0.5*(K2(2)-12)); 
   km = km*exp(0.5*(K2(2)-12)); 
end
g = g.*exp(K2(2)-15);
end


% Transition to Larger weight males
gm   = g./7;

% if( max(km,kf) > 1-max(d(2:end)))
%     
% dif = kf./km;    
%     km = 1-max(d(2:end));
%     
%     if km < 0
%      
%         km = 0;
%     end
%     kf = dif.*km;
% end
  
% Transition to new class (a,b) = (0.0043,1.61
c = kf./(1+ (a*N)^b3);
cm = km./(1+ (a*N)^b3);




 

% if( max([c,cm]) + max(d(2:end)) >1)
%    c = 1-d(2);
%    cm = c;
% end

%if N > 0
K = K2(2)*exp(-0.0001*N);
%end

if(K < 4.51)
   
    K = 4.51;
end






% L1_1:   +eggs-L11
Y(2) =  (1-d(1))*(X(2)*(1 -c ));
%%%%
%%%%
%L2_1: + L1_1 -L21 
Y(3) =  (1-d(1))*c*(1-g(1))*X(2) +(1- d(2))*(X(3)*(1-c));
%L2_2: + cL1_2 + gL1_1 -L22
Y(4) =  (1-d(2))*c*g(1)*X(2) + (1-d(2))*(X(4)*(1- c ));
%%%%
%%%%
%L3_1: + cL2_1 -L3_1
Y(5) =  (1-d(2))*c*(1-g(2))*X(3) + (1- d(3))*X(5)*(1-c);
%L3_2: + gL2_1 + cL2_2  -L32
Y(6) =  (1-d(2))*X(3)*g(2)*c + (1-d(2))*c*(1-g(3))*X(4)+ (1-d(3))*X(6)*(1-c );
%L3_3: + gL2_2 + cL2_3 -L33
Y(7) =  (1-d(2))*c*g(3)*X(4) + (1-d(3))*X(7)*(1-c );
%%%%
%%%
%L4_1: + cL3_1 - L41
Y(8) =  (1-d(3))*c*(1-g(4))*X(5) +(1- d(4))*X(8)*(1-c);
%L4_2: + gL3_1 + cL32 -L42
Y(9) =  (1-d(3))*X(5)*g(4)*c + (1-d(3))*c*(1-g(5))*X(6)+ (1-d(4))*X(9)*(1-c);
% L4_3: gL3_2 + L3_3 - L43
Y(10) = (1-d(3))*X(6)*g(5)*c + (1-d(3))*X(7)*c  +(1- d(4))*X(10)*(1-c );
%%%%
%%%%
% P_1:
Y(11) = (1-d(4))*c*(1-g(6))*X(8)+ (1-d(5))*X(11)*(1- c);
% P_2: gL4_1 + cL4_2 - P2
Y(12) = (1-d(4))*X(8)*c*g(6)+ (1-d(4))*c*(1-g(7))*X(9)+ (1-d(5))*X(12)*(1- c);
% P_3: gL4_2 + cL4_3- P4
Y(13) = (1-d(4))*c*g(7)*X(9)+ (1-d(4))*c*X(10) + (1-d(5))*X(13)*(1- c);


% Males L1
Ym(2) =  (1-dm(1))*(Xm(2)*(1 -cm ));
%%%%
%%%%
%L2_1: + L1_1 -L21 
Ym(3) =  (1-dm(1))*cm*(1-gm(1))*Xm(2) + (1- dm(2))*(Xm(3)*(1-cm ));
%L2_2: + cmL1_2 + gmL1_1 -L22
Ym(4) =  (1-dm(1))*cm*gm(1)*Xm(2) + (1-dm(2))*(Xm(4)*(1- cm ));
%%%%
%%%%
%L3_1: + cmL2_1 -L3_1
Ym(5) =  (1-dm(2))*cm*(1-gm(2))*Xm(3) + (1- dm(3))*Xm(5)*(1-cm);
%L3_2: + gmL2_1 + cmL2_2  -L32
Ym(6) =  (1-dm(2))*Xm(3)*gm(2)*cm + (1-dm(2))*cm*(1-gm(3))*Xm(4)+ (1-dm(3))*Xm(6)*(1-cm);
%L3_3: + gmL2_2 + cmL2_3 -L33
Ym(7) =  (1-dm(2))*cm*gm(3)*Xm(4) + (1-dm(3))*Xm(7)*(1-cm );
%%%%
%%%
%L4_1: + cmL3_1 - L41
Ym(8) =  (1-dm(3))*cm*(1-gm(4))*Xm(5) + (1-dm(4))*Xm(8)*(1-cm );
%L4_2: + gmL3_1 + cmL32 -L42
Ym(9) =  (1-dm(3))*Xm(5)*gm(4)*cm +(1- dm(3))*cm*(1-gm(5))*Xm(6)+ (1-dm(4))*Xm(9)*(1-cm);
% L4_3: gmL3_2 + L3_3 - L43
Ym(10) =  (1-dm(3))*Xm(7)*cm+ (1-dm(3))*cm*gm(5)*Xm(6)  + (1-dm(4))*Xm(10)*(1-cm );


%%%%
%%%%
% P_1:
Ym(11) = (1-dm(4))*cm*(1-gm(6))*Xm(8)+ (1-dm(5))*Xm(11)*(1- cm);
% P_2: gL4_1 + cL4_2 - P2
Ym(12) = (1-dm(4))*Xm(8)*cm*gm(6)+(1- dm(4))*cm*(1-gm(7))*Xm(9)+ (1-dm(5))*Xm(12)*(1- cm);
% P_3: gL4_2 + cL4_3- P4
Ym(13) = (1-dm(4))*cm*gm(7)*Xm(9)+ (1-dm(4))*cm*Xm(10) + (1-dm(5))*Xm(13)*(1- cm);

% dead, 
Ym(1) = dm(1)*Xm(2) + dm(2)*(Xm(3)+ Xm(4))+ dm(3)*(Xm(5)+ Xm(6)+ Xm(7))+ dm(4)*(Xm(8)+ Xm(9)+ Xm(10))+ dm(5)*(Xm(11)+ Xm(12)+  Xm(13)) + d(1)*X(2) + d(2)*(X(3)  + X(4)) + d(3)*(X(5) + X(6) + X(7)) + d(4)*(X(8) + X(9) + X(10)) + d(5)*(X(11) +  X(12) + X(13)); 

% female adults
Y(14) =  (1-d(5))*(X(12) + X(13) + X(11))*c;
% male adults
Ym(14) = (1-dm(5))*(Xm(12) + Xm(13) + Xm(11))*cm;
%

end