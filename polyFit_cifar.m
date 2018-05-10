%curve fitting
clear all;
close all;

%compare cat and bird
% c1 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\cat.csv');
% c2 = csvread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\bird.csv');

[num1, txt1, raw1] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\cat.csv');
[num2, txt2, raw2] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\bird.csv');

[num3, txt3, raw3] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\airplane.csv');
[num4, txt4, raw4] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\automobile.csv');
[num5, txt5, raw5] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\deer.csv');
[num6, txt6, raw6] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\dog.csv');
[num7, txt7, raw7] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\frog.csv');
[num8, txt8, raw8] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\horse.csv');
[num9, txt9, raw9] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\ship.csv');
[num10, txt10, raw10] = xlsread('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\grayscale_n=100\Unlabeled\truck.csv');
%mean of all features. return matrix of x-feature, y-mean of feature col.
for i=1:1:64
    m(i,1) = i;
    m(i,2) = mean(num3(:,i));
end
% std of all features. return matrix of x-feature, y-mean of feature col.
% for i=1:1:64
%     s(i,1) = i;
%     s(i,2) = std(num8(:,i));
% end
%-------------
for i=1:1:64
    m2(i,1) = i;
    m2(i,2) = mean(num2(:,i));
end
%-------------
% disp(m);
% disp(s);
% 
% figure;
% bar(m(1:64,1),m(:,2));

% %https://www.mathworks.com/help/matlab/ref/polyval.html
%------------------------------------
features = (m(1:64,1));
stds = (m(:,2));
offset = 0.3;
max = max(m(:,2))+offset; 
min = min(m(:,2))-offset;
T1 = table(features, stds);%64x2 table

features2 = (m2(1:64,1));
stds2 = (m2(:,2));
offset2 = 0.3;
% max2 = max(m2(:,2))+offset; 
% min2 = min(m2(:,2))-offset;
T2 = table(features2, stds2);%64x2 table

plot(features, stds,'-o'); %or 'o' for no tracing

hold on;

% plot(features2, stds2,'-o'); %or 'o' for no tracing
% axis([0 64 0 25]) %'inf' means infinity
% xlabel('feature #');
% ylabel('Mean value at feature column');
axis([0 64 min-2 max+2]) %'inf' means infinity
% hold on;

% S = Error estimation structure
% S has fields: R = Triangular factor from a Qr decomp. of the vandermonde
% matrix of x. df = degrees of freedom, normr = norm of the residuals
%The norm of the residuals is a measure of the deviation between the 
%correlation and the data. Residual = difference between sample and est.
%val
%a QR decomposition (also called a QR factorization) of a matrix 
% is a decomposition of a matrix A into a product A = QR of an
% orthogonal matrix Q and an upper triangular matrix R
% 
[p,S,mu] = polyfit(T1.features, T1.stds, 40);
%in general, (n-1) degrees for (n-1) pts
f = polyval(p,T1.features,[],mu); %or [],mu for stdz x-hat *************
plot(features, f);
title('Polynomial Curve Fitting (Means)');
xlabel('x= feature #');
ylabel('y= means of features');
hold off;
disp(f);
%------------------------------------------------

[y, delta] = polyval(p,T1.features,S, mu); %remove mu to non-stdz

intervalMinus = y+delta; 
intervalPlus = y-delta; 
fprintf('y-delta: %i\n', intervalMinus );
fprintf('y+delta: %i\n', intervalPlus );
interval = [intervalMinus;intervalPlus];

% figure;
% plot(1:64, intervalMinus, 'r');
% title('Standard Error (Standardized values)');
% xlabel('x = 64 features');
% ylabel('y = (y +/- delta)');
% hold on;
% plot(1:64, intervalPlus, 'b');
% hold off;

B = mldivide(T1.features, f); %solves Ax = B //y-int
fprintf('y-int B = %i\n', B);
fprintf('\n');
disp(delta);
%-------------------------------------------------
% for i=1:1:64
%     m2(i,1) = i;
%     m2(i,2) = mean(num2(:,i));
% end
% % std of all features. return matrix of x-feature, y-mean of feature col.
% for i=1:1:64
%     s2(i,1) = i;
%     s2(i,2) = std(num2(:,i));
% end
% disp(m2);
% % disp(s2);
% figure;
% bar(m2(1:64,1),m2(:,2));
% figure;
% bar(s2(1:64,1),m2(:,2));

