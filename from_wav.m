close all

[y, Fs] = audioread('a.mp3');
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

idx = find(Y_limited > 50);
vals = real(Y(idx));
text(idx, vals, idx + ", " + vals)

msg = "";
for i = 1:length(idx)
    msg = msg + "+ " + vals(i)/2000 + "*cos(2*pi*" + idx(i) + "*t)";
end
msg = msg + ";";

disp(msg)

a = 0.025213*cos(2*pi*433*t)+ 0.04726*cos(2*pi*437*t)+ 0.037705*cos(2*pi*440*t)+ 0.23538*cos(2*pi*441*t)+ 0.23811*cos(2*pi*443*t)+ 0.083558*cos(2*pi*444*t)+ 0.03475*cos(2*pi*448*t)+ 0.034909*cos(2*pi*876*t)+ 0.095778*cos(2*pi*880*t)+ 0.31414*cos(2*pi*883*t)+ 0.036108*cos(2*pi*1323*t)+ 0.03002*cos(2*pi*1762*t)+ 0.048665*cos(2*pi*1763*t)+ 0.095019*cos(2*pi*1765*t)+ 0.031523*cos(2*pi*2205*t)+ 0.049392*cos(2*pi*2647*t);
figure
plot(t, a)
title("Generated")
sound(a, Fs);
audiowrite('gen_trumpet_a.wav', a, Fs);