% filter specification
wp=0.3*pi; ws=0.5*pi; Ap=0.1; As=40;

% width of transition band
df=abs(ws-wp);

%estimate beta of Kaiser window
delta_p = 1-10^(-0.05*Ap);
delta_s = 10^(-0.05*As);
A = -20*log10(min(delta_p,delta_s));
M = ceil((A-7.95)/(2.285*abs(wp-ws)));
M = mod(M,2)+M;
fprintf('Order of the filter=%.0f\n',M);

if As > 50
    beta = 0.1102*(As-8.7);
elseif As>=21 && As<=50
    beta=0.5842*(As-21)^0.4+0.07886*(As-21);
else 
    beta = 0;
end
fprintf('beta=%0.4f\n',beta);

w=kaiser(M+1,beta); %generate Kaiser window
wc=(wp+ws)/2; %cutoff frequency of ideal lowpass filter

%generate Order M ideal low pass filter
alpha=M/2; k=0:M;
hd=(wc/pi)*sinc((wc/pi)*(k-alpha));
h=hd.*w';
omega=linspace(0,pi,512);
mag=freqz(h,[1],omega);
magdb=20*log10(abs(mag));
plot(omega/pi,magdb);axis([0 1 -100 5]);
title('Gain response of lowpass FIR filter');
xlabel('Normalized frequency');
ylabel('Gain, db');legend('Kaiser');grid;
