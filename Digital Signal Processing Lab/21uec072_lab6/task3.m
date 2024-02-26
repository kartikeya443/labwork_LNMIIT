clc 
clear all 
close all

Im=imread('cameraman.tif');
Im1=zeros(64,64);
Im1(1:64,1:64)=Im(128:128+63,128:128+63);
M=8;
N=8;
beta(1)=sqrt(1/N);
beta(2:N)=sqrt(2/N);

for index1 = 1:8
    for index2 = 1:8
        XIm(1:8,1:8)=Im1(8*(index1-1)+1:8*(index1),8*(index2-1)+1:8*(index2));
for k = 1:M
    for l = 1:N
        sum=0;
        for i = 1:M
            for j = 1:N
                sum = sum + XIm(i, j) * cos((pi * (2 * i - 1) * (k - 1)) / (2 * M)) * cos((pi * (2 * j - 1) * (l - 1)) / (2 * N));
            end
        end
        XIm(k,l) = beta(k)*beta(l)*sum;
    end
end
y = XIm;
y1 = zeros(8,8);
y1(1:6,1:6) = y(1:6,1:6);
z=idct2(y1);
znew(8*(index1-1)+1:8*(index1),8*(index2-1)+1:8*(index2))=z(1:8,1:8);
    end 
end

subplot(1,2,1);
imshow(uint8(Im1));
title("Im1");
subplot(1,2,2);
imshow(uint8(znew));
title("Znew");