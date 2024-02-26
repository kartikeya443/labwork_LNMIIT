clc
close all
clear all

load handel.mat

filename = 'handel.wav';
audiowrite(filename,y,Fs);
clear y Fs