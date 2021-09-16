function y = fitStar(gin,abpar,p,d)

sl = gin(3:4);
g = gin(1:2);
nu = 0.5207;

km = p(1);
kf = p(2);

if length(p)>2
    con1 = p(3);
    con2 = p(4);
else
    con1 = 0.5;
    con2 = 0.5;
end


% Low density data, weight proportion, large, medium, small
tl = [9   2  10   7  14   1   9   0  10   5    9   10   11;
      0   6   0   3   0  13   3  11   0   0    1    0    1;
      0   0   0   0   0   0   0   0   0   0    0    0    0];
tl =  tl./sum(tl);
Hd = tl(1,:); Md = tl(2,:); Ld = tl(3,:);

% low density
tt = 20;
IC = 13;
VarE

y = sum((Ld - Lm).^2 + (Md - Mm).^2 + (Hd - Hm).^2);


% High density weight proportion by large, medium, small
th = [0   0   0   0   0   0    0    0;
      0   2  15   0   4  16    8    3;
	  21  25  6  21  15   7   24   31];
th =  th./sum(th);
Hd = th(1,:); Md = th(2,:); Ld = th(3,:); 

% high density
tt = 45;
IC = 39;
VarE

y = y + sum( (Ld - Lm).^2 + (Md - Mm).^2 + (Hd - Hm).^2);

end