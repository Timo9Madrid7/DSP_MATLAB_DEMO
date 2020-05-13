wp1=10; wp2=30; ws1=19; ws2=21; Ap=1; As=20;

% parameter transformation
ws = 1;
[wp,B,w0] = LP2BStrans(ws1,ws2,wp1,wp2);

% BW Low-pass filter
[N,Wc]=buttord(wp,ws,Ap,As,'s');
[num,den] = butter(N,Wc,'s');

% LP to BS
[numt,dent] = lp2bs(num,den,w0,B);

% plot
w=linspace(5,35,1000);
h=freqs(numt,dent,w);
plot(w,20*log10(abs(h)));
w=[wp1 ws1 ws2 wp2];
set(gca,'xtick',w);grid;
h=freqs(numt,dent,w);A=-20*log10(abs(h))