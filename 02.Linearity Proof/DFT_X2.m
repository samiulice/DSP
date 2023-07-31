
%% A DFT example (using exponential form of DFT equation)
clc;   clear;   close all;
DFT_points = 8;
j = sqrt(-1);
Fs = 8*1e3;         % Sampling frequency 8KHz
Ts = 1/Fs;
i = 1;
x2 = [];
for n = 1:DFT_points
    m = n-1;
    x2(i) = 0.5*sin(2*pi*2000*m*Ts+(3*pi/4));
    i = i + 1;
end
t = 1:DFT_points;
% Plot first N discrete values of continuous signal x :
   figure(1);   plot(t,x2,'b--o');   grid on;
   xlabel('Time (millisecond)');     ylabel('Signal amplitude')
   title('Signal x in time-domain');   zoom xon;


N = DFT_points;   % The number of samples of input sequence- x and the number of frequency points in the DFT output  

%% DFT using Matlab builtin function: 

% n_1 = length(x);
% dft_matlab = x*dftmtx(n_1);


%% DFT using exponential equation:
X_exp = zeros(N,1);     Xe_real = zeros(N,1);     Xe_imag = zeros(N,1);
X2_mag = zeros(N,1);    Xe_ang_rad = zeros(N,1);  Xe_ang_deg = zeros(N,1);
for m = 1:DFT_points
    X_1 = zeros(N,1);   
    m_e = m - 1;
    for ii = 1:N
        n = ii-1;   
        X_p1 = [];   
        X_p1 = x2(1,ii)*exp((-j*2*pi*n*m_e)/N);                    
        X_1(ii,1) = X_p1;  
    end
    X_exp(m,1) = sum(X_1(:,1));
    Xe_real(m,1) = real(X_exp(m,1));
        if Xe_real(m,1) > 0 && Xe_real(m,1) < 1e-10
           Xe_real(m,1) = 0;  
        end  
        if Xe_real(m,1) < 0 && Xe_real(m,1) > -1e-10
           Xe_real(m,1) = 0;  
        end
    Xe_imag(m,1) = imag(X_exp(m,1));
        if Xe_imag(m,1) > 0 && Xe_imag(m,1) < 1e-10
           Xe_imag(m,1) = 0;  
        end  
        if Xe_imag(m,1) < 0 && Xe_imag(m,1) > -1e-10
           Xe_imag(m,1) = 0;  
        end
    X2_mag(m,1) = sqrt(Xe_real(m,1).^2 + Xe_imag(m,1).^2);
    Xe_ang_rad(m,1) = atan(Xe_imag(m,1)/Xe_real(m,1));     Xe_ang_rad(isnan(Xe_ang_rad)) = 0;
    Xe_ang_deg(m,1) = (180/3.14159)*Xe_ang_rad(m,1); 
end

mf = 0:DFT_points-1;
figure(2); 
stem(mf,Xe_real,'LineStyle','-.',...
     'MarkerSize',15,'Marker','s',...
     'MarkerFaceColor','blue',...
     'MarkerEdgeColor','green')
grid on;
title('Real part of X_exp(m)')
xlabel('m (KHz)')
ylabel('Amplitude')

figure(3);
stem(mf,Xe_imag,'LineStyle','-.',...
     'MarkerSize',15,'Marker','s',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','green')
grid on;
title('Imaginary part of X_exp(m)')
xlabel('m (KHz)')
ylabel('Amplitude')

figure(4); 
stem(mf,X2_mag,'LineStyle','--',...
     'MarkerSize',15,'Marker','s',...
     'MarkerFaceColor','black',...
     'MarkerEdgeColor','green')
grid on;
title('Magnitude of X_exp(m)')
xlabel('m (KHz)')
ylabel('Magnitude')

figure(5); 
stem(mf,Xe_ang_deg,'LineStyle','--',...
     'MarkerSize',15,'Marker','s',...
     'MarkerFaceColor','cyan',...
     'MarkerEdgeColor','green')
grid on;
title('Phase angle of X_exp(m)')
xlabel('m (KHz)')
ylabel('Degree')

save X2_mag X2_mag;

