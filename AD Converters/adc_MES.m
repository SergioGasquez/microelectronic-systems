function [Q,Y] = adc_MES(X_in,B,type_in)
% X_in: Input vector
% B_in: Num. of bits
% Y: Quantization out.
% Q: Out. code 
% type_in: Determine A/D type (real,ideal)

if strcmp(type_in,'real')
     X=X_in.*X_in;
%      disp(['X = ' num2str(X)]);
else if strcmp(type_in,'ideal')
     X=X_in;
     end
end

N=2^B;
high = ceil(max(X));
low = floor(min(X));
qstep = (high-low)/N; % Quantization step size (voltage)
Q = floor((X-low)/qstep);  % code coresponsible to the quant. voltage 
low = low + qstep/2; % begin with 0.5 step voltage 
Y = low + qstep*Q; %quant. voltage (in voltage)
