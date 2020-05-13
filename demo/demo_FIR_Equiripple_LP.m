% 等波纹FIR滤波器设计
Fp=0.5;Fs=0.6;ds=0.0017;dp=ds;

% Vector of frequency band 
% of FIR digital filter to be designed
f=[Fp Fs];
% The vectors of B elements respectively represent 
% the magnitude values of FIR filter in B frequency bands
a=[1 0];
% Vector of B elements, respectively representing the fluctuation
% value of FIR filter in B frequency bands
dev=[dp ds];

[N,fo,ao,w] = remezord(f,a,dev);
h=remez(N,fo,ao,w);
w=linspace(0,pi,1000);
w=linspace(0,pi,1000);
mag=freqz(h,[1],w);
%输出为增益
hd=plot(w/pi,20*log10(abs(mag)));
axis([0 1 -100 10]);grid;
%输出为幅度函数
% hd=plot(w/pi, abs(mag));grid;
xlabel('Normalized frequency'); ylabel('Gain, dB');