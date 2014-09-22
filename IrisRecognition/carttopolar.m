function [ Ro, Smallteta ] = carttopolar( x ,y )
%CARTTOPOLAR Summary of this function goes here
%   Detailed explanation goes here
    Ro = (x*x +y*y)/2;
    if( y == 0&& x==0)
         Smallteta = 0;
     elseif (y>=0 && x> 0)
        Smallteta = atan(y/x);
    elseif(x<0 && y>=0)
        Smallteta = atan(y/x) +pi;
    elseif(x<0 && y<0)
        Smallteta = atan(y/x) +pi;
    elseif(x>0 && y<0)
        Smallteta = atan(y/x) +2*pi;    
    elseif (x == 0 && y> 0)
        Smallteta= pi/2;
    elseif (x ==0 && y<0)
        Smallteta= 2*pi - pi/2;
    end
end

