clc
clear all
close all

snr_db = [0:1:10];
snr_lin = 10.^(snr_db./10);
error = qfunc(sqrt(snr_lin));

semilogy(snr_db, error, '-+');
grid on;