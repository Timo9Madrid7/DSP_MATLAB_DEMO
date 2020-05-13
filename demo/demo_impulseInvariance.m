%Design DF BW low-pass filter using impulse invariance
%DF BW LP specfication
Wp=0.2*pi; Ws=0.6*pi; Ap=2; As=15;
Fs=1; %Sampling frequency(Hz)

%Analog Butterworth specfication
wp=Wp*Fs; ws=Ws*Fs;

%determine the order of AF filter
[N,wc]=buttord(wp,ws,Ap,As,'s');

%determine the 3-db cutoff frequency of BW filter from pass-band specfication
% wc=wp/(10^(0.1*Ap)-1)^(1/N/2);

%determine the AF-BW filter
[numa,dena]=butter(N,wc,'s');

%determine the DF filter
[numd,dend]=impinvar(numa,dena,Fs);

%plot the frequency response
w=linspace(0,pi,1024);
h=freqz(numd,dend,w);
norm=max(abs(h));
numd=numd/norm;
plot(w/pi,20*log10(abs(h/norm)));
xlabel('Normalized frequency');
ylabel('Gain,dB');

%computer Ap As of the designed filter
w=[Wp Ws];
h=freqz(numd,dend,w);
fprintf('Ap= %.4f\n',-20*log10( abs(h(1))));
fprintf('As= %.4f\n',-20*log10( abs(h(2))));