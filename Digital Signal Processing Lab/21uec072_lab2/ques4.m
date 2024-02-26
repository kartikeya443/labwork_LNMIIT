close all
clear all
clc

F = 3e3;
A = 0.5;
Fs2 = 8e3;
n2 = 0:1:ceil(5*Fs2/F);                                                                        
x = A*cos(2*pi*(n2*F)/Fs2);
subplot(1,3,1);
stem(n2,x);

y1 = myquantizer(x,8);
subplot(1,3,2);
stem(n2,y1);

z = zeros(length(x));
level = 8;
delta = (max(x)-min(x))/(level-1);
for i = 1:length(x)
    if x(i)>0 && x(i)<= delta/2
        x(i) = delta/2;
        z(i) = "10";
    elseif x(i) > delta && x(i)<= 3*delta/2
        x(i) = 3*delta/2;
        z(i) = "11";
    elseif x(i) > -delta/2 && x(i)<= 0
        x(i) = -delta/2;
        z(i) = "01";
    else
        x(i) = -3*delta/2;
        z(i) = "00";
    end
end
disp(z);
subplot(1,3,3);
stem(n2,z);