%用Remez算法实现的MATLAB程序：
Fs1=0.2;Fp1=0.3;Fp2=0.6;Fs2=0.7;
f=[Fs1 Fp1 Fp2 Fs2];a=[0 1 0];
Rp=0.1;Rs=0.01;dev=[Rs Rp Rs];
[N,fo,ao,w] = remezord(f,a,dev);
h = remez(N+5,fo,ao,w);
w=linspace(0,pi,1000);
mag=freqz(h,[1],w);
plot(w/pi,20*log10(abs(mag)));
axis([0 1 -45 1]);
grid on;
xlabel('Normalized frequency');
ylabel('Gain, dB');