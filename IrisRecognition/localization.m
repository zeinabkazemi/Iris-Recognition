function [ J ,R_Center , R_Radius_big , R_Radius , ox , oy] = localization(I)
%LOCALIZATION Summary of this function goes here
%   Detailed explanation goes here
%I=imread('C:\Users\Zeinab\Desktop\iris-localization\MMU Iris Database\1\left\aeval1.bmp','bmp');
%figure( 'Name', 'preprocessed image');
%imshow(I );

J = rgb2gray(I);

filteredJ = medfilt2(J,[10 10]);

e = edge(filteredJ, 'canny');
%figure( 'Name', 'edge image');
%imshow(e);
[centers,radii]=imfindcircles(e,[20 35],'Sensitivity',0.95);
R_Center=centers(1,:);
R_Radius=radii(1);
%viscircles(R_Center,R_Radius,'EdgeColor','b'); %the small circle
[centers,radii]=imfindcircles(e,[45 80],'Sensitivity',0.95);
R_Center_big=centers(1,:);
R_Radius_big=radii(1);
ox=R_Center_big(2)-R_Center(2);
oy=R_Center_big(1)-R_Center(1);
%viscircles(R_Center_big,R_Radius_big,'EdgeColor','b'); %the big circle


end