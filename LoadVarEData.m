%% Load and Plot Mass Data

x = readtable('VarE.csv');

%%
tid = find(strcmp(x.Var5,'na')==0);
Fid = find(strcmp(x.Var3,'F'));
Mid = find(strcmp(x.Var3,'M'));

Lid = find(strcmp(x.Var1,'low'));
Hid = find(strcmp(x.Var1,'high'));

FLid = intersect(intersect(Fid,Lid),tid);
FHid = intersect(intersect(Fid,Hid),tid);

FL = str2double(x.Var5(FLid));
FH = str2double(x.Var5(FHid));

MLid = intersect(intersect(Mid,Lid),tid);
MHid = intersect(intersect(Mid,Hid),tid);

ML = str2double(x.Var5(MLid));
MH = str2double(x.Var5(MHid));

%% Plot histogram
figure(1)
subplot(2,2,1:2)
hist(FL,.55:.1:3.5)
hold on
plot([1.5 1.5],[0 40],'k--')
plot([2.5 2.5],[0 40],'k--')
hold off
xlim([.5 3.5])
set(gca,'fontsize',14)

subplot(2,2,3:4)
hist(FH,.55:.1:3.5)
hold on
plot([1.5 1.5],[0 40],'k--')
plot([2.5 2.5],[0 40],'k--')
hold off

%%
FLL = length(find(FL<1.5));
FLM = length(find(FL>1.5 & FL<2.5));
FLH =  length(find(FL>2.5));
[FLL FLM FLH length(FL)]
[FLL FLM FLH length(FL)]/length(FL)

FHL = length(find(FH<1.5));
FHM = length(find(FH>1.5 & FH<2.5));
FHH = length(find(FH>2.5));
[FHL FHM FHH length(FH)]
[FHL FHM FHH length(FH)]/length(FH)

%% Relative male value
nu  = mean([MH; ML])/mean([FH; FL])
xlim([.5 3.5])
set(gca,'fontsize',14)
% nu = 0.5207