
%% DFT Linearity Property: 
%% Time Domain Signal
clc;
clear;
close all;
Fs = 24000;     % Sampling frequency (24KHz)
Ts = 1/Fs;      % seconds
N = 24;
a = 4;
Fc_1 = 3000;
b = 7;
Fc_2 = 11000;
t = 0:N-1;

x1= a*sin(2*pi*Fc_1*t*Ts);
x2= b*sin(2*pi*Fc_2*t*Ts);
x_comb = x1 + x2;     

%% Plot All Time Domain Siglans:
figure(1)
plot(t,x1,'k--o','LineWidth',2)
grid on
xlabel('Time(millisecond)')
ylabel('Signal amplitude')
title('x1 signal versus time')

figure(2);
plot(t,x2,'b--o','LineWidth',2)
grid on
xlabel('Time(millisecond)')
ylabel('Signal amplitude')
title('x2 signal versus time')

figure(3)
plot(t,x_comb,'k--o','LineWidth',2)
grid on
xlabel('Time(millisecond)')
ylabel('Signal amplitude')
title('Combined signal versus time')

%% DFT of Signal x1:   
[~,X1_mag,~] = dft(x1, N);
%% DFT of Signal x2:    
[~,X2_mag,~] = dft(x2, N);
%% DFT of combined Signal:     
[~,X_comb_mag,~] = dft(x_comb, N);
%% Sum of the DFT values of x1 and x2:
DFT_Sum_mag = X1_mag + X2_mag;
%% Plot All DFTs:
figure(4)
subplot(2,1,1)
stem(t,X_comb_mag,'bo','LineWidth',2)
grid on
title('Magnitude of X-Comb-DFT')
xlabel('Frequency(KHz)')
ylabel('Magnitude')

subplot(2,1,2)
stem(t,DFT_Sum_mag,'ro','LineWidth',2)
grid on
title('Magnitude of DFT-SUM')
xlabel('Frequency(KHz)')
ylabel('Magnitude')

%% Verify DFT Linearity property: 
DFT_Linearity_error = max(abs(DFT_Sum_mag - X_comb_mag));
if DFT_Linearity_error < 1e-10
   disp('Linearity property of DFT is proved'); 
end
