clc;
clear all;
close all;

N = 25;
Wc = 0.5;
w = 0:0.1:pi;
%% FIR Low Pass Filter using Blackman Window
x = fir1(N,Wc,blackman(N+1));
h = freqz(x,1,w);
subplot(2,2,1)
plot(w/pi,abs(h));
grid on;
title('FIR LPF using Blackman Window');
xlabel('Normalized Frequency');
ylabel('Magnitude in dB');
%% FIR Low Pass Filter using Hamming Window
x = fir1(N,Wc,hamming(N+1));
h = freqz(x,1,w);
subplot(2,2,2)
plot(w/pi,abs(h));
grid on;
title('FIR LPF using Hamming Window');
xlabel('Normalized Frequency');
ylabel('Magnitude in dB');
%% FIR Low Pass Filter using Hanning Window
x = fir1(N,Wc,hanning(N+1));
h = freqz(x,1,w);
subplot(2,2,3)
plot(w/pi,abs(h));
grid on;
title('FIR LPF using Hanning Window');
xlabel('Normalized Frequency');
ylabel('Magnitude in dB');
%% FIR Low Pass Filter using Kaiser Window
x = fir1(N,Wc,kaiser(N+1,3.5));
h = freqz(x,1,w);
subplot(2,2,4)
plot(w/pi,abs(h));
grid on;
title('FIR LPF using Kaiser Window');
xlabel('Normalized Frequency');
ylabel('Magnitude in dB');
