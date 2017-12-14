clear all;
close all;
% We define time of sampling,freq of sampling and number of steps
fs=1*1e6;
Ts=1/fs;
N=2^16; 

% We define frequencies of all signals
f1=fs/2-(1*1e3);
f2=fs/2 + (2*1e3);
f3=fs+3*1e3;
f4=fs+7*1e3;

% We define the chosen corner frequency and order of the filter
wp=2*pi*15000; % We give the corner frequency in angular frequency 
% since we are using the function butter and it's how it requires
ord=2;
[num,den]=butter(ord,wp,'s');

% Once created the simulink model we simule
options=simset('RelTol', 1e-3,'MaxStep', 1/(10*fs),'FixedStep',1/fs);
sim('Exercise12',(N-1)*Ts,options); %startup of Simulink model

% Finally we plot the results
fft_plot(out,fs,'lin','dB');
fft_plot(out1,fs,'lin','dB');



