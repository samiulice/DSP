clc;
clear all;
close all;

I = input('Upsampling factor: ');
D = input('Downsampling factor: ');
L = input('Length of the sequence: ');
f1 = input('Frequency of the first signal: ');
f2 = input('Frequency of the second signal: ');
n = 0:L-1;
x = sin(2*pi*f1*n) + sin(2*pi*f2*n);
y = resample(x, I, D);

subplot(2,1,1)
stem(x)
subplot(2,1,2)
stem(y)