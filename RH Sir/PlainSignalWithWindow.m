clc;
clear all;
close all;

%Load
plain = load('plain');
figure(1)
plot(plain)

%% voice: 
figure(2)
subplot(3,1,1)
%segment
st = 8001;
N = 512;
voice_seg = plain(st:st+N-1);
plot(voice_seg)
subplot(3,1,2)
voice_exp = abs(fft(voice_seg,N).^2);
plot(voice_exp);
subplot(3,1,3)
voice_exp_real  = real(ifft(voice_exp));
plot(voice_exp_real);

%% nonvoice
figure(3)
subplot(3,1,1)
%segment
st = 3001;
nvoice_seg = plain(st:st+N-1);
plot(nvoice_seg)

subplot(3,1,2)
nvoice_exp = abs(fft(nvoice_seg,N).^2);
plot(nvoice_exp);
subplot(3,1,3)
nvoice_exp_real  = real(ifft(nvoice_exp));
plot(nvoice_exp_real);

%% Voice Signal Filtering using Hamming Window
figure(4)
w_Ham = zeros(N,1);
for n = 0:N-1
    w_Ham(n+1,1) = 0.54 - 0.46*cos(2*pi*(n/(N-1)));      %Define Hamming window function
end
voice_Ham = voice_seg.*w_Ham;
subplot(2,1,1)
voice_exp_Ham = abs(fft(voice_Ham,N).^2);
plot(voice_exp_Ham);
subplot(2,1,2)
voice_exp_Ham_real  = real(ifft(voice_exp_Ham));
plot(voice_exp_Ham_real);

%% Non-Voice Signal Filtering using Hamming Window
figure(5)
nvoice_Ham = nvoice_seg.*w_Ham;
subplot(2,1,1)
nvoice_exp_Ham = abs(fft(nvoice_Ham,N).^2);
plot(nvoice_exp_Ham);
subplot(2,1,2)
nvoice_exp_Ham_real  = real(ifft(nvoice_exp_Ham));
plot(nvoice_exp_Ham_real);

%% Voice Signal Filtering using Hanning Window
figure(6)
w_Han = zeros(N,1);
for n = 0:N-1
    w_Han(n+1,1) = 0.50 - 0.5*cos(2*pi*(n/(N-1)));      %Define Hamming window function
end
voice_Han = voice_seg.*w_Han;
subplot(2,1,1)
voice_exp_Han = abs(fft(voice_Han,N).^2);
plot(voice_exp_Han);
subplot(2,1,2)
voice_exp_Han_real  = real(ifft(voice_exp_Han));
plot(voice_exp_Han_real);

%% Non-Voice Signal Filtering using Hanning Window
figure(7)
nvoice_Han = nvoice_seg.*w_Han;
subplot(2,1,1)
nvoice_exp_Han = abs(fft(nvoice_Han,N).^2);
plot(nvoice_exp_Han);
subplot(2,1,2)
nvoice_exp_Han_real  = real(ifft(nvoice_exp_Han));
plot(nvoice_exp_Han_real);



