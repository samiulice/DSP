
%% DFT Leakage Minimization (filtering) using Hamming window function
clc;
clear;
close all;
Fs = 64000;                   % Sampling frequency (64KHz)
Ts = 1/Fs;                     % seconds
N = 64;                         %Number of DFT Points     
a = 8;
Fc_1 = 3300;
b = 6;
Fc_2 = 3700;

n = 0:N-1;
x= a*sin(2*pi*Fc_1*n*Ts) + b*sin(2*pi*Fc_2*n*Ts);     
% Plot first N discrete values of signal x:
figure(1);
plot(n,x,'b--o','LineWidth',2);
grid on;
xlabel('Time(millisecond)');
ylabel('Signal amplitude')
title('x signal versus time');

%% DFT of x_comb (using exponential equation):

[X_exp,~,~] = dft(x, N);

%% Filtering using Window Function
w_Ham = 0.54 - 0.46*cos(2*pi*(n/(N-1)));      %Define Hamming window function
w_Han = 0.50 - 0.50*cos(2*pi*(n/(N-1)));      %Define Hamming window function
w_B = 0.42 - 0.5*cos(2*pi*(n/(N-1))) + 0.08*cos(4*pi*(n/(N-1)));     %Define Blackman window function
figure(2)
stem(n,w_Ham,'k','LineWidth',2)
grid on
title('Hamming Window')
xlabel('n')
ylabel('w')

figure(3)
stem(n,w_Han,'k','LineWidth',2);
grid on;
title('Hanning Window');
xlabel('n');
ylabel('w')

figure(4)
stem(n,w_B,'k','LineWidth',2);
grid on;
title('Blackman Window');
xlabel('n');
ylabel('w')


%% Multiplication of Window function and signal x:
x_Ham = x.*w_Ham;               
x_Han = x.*w_Han;               
x_B = x.*w_B;               
figure(5)
stem(n,x_Ham,'m','LineWidth',2);
grid on;
title('Multiplication of Hamming Window and Signal X');
xlabel('Time');
ylabel('Amplitude')

figure(6)
stem(n,x_Han,'m','LineWidth',2);
grid on;
title('Multiplication of Hanning Window and Signal X');
xlabel('Time');
ylabel('Amplitude')

figure(7)
stem(n,x_B,'m','LineWidth',2);
grid on;
title('Multiplication of Blackman Window and Signal X');
xlabel('Time');
ylabel('Amplitude')

%% DFT of signal x with window
[X_dft_Ham,~,~] = dft(x_Ham, N);     
[X_dft_Han,~,~] = dft(x_Han, N);     
[X_dft_B,~,~] = dft(x_B, N);

figure(8); 
stem(n,X_exp,'r','LineWidth',2)
grid on;
title('Magnitude of DFT of signal x')
xlabel('Frequency(KHz)')
ylabel('Magnitude')

figure(9); 
stem(n,X_dft_Ham,'LineWidth',2);
grid on;
title('Magnitude of DFT of X after using Hamming Window')
xlabel('Frequency(KHz)')
ylabel('Magnitude')

figure(10); 
stem(n,X_dft_Han,'LineWidth',2);
grid on;
title('Magnitude of DFT of X after using Hanning Window')
xlabel('Frequency(KHz)')
ylabel('Magnitude')

figure(11); 
stem(n,X_dft_B,'LineWidth',2);
grid on;
title('Magnitude of DFT of X after using Blackman Window')
xlabel('Frequency(KHz)')
ylabel('Magnitude')



