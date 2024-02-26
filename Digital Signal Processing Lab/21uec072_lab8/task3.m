 clc;
clear all;
close all;

x = [1,2,3,4,5,6,7,8];
y = fft(x);
N = length(x);
V = log2(N);
x = [x, zeros(2^V-N)];
x = bitrevorder(x);

half = 1;
for level= 1:V 
    for index = 0:2^level:N-1
        for n= 0:(half-1)
            pos = n + index + 1;
            power=(2^(V-level))*n;
            W = exp(-2*1i*pi*power/N);
            a = x(pos) + x(pos+half).*W;
            b = x(pos) - x(pos+half).*W;
            x(pos) = a;
            x(pos+half) = b;
        end
    end
    half= half*2;
end
disp(x);
disp(y);