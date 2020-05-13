% 利用矩形窗函数法设计FIR低通
Wc=0.3*pi;
M=30; N=M+1; %确定滤波器阶数
fprintf('滤波器阶数=%.0f\n',M);

w=ones(1,N);%w = hanning(N);
k=0:M;

hd=(Wc/pi)*sinc(Wc*(k-0.5*M)/pi);
h = hd.*w;

omega=linspace(0,pi,512);
mag=freqz(h,[1],omega);
magdb=20*log10(abs(mag));

plot(omega/pi,magdb);
xlabel('Normalized frequency');ylabel('Gain, db');grid;