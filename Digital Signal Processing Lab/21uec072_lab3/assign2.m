close all
clc

% Convulation without inbuilt function:

x = [1,2,3,4];
h = [1,3,5,7];
x1 = length(x);
h1 = length(h);
%z = zeros(x1,h1);
y = zeros(1,x1+h1-1);

for i = 1:x1
    for j = 1:h1
        y(i+j-1) = y(i+j-1)+x(i)*h(j);
        %z(i,j) = x(i)*h(j);
    end
end

disp(y);

% Convolution with inbuilt function:
z = conv(x,h);
disp(z);