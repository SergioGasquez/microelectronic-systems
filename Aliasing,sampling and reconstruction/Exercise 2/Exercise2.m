clear all;
close all;

% We define time of sampling,freq of sampling and number of steps
Fs=1e6;
Ts=1/Fs;
N=2^15;
% We define Amplitude and f0
A=1;
f0=100*1e3;

% We declare the inputs of the Butterworth filter
ord=1; % We will use a first order filter 
wp=2*pi*f0; % Angular freq
[num,den]=butter(ord,wp,'s');


% We simulate the simulink model
options=simset('RelTol', 1e-3,'MaxStep', 1/(Fs*10),'FixedStep',1/Fs);
sim('Exercise21',(N-1)*Ts,options); 

% For out2 we will use the funciont usample because it needs to be N-times
% higher
out2_upsample=upsample(out2,10);
% Finally we plot the outputs
fft_plot(out2_upsample*10,Fs*10,'lin','dB');
fft_plot(out,10*Fs,'lin','dB');
fft_plot(out1,10*Fs,'lin','dB');

