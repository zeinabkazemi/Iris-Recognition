function [ rp ] = Rprime(ox, oy, teta, ri)
%RPRIME Summary of this function goes here
%   Detailed explanation goes here
alpha =ox^2+oy^2;
beta=cos(pi-atan(oy/ox)-teta);

rp1 = sqrt(alpha)*beta;
rp2 = sqrt(ri^2 - alpha + alpha*beta^2); 
rp = rp1 + rp2;
% if(teta >=0 && teta<pi)
%      rp = rp1 + rp2;
% else
%      rp = rp1 - rp2;
% end
end

