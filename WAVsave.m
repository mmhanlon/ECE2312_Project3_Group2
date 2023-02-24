function [] = WAVsave(filename, sound, fs)
load handel.mat
audiowrite(filename,sound,fs);
clear sound fs
end