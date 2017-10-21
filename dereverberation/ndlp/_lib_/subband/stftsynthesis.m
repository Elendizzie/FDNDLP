function y1 = stftsynthesis(s, winsize, winshift)
%
% y1 = stftsynthesis(s, winsize, winshift)
%
% *****************************************************
% Last-modified: 2017/02/24
%
% Author: Teng Xiang
% *****************************************************
L = size(s, 1);

y1 = zeros((L - 1) * winshift + winsize, 1);

for l = 1 : L
    tmp = ifft(s(l,:)); 
    index = (l-1) * winshift;
    y1(index+1 : index + winsize) = y1(index+1 : index + winsize) + tmp.';
end