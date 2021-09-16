%% Data for VarE
%%   8  9 10 11 12 13 14 16 17 18 19 22; L M s
H1 = [0  0  0  0  0  0  0  0  0  0  0  0;  0  0  0  0  0  0  0  0  0  0  0  0;  3  7  8  1  1  0  1  0  0  0  0  0];
H2 = [0  0  0  0  0  0  0  0  0  0  0  0;  1  1  0  0  0  0  0  0  0  0  0  0; 12 10  0  0  0  2  0  0  1  0  0  0];
H3 = [0  0  0  0  0  0  0  0  0  0  0  0; 0 14  1  0  0  0  0  0  0  0  0  0;   0  0  4  0  2  0  0  0  0  0  0  0];
H4 = [0  0  0  0  0  0  0  0  0  0  0  0; 0  0  0  0  0  0  0  0  0  0  0  0; 0  4 11  3  0  0  0  1  0  1  1  0];
H5 = [0  0  0  0  0  0  0  0  0  0  0  0; 0  3 1  0  0  0  0  0  0  0  0  0; 0  5  7  0  1  0  0  0  0  0  1  1];
H6 = [0  0  0  0  0  0  0  0  0  0  0  0; 0  3 13  0  0  0  0  0  0  0  0  0; 0  0  5  2  0  0  0  0  0  0  0  0];
H7 = [0  0  0  0  0  0  0  0  0  0  0  0; 0  5 3  0  0  0  0  0  0  0  0  0;0  2  8 10  2  1  1  0  0  0  0  0];
H8 = [0  0  0  0  0  0  0  0  0  0  0  0; 0  3  0  0  0  0  0  0  0  0  0  0; 0  3 15 12  0  1  0  0  0  0  0  0];
H1 = [zeros(3,3),H1(:,1:7), zeros(3,1), H1(:,8:11), zeros(3,2), H1(:,12)]./ sum(sum(H1));
H2 = [zeros(3,3),H2(:,1:7), zeros(3,1), H2(:,8:11), zeros(3,2), H2(:,12)]./ sum(sum(H2));
H3 = [zeros(3,3),H3(:,1:7), zeros(3,1), H3(:,8:11), zeros(3,2), H3(:,12)]./ sum(sum(H3));
H4 = [zeros(3,3),H4(:,1:7), zeros(3,1), H4(:,8:11), zeros(3,2), H4(:,12)]./ sum(sum(H4));
H5 = [zeros(3,3),H5(:,1:7), zeros(3,1), H5(:,8:11), zeros(3,2), H5(:,12)]./ sum(sum(H5));
H6 = [zeros(3,3),H6(:,1:7), zeros(3,1), H6(:,8:11), zeros(3,2), H6(:,12)]./ sum(sum(H6));
H7 = [zeros(3,3),H7(:,1:7), zeros(3,1), H7(:,8:11), zeros(3,2), H7(:,12)]./ sum(sum(H7));
H8 = [zeros(3,3),H8(:,1:7), zeros(3,1), H8(:,8:11), zeros(3,2), H8(:,12)]./ sum(sum(H8));
%   8  9 10 11 13; l m s
L1 = [   5  3  1  0  0;  0  0  0  0  0;  0  0  0  0  0];
L2 = [   1  1  0  0  0;  6  0  0  0  0;  0  0  0  0  0];
L3 = [   0  10 0  0  0;  0  0  0  0  0;  0  0  0  0  0];
L4 = [   0  4  2  1  0;  0  2  0  1  0;  0  0  0  0  0];
L4b = [  0  5  9  0  0;  0  0  0  0  0;  0  0  0  0  0];
L4c = [   0 0 1  0  0;  0  4 9  0  0;  0  0  0  0  0];
L5 = [   0 8  1  0  0;  0  2  0  1  0;  0  0  0  0  0];
L6 = [   0 0 0  0  0;  0  6  4  0  1;  0  0  0  0  0];
L7 = [   0 1 8  1    0;  0  0  0  0  0;  0  0  0  0  0];
L8 = [   0  2 3  0  0;  0  0  0  0  0;  0  0  0  0  0];
L9 = [   0 6 3  0  0;  0  0  1  0  0;  0  0  0  0  0];
L9c = [   1 1 1 7  0;  0  0  0  0  0;  0  0  0  0  0];
L9d = [   0 0 8 3    0;  0  0  1  0  0;  0  0  0  0  0];
L1 = [zeros(3,3),L1(:,1:4), zeros(3,1),  L1(:,5)]./ sum(sum(L1));
L2 = [zeros(3,3),L2(:,1:4), zeros(3,1),  L2(:,5)]./ sum(sum(L2));
L3 = [zeros(3,3),L3(:,1:4), zeros(3,1),  L3(:,5)]./ sum(sum(L3));
L4 = [zeros(3,3),L4(:,1:4), zeros(3,1),  L4(:,5)]./ sum(sum(L4));
L4b = [ zeros(3,3),L4b(:,1:4), zeros(3,1),  L4b(:,5)]./ sum(sum(L4b));
L4c = [zeros(3,3),L4c(:,1:4), zeros(3,1),  L4c(:,5)]./ sum(sum(L4c));
L5 = [zeros(3,3),L5(:,1:4), zeros(3,1),  L5(:,5)]./ sum(sum(L5));
L6 = [zeros(3,3),L6(:,1:4), zeros(3,1),  L6(:,5)]./ sum(sum(L6));
L7 = [zeros(3,3),L7(:,1:4), zeros(3,1),  L7(:,5)]./ sum(sum(L7));
L8 = [zeros(3,3),L8(:,1:4), zeros(3,1),  L8(:,5)]./ sum(sum(L8));
L9 = [zeros(3,3),L9(:,1:4), zeros(3,1),  L9(:,5)]./ sum(sum(L9));
L9c = [zeros(3,3),L9c(:,1:4), zeros(3,1),  L9c(:,5)]./ sum(sum(L9c));
L9d = [zeros(3,3),L9d(:,1:4), zeros(3,1),  L9d(:,5)]./ sum(sum(L9d));

%%
s = 1;
Hlarge = [H1(s,:); H2(s,:); H3(s,:); H4(s,:); H5(s,:); H6(s,:); H7(s,:); H8(s,:)];
Llarge = [L1(s,:); L2(s,:); L3(s,:); L4(s,:); L4b(s,:); L4c(s,:); ...
        L5(s,:); L6(s,:); L7(s,:); L8(s,:); L9(s,:); L9c(s,:); L9d(s,:)];
s = 2;
Hmed = [H1(s,:); H2(s,:); H3(s,:); H4(s,:); H5(s,:); H6(s,:); H7(s,:); H8(s,:)];
Lmed = [L1(s,:); L2(s,:); L3(s,:); L4(s,:); L4b(s,:); L4c(s,:); ...
        L5(s,:); L6(s,:); L7(s,:); L8(s,:); L9(s,:); L9c(s,:); L9d(s,:)];

s = 3;
Hsmall = [H1(s,:); H2(s,:); H3(s,:); H4(s,:); H5(s,:); H6(s,:); H7(s,:); H8(s,:)];
Lsmall = [L1(s,:); L2(s,:); L3(s,:); L4(s,:); L4b(s,:); L4c(s,:); ...
        L5(s,:); L6(s,:); L7(s,:); L8(s,:); L9(s,:); L9c(s,:); L9d(s,:)];