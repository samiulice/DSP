clc;
clear all;
close all;

I = input('Upsampling factor: ');
L = input('Length of the sequence: ');
f1 = input('Frequency of the first signal: ');
f2 = input('Frequency of the second signal: ');
n = 0:L-1;
x = sin(2*pi*f1*n)+sin(2*pi*f2*n);
y = interp(x,I);
subplot(2,1,1)
stem(x, 'LineWidth', 2);
subplot(2,1,2)
stem(y, 'LineWidth', 2);
grid on