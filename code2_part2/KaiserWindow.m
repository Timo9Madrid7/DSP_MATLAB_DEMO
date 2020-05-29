% filter specification
wp=0.4*pi; ws=0.6*pi; Ap=0.5; As=55;

% estimate M and beta of Kaiser window
delta_p = 1-10^(-0.05*Ap);
delta_s = 10^(-0.05*As);
A = -20*log10(min(delta_p,delta_s));
M = ceil((A-7.95)/(2.285*abs(wp-ws)));
M = mod(M,2)+M;
if As > 50
    beta = 0.1102*(As-8.7);
elseif As>=21 && As<=50
    beta=0.5842*(As-21)^0.4+0.07886*(As-21);
else 
    beta = 0;
end

% build the Kaiser windowed DF
w=kaiser(M+1,beta); %Kaiser window
alpha=M/2; k=0:M; wc=(wp+ws)/2;
hd=(wc/pi)*sinc((wc/pi)*(k-alpha));
h=hd.*w';

% plot the figures
figure(1);
wvtool(h);
figure(2);
omega=linspace(0,pi,5000);
mag=freqz(h,[1],omega);
magdb=20*log10(abs(mag));
plot(omega/pi,magdb);axis([0 1 -100 5]);grid on;
title('Kaiser Windowed FIR DF');
xlabel('Normalized frequency');ylabel('Gain, db')
