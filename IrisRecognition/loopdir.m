%matlabpool(8);
%%
folder='C:\Users\Zeinab\Desktop\iris-localization\MMU_Iris_Database';
subdir=dir(folder);
count=1;
X =[];
for i=3:length(subdir)
    sub_subdir=dir([folder '\' subdir(i).name]);
    for j=3:length(sub_subdir)
        if(strcmp(sub_subdir(j).name,'left'))
            for k=1:5
                img=dir([folder '\' subdir(i).name '\left\*.bmp']);
                filename = [folder '\' subdir(i).name '\left\' img(k).name]
                try
                    X(count,:) = iriscode( filename );
                catch
                    display(['Error in local' filename]);
                end
                count = count + 1;
            end
        else
            for k=1:5
                img=dir([folder '\' subdir(i).name '\right\*.bmp']);
                filename = [folder '\' subdir(i).name '\right\' img(k).name]
                try
                    X(count,:) = iriscode( filename );
                catch
                    display(['Error in local' filename]);
                end
                count = count + 1;
            end
         end
    end
end
%%
h = pdist(X([1:340 351:end],:),'hamming');
D = squareform(h);
figure;
imagesc(D);
mv = [];
vv = [];
for i=1:5:size(D,1)
    for j=0:4
        mv(i+j) = mean(D(i+j,[i:i+j-1 i+j+1:i+4]));
        vv(i+j) = var(D(i+j,[i:i+j-1 i+j+1:i+4]));
    end
end
m = mean(mv);
v = sqrt(sum(vv.^2))/size(D,1);
%%
mn = m*1.2;
fp =0;
fn =0;
for i=1:5:size(D,1)
    for j=0:4
       accepted = D(i+j,:)<(mn+2*v);
       fp = fp + nnz(accepted([1:i-1 i+5:end]));
       fn = fn + 5 - nnz(accepted(i:i+4));
    end
end

display(sprintf('fn = %f fp = %f', 100*fn/(size(D,1)*4), 100*fp/size(D,1)^2));