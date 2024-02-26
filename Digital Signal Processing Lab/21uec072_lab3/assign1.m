clc 
close all
x = [1 2];
y = [2 3 4];
m = length(x);
n = length(y);
X = [x zeros(1,n)];
Y = [y zeros(1,m)];
for i = 1:m+n-1
    for j = 1:i
        h(i,j) = Y(i-j+1);
    end
end
disp(h);