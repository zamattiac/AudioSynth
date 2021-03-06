close all

[y, Fs] = audioread('trumpeta.mp3');
Ts = 1/Fs;
% End time = (number of samples / samples per second) - 1
t = [0:Ts:length(y)/Fs-Ts];
figure
plot(t, y)
title("Original")

Y = fft(y, Fs);
% Low-pass at Fs/2 to eliminate replicas
Y_limited = Y(1:Fs/2);
freqs = [0:Fs/2-1];
figure
plot(freqs, Y_limited)
title("FFT")

idx = find(Y_limited > 90);
vals = real(Y(idx));
text(idx, vals, idx + ", " + vals)

msg = "";
for i = 1:length(idx)
    msg = msg + "+ " + vals(i)/100 + "*cos(2*pi*" + int8(idx(i)/440) + "*t)";
end
msg = msg + ";";

disp(msg)