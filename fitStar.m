function y = fitStar(  g)

sl = g(3:4);
g = g(1:2);
gm = 1.5;
% these things change for each data set
% this is the total days shift 0 to 1

% Input a matrix length tt by 6 (L1-L4, P, A)

%sl = [ sl,1];
p2 = [0.0043, 1.61];
p = [0.94 0.85];
%0.0660    0.0250   24

% In put daily death
d = 0.066.*ones(1,30);
tt = 27;

km = p(1)  ;
kf =p(2) ;
% initial values 

dl =0;
Fe = zeros(tt, 22);
M = zeros(tt, 22);

K = zeros(tt,1);


    % This is low density data, weight proportion, large, medium, small
tl =[ 9   2  10   7  14   1   9   0  10   5    9   10   11;
      0   6   0   3   0  13   3  11   0   0    1    0    1;
      0   0   0   0   0   0   0   0   0   0    0    0    0];
 tl =  tl./sum(tl);
 Hd = tl(1,:); Md = tl(2,:); Ld = tl(3,:);
  Fe(1,2) = 13;
M(1,2) = 13;
K(1:(dl+1),:) = 30; 


     t = 2;
  nn = sum(M(1,2:19) + Fe(1,2:19));
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyGd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
  

   
for t = 3:tt

  nn = sum(M((t-1),2:19) + Fe((t-1),2:19));
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyGd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
    
%    if(mod(t,5) ==0)
   %     K(t+dl) =  200;% K(t+1,1) + 500;
%     end
       % K(t+dl) = K(t+1,1);
end


% proportion of those that pupate by  size
totm =  sum(sum(Fe(:,20:22)));
Lm = sum( Fe(:,20))./totm;
Mm = sum(Fe(:,21))./totm;
Hm = sum( Fe(:,22))./totm;


y = sum((Ld - Lm).^2 + (Md - Mm).^2 + (Hd - Hm).^2);


     % this is high density weight proportion by large, medium, small
  th =[  0   0   0   0   0   0    0    0;
         0   2  15   0   4  16    8    3;
         21  25   6  21  15   7   24   31];
    th =  th./sum(th);
 Hd = th(1,:); Md = th(2,:); Ld = th(3,:); 
    Fe(1,2) = 39;
    M(1,2) = 39;
    K(1:(dl+1),:) = 30; 



% 

% 
%
    
     t = 2;
  nn = sum(M(1,2:19) + Fe(1,2:19));
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyGd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
  

   
for t = 3:tt

  nn = sum(M((t-1),2:19) + Fe((t-1),2:19));
   [Fe(t,:) , M(t,:),  K(t+dl)] = discreteLonlyGd(Fe(t-1,:) ,M(t-1,:),K([(t-1), (t+dl-1)]) ,km, kf, d(t-1), p2(1),p2(2), sl, gm, g, nn);
    
%    if(mod(t,5) ==0)
   %     K(t+dl) =  200;% K(t+1,1) + 500;
%     end
       % K(t+dl) = K(t+1,1);
end



totm =  sum(sum(Fe(:,20:22)));
Lm = sum( Fe(:,20))./totm;
Mm = sum(Fe(:,21))./totm;
Hm = sum( Fe(:,22))./totm;


y = y + sum( (Ld - Lm).^2 + (Md - Mm).^2 + (Hd - Hm).^2);



%y = norm([Ld';Md';Hd'] - [Lm; Mm; Hm]);
%y = norm([sum(Ld);sum(Md);sum(Hd)] - [sum(Lm);sum(Mm);sum(Hm)]);
end