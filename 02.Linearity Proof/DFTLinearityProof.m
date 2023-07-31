clc;
clear;
close all;
load('X_mag.mat');
load('X1_mag.mat');
load('X2_mag.mat');

X_new_sum = X1_mag+X2_mag;
Linearity_error = max(abs(X_new_sum - X_mag));
if Linearity_error < 1e-10
    fprintf('Linearity_is_proved');
else
    fprintf('Linearity_error');
end
