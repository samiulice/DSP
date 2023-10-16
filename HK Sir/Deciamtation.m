clc;
clear all;
close all;
D=input('Downsampling factor: ');
L=input('Length of the input signal: ');
f1=input('Frequency of first sinusodal: ');
f2=input('Frequency of second sinusodal: ');
n=0:L-1;
x=sin(2*pi*f1*n)+sin(2*pi*f2*n);
y=decimate(x,D,'fir');
subplot(2,1,1);
stem(x);
subplot(2,1,2)
stem(y);
