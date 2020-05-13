M=input('order of filter M='); k0=input('k0=(always=M/2)');
k=0:M; omegac=pi/3;
hd=omegac/pi.*sinc(omegac/pi*(k-k0));%滤波器单位脉冲响应h[k]

subplot(3,1,1); stem([0:M],hd); grid
xlabel('k'); ylabel('hd[k]'); title('impulse response');


h1=hd; H1=abs(fft(h1,512));%滤波器幅度谱
%作图
omegac=0:pi/255:pi;

subplot(3,1,2); c=plot(omegac,H1(1:256)); grid
xlabel('\Omegac'); ylabel('Magnitude spectrum');

subplot(3,1,3); phi=angle(fft(h1,512));
phil=unwrap(phi); %对phi解卷绕
plot(omegac,phil(1:256));grid