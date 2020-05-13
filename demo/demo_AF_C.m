% Design Analog CBI Lowpass Filter
%fp=1K fs=5K Ap=1db As=40db;
wp=2*pi*1000;ws=2*pi*5000;Ap=1;As=40;
%Design filter
[N,wc]=ellipord(wp,ws,Ap,As,'s');
[num,den]=ellip(N,Ap,As,wc,'s');
fprintf('Order of the filter=%.0f\n',N)
disp('Numerator polynomial');
fprintf('%.4e\n',num);
disp('Denominator polynomial');
fprintf('%.4e\n',den);
%Compute Ap and As of designed filter
omega1=linspace(0,wp,500);
omega2=linspace(wp,ws,200);
omega3=linspace(ws,5*1000*pi*2,500);
h1 = 20*log10(abs(freqs(num,den,omega1)));
h2 = 20*log10(abs(freqs(num,den,omega2)));
h3 = 20*log10(abs(freqs(num,den,omega3)));
fprintf('Ap= %.4f\n',max(-h1));
fprintf('As= %.4f\n',min(-h3));
plot ([omega1 omega2 omega3]/(2*pi),[h1 h2 h3]); grid;
xlabel('Frequency in Hz'); ylabel('Gain in dB')