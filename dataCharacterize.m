close all;
clear all;
%airplane
c1 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\airplane.csv');
c2 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\automobile.csv');
c3 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\bird.csv');
c4 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\cat.csv');
c5 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\deer.csv');
c6 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\dog.csv');
c7 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\frog.csv');
c8 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\horse.csv');
c9 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\ship.csv');
c10 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\truck.csv');

[nm1,txt1,raw1] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\airplane.csv');
[nm2,txt2,raw2] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\automobile.csv');
[nm3,txt3,raw3] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\bird.csv');
[nm4,txt4,raw4] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\cat.csv');
[nm5,txt5,raw5] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\deer.csv');
[nm6,txt6,raw6] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\dog.csv');
[nm7,txt7,raw7] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\frog.csv');
[nm8,txt8,raw8] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\horse.csv');
[nm9,txt9,raw9] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\ship.csv');
[nm10,txt10,raw10] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\truck.csv');


%returns row vector containing mean of each col.
% exp1 = mean(c1);exp2 = mean(c2);exp3 = mean(c3);exp4 = mean(c4);
% exp5 = mean(c5);exp6 = mean(c6);exp7 = mean(c7);exp8 = mean(c8);
% exp9 = mean(c9);exp10 = mean(c10);

% %concat vertically (stacked on top each other)
% Cexp = [exp1;exp2;exp3;exp4;exp5;exp6;exp7;exp8;exp9;exp10];

% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\concatCSV\n=100\expVals.csv', Cexp);

% %sd of each feature/column.
% sd1 = std(c1);sd2 = std(c2);sd3 = std(c3);sd4 = std(c4);sd5 = std(c5);
% sd6 = std(c6);sd7 = std(c7);sd8 = std(c8);sd9 = std(c9);sd10 = std(c10);
% Cstd = [sd1;sd2;sd3;sd4;sd5;sd6;sd7;sd8;sd9;sd10];
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\concatCSV\n=100\stdClass.csv', Cstd);

% %plot exp. val and s.d.
% figure;plot(exp1);hold on; plot(exp1,'color','blue');
% grid on; xlabel('Feature column'); ylabel('Expected Values');
% 
% figure;plot(sd1);hold on; plot(sd1,'color','red');grid on;
% xlabel('Feature column');ylabel('Standard Deviation');
% 
% %1 feature histogram 

% figure;hist(c4(:,f10),40);grid on; %cat, 10th feature
% axis([0 255 0 20]) %0-255 for px val, 0-20 for feature range
% figure;hist(c10(:,f10),40);grid on;
% axis([0 255 0 20]) %truck, 10th feature
% 
% %3 features histogram compare cat & truck
% figure;plot3(c4(:,f1), c4(:,f14), c4(:,f16), '.');hold on;
% plot3(c10(:,f1), c10(:,f14), c10(:, f16), 'r.');grid on;
% xlabel('Feature 1'); ylabel('Feature 12'); zlabel('Feature 16');


% [a1,b1,cc1]=xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\concatCSV\n=100\GaussianWeights\randnums1.xls');
% [a2,b2,cc2]=xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\concatCSV\n=100\GaussianWeights\randnums2.xls');
%generate random numbers following assumed N(0,1) distribution

nn=64;  %#features

