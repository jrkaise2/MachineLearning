openExample('vision/DeepLearningRCNNObjectDetectionExample')
cifar10Data = tempdir;
 url = 'https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz';
 helperCIFAR10Data.download(url, cifar10Data);
[trainingImages, trainingLabels, testImages, testLabels] = helperCIFAR10Data.load(cifar10Data);
 size(trainingImages);
numImageCategories = 10;
categories(trainingLabels);
disp(size(trainingImages));
% %------------------------32x32---------------------------------------
% % figure
% % map = containers.Map;
% 
% % num = 1;
% % n=0;
% % labelNum = 0;
% % d = zeros(1024,64);
% % for i=1:100
% %     img = trainingImages(:,:,:,i);
% %     label = trainingLabels(1:i,:);
% %     imwrite(img, strcat('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\test\',int2str(num),'.jpg'),'jpg', 'Quality', 100);
% %     img2 = imread(strcat('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\test\',int2str(num),'.jpg'));
% %      a = imresize(img,[64 64]);
% % if trainingLabels(i,:) =='frog'
% %     disp('frog founddddd');
% % end
% % disp(label)
% %     k = 1;
% %     c = zeros(1, 64);
% %     for ii = 1:8:256  %256/8=32 col-wise
% %         for j = 1:8:256 %256/8=32 row-wise
% %             %8x8=64 blocks /img
% %             b = img(ii:ii+7, j:j+7); %create 8x8 block
% %              c(k, :) = reshape(b,1,64);
% %             d(k+n,1:64) = reshape(b,1,64);
% %             d(k+n,65:65) = label(i,:);
% %             k = k+1;
% %         end
% %     end
% % %     csvwrite(strcat('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\test\',int2str(num),'.csv'), c);
% %     num = num + 1;
% %     n=n+1024;
% % end
% % csvwrite(strcat('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\1x16\concatCSV\concatFinal8x8.csv'), d);
% %-----------------separate classes into their csv's-----------------
n1=0;
n2=0;
n3=0;
n4=0;
n5=0;
n6=0;
n7=0;
n8=8;
n9=0;
n10=0;

m1=zeros(200, 64);
m2=zeros(200, 64);
m3=zeros(200, 64);
m4=zeros(200, 64);
m5=zeros(200, 64);
m6=zeros(200, 64);
m7=zeros(200, 64);
m8=zeros(200, 64);
m9=zeros(200, 64);
m10=zeros(200,64);
for i=1:100
    img = trainingImages(:,:,:,i);
    label = trainingLabels(1:i,:);
    img2 = imresize(img(:,:,1), [256 256]);
    if trainingLabels(i,:) == 'airplane'
         k = 1;
%         c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m1(k+n1,1:64) = reshape(b,1,64);
%                 m1(k+n1,65:65) = label(i,:);
                k = k+1;
            end
        end
    n1=n1+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'automobile'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m2(k+n2,1:64) = reshape(b,1,64);
%                 m2(k+n2,65:65) = label(i,:);
                k = k+1;
            end
        end
    n2=n2+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'bird'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m3(k+n3,1:64) = reshape(b,1,64);
%                 m3(k+n3,65:65) = label(i,:);
                k = k+1;
            end
        end
    n3=n3+1024;
    clear c;
    clear b;
    end
    if trainingLabels(i,:) == 'cat'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m4(k+n4,1:64) = reshape(b,1,64);
%                 m4(k+n4,65:65) = label(i,:);
                k = k+1;
            end
        end
    n4=n4+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'deer'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m5(k+n5,1:64) = reshape(b,1,64);
%                 m5(k+n5,65:65) = label(i,:);
                k = k+1;
            end
        end
    n5=n5+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'dog'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m6(k+n6,1:64) = reshape(b,1,64);
%                 m6(k+n6,65:65) = label(i,:);
                k = k+1;
            end
        end
    n6=n6+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'frog'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m7(k+n7,1:64) = reshape(b,1,64);
%                 m7(k+n7,65:65) = label(i,:);
                k = k+1;
            end
        end
    n7=n7+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'horse'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m8(k+n8,1:64) = reshape(b,1,64);
%                 m8(k+n8,65:65) = label(i,:);
                k = k+1;
            end
        end
    n8=n8+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'ship'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m9(k+n9,1:64) = reshape(b,1,64);
%                 m9(k+n9,65:65) = label(i,:);
                k = k+1;
            end
        end
    n9=n9+1024;
    clear b;
    clear c;
    end
    if trainingLabels(i,:) == 'truck'
            k=1;
%             c = zeros(1, 64);
        for ii = 1:8:256  %256/8=32 col-wise
            for j = 1:8:256 %256/8=32 row-wise
                %8x8=64 blocks /img
                b = img2(ii:ii+7, j:j+7); %create 8x8 block
%                 c(k, :) = reshape(b,1,64);
                m10(k+n10,1:64) = reshape(b,1,64);
%                 m10(k+n10,65:65) = label(i,:);
                k = k+1;
            end
        end
    n10=n10+1024;
    clear c;
    clear b;
    end
end

% csvwrite(strcat('C:\Users\yo\Desktop\CSC510\HW1\dataset_UPEK\',int2str(i),'_',int2str(j),'.csv'));
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\airplane.csv', m1);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\automobile.csv', m2);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\bird.csv', m3);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\cat.csv', m4);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\deer.csv', m5);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\dog.csv', m6);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\frog.csv', m7);
%for sum reason horse populates with first 8 rows with zeros, so remove.
m8(1:8,:)=[];
csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\horse.csv', m8);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\ship.csv', m9);
% csvwrite('C:\Users\yo\Desktop\CSC510\HW1\dataset_CIFAR10\8x8\truck.csv', m10);
% 
% %-------------------64x16 to 32x32-------------------------------------------
