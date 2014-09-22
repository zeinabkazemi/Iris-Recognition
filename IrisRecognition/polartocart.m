function [ x,y ] = polartocart( Ro, Smallteta )
%POLARTOCART Summary of this function goes here
%   Detailed explanation goes here
 x = (Ro)*cos(Smallteta);
 y = (Ro)*sin(Smallteta);

end

