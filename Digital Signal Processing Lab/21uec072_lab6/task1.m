clc
clear all
close all

Im = imread('cameraman.tif');
[M,N] = size(Im);
dct_coeff = dct2(Im);
Z = zeros(M,N);
for i = 1:M
    for j = 1:N
        if(i<=M/2 && j<=N/2)
            Z(i,j) = dct_coeff(i,j);
        else 
            Z(i,j) = 0;
        end
    end
end

z_out = idct2(Z);
subplot(1,2,1);
imshow(uint8(Im));
title('Original Image');
subplot(1,2,2);
imshow(uint8(z_out));
title('Re-construct Img');

p = ((N)^2 - (128))/(N)^2
