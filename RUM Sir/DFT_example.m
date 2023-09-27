%% DFT example (using exponential form of DFT equation)
clc;
clear all;
close all;
N = 8;
Fs = 8*1e3;         % Sampling frequency 8KHz
Ts = 1/Fs;
t = 0:N-1;
x = sin(2*pi*1000*t*Ts)+0.5*sin(2*pi*2000*t*Ts+(3*pi/4));

% Plot first N discrete values of continuous signal x :
 figure(1)
 plot(t,x,'b--o','LineWidth',2)   
 xlabel('Time')
 ylabel('Amplitude')
 title('Signal x in time-domain')
 grid on

%% DFT using Matlab builtin function: 

% n_1 = length(x);
% dft_matlab = x*dftmtx(n_1);

%% DFT using exponential equation:
[X_exp,X_mag,X_ang] = dft(x, N);
figure(2)
X_real = real(X_exp);
stem(t,X_real,'r','LineWidth',2)
grid on
title('Real part')
xlabel('Frequency(KHz)')
ylabel('Amplitude')

figure(3)
X_imag = imag(X_exp);
stem(t,X_imag,'g','LineWidth',2)
grid on
title('Imaginary part')
xlabel('Frequency(KHz)')
ylabel('Amplitude')

figure(4)
stem(t,X_mag,'k','LineWidth',2)
grid on;
title('Magnitude')
xlabel('Frequency(KHz)')
ylabel('Magnitude')

figure(5)
stem(t,X_ang,'b','LineWidth',2)
grid on;
title('Phase angle in Degrees')
xlabel('Frequency(KHz)')
ylabel('Degree')