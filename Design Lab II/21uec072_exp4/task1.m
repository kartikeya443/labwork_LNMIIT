clc;
clear all;
close all;

snr_db = 0:1:20;
snr_lin = 10.^(snr_db./10);
N = 1e6;
alpha = [3,1,-1,-3];

for sn = 1:length(snr_db)
    n_st = 1./sqrt(snr_lin(sn));
    x1 = randsrc(1,N,alpha);
    x2 = randsrc(1,N,alpha);

    x = x1+1j*x2; %16 qam gen
    noise = (1/sqrt(2))*complex(randn(1,N), randn(1,N));
    y = (1/sqrt(10))*x+n_st.*noise;
    y = sqrt(10)*y;
   
    for k = 1:N
       if (real(y(k))>=2)
           det_r(k) = 3;
       elseif (real (y(k))<2 && real(y(k))>=0)
           det_r(k) = 1;
       elseif (real (y(k))<0 && real(y(k))>=-2)
           det_r(k) = -1;
       else
           det_r(k) = -3;
       end

       if (imag(y(k))>=2)
           det_i(k) = 3j;
       elseif (imag(y(k))<2 && imag(y(k))>=0)
           det_i(k) = 1j;
       elseif (imag(y(k))<0 && imag(y(k))>=-2)
           det_i(k) = -1j;
       else
           det_i(k) = -3j;
       end
         
   end


    det = det_r + det_i;
    error(sn) = sum(x~=det)/N;
end

ber_th_qam = 1.5*erfc(sqrt(snr_lin./10));

figure;
semilogy(snr_db,error,'-+');
hold on;
semilogy(snr_db,ber_th_qam,'-o');
grid on;
