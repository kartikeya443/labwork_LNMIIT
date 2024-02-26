clc
close all
clear all

snr_db = 0:3:20;
snr_lin = 10.^(snr_db./10);


N = 10^6;
x1 = randi([0, 1], 1, N);
x = 2*x1 - 1;
L=3;
theoritical=(factorial(2*L-1)/(factorial(L)*factorial(2*L-1-L))).*((1./(2*snr_lin)).^L);

for i=1:length(snr_db)
    n_sd = 1./sqrt(snr_lin(i));

    h1 = 1/sqrt(2)*complex(randn(1,N), randn(1,N));
    h2 = 1/sqrt(2)*complex(randn(1,N), randn(1,N));
    h3 = 1/sqrt(2)*complex(randn(1,N), randn(1,N));
    
    noise1 = n_sd.*sqrt(1/2).*complex(randn(1,N),randn(1,N));
    noise2 = n_sd.*sqrt(1/2).*complex(randn(1,N),randn(1,N));
    noise3 = n_sd.*sqrt(1/2).*complex(randn(1,N),randn(1,N));
    
    y1 = h1.*x + noise1;
    y2 = h2.*x + noise2;
    y3 = h3.*x + noise3;
    
    mcrcombineY = conj(h1).*y1 + conj(h2).*y2 + conj(h3).*y3;
    detectedY = mcrcombineY./(h1.*conj(h1)+h2.*conj(h2)+h3.*conj(h3));
    detectedX = 2*(detectedY > 0) - 1;
    error = sum(abs(detectedX - x).^2);
    ber(i) = error./N;
end

figure;
semilogy(snr_db,ber,'-+');
hold on;
semilogy(snr_db,theoritical,'-o');
grid on;
