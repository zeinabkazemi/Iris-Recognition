function [ EI ] = equalizer( I )
%EQUALIZER Summary of this function goes here
%   Detailed explanation goes here
Histogram = zeros(1,256);
for i=1:size(I,1)
    for j=1:size(I,2)
        Histogram(I(i,j) + 1) =  Histogram(I(i,j) + 1)+1;
    end
end
total_num_pixels = size(I,1)*size(I,2);

p = Histogram / total_num_pixels;
EI = zeros(size(I),'uint8');
for i=1:size(I,1)
    for j=1:size(I,2)
        EI(i,j) =  floor(255 * sum(p(1:(I(i,j)+1)))+0.5);
    end
end

end

