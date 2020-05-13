% 利用矩形窗函数法设计FIR高通
Wp=0.8*pi;Ws=0.7*pi;
M=62; N=M+1; %确定滤波器阶数
fprintf('滤波器阶数=%.0f\n',M);
w=ones(1,N);%w = hanning(N);
Wc=(Wp+Ws)/2; k=0:M;

hd=-(Wc/pi)*sinc(Wc*(k-0.5*M)/pi);hd(0.5*M+1)=hd(0.5*M+1)+1;
h=hd.*w; omega=linspace(0,pi,512);

mag=freqz(h,[1],omega);magdb=20*log10(abs(mag));

plot(omega/pi,magdb);
xlabel('Normalized frequency');ylabel('Gain, db');grid;