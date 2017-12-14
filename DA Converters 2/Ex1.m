clear all;
close all;
% We define all the variables
Fs=1;           % Sampling Freq
Vdd=1;          % Voltage input
B=12;           % Number of bits
RL=25;          % Load Resistor
Ron=100;        % Switch serial resistor
RU=200e6;       % Current source resistor
Iu=Vdd/(RL*(2^B-1));
Ron_n=Ron*ones(1,2^B);
RU_n=RU*ones(1,2^B);
Rn_n=Ron_n+RU_n;
In_n=Vdd./Rn_n + Iu;

x_lin=0:2^B-1;
% We obtain the Vout_lin
for i=1:2^B
    Vout_lin(i)=sum(In_n(1:x_lin(i)))./(1/RL+sum(1./(Rn_n(1:x_lin(i)))));
end
% Output voltage vs code
figure(1)
stairs(x_lin,Vout_lin);
grid on;
title('Output voltage vs linearly increased code')

% We define delta and get DNL and INL
delta=Vdd/(2^B-1);
DNL=(diff(Vout_lin)-delta)/delta;
for j=1:length(DNL)
    INL(j)=sum(DNL(1:j));
end

% We plot DNL and INL
figure(2)
subplot(2,1,1)
plot(x_lin(1:4095),DNL)
title('DNL')
subplot(2,1,2)
plot(x_lin(1:4095),INL)
title('INL')


% We now calculate Vout sin (Single)
n=0:2^B-1;
x_sin=(2^B-1)*(0.5*sin(2*pi*500./length(n).*n)+0.5);
  for g=1:length(x_sin)
      Vout_sin(g)=sum(In_n(1:x_sin(g)))./(1/RL+sum(1./Rn_n(1:x_sin(g))));
  end
  
 fft_plot(Vout_sin,1,'lin','dB')
 title('Non Differential')
 ylim([-140 20])
 
% We now calculate Vout sin 180 (Diff)
x_sin_180=(2^B-1)*(0.5*sin(2*pi*500./length(n).*n+pi)+0.5);
for g=1:length(x_sin)
    Vout_sin_180(g)=sum(In_n(1:x_sin_180(g)))./(1/RL+sum(1./Rn_n(1:x_sin_180(g))));
end

fft_plot((Vout_sin-Vout_sin_180)/2,1,'lin','dB');
ylim([-140 20])
title('Differential')

