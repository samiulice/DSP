%% DFT Leakage Minimization (filtering) using Hamming window function
clc;
clear;
close all;
Fs = 64000;                   % Sampling frequency (64KHz)
Ts = 1/Fs;                     % seconds
N = 64;                         %Number of DFT Points     
n = 0:N-1;
x= 8*sin(2*pi*3300*n*Ts) + 6*sin(2*pi*3700*n*Ts);     
% Plot first N discrete values of signal x:
figure(1);
plot(n,x,'b--o','LineWidth',2);
grid on;
xlabel('Time(millisecond)');
ylabel('Signal amplitude')
title('x signal versus time');     

%% Window Builtin Function
% w_Ham = hamming(N)';
% w_Han = hanning(N)';
% w_B = blackman(N)';

%% Window Function
w_Ham = 0.54 - 0.46*cos(2*pi*(n/(N-1)));      %Define Hamming window function
w_Han = 0.50 - 0.50*cos(2*pi*(n/(N-1)));      %Define Hamming window function
w_B = 0.42 - 0.5*cos(2*pi*(n/(N-1))) + 0.08*cos(4*pi*(n/(N-1)));     %Define Blackman window function

figure(2)
subplot(3,1,1)
stem(n,w_Ham,'k','LineWidth',2)
grid on
title('Hamming Window')
xlabel('n')
ylabel('w')

subplot(3,1,2)
stem(n,w_Han,'k','LineWidth',2);
grid on;
title('Hanning Window');
xlabel('n');
ylabel('w')

subplot(3,1,3)
stem(n,w_B,'k','LineWidth',2);
grid on;
title('Blackman Window');
xlabel('n');
ylabel('w')


%% Multiplication of Window function and signal x:
x_Ham = x.*w_Ham;               
x_Han = x.*w_Han;               
x_B = x.*w_B;               
figure(3)
subplot(3,1,1)
stem(n,x_Ham,'m','LineWidth',2);
grid on;
title('Multiplication of Hamming Window and Signal X');
xlabel('Time');
ylabel('Amplitude')

subplot(3,1,2)
stem(n,x_Han,'m','LineWidth',2);
grid on;
title('Multiplication of Hanning Window and Signal X');
xlabel('Time');
ylabel('Amplitude')

subplot(3,1,3)
stem(n,x_B,'m','LineWidth',2);
grid on;
title('Multiplication of Blackman Window and Signal X');
xlabel('Time');
ylabel('Amplitude')

%% DFT of signal x
[~,X_mag,~] = dft(x,N);
%% DFT of signal x with window
[~,X_dft_Ham,~] = dft(x_Ham, N);     
[~,X_dft_Han,~] = dft(x_Han, N);     
[~,X_dft_B,~] = dft(x_B, N);

figure(4) 
plot(n,X_mag,'g--o','LineWidth',1)
grid on;
hold on;
plot(n,X_dft_Ham,'r--o','LineWidth',1)
grid on;
hold on;
plot(n,X_dft_Han,'b--o','LineWidth',1)
grid on;
hold on;
plot(n,X_dft_B,'k--o','LineWidth',1)
grid on;
title('DFT Magnitudes of x after using Window')
xlabel('Frequency(KHz)')
ylabel('Magnitude')
legend('Without Window','Hamming Window','Hanning Window','Blackman Window','location','north');



