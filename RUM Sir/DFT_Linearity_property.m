%% Time Domain Signal
clc;
clear;
close all;
Fs = 16000;     % Sampling frequency (24KHz)
Ts = 1/Fs;      % seconds
N = 16;
t = 0:N-1;

x1= 2*sin(2*pi*1000*t*Ts);
x2= 5*sin(2*pi*3000*t*Ts);
x_comb = x1 + x2;     

%% Plot All Time Domain Siglans:
figure(1)
title('Time domain signal')
subplot(3,1,1)
stem(t,x1,'ko','LineWidth',2)
grid on
xlabel('Time(millisecond)')
ylabel('Signal amplitude')
title('x1 signal versus time')

subplot(3,1,2)
stem(t,x2,'bo','LineWidth',2)
grid on
xlabel('Time(millisecond)')
ylabel('Signal amplitude')
title('x2 signal versus time')

subplot(3,1,3)
stem(t,x_comb,'ro','LineWidth',2)
grid on
xlabel('Time(millisecond)')
ylabel('Signal amplitude')
title('Combined signal versus time')

%% DFT of Signal x1:   
[X1_exp,X1_mag,X1_ang] = dft(x1, N);
%% DFT of Signal x2:    
[X2_exp,X2_mag,X2_ang] = dft(x2, N);
%% DFT of combined Signal:     
[X_comb_exp,X_comb_mag,X_comb_ang] = dft(x_comb, N);

DFT_sum = X1_mag + X2_mag;
DFT_sum_ang = X1_ang + X2_ang;
%% Plot All DFTs:
figure(2)
subplot(2,2,1)
stem(t,X_comb_mag,'bo','LineWidth',2)
grid on
title('DFT Magnitudes of Combined signal')
xlabel('Frequency(KHz)')
ylabel('Magnitude')
subplot(2,2,2)
stem(t,X_comb_ang,'bo','LineWidth',2)
grid on
title('Phase angle  of Combined signal')
xlabel('Frequency(KHz)')
ylabel('Degree')

subplot(2,2,3)
stem(t,DFT_sum,'ro','LineWidth',2)
grid on
title('DFT Magnitudes of DFT Sum')
xlabel('Frequency(KHz)')
ylabel('Magnitude')
subplot(2,2,4)
stem(t,DFT_sum_ang,'ro','LineWidth',2)
grid on
title('Phase angle  of DFT Sum')
xlabel('Frequency(KHz)')
ylabel('Degree')


%% Verify DFT Linearity property:
Linearity_error = max(abs(X1_exp + X2_exp - X_comb_exp));
if Linearity_error < 1e-10
   disp('Linearity property of DFT is proved'); 
end
