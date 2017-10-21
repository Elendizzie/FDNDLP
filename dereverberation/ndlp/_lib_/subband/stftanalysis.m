function y = stftanalysis(s, winsize, winshift)
%
% y = y = stftanalysis(s, winsize, winshift)
%
% *****************************************************
% Last-modified: 2017/02/24
%
% Author: Teng Xiang
% *****************************************************
% win = hanning(winsize);
win = hanning(winsize);
s = [s; zeros(winshift - mod(length(s) - winsize, winshift), 1)];
LEN = length(s);
L = (LEN - winsize) / winshift + 1;
y = zeros(L, winsize);

for l = 1 : L
    index = (l-1) * winshift;
    y(l,:) = fft(s(index + 1:index+winsize) .* win);
end