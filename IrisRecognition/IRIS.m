I=imread('C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\15\left\lokel5.bmp','bmp');
[ Localized_I ,R_Center , R_Radius_big , R_Radius , ox , oy ] = localization(I);
polar = mynormalize(Localized_I ,R_Center , R_Radius_big , R_Radius , ox , oy );
EP = equalizer( polar );
figure;
imshow(EP);
%%
sizeofvec=1024;
[ HR, HI ] = mygabor2D( EP ,sizeofvec);

Imgabout = HI>0;
Regabout = HR>0;
iris_code = [Imgabout, Regabout];

figure;
imshow(reshape(iris_code,[32 64]));



%loopdir(  'C:\Users\Zeinab\Desktop\iris-localization\MMU Iris Database',sizeofvec);



%%
% Sx = size(EP,1)/2;%ro
% Sy = size(EP,2)/1.5;%theta0
% U = 0;%r0/alpha 
% V = size(EP,2)/2;%theta0/beta
% G = gaborfilter(Sx,Sy,U,V);
% 
% Imgout = conv2(double(EP),double(imag(G)),'same');
% Regout = conv2(double(EP),double(real(G)),'same');
% 
% bImgabout = (Imgout)>0;
% bRegabout = (Regout)>0;
% 
% % avgI = graythresh(Imgabout);
% % avgR = graythresh(Regabout);
% % bImgabout = im2bw(Imgabout, avgI);
% % bRegabout = im2bw(Regabout, avgR);
% 
% figure;
% imshow(bImgabout);
% 
% figure;
% imshow(bRegabout);