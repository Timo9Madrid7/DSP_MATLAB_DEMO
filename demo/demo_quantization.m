N = 5;
q = 2^(-N);
d_dec = [0.625 0.573 -0.872 0.268 -0.326];

% round
% value_dec = round(d_dec/q);
% truncation 
value_dec = floor(d_dec/q); 

value_bin = dec2bin(abs(value_dec),N);
value_bin = reshape(string(value_bin),[1 5]);
sign_bin = string(1-(d_dec>=0));
d_bin = sign_bin+'.'+value_bin;
