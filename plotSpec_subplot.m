function [] = plotSpec_subplot(data1, data2, name1, name2, fs)

figure;
N.overlap = 256;
N.fft = 1024;
subplot(1,2,1)
[S,F,T,P] = spectrogram(data1, window, N.overlap, N.fft, fs, 'yaxis');
surf(T,F, 10*log10(P), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');
title(name1);
subplot(1,2,2)
[S2,F2,T2,P2] = spectrogram(data2, window, N.overlap, N.fft, fs, 'yaxis');
surf(T2,F2, 10*log10(P2), 'edgecolor', 'none'); axis tight; view(0,90); colormap(jet);
set(gca, 'clim', [-80,-20]);
ylim([0, 8000]);
xlabel('Time (s)'); ylabel('Frequency (Hz)');
title(name2);

end