% DF BW LP specfication
Wp=0.2*pi; Ws=0.6*pi; Ap=2; As=15;
T=1;Fs=1/T; % Sampling frequency(Hz)

% Use impulse invariance
wp_ii=Wp*Fs; ws_ii=Ws*Fs;
% Use bilinear invariance
wp_bi=2*tan(Wp/2)/T;ws_bi=2*tan(Ws/2)/T;

%determine the order of AF filter
[N_ii,wc_ii]=buttord(wp_ii,ws_ii,Ap,As,'s');
[N_bi,wc_bi]=buttord(wp_bi,ws_bi,Ap,As,'s');

%determine the AF-BW filter
[numa_ii,dena_ii]=butter(N_ii,wc_ii,'s');
[numa_bi,dena_bi]=butter(N_bi,wc_bi,'s');

%determine the DF filter
[numd_ii,dend_ii]=impinvar(numa_ii,dena_ii,Fs);
[numd_bi,dend_bi]=bilinear(numa_bi,dena_bi,Fs);

%plot the frequency response
w=linspace(0,pi,1024);
h_ii=freqz(numd_ii,dend_ii,w);
h_bi=freqz(numd_bi,dend_bi,w);
plot(w/pi,20*log10(abs(h_ii/max(abs(h_ii)))));
hold on; grid on;
plot(w/pi,20*log10(abs(h_bi)));
axis([0 1 -50 0]);
xlabel('Normalized frequency');ylabel('Gain,dB');
legend("Impulse Invariance","Bilinear");
title('Impulse Invariance vs. Bilinear ');