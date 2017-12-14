% We define the frequency vector and sampling frequency
freq= 0:10:50e6;
Fs = 20e6;
% We define the calculated elements R and C2
R=15.9e3;
C2=10e-9;

% For S Domain
% We define numerator and denominator of the transfer function
Bs=[1];
As=[R*C2 1];
% We define angular frequency
w=2*pi*freq;
% We calculate the transfer fucntion
[Hs,Ws] = freqs(Bs,As,w);
% We transform from angular freq to freq
fs=Ws/(2*pi);
% We calculate the phase and transform it to degrees
phase = angle(Hs);
degPhaseS = phase*180/(pi);


% For Z Domain
Ceq=1/(R*Fs);
Bz=[0 Ceq];
Az=[Ceq+C2 -C2];

[Hz,Wz] = freqz(Bz,Az,freq,Fs);
fz=Wz/2*pi;
 
phase = angle(Hz);
degPhaseZ = phase*180/(pi);

% Finally we plot the results
figure(1)
semilogx(fs,20*log10(Hz))
grid on
hold on
semilogx(fs,20*log10(Hs))
legend('Z Domain','S Domain')
% The spikes are due to the digital filter,but since we are using a higher 
% sampling freq they are out of the filter and its not a problem.(If we use
% lower Fs they may be in the middle of the filter)

figure(2)
semilogx(fs,degPhaseZ)
grid on
hold on
semilogx(fs,degPhaseS)
legend('Z Domain','S Domain')
% Spikes also appear in phase but we can see that the phase is pretty much
% the same as in continuous time

