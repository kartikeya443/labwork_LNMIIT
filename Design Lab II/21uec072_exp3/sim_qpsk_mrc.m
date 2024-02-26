clc
clear all
close all

snrdb = 0:3:30;
error_bpsk = zeros(1,length(snrdb));
snr_lin = 10.^(snrdb/10);

for p = 1:length(snrdb)
    snrlin = 10^(snrdb(p)/10);
    n_sd = 1/sqrt(snrlin);  %standerd deviation
    sim('simulink_qpsk_mrc.slx');
    error_bpsk(p) = ans.error;
end
semilogy(snrdb,error_bpsk,'-*')
hold on;
L = 2;
th = (factorial(2*L - 1)/(factorial(L)*factorial(L- 1))); 
th = 2*th./((2.*snr_lin).^L);
semilogy(snrdb, th, '-ok');