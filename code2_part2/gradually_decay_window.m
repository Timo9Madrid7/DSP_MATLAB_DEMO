% filter specification
wp=0.4*pi; ws=0.6*pi; Ap=0.5; As=55;

% gradually decaying window design
Lt = 40; Lp = 4*Lt; M=Lt*2+Lp;
W = ones(1,M);
W(1:Lt)=(0:1:Lt-1)/Lt; 
W(Lt+Lp+1:Lt*2+Lp)=fliplr(W(1:Lt));

% build the Blackman windowed DF
w = abs(ifftshift(ifft(W)));
w = (w-min(w))/(max(w)-min(w));
alpha=M/2; k=0:M-1; wc=(wp+ws)/2;
hd = (wc/pi)*sinc((wc/pi)*(k-alpha));
h = hd.*w;

% plot the figures
figure(1);
omegaW = linspace(-ws,ws,M);
plot(omegaW/pi,W);axis([0 1 0 1.1]);grid on;
xlabel('Normalized Frequency');ylabel("amplitude");
title('Gradually Decay Window');
figure(2)
omega = linspace(0,pi,5000);
mag = freqz(h,[1],omega);
mag = abs(mag);
magnorm = (mag-min(mag))/(max(mag)-min(mag));
magdb = 20*log10(magnorm);
plot(omega/pi,magdb);axis([0 1 -100 5]);grid on;
title('Gradually Decay windowed FIR DF');
xlabel('Normalized frequency');ylabel('Gain, db');
hold on;
