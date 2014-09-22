function [ polar ] = mynormalize( Localized_I ,Center , R_iris , R0 , ox , oy, Teta, Rosize )
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here

%maxi = max(Center(1), size(Localized_I,1)-Center(1));
%maxj = max(Center(2), size(Localized_I,2)-Center(2));

%[Romax, ~] = carttopolar(max(maxi, maxj),0); %this is the maxima of the ro 
%when the x/2*x/2 + y/2*y/2, the other parts are going to be black

%rosize = max(maxi, maxj);
x0 = Center(2);
y0 = Center(1); 



polar = zeros(Rosize, Teta);
parfor (t=1:Teta, 8)
    pp = zeros(Rosize, 1);
    for r=1:Rosize   
        smallteta = (t-1)*2*pi/Teta + pi;

        rp = Rprime(ox,oy,smallteta,R_iris) - R0;
       
        ro = rp*r/Rosize + R0;
        
        [x, y] = polartocart(ro, smallteta);
       
        i = x0 + x;
        j = y0 - y;
        
         pp(r,1) = interp2(double(Localized_I), j, i, 'linear');

    end
    polar(:,t) = pp;
end

polar = uint8(polar);

end

