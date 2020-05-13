wp=2*pi*1000;ws=2*pi*5000;Ap=1;As=40;
[N,wc]=buttord(wp,ws,Ap,As,'s'); % filter order£»
fprintf('Order of the filter=%.0f\n',N)
[num,den] = butter(N,wc,'s');
fprintf('num=%.4e\n',num);
fprintf('den=%.4e\n',den);
%Compute Ap and As of designed filter
omega=[wp ws]; h = freqs(num,den,omega);
fprintf('Ap= %.4f\n',-20*log10(abs(h(1))));
fprintf('As= %.4f\n',-20*log10(abs(h(2))));
% Compute and plot the frequency response
omega=[0:200:10000*pi];h= freqs(num,den,omega);
gain = 20*log10(abs(h));
plot (omega/(2*pi),gain);
xlabel('Frequency in Hz'); ylabel('Gain in dB')
