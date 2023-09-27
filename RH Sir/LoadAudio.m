clc;
clear all;
close all;

%% Load plain
plain = load('plain');
figure(1)
plot(plain)

%% Load sn0
sn0 = load('sn0');
figure(2)
plot(sn0)

%% Load sn5
sn5 = load('sn5');
figure(3)
plot(sn5)
%% Load sn10
sn10 = load('sn10');
figure(4)
plot(sn10)
%% Load sn15
sn15 = load('sn15');
figure(5)
plot(sn15)

%% Load sn20
sn20 = load('sn20');
figure(6)
plot(sn20)

%% Load sn_5
sn_5 = load('sn_5');
figure(7)
plot(sn5)