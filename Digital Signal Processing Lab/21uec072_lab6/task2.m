clc
clear all
close all

Im =  imread('cameraman.tif');
I = Im(1:8, 1:8);
[M,N] = size(I);
Z1 = dct2(I);
Z2 = mycompression(Im);

error = mse(Z1,Z2)

subplot(1,2,1);
imshow(uint8(Im));
title('Original Image');
subplot(1,2,2);
imshow(uint8(Z2));
title('My Img');