function [ H ] = readinfo( filename,sizeofvec )
%READINFO Summary of this function goes here
%   Detailed explanation goes here

H = readmtx(filename,1,sizeofvec,'double');

end

