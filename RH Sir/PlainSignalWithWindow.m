clc;
clear all;
close all;

%Load
plain = load('plain');
figure(1)
plot(plain)
xlabel('Time');
ylabel('Amplitude');
title('Plain Signal');


%% voice: 
figure(2)
subplot(3,1,1)
st = 8001;
N = 512;
voice_seg = plain(st:st+N-1);
plot(voice_seg)
xlabel('Time');
ylabel('Amplitude');
title('Voice signal');


subplot(3,1,2)
voice_exp_mag = abs(fft(voice_seg,N).^2);
plot(voice_exp_mag);
xlabel('Frequency');
ylabel('Magnitude');
title('DFT');

subplot(3,1,3)
voice_exp_real  = real(ifft(voice_exp_mag));
plot(voice_exp_real);
xlabel('Time');
ylabel('Amplitude');
title('IDFT');



%% nonvoice
figure(3)
subplot(3,1,1)
st = 17001;
N = 512;
nvoice_seg = plain(st:st+N-1);
plot(nvoice_seg)
xlabel('Time');
ylabel('Amplitude');
title('Non Voice signal');

subplot(3,1,2)
nvoice_exp_mag = abs(fft(nvoice_seg,N).^2);
plot(nvoice_exp_mag);
xlabel('Frequency');
ylabel('Magnitude');
title('DFT');

subplot(3,1,3)
nvoice_exp_real  = real(ifft(nvoice_exp_mag));
plot(nvoice_exp_real);
xlabel('Time');
ylabel('Amplitude');
title('IDFT');

%% Voice Signal Filtering using Hamming Window
n = 0:N-1;
w_Ham(n+1, 1)= 0.54 - 0.46*cos(2*pi*(n/(N-1)));      %Define Hamming window function
figure(4)
subplot(3,1,1)
voice_Ham = voice_seg.*w_Ham;
plot(voice_Ham)
xlabel('Time');
ylabel('Amplitude');
title('Voice signal with Hamming Window');

subplot(3,1,2)
voice_exp_Ham = abs(fft(voice_Ham,N).^2);
plot(voice_exp_Ham);
xlabel('Frequency');
ylabel('Magnitude');
title('DFT');

subplot(3,1,3)
voice_exp_Ham_real  = real(ifft(voice_exp_Ham));
plot(voice_exp_Ham_real);
xlabel('Time');
ylabel('Amplitude');
title('IDFT');

%% Non-Voice Signal Filtering using Hamming Window
figure(5)
subplot(3,1,1)
nvoice_Ham = nvoice_seg.*w_Ham;
plot(nvoice_Ham);
xlabel('Time');
ylabel('Amplitude');
title('Non Voice signal with Hamming Window');

subplot(3,1,2)
nvoice_exp_Ham = abs(fft(nvoice_Ham,N).^2);
plot(nvoice_exp_Ham);
xlabel('Frequency');
ylabel('Magnitude');
title('DFT');

subplot(3,1,3)
nvoice_exp_Ham_real  = real(ifft(nvoice_exp_Ham));
plot(nvoice_exp_Ham_real);
xlabel('Time');
ylabel('Amplitude');
title('IDFT');

%% Voice Signal Filtering using Hanning Window
w_Han(n+1,1) = 0.50 - 0.5*cos(2*pi*(n/(N-1)));      %Define Hamming window function
figure(6)
subplot(3,1,1)
voice_Han = voice_seg.*w_Han;
plot(voice_Han);
xlabel('Time');
ylabel('Amplitude');
title('Voice signal with Hanning Window');

subplot(3,1,2)
voice_exp_Han = abs(fft(voice_Han,N).^2);
plot(voice_exp_Han);
xlabel('Frequency');
ylabel('Magnitude');
title('DFT');

subplot(3,1,3)
voice_exp_Han_real  = real(ifft(voice_exp_Han));
plot(voice_exp_Han_real);
xlabel('Time');
ylabel('Amplitude');
title('IDFT');

%% Non-Voice Signal Filtering using Hanning Window
figure(7)
subplot(3,1,1)
nvoice_Han = nvoice_seg.*w_Han;
plot(nvoice_Han);
xlabel('Time');
ylabel('Amplitude');
title('Non Voice signal with Hanning Window');

subplot(3,1,2)
nvoice_exp_Han = abs(fft(nvoice_Han,N).^2);
plot(nvoice_exp_Han);
xlabel('Frequency');
ylabel('Magnitude');
title('DFT');

subplot(3,1,3)
nvoice_exp_Han_real  = real(ifft(nvoice_exp_Han));
plot(nvoice_exp_Han_real);
xlabel('Time');
ylabel('Amplitude');
title('IDFT');

