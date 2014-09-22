function [ iris_code ] = iriscode( filename )
%IRISCODE Summary of this function goes here
%   Detailed explanation goes here


Teta = 100;
Rosize = 40;
sizeofvec=Teta*4;%2;


I = imread(filename,'bmp');
[ Localized_I ,R_Center , R_Radius_big , R_Radius , ox , oy ] = localization(I);

polar = mynormalize(Localized_I ,R_Center , R_Radius_big , R_Radius , ox , oy, Teta, Rosize );

EP = equalizer( polar) ;%)equalizer(;

[ HR, HI ] = mygabor2D( EP ,sizeofvec, 1);
Imgabout = HI>0;
Regabout = HR>0;
iris_code = [Imgabout; Regabout]';

end

