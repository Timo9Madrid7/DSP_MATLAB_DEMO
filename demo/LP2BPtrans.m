function [ws,B,w0] = LP2BPtrans(ws1,ws2,wp1,wp2)
%LP2BPTRANS is to transfer LP's parameters to BP
% w_bar=(w^2-w0^2)/(B*w), where B=wp2-wp1 and w0=wp1wp2
B = wp2-wp1;
w0 = sqrt(wp1*wp2);
ws1_bar = (ws1^2-w0^2)/(B*ws1);
ws2_bar = (ws2^2-w0^2)/(B*ws2);
ws = min(abs(ws1_bar),abs(ws2_bar));
end