rand1 = normrnd(0,1,[nn 1]);
rand1stdz = (rand1-mean(rand1))/std(rand1); %standardized
rand1stdz = max(abs(rand1stdz), [], 2); %max >0 values, already normalized
rand2 = normrnd(0,1,[nn 1]);
rand2stdz = (rand2-mean(rand2))/std(rand2); 
rand2stdz = max(abs(rand2stdz), [], 2);
rand3 = normrnd(0,1,[nn 1]);
rand3stdz = (rand3-mean(rand3))/std(rand3); %standardized
rand3stdz = max(abs(rand3stdz), [], 2); %max >0 values, already normalized
rand4 = normrnd(0,1,[nn 1]);
rand4stdz = (rand4-mean(rand4))/std(rand4); 
rand4stdz = max(abs(rand4stdz), [], 2);
rand5 = normrnd(0,1,[nn 1]);
rand5stdz = (rand5-mean(rand5))/std(rand5); 
rand5stdz = max(abs(rand5stdz), [], 2);
rand6 = normrnd(0,1,[nn 1]);
rand6stdz = (rand6-mean(rand6))/std(rand6);
rand6stdz = max(abs(rand6stdz), [], 2);
rand7 = normrnd(0,1,[nn 1]);
rand7stdz = (rand7-mean(rand7))/std(rand7); 
rand7stdz = max(abs(rand7stdz), [], 2);
rand8 = normrnd(0,1,[nn 1]);
rand8stdz = (rand8-mean(rand8))/std(rand8);
rand8stdz = max(abs(rand8stdz), [], 2);
rand9 = normrnd(0,1,[nn 1]);
rand9stdz = (rand9-mean(rand9))/std(rand9); 
rand9stdz = max(abs(rand9stdz), [], 2);
rand10 = normrnd(0,1,[nn 1]);
rand10stdz = (rand10-mean(rand10))/std(rand10);
rand10stdz = max(abs(rand10stdz), [], 2);
% disp(size(rand1stdz));

%smallest # to preserve dimensions is : 4096 observations per class
num1 = nm1(1:4096, 1:64);
num2 = nm2(1:4096, 1:64);
num3 = nm3(1:4096, 1:64);
num4 = nm4(1:4096, 1:64);

num5 = nm5(1:4096, 1:64);

num6 = nm6(1:4096, 1:64);

num7 = nm7(1:4096, 1:64);

num8 = nm8(1:4096, 1:64);

num9 = nm9(1:4096, 1:64);

num10 = nm10(1:4096, 1:64);

% disp(size(num1));
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\num1.csv', num1);
% [nmm1,txt1,raw1] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\num1.csv');

% a1=(a1-mean(a1))/std(a1); %z-score of random numbers/Gaussian weights
% a2=(a2-mean(a2))/std(a2); %standardized
% 
% a1=a1/(max(abs(a1))); %normalized
% a2=a2/(max(abs(a2)));

