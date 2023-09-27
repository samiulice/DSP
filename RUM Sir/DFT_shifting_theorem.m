%% A DFT shifting theorem example (using exponential form of DFT equation)
clc;   clear;   close all;

j = sqrt(-1);
N = 8;
k = 3;            % Amount of shift in Time-domain signal  
Fs = 8e3;         % Sampling frequency 8KHz
Ts = 1/Fs;
t = 0:N+k-1;

x = sin(2*pi*1000*t*Ts)+0.5*sin(2*pi*2000*t*Ts+(3*pi/4));

x_original = x(1, 1:N);                 %original sequence 
x_shifted = x(1,1+k:end);            % sequence shifted by k samples

% Plot first N discrete values of signal x:
figure(1);
plot(t,x,'b--o', 'LineWidth', 2);
grid on;
zoom xon;
xlabel('Time (millisecond)');     ylabel('Signal amplitude')
title('x signal versus time');   

%% DFT of original sequence
[X_exp,~,~] = dft(x_original, N);
%% DFT of shifted sequence
[~, X_Shifted_mag, X_Shifted_ang] = dft(x_shifted, N);

%% Using DFT shifting formula
X_Cal_mag = zeros(1,N);
X_Cal_ang= zeros(1,N);
for m = 1:N
    X_Cal_exp = exp((j*2*pi*k*(m-1))/N)*X_exp(1,m);
    X_real = real(X_Cal_exp);
    if abs(X_real)< 1e-10
        X_real = 0;
    end
    X_imag = imag(X_Cal_exp);
    if abs(X_imag) < 1e-10
       X_imag = 0;  
    end
    X_Cal_mag(1,m) = sqrt(X_real.^2+X_imag.^2); 
    X_ang = (180/3.14159)*atan(X_imag/X_real);
    X_ang(isnan(X_ang)) = 0;
    X_Cal_ang(1,m)= X_ang;   
end

%% Plot all DFTs
n = 0:N-1;
figure(2)
subplot(2,2,1)
stem(n,X_Shifted_mag,'r--o', 'LineWidth', 2)
grid on;
title('DFT Magnitudes of Shifted Sequence')
xlabel('Frequency(KHz)')
ylabel('Amplitude')

subplot(2,2,2)
stem(n,X_Cal_mag,'b--o', 'LineWidth', 2)
grid on;
title('Calculated Magnitudes of Shifted sequene')
xlabel('Frequency(KHz)')
ylabel('Amplitude')

subplot(2,2,3)
stem(n,X_Shifted_ang,'r--o', 'LineWidth', 2)
grid on;
title('DFT Angle of Shifted Sequence')
xlabel('Frequency(KHz)')
ylabel('Degree')

subplot(2,2,4) 
stem(n,X_Cal_ang,'b--o', 'LineWidth', 2)
grid on;
title('Calculated Angle of Shifted sequene')
xlabel('Frequency(KHz)')
ylabel('Degree')

%% Verification of DFT Shifting Property: 
magnitude_diff = max(abs(X_Shifted_ang - X_Cal_ang));
angle_diff = max(abs(X_Shifted_mag - X_Cal_mag));
    if magnitude_diff < 1e-10 && angle_diff < 1e-10 
       disp('Shifting Property of DFT is proved');
    end
