%Design DF BW low-pass filter using bilinear
%DF BW LP specfication
Wp=0.2*pi; Ws=0.6*pi; Ap=2; As=15;
T=2;Fs=1/T; %Sampling frequency(Hz)

%Analog Butterworth specfication
wp=2*tan(Wp/2)/T;ws=2*tan(Ws/2)/T;

%determine the order of AF filter and the 3-dB cutoff frequency 
[N,wc]=buttord(wp,ws,Ap,As,'s');

%determine the AF-BW filter
[numa,dena]=butter(N,wc,'s');

%determine the DF filter
[numd,dend]=bilinear(numa,dena,Fs);

%plot the frequency response
w=linspace(0,pi,1024);
h=freqz(numd,dend,w);
plot(w/pi,20*log10(abs(h)));
axis([0 1 -50 0]);grid;
xlabel('Normalized frequency'); ylabel('Gain,dB');

%computer Ap¡¢As of the designed filter
w=[Wp Ws];h=freqz(numd,dend,w);
fprintf('Ap= %.4f\n',-20*log10( abs(h(1))));
fprintf('As= %.4f\n',-20*log10( abs(h(2))));