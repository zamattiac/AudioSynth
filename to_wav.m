 clear all
 Fs=10000;
 Ts=1/Fs;
 t=[0:Ts:.03];
  
 %% 
 % PURE
 F=440; %Frequency of note A is 440 Hz
 A = sin(2*pi*F*t);
 F = 500;
 B = sin(2*pi*F*t);
 F = 400;
 G = sin(2*pi*F*t);

 audiowrite('a.wav', A, Fs);
 audiowrite('b.wav', B, Fs);
 audiowrite('g.wav', G, Fs);
 
 %%
 % TRUMPET
 F=440; %Frequency of note A is 440 Hz
 A = .35*sin(2*pi*F*t) + .45*sin(2*pi*2*F*t) + .9*sin(2*pi*3*F*t) + .39*sin(2*pi*4*F*t) + .05*sin(2*pi*5*F*t) + .15*sin(2*pi*6*F*t) + .04*sin(2*pi*7*F*t);
 F = 500;
 B = .35*sin(2*pi*F*t) + .45*sin(2*pi*2*F*t) + .9*sin(2*pi*3*F*t) + .39*sin(2*pi*4*F*t) + .05*sin(2*pi*5*F*t) + .15*sin(2*pi*6*F*t) + .04*sin(2*pi*7*F*t);
 F = 400;
 G = .35*sin(2*pi*F*t) + .45*sin(2*pi*2*F*t) + .9*sin(2*pi*3*F*t) + .39*sin(2*pi*4*F*t) + .05*sin(2*pi*5*F*t) + .15*sin(2*pi*6*F*t) + .04*sin(2*pi*7*F*t);
 
 audiowrite('trumpet_a.wav', A, Fs);
 audiowrite('trumpet_b.wav', B, Fs);
 audiowrite('trumpet_g.wav', G, Fs);