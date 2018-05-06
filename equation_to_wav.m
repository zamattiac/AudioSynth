clear all
fmax = 440;
num_points = 2048;
Fs = num_points * fmax;
Ts = 1/Fs;
t = [0:Ts:(1-Ts)/440];
% Original signal is 440 Hz, so we want 1

fname = 'trumpeta';

% EQUATION FOR NOTE
A = 0.13757*cos(2*pi*425*t)+ 0.29789*cos(2*pi*429*t)+ 0.17041*cos(2*pi*430*t)+ 0.50426*cos(2*pi*433*t)+ 0.12281*cos(2*pi*436*t)+ 0.94519*cos(2*pi*437*t)+ 0.75411*cos(2*pi*440*t)+ 4.7077*cos(2*pi*441*t)+ 4.7622*cos(2*pi*443*t)+ 1.6712*cos(2*pi*444*t)+ 0.695*cos(2*pi*448*t)+ 0.18677*cos(2*pi*449*t)+ 0.19438*cos(2*pi*452*t)+ 0.15257*cos(2*pi*456*t)+ 0.14033*cos(2*pi*460*t)+ 0.15194*cos(2*pi*468*t)+ 0.14775*cos(2*pi*865*t)+ 0.19729*cos(2*pi*869*t)+ 0.18244*cos(2*pi*872*t)+ 0.25001*cos(2*pi*873*t)+ 0.69817*cos(2*pi*876*t)+ 0.21311*cos(2*pi*877*t)+ 1.9156*cos(2*pi*880*t)+ 0.12274*cos(2*pi*881*t)+ 6.2829*cos(2*pi*883*t)+ 0.10801*cos(2*pi*886*t)+ 0.31316*cos(2*pi*887*t)+ 0.2239*cos(2*pi*888*t)+ 0.20627*cos(2*pi*891*t)+ 0.17269*cos(2*pi*892*t)+ 0.13743*cos(2*pi*896*t)+ 0.1029*cos(2*pi*1300*t)+ 0.1237*cos(2*pi*1304*t)+ 0.14708*cos(2*pi*1308*t)+ 0.13677*cos(2*pi*1311*t)+ 0.1281*cos(2*pi*1312*t)+ 0.22202*cos(2*pi*1315*t)+ 0.31539*cos(2*pi*1319*t)+ 0.72215*cos(2*pi*1323*t)+ 0.27175*cos(2*pi*1325*t)+ 0.28457*cos(2*pi*1326*t)+ 0.14414*cos(2*pi*1331*t)+ 0.18474*cos(2*pi*1744*t)+ 0.22496*cos(2*pi*1748*t)+ 0.19959*cos(2*pi*1751*t)+ 0.49791*cos(2*pi*1755*t)+ 0.49871*cos(2*pi*1758*t)+ 0.34789*cos(2*pi*1759*t)+ 0.6004*cos(2*pi*1762*t)+ 0.97331*cos(2*pi*1763*t)+ 1.9004*cos(2*pi*1765*t)+ 0.46418*cos(2*pi*1767*t)+ 0.18205*cos(2*pi*1769*t)+ 0.15788*cos(2*pi*1770*t)+ 0.17123*cos(2*pi*1775*t)+ 0.17605*cos(2*pi*2194*t)+ 0.2363*cos(2*pi*2197*t)+ 0.25092*cos(2*pi*2198*t)+ 0.2908*cos(2*pi*2201*t)+ 0.13871*cos(2*pi*2203*t)+ 0.63046*cos(2*pi*2205*t)+ 0.45223*cos(2*pi*2209*t)+ 0.19449*cos(2*pi*2637*t)+ 0.14552*cos(2*pi*2640*t)+ 0.13604*cos(2*pi*2641*t)+ 0.13316*cos(2*pi*2644*t)+ 0.38386*cos(2*pi*2645*t)+ 0.98785*cos(2*pi*2647*t)+ 0.27432*cos(2*pi*2649*t)+ 0.10473*cos(2*pi*2650*t)+ 0.19497*cos(2*pi*2652*t)+ 0.32683*cos(2*pi*3085*t)+ 0.48227*cos(2*pi*3087*t)+ 0.42678*cos(2*pi*3089*t)+ 0.30134*cos(2*pi*3091*t)+ 0.13647*cos(2*pi*3097*t)+ 0.15965*cos(2*pi*3526*t)+ 0.21382*cos(2*pi*3528*t)+ 0.22468*cos(2*pi*3532*t)+ 0.37503*cos(2*pi*3968*t)+ 0.35535*cos(2*pi*3970*t)+ 0.24137*cos(2*pi*3972*t)+ 0.26617*cos(2*pi*4408*t)+ 0.25997*cos(2*pi*4410*t)+ 0.20754*cos(2*pi*4412*t)+ 0.24513*cos(2*pi*4414*t)+ 0.12954*cos(2*pi*4848*t)+ 0.2577*cos(2*pi*4850*t)+ 0.27199*cos(2*pi*4854*t)+ 0.17422*cos(2*pi*4856*t)+ 0.20902*cos(2*pi*5290*t)+ 0.1087*cos(2*pi*5293*t)+ 0.1164*cos(2*pi*5296*t)+ 0.10001*cos(2*pi*5730*t)+ 0.12407*cos(2*pi*5733*t);

% A = downsample(A, 10);
figure
plot(t, A)
title("Synthesized")
% 
figure
plot(t, double(int8(A)) - A)
title("Quantization error")

%%
audiowrite(strcat(fname, '8BIT.wav'), A, Fs, 'BitsPerSample', 8); 
audiowrite(strcat(fname, '16BIT.wav'), A, Fs, 'BitsPerSample', 16); 

writefile = fopen(strcat(fname,'.txt'), 'w');
quantizedA = int8(A*127/max(A));

figure
plot(t, quantizedA);
title("Quantized")

fprintf(writefile,'%d, ', quantizedA);
fclose(writefile);



















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