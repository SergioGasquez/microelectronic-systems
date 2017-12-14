clear all;
close all;
% We define the number of samples ,the number of bits,amplitude of Vin,
% we create the function ramp and finally we define the step
N=2^16; 
B=3; 
V=1;
ramp=(0:(N-1))./N;
step=V/2^B;
% We use the provided function to get Q and Y
% Q contains the code and Y the value between 0 and 1 equivalent
[Qideal,Yideal]=adc_MES(ramp,B,'ideal');
[Qreal,Yreal]=adc_MES(ramp,B,'real');
% In order to calculate the real one,it makes ramp square in line 9 of the
% function adc_MES.m

% We plot the results
figure(1)
plot(ramp,Qideal) 
hold on
plot(ramp,Qreal) 
set(gca,'xTick',(0:2^B-1)*step)
grid on
legend('Ideal','Real')
% We get the histogram from both ideal and real 
figure(2)           
hist(Qideal,(0:(2^B)-1))
figure(3)
hist(Qreal,(0:(2^B)-1)) 

