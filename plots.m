Fs = 256;
Ts = 1/Fs;
t = [0:Ts:1-Ts];

A = cos(2*pi*40*t);
% plot(t, A, '-')
stem(A)
title("Original signal");
% At this rate, 256/40 = 6.4 samples per cycle

figure
A = cos(2*pi*t);
stem(A)
title("Target signal");

% Multiply sampling frequency by 8
% 51.2 samples/cycle
Fs = 2048;
Ts = 1/Fs;
t = [0:Ts:1/40];
A = cos(2*pi*40*t);
figure
stem(A);
title("Adequately-sampled signal")

% STATUS: 440 cycles per second
% At 2048 samples per second
% GOAL: 2048 samples for 1 second
% One cycle per second (1 Hz)