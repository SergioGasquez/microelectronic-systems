clear all;
close all;

% We define the two components
Fl=10.21*1e6;
Fh=10.39*1e6;

% We calculate band width,number of points,fs and Ts
BW=Fh-Fl;
Fs=2*BW; % Fs>2BW to be able to recover the signal
% Fs=364.6e3; %For the second part of the exercese
Ts=1/Fs;
N=2^15;

% We simulate the simulink model
options=simset('RelTol', 1e-3,'MaxStep', 1/(Fs),'FixedStep',1/Fs);
sim('Exercise31',(N-1)*Ts,options); 

% out_upsampled=upsample(out1,60); %For the second part of the exercese

% We print the results
fft_plot(out,10*Fs,'lin','dB');
fft_plot(out1,10*Fs,'lin','dB');
% fft_plot(out_upsampled*60,Fs*60,'lin','lin');  %For the second part of the exercese