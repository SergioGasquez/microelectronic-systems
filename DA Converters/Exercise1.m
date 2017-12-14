close all;
clear all;

% We define the unit resistor and reference voltage
R0=10e3;
Vref=2;
% We create the array of resistors both ideal and real 
R=[R0/2 R0 R0 R0 R0 R0 R0 R0 R0/2];
eps_r=log((1:length(R)).^2).*0.1;
Ri=R.*(1+eps_r);
% We obtain both voltage output ideal and real
for k=1:8
    VoutI(k)=Vref*(sum(R(1:k))/sum(R));
    VoutR(k)=Vref*(sum(Ri(1:k))/sum(Ri));
end
% We calculate Delta as the diference between two consecutive ideal samples
Delta=VoutI(2)-VoutI(1);
% Using the formulas of Lab 4 we will obtain DNL and INL
DeltaR(1)=0;
DNL(1)=0;
INL(1)=0;
for k=2:8
    DeltaR(k)=VoutR(k)-VoutR(k-1);
    DNL(k)=(DeltaR(k)-Delta)/Delta;
    INL(k)=sum(DNL(1:k));
end
% We obtain DNLrms and INLmax
DNL2=DNL.*DNL;          % DNL ^2
DNLrms=sqrt((1/7)*sum(DNL2))
INLmax=max(abs(INL))

% Finally, we plot the results
stairs(VoutI)
hold on
grid on
stairs(VoutR)
legend('Vout Ideal','Vout Real')
ylabel('Voltage Output')

