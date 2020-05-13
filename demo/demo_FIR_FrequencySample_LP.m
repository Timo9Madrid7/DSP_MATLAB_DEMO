% 频率取样法设计I型线性相位高通FIR
M=10;
Wp=0.5*pi; 
m=0:(M+1)/2; 
Wm=2*pi*m./(M+1);
Ad=double([Wm<=Wp]); %将逻辑型数据转换为double型

%添加过渡点时打开
% mtr=ceil(Wp*(M+1)/(2*pi));
%Ad(mtr)=0.28;

Hd=Ad.*exp(-j*0.5*M*Wm);
Hd=[Hd conj(fliplr(Hd(2:M/2+1)))];
h=real(ifft(Hd));
w=linspace(0,pi,1000); 
H=freqz(h,[1],w);
plot(w/pi,abs(H));grid;
xlabel('Normalized frequency');ylabel('Gain, dB');