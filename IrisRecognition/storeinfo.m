function [] = storeinfo( H , filename)
%STOREINFO Summary of this function goes here
%   Detailed explanation goes here
  %  filename='C:\Users\Zeinab\Desktop\iris-localization\1.txt';
   % H=[ 1 2 3 4 5];
   % save(filename,'H');
    fid=fopen(filename,'w');
    fwrite(fid,H,'double');
    fclose(fid);
end

