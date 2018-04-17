clear all
Fs=16384;
Ts=1/Fs;
t =[0:Ts:1];

% PASTE EQUATION HERE
A = 0.025213*cos(2*pi*433*t)+ 0.04726*cos(2*pi*437*t)+ 0.037705*cos(2*pi*440*t)+ 0.23538*cos(2*pi*441*t)+ 0.23811*cos(2*pi*443*t)+ 0.083558*cos(2*pi*444*t)+ 0.03475*cos(2*pi*448*t)+ 0.034909*cos(2*pi*876*t)+ 0.095778*cos(2*pi*880*t)+ 0.31414*cos(2*pi*883*t)+ 0.036108*cos(2*pi*1323*t)+ 0.03002*cos(2*pi*1762*t)+ 0.048665*cos(2*pi*1763*t)+ 0.095019*cos(2*pi*1765*t)+ 0.031523*cos(2*pi*2205*t)+ 0.049392*cos(2*pi*2647*t);
audiowrite('trumpeta8BIT.wav', A, Fs, 'BitsPerSample', 8); 
audiowrite('trumpeta16BIT.wav', A, Fs, 'BitsPerSample', 16); 





















%%   
% generate PURE tones
%  F=440; %Frequency of note A is 440 Hz
%  A = sin(2*pi*F*t);
%  F = 500;
%  B = sin(2*pi*F*t);
%  F = 400;
%  G = sin(2*pi*F*t);
% 
%  audiowrite('a.wav', A, Fs);
%  audiowrite('b.wav', B, Fs);
%  audiowrite('g.wav', G, Fs);
  
%%
% generate TRUMPET tones
%  F= 440; %Frequency of note A is 440 Hz
%  A = .35*sin(2*pi*F*t) + .45*sin(2*pi*2*F*t) + .9*sin(2*pi*3*F*t) + .39*sin(2*pi*4*F*t) + .05*sin(2*pi*5*F*t) + .15*sin(2*pi*6*F*t) + .04*sin(2*pi*7*F*t);
%  F = 500;
%  B = .35*sin(2*pi*F*t) + .45*sin(2*pi*2*F*t) + .9*sin(2*pi*3*F*t) + .39*sin(2*pi*4*F*t) + .05*sin(2*pi*5*F*t) + .15*sin(2*pi*6*F*t) + .04*sin(2*pi*7*F*t);
%  F = 400;
%  G = .35*sin(2*pi*F*t) + .45*sin(2*pi*2*F*t) + .9*sin(2*pi*3*F*t) + .39*sin(2*pi*4*F*t) + .05*sin(2*pi*5*F*t) + .15*sin(2*pi*6*F*t) + .04*sin(2*pi*7*F*t);
% C = 0.057474*cos(2*pi*1043*t)+ 0.07446*cos(2*pi*1045*t)+ 0.026359*cos(2*pi*1052*t)+ 0.028077*cos(2*pi*2098*t)+ 0.032131*cos(2*pi*2102*t)+ 0.031042*cos(2*pi*2109*t)+ 0.030078*cos(2*pi*2116*t);
% plot(t, C)
% audiowrite('oboec16BIT.wav', C, Fs, 'BitsPerSample', 16);
% audiowrite('oboec8BIT.wav', C, Fs, 'BitsPerSample', 8);
% audiowrite('trumpet_a.wav', A, Fs, 'BitsPerSample', 16);
%  audiowrite('trumpet_b.wav', B, Fs, 'BitsPerSample', 8);
%  audiowrite('trumpet_g.wav', G, Fs, 'BitsPerSample', 8);