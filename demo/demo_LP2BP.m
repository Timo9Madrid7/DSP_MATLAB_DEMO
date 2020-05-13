wp1=6; wp2=8; ws1=4; ws2=11; Ap=1; As=32;

% parameter transformation
wp = 1;
[ws,B,w0] = LP2BPtrans(ws1,ws2,wp1,wp2);

% BW Low-pass filter
[N,Wc]=buttord(wp,ws,Ap,As,'s');
[num,den] = butter(N,Wc,'s');

% LP to BP
[numt,dent] = lp2bp(num,den,w0,B);

% plot
w=linspace(2,12,1000);
h=freqs(numt,dent,w);
plot(w,20*log10(abs(h))) ; grid ;
xlabel('Frequency in rad/s');
ylabel('Gain in dB')
