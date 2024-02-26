clc
clear all
close all

snr_db = 0:1:20;
snr_lin = 10.^(snr_db./10);

for i = 1:length(snr_lin)
    n_st = 1./sqrt(snr_lin(i));
    sim("simu_21uec072.slx");
end

error = ans.error