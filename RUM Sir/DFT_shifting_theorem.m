%% A DFT shifting theorem example (using exponential form of DFT equation)
clc;   clear;   close all;

j = sqrt(-1);
N = 8;
k = 3;            % Amount of shift in Time-domain signal  
Fs = 8e3;         % Sampling frequency 8KHz
Ts = 1/Fs;

t = 0:N+k-1;
x = sin(2*pi*1000*t*Ts)+0.5*sin(2*pi*2000*t*Ts+(3*pi/4));
n = 0:N-1;
x_original = x(1, 1:N);                 %original sequence 
x_shifted = x(1,1+k:end);            % sequence shifted by k samples

% Plot first N discrete values of signal x:
figure(1);
subplot(2,1,1)
stem(n,x_original,'bo', 'LineWidth', 2);
grid on;
xlabel('Time (millisecond)');
ylabel('Signal amplitude')
title('Original Signal');   
subplot(2,1,2)
stem(n,x_shifted,'ro', 'LineWidth', 2);
grid on;
xlabel('Time (millisecond)');
ylabel('Signal amplitude')
title('Time Shifted Signal');   

%% DFT of original sequence
[X_exp,X_mag,X_ang] = dft(x_original, N);

%% Using DFT shifting formula
X_shifted_mag = zeros(1,N);
X_shifted_ang= zeros(1,N);
for m = 0:N-1
    i = m+1;
    X_shifted_exp = exp((j*2*pi*k*m)/N)*X_exp(1,i);
    X_real = real(X_shifted_exp);
    if abs(X_real)< 1e-10
        X_real = 0;
    end
    X_imag = imag(X_shifted_exp);
    if abs(X_imag) < 1e-10
       X_imag = 0;  
    end
    X_shifted_mag(1,i) = sqrt(X_real.^2+X_imag.^2); 
    X_ang_rad= (180/3.14159)*atan(X_imag/X_real);
    X_ang_rad(isnan(X_ang_rad)) = 0;
    X_shifted_ang(1,i)= X_ang_rad;   
end

%% Plot all DFTs
figure(2)
subplot(2,2,1)
stem(n,X_mag,'ro', 'LineWidth', 2)
grid on;
title('DFT Magnitudes of Original Sequence')
xlabel('Frequency(KHz)')
ylabel('Amplitude')

subplot(2,2,2)
stem(n,X_shifted_mag,'bo', 'LineWidth', 2)
grid on;
title('DFT Magnitudes of Shifted sequene')
xlabel('Frequency(KHz)')
ylabel('Amplitude')

subplot(2,2,3)
stem(n,X_ang,'ro', 'LineWidth', 2)
grid on;
title('DFT Angle of Original Sequence')
xlabel('Frequency(KHz)')
ylabel('Degree')

subplot(2,2,4) 
stem(n,X_shifted_ang,'bo', 'LineWidth', 2)
grid on;
title('DFT Angle of Shifted sequene')
xlabel('Frequency(KHz)')
ylabel('Degree')

%% Verification of DFT Shifting Property: 
magnitude_diff  = max(abs(X_mag - X_shifted_mag));
    if magnitude_diff < 1e-10 
       disp('Shifting Property of DFT is proved');
    end
