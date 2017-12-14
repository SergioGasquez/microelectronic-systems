close all;
clear all;

Delta=0.125;
TransitionPointReal=[0 0.3535 0.5 0.6215 0.7070 0.7905 0.8660 0.9335];

samples= length(TransitionPointReal);
for i=1:samples
    TransitionPointIdeal(i)=Delta*(i);
end

for i=2:samples
    CodeReal(i)=TransitionPointReal(i)-TransitionPointReal(i-1);
    DeltaR(i)=(CodeReal(i)-Delta)/Delta; % DNL(n)
    DeltaRi=DeltaR(1:i);
    INL(i)=sum(DeltaRi);
end
% We calculate the DNL rms and INL max
DeltaR2=DeltaR.^2; % We get the square for the DNL_rms formula
DLNrms=sqrt((1/(8-1))*sum(DeltaR2)); % Formula pdf
INLmax=max(INL);

% We print the results
disp('DNLrms:')
disp(DLNrms)
disp('INLmax:')
disp(INLmax)