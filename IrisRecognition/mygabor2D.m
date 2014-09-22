function [ HR, HI ] = mygabor2D( I ,sizeofvec, mode)
%MYGABOR2D Summary of this function goes here
%   Detailed explanation goes here

    if(mode == 1)
        h=zeros(sizeofvec,1);
        r0 = 0;%size(I,1);
        teta0 = size(I,2)/2;%2*pi/size(I,2);
        alpha =  size(I,1)/3;%%gussian
        beta = size(I,2)/3;

        coeff = zeros(size(I));
        for i=0:size(I,1)-1
            for j=0:size(I,2)-1
                coeff(i+1,j+1) = double(I(i+1,j+1))*exp((-((r0-i)/alpha)^2-((teta0-j)/beta)^2))*(i+1);
                for k=0:size(h,1)-1
                    h(k+1) = h(k+1)+ exp(1i*k*(teta0-j))*coeff(i+1,j+1);
                end
            end
        end
        HI = imag(h);
        HR = real(h);
        % figure;
        % imshow(coeff);
    elseif (mode ==2)
        Sx = 1;
        Sy = 1;
        U = 0;%0;%r0
        V = 0;%size(I,2)/2;%theta0

        
        G = gaborfilter(Sx, Sy, U, V);
        Imgout = conv2(double(I),double(imag(G)),'same');
        Regout = conv2(double(I),double(real(G)),'same');

        bImgabout = (Imgout)>0;
        bRegabout = (Regout)>0;

        avgI = graythresh(Imgout);
        avgR = graythresh(Regout);
        HI = reshape(im2bw(Imgout, avgI),[size(Imgout,1)*size(Imgout,2) 1]);
        HR = reshape(im2bw(Regout, avgR),[size(Imgout,1)*size(Imgout,2) 1]);
    elseif (mode ==3)
        r0 = 0;%size(I,1);
        teta0 = size(I,2)/2;%2*pi/size(I,2);
        alpha =  size(I,1)/2;%%gussian
        beta = size(I,2)/1.5;
        
        J = zeros(size(I));
        for i=0:size(I,1)-1
            for j=0:size(I,2)-1
                J(i+1,j+1) = double(I(i+1,j+1))*exp((-((r0-i)/alpha)^2-((teta0-j)/beta)^2));%gabor
            end
        end
        J = fft2(J); 
%         figure;
%         imshow(imag(J)>0);
%         figure;
%         imshow(real(J)>0);
        HI = reshape(imag(J)>0,[size(J,1)*size(J,2) 1]);
        HR = reshape(real(J)>0,[size(J,1)*size(J,2) 1]);
    end
end

