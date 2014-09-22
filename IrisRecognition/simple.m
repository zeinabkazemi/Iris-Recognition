X = [];
X(1,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\12\left\kelvinl2.bmp' );
X(2,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\12\left\kelvinl3.bmp' );


X(3,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\13\left\lecl2.bmp' );
X(4,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\13\left\lecl3.bmp' );


X(5,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\15\left\lokel1.bmp' );
X(6,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\15\left\lokel5.bmp' );

X(7,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\19\left\maranl2.bmp' );
X(8,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\19\left\maranl4.bmp' );


X(9,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\23\left\minglil1.bmp' );
X(10,:) = iriscode( 'C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database\23\left\minglil4.bmp' );

h = pdist(X,'hamming');
D = squareform(h);
figure;
imagesc(D);
metr = [];
falsepositive = 0;
for i=1:2:size(D,1)
    metr(i) = mean(D(i,[1:i-1 i+2:end])) - D(i,i+1);
    if(min(D(i,[1:i-1 i+2:end])) - D(i,i+1)<0)
        falsepositive = falsepositive +1;
    end
    metr(i+1) = mean(D(i+1,[1:i-1 i+2:end])) - D(i+1,i);
    if(min(D(i+1,[1:i-1 i+2:end])) - D(i+1,i)<0)
        falsepositive = falsepositive +1;
    end
end
mean(metr)
falsepositive