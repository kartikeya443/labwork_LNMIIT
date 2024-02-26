clc
clear all
close all

snr_db = 0:3:30;
error_qpsk = zeros(1,length(snr_db));
error_th = zeros(1,length(snr_db));

for p=1:length(snr_db)
    snr_lin = 10^(snr_db(p)/10);
    n_sd = 1/sqrt(snr_lin);
    sim('sim_21uec072.slx');
    error_qpsk(p) = ans.simout;
    error_th(p) = (1 - sqrt(snr_lin/(snr_lin+2)));
end



semilogy(snr_db,error_qpsk,'-*')
hold on
semilogy(snr_db,error_th,'-o')
hold off
grid on