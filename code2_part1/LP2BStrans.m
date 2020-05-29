function [wp,B,w0] = LP2BStrans(ws1,ws2,wp1,wp2)
%LP2BSTRANS is to transfer LP's parameters to BP
% w_bar=(w^2-w0^2)/(B*w), where B=wp2-wp1 and w0=wp1wp2
B = ws2-ws1;
w0 = sqrt(ws1*ws2);
wp1_bar = (B*wp1)/(wp1^2-w0^2);
wp2_bar = (B*wp2)/(wp2^2-w0^2);
wp = max(abs(wp1_bar),abs(wp2_bar));
end