mn1 = mean(num1');
mn2 = mean(num2');
mn3 = mean(num3');
mn4 = mean(num4');
mn5 = mean(num5');
mn6 = mean(num6');
mn7 = mean(num7');
mn8 = mean(num8');
mn9 = mean(num9');
mn10 = mean(num10');
% trans = nmm1';
% disp(size(trans));
% disp(size(mn1));

std1 = std(num1'); 
std2 = std(num2');
std3 = std(num3');
std4 = std(num4');
std5 = std(num5');
std6 = std(num6');
std7 = std(num7');
std8 = std(num8');
std9 = std(num9');
std10 = std(num10');
% disp(size(std1));

%64x1 rand1
%1024x64 num1
%1x1024 mean
%1x1024 std
%1024x64 new1
%YOU WILL GET ERRORS IF DON"T RUN clear all; and close all; at 1st line!!!

%airplane
for jj=1:nn
    new1(:,jj)=rand1stdz(jj)*(num1(:,jj)-mn1(:,jj))./(1+std1(:,jj));
end
% disp(size(new1));
%automobile
for jj=1:nn
    new2(:,jj)=rand2stdz(jj)*(num2(:,jj)-mn2(:,jj))./(1+std2(:,jj));
end
%bird
for jj=1:nn
    new3(:,jj)=rand3stdz(jj)*(num3(:,jj)-mn3(:,jj))./(1+std3(:,jj));
end
%cat
for jj=1:nn
    new4(:,jj)=rand4stdz(jj)*(num4(:,jj)-mn4(:,jj))./(1+std4(:,jj));
end
%deer
for jj=1:nn
    new5(:,jj)=rand5stdz(jj)*(num5(:,jj)-mn5(:,jj))./(1+std5(:,jj));
end
%dog
for jj=1:nn
    new6(:,jj)=rand6stdz(jj)*(num6(:,jj)-mn6(:,jj))./(1+std6(:,jj));
end
%frog
for jj=1:nn
    new7(:,jj)=rand7stdz(jj)*(num7(:,jj)-mn7(:,jj))./(1+std7(:,jj));
end
%horse
for jj=1:nn
    new8(:,jj)=rand8stdz(jj)*(num8(:,jj)-mn8(:,jj))./(1+std8(:,jj));
end
%ship
for jj=1:nn
    new9(:,jj)=rand9stdz(jj)*(num9(:,jj)-mn9(:,jj))./(1+std9(:,jj));
end
%truck
for jj=1:nn
    new10(:,jj)=rand10stdz(jj)*(num10(:,jj)-mn10(:,jj))./(1+std10(:,jj));
end

% %variance of features
% var1 = var(new1(:,1:64));
% var2 = var(new2(:,1:64));
% var3 = var(new3(:,1:64));
% var4 = var(new4(:,1:64));
% var5 = var(new5(:,1:64));
% var6 = var(new6(:,1:64));
% var7 = var(new7(:,1:64));
% var8 = var(new8(:,1:64));
% var9 = var(new9(:,1:64));
% var10 = var(new10(:,1:64));
% Cvar = [var1;var2;var3;var4;var5;var6;var7;var8;var9;var10];
%   csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\variance.csv', Cvar);

% covariance btwn NxN features of cat observations. f1 with f2, f3, f4..f2
% with f3,f4,f5... etc..
% covariances in the diagonal for each corresponding column.(covar matrix)
% mm=1;
% kk=1;
% q = 1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new1(:,kk),new1(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\1Covar.csv', d);

% clear covar;
% clear d;
% q =1 ;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new2(:,kk),new2(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\2Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new3(:,kk),new3(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\3Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new4(:,kk),new4(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\4Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new5(:,kk),new5(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\5Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new6(:,kk),new6(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\6Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new7(:,kk),new7(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\7Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new8(:,kk),new8(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\8Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new9(:,kk),new9(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\9Covar.csv', d);
% 
% clear covar;
% clear d;
% q = 1;
% mm=1;
% kk=1;
% while kk~= 64
%     for ii=kk:1:64
%         covar(mm:mm+1,1:2) = cov(new10(:,kk),new10(:,ii));
%         d(q,1) = covar(mm,2) 
%         d(q,2) = kk;
%         d(q,3) = ii;
%         q=q+1;
%         mm=mm+2;
%     end
%     kk=kk+1;
% end
% 
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\10Covar.csv', d);
% 
% covar1 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\1Covar.csv');
% covar2 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\2Covar.csv');
% covar3 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\3Covar.csv');
% covar4 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\4Covar.csv');
% covar5 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\5Covar.csv');
% covar6 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\6Covar.csv');
% covar7 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\7Covar.csv');
% covar8 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\8Covar.csv');
% covar9 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\9Covar.csv');
% covar10 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\characterize\10Covar.csv');
% 
% figure;
% stem(covar1(:,2), covar1(:,1));
% figure;
% stem(covar2(:,2), covar2(:,1));
% figure;
% stem(covar3(:,2), covar3(:,1));
% figure;
% stem(covar4(:,2), covar4(:,1));
% figure;
% stem(covar5(:,2), covar5(:,1));
% figure;
% stem(covar6(:,2), covar6(:,1));
% figure;
% stem(covar7(:,2), covar7(:,1));
% figure;
% stem(covar8(:,2), covar8(:,1));
% figure;
% stem(covar9(:,2), covar9(:,1));
% figure;
% stem(covar10(:,2), covar10(:,1));

ff1=1; ff2=28; ff3=59;
% display a "weighted" standardized data
figure;
plot3(new1(:,ff1),new1(:,ff2),new1(:,ff3),'r.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on; 
plot3(new2(:,ff1),new2(:,ff2),new2(:,ff3),'g.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new3(:,ff1),new3(:,ff2),new3(:,ff3),'b.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new4(:,ff1),new4(:,ff2),new4(:,ff3),'m.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new5(:,ff1),new5(:,ff2),new5(:,ff3),'k.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new6(:,ff1),new6(:,ff2),new6(:,ff3),'c.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new7(:,ff1),new7(:,ff2),new7(:,ff3),'y.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new8(:,ff1),new8(:,ff2),new8(:,ff3),'Color',[1 0.4 0.6]);grid on; %pink 
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new9(:,ff1),new9(:,ff2),new9(:,ff3),'Color',[0 0.4 0]);grid on; %dark green 
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new10(:,ff1),new10(:,ff2),new10(:,ff3),'Color',[1 0.4 0]);grid on; %orange 
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
% -----------------------histogram---airplane on features 1, 28, 59-------
figure;
hist(c1(:,ff1),40, 'r');grid on;
axis([0 255 0 690]);
figure;
hist(c1(:,ff2),40, 'g');grid on;
axis([0 255 0 690]);
figure;
hist(c1(:,ff3),40, 'b');grid on;
axis([0 255 0 690]);

% ---------------------std & mean with plot-----------------------
m1=mean(c1);
m2=mean(c2);
m3=mean(c3);
m4=mean(c4);
m5=mean(c5);
m6=mean(c6);
m7=mean(c7);
m8=mean(c8);
m9=mean(c9);
m10=mean(c10);

s1=std(c1);
s2=std(c2);
s3=std(c3);
s4=std(c4);
s5=std(c5);
s6=std(c6);
s7=std(c7);
s8=std(c8);
s9=std(c9);
s10=std(c10);

figure;
plot(m1, 'Color', 'r'); hold on; plot(m2, 'Color', 'g'); hold on;
plot(m3, 'Color', 'b'); hold on; plot(m4, 'Color', 'm'); hold on;
plot(m5, 'Color', 'k'); hold on; plot(m6, 'Color', 'c'); hold on;
plot(m7, 'Color', 'y'); hold on; plot(m8, 'Color', [1 0.4 0.6]); hold on;
plot(m9, 'Color', [0 0.4 0]); hold on; plot(m10, 'Color', [1 0.4 0]); grid on;
xlabel('Feature Numbers'); ylabel('Mean Values');

figure;
plot(s1, 'Color', 'r'); hold on; plot(s2, 'Color', 'g'); hold on;
plot(s3, 'Color', 'b'); hold on; plot(s4, 'Color', 'm'); hold on;
plot(s5, 'Color', 'k'); hold on; plot(s6, 'Color', 'c'); hold on;
plot(s7, 'Color', 'y'); hold on; plot(s8, 'Color', [1 0.4 0.6]); hold on;
plot(s9, 'Color', [0 0.4 0]); hold on; plot(m10, 'Color', [1 0.4 0]); grid on;
xlabel('Feature Numbers'); ylabel('Standard Deviation Values');

% ------------------------------------------------------------------

clear v1;
clear v2;
clf;
% %orthogonality test
v1=[new2(:,1) new2(:,33) new2(:,59)]; %vectors
v2=[new3(:,1) new3(:,33) new3(:,59)];

v11=v1(1:end-1,:)-v1(2:end,:); %calc vectors on planes
v12=v2(1:end-1,:)-v2(2:end,:);

vv=v11.*v12; %dot product
uu=sum(vv'); %check if dot prod. is close to zero, val of mean shift
mean(uu) %269.8058 not close to 0 at all.
disp('mean of uu'); 
disp(mean(uu)); %21.4692 NOT close to 0. fails test.
figure;plot(uu);grid on;axis([0 1024 -2 2]);

figure;plot3(new1(:,1),new1(:,33),new1(:,59),'b.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on; 
plot3(new2(:,1),new2(:,33),new2(:,59),'r.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
hold on;
plot3(new3(:,1),new3(:,33),new3(:,59),'g.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

% ----------mean shift,gaussian weights, gaussian increase--------

%     same as usual except with a2 or rand2stdz(jj)*(num1(:,jj)-....
    alpha = 0.99; %max weight alpha = 0.1
    f1=1; f2=28; f3=59;
for jj=1:nn
    new1(:,jj)=(alpha*mn1(jj))+((num1(:,jj))-mn1(jj))./(1+std1(jj));
end

mcc1=mean(new1);
scc1=std(new1);
mm1=length(new1);
randn('seed',111);
for jj=1:nn
    rr1(:,jj) = mcc1(jj) + scc1(jj).*randn(mm1,1);
end
rrr1=[new1;rr1];
figure;plot3(rrr1(:,f1),rrr1(:,f2),rrr1(:,f3),'r.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new2(:,jj)=alpha*mn2(jj)+(num2(:,jj)-mn2(jj))./(1+std2(jj));
end
mccn1=mean(new2);
sccn1=std(new2);
mmm1=length(new2);
randn('seed', 129);
for jj=1:nn
    rrn1(:,jj) = mccn1(jj) + sccn1(jj).*randn(mmm1,1); %mmm1 = |new2|
end
rrr11=[new2;rrn1];
hold on; plot3(rrr11(:,f1),rrr11(:,f2),rrr11(:,f3),'g.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new3(:,jj)=alpha*mn3(jj)+((num3(:,jj)-mn3(jj)))./(1+std3(jj));
end
mccnn1=mean(new3);
sccnn1=std(new3);
mmmm1=length(new3);
randn('seed', 129);
for jj=1:nn
    rrnn1(:,jj) = mccnn1(jj) + sccnn1(jj).*randn(mmmm1,1);
end
rrr111=[new3;rrnn1];
hold on; plot3(rrr111(:,f1),rrr111(:,f2),rrr111(:,f3),'b.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new4(:,jj)=alpha*mn4(jj)+((num4(:,jj)-mn4(jj)))./(1+std4(jj));
end
mccnnn1=mean(new4);
sccnnn1=std(new4);
mmmmm1=length(new4);
randn('seed', 129);
for jj=1:nn
    rrnnn1(:,jj) = mccnnn1(jj) + sccnnn1(jj).*randn(mmmmm1,1);
end
rrr1111=[new4;rrnnn1];
hold on; plot3(rrr1111(:,f1),rrr1111(:,f2),rrr1111(:,f3),'m.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new5(:,jj)=alpha*mn5(jj)+((num5(:,jj)-mn5(jj)))./(1+std5(jj));
end
mccnnnn1=mean(new5);
sccnnnn1=std(new5);
mmmmmm1=length(new5);
randn('seed', 129);
for jj=1:nn
    rrnnnn1(:,jj) = mccnnnn1(jj) + sccnnnn1(jj).*randn(mmmmmm1,1);
end
rrr11111=[new5;rrnnnn1];
hold on; plot3(rrr11111(:,f1),rrr11111(:,f2),rrr11111(:,f3),'k.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new6(:,jj)=alpha*mn6(jj)+((new6(:,jj)-mn6(jj)))./(1+std6(jj));
end
mccnnnnn1=mean(new6);
sccnnnnn1=std(new6);
mmmmmmm1=length(new6);
randn('seed', 129);
for jj=1:nn
    rrnnnnn1(:,jj) = mccnnnnn1(jj) + sccnnnnn1(jj).*randn(mmmmmmm1,1);
end
rrr111111=[new6;rrnnnnn1];
hold on; plot3(rrr111111(:,f1),rrr111111(:,f2),rrr111111(:,f3),'c.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new7(:,jj)=alpha*mn7(jj)+((new7(:,jj)-mn7(jj)))./(1+std7(jj));
end
mccnnnnnn1=mean(new7);
sccnnnnnn1=std(new7);
mmmmmmmm1=length(new7);
randn('seed', 129);
for jj=1:nn
    rrnnnnnn1(:,jj) = mccnnnnnn1(jj) + sccnnnnnn1(jj).*randn(mmmmmmmm1,1);
end
rrr1111111=[new7;rrnnnnnn1];
hold on; plot3(rrr1111111(:,f1),rrr1111111(:,f2),rrr1111111(:,f3),'y.');grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new8(:,jj)=alpha*mn8(jj)+((new8(:,jj)-mn8(jj)))./(1+std8(jj));
end
mccnnnnnnn1=mean(new8);
sccnnnnnnn1=std(new8);
mmmmmmmmm1=length(new8);
randn('seed', 129);
for jj=1:nn
    rrnnnnnnn1(:,jj) = mccnnnnnnn1(jj) + sccnnnnnnn1(jj).*randn(mmmmmmmmm1,1);
end
rrr11111111=[new8;rrnnnnnnn1];
hold on; plot3(rrr11111111(:,f1),rrr11111111(:,f2),rrr11111111(:,f3),'Color',[1 0.4 0.6]);grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new9(:,jj)=alpha*mn9(jj)+((new9(:,jj)-mn9(jj)))./(1+std9(jj));
end
mccnnnnnnnn1=mean(new9);
sccnnnnnnnn1=std(new9);
mmmmmmmmmm1=length(new9);
randn('seed', 129);
for jj=1:nn
    rrnnnnnnnn1(:,jj) = mccnnnnnnnn1(jj) + sccnnnnnnnn1(jj).*randn(mmmmmmmmmm1,1);
end
rrr111111111=[new9;rrnnnnnnnn1];
hold on; plot3(rrr111111111(:,f1),rrr111111111(:,f2),rrr111111111(:,f3),'Color',[0 0.4 0]);grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');

for jj=1:nn
    new10(:,jj)=alpha*mn10(jj)+((new10(:,jj)-mn10(jj)))./(1+std10(jj));
end
mccnnnnnnnnn1=mean(new10);
sccnnnnnnnnn1=std(new10);
mmmmmmmmmmm1=length(new10);
randn('seed', 129);
for jj=1:nn
    rrnnnnnnnnn1(:,jj) = mccnnnnnnnnn1(jj) + sccnnnnnnnnn1(jj).*randn(mmmmmmmmmmm1,1);
end
rrr1111111111=[new10;rrnnnnnnnnn1];
hold on; plot3(rrr1111111111(:,f1),rrr1111111111(:,f2),rrr1111111111(:,f3),'Color',[1 0.4 0]);grid on;
xlabel('Feature 1');ylabel('Feature 33');zlabel('Feature 59');
rrr1111111111(:,65) = 1;
rrr111111111(:,65) = 2;
rrr11111111(:,65) = 3;
rrr1111111(:,65) = 4;
rrr111111(:,65) = 5;
rrr11111(:,65) = 6;
rrr1111(:,65) = 7;
rrr111(:,65) = 8;
rrr11(:,65) = 9;
rrr1(:,65) = 10;
all = [rrr1111111111;rrr111111111;rrr11111111;rrr1111111;rrr111111;rrr11111;rrr1111;rrr111;rrr11;rrr1;];

[m, n] = size(all);
disp('m');
disp(m);
shuff = randperm(m);
for i=1:1:m
    tempAll(i,1:65) = all(shuff(i),1:65);
end
csvwrite('C:/Users/yo/Desktop/CSC510/HW3/meanshifted/cifar10meanshifted.csv', tempAll);