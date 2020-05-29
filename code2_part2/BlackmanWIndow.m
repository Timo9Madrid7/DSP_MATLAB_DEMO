% filter specification
wp=0.4*pi; ws=0.6*pi; Ap=0.5; As=55;

% estimate M of Blackman window
df=abs(ws-wp);
M = ceil(11*pi/df);

% build the Blackman windowed DF
w = blackman(M+1); %blackman window
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
title('Blackman windowed FIR DF');
xlabel('Normalized frequency');ylabel('Gain, db')