clc
clear

devices = audiodevinfo();
inputID = devices.input(1);
outputID = devices.output(1);

fs = 48000;
nBits = 8;
nChannels = 1;
duration = 5;

window = hamming(512);
N.overlap = 256;
N.fft = 1024;

% Project 3

% Speech-only Signal
[y,fs] = audioread('Recording_1.wav'); % Previously recorded speech file from Project 1

target_F = 8000;

stopband_st = target_F/fs;
passband_end = (target_F-2000)/fs;

F = [0 passband_end stopband_st 1];
A = [1 1 0 0];
lpf = firls(255, F, A);
filtered = filter(lpf, A, y);
speech_only = downsample(filtered,2);

plotSpec(y, fs, 'Unfiltered');
plotSpec(speech_only, fs, 'Speech-Only');


% First Frequency Decomposition
low_pass = filter(lpf, A, speech_only);
xL = downsample(low_pass,2);

stopband_end = (target_F-2000)/fs;
passband_st = target_F/fs;
F = [0 stopband_end passband_st 1];
A = [0 0 1 1];
hpf = firls(255, F, A);
high_pass = filter(hpf, 1, speech_only);
xH = downsample(high_pass,2);

plotSpec_subplot(low_pass,high_pass, 'Lowpass', 'Highpass', fs);
plotSpec_subplot(xL,xH, 'Downsampled Lowpass', ' Downsampled Highpass', fs);