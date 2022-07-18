% Plot
figure(1); set(gca, 'FontSize',13);

% Audio File
[data,fs]=audioread('octave.m4a');
T = 1/fs;
L = length(data);
t = (0:L-1)*T;
subplot(2,2,1), plot(t,data);
title('Octave Recording');
xlabel('t(s)'); ylabel('X(t)');set(gca, 'FontSize',13);
xlim([t(1),t(end)]);

% Tone
tstart = 1+1.65E5; tstop=1.7E5;
hold on; plot(t(tstart:tstop),data(tstart:tstop)); hold off;
subplot(2,2,1);
tone = data(tstart:tstop);
subplot(2,2,2), plot(tstart:tstop,tone);
title('First Tone');
xlabel('t (s)'); ylabel('x(t)');set(gca, 'FontSize',13);

% FFT
% L = length(tone); n = 2^nextpow2(L);
% Ftone = fft(tone,n,2);
% P2 = abs(Ftone/L); P1 = P2(:,1:n/2+1);P1(:,2:end-1) = 2*P1(:,2:end-1);
% f = 0:(fs/n):(fs/2 - fs/n);
% subplot(2,2,3), plot(f, P1(1:n/2));

% L = length(tone);
% Ftone = fft(tone,2,n);
% P2 = abs(Ftone/L); P1 = P2(1:L/2+1); P1(2:end-1) = 2*P1(2:end-1);
% f = fs*(0:(L/2))/L;
% subplot(2,2,3), plot(f, P1);

L = length(tone);
Ftone = fft(tone);
P2 = abs(Ftone/L); P1 = P2(1:L/2+1); P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(L/2))/L;
subplot(2,2,3), semilogy(f, P1);
title('Magnitude of FFT of Tone'); 
xlabel('f (Hz)'); ylabel('|F{x}|');set(gca, 'FontSize',13);
[psor,lsor] = findpeaks(P1,f,'SortStr','descend');
% xlim([f(1),lsor(8)]); 
xlim([0,length(f)]);
pitch = lsor(1);
step = (psor(1)-psor(2))/psor(1);
clear f fs Ftone L lsor P1 P2 psor t T tone tstart tstop;