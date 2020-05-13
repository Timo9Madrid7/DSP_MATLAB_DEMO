% 频率取样法设计I型线性相位高通FIR
M=input('M='); %M=32;
Wp=0.6*pi; m=0:(M+1)/2; Wm=2*pi*m./(M+1);
mtr=ceil(Wp*(M+1)/(2*pi));
Ad=double([Wm>=Wp]); %将逻辑型数据转换为double型
%Ad(mtr)=0.28;%添加过渡点时打开
Hd=Ad.*exp(-j*0.5*M*Wm);
Hd=[Hd conj(fliplr(Hd(2:M/2+1)))];
h=real(ifft(Hd));
w=linspace(0,pi,1000); H=freqz(h,[1],w);
plot(w/pi,20*log10(abs(H)));axis([0 1 -100 5]);grid;
%或更换为plot(w/pi,abs(H));grid;
xlabel('Normalized frequency');ylabel('Gain, dB');