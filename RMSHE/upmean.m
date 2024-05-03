function [epu,hist4]=upmean(Xm,a,b)

hist3 = zeros(1,256);
hist4 = zeros(1,256);

t=0;
Nu=0;
%loop to get upper mean 

for i=1:b(1)
    for j=1:b(2)
        if a(i,j)>Xm
            Nu=Nu+a(i,j);%sum of all Nu
            t=t+1;%total number of values greater than Xm
        end
    end
end

for i=1:b(1)
    for j=1:b(2)
        for k=Xm:255
             if a(i,j)==k
                 hist3(k+1)=hist3(k+1)+1;
             end
        end
    end
end   
pdfu=(1/Nu)*hist3;
cdfu = zeros(1,256);
cdfu(1)=pdfu(1);
for gu=2:256
cdfu(gu)=cdfu(gu-1)+pdfu(gu);
end
cdfu = round(255*cdfu);
epu = zeros(b);
for du=1:b(1)%loop tracing the rows of image
    for eu=1:b(2)%loop tracing these columns of image
        r=(a(du,eu)+1);%pixel values in image
        epu(du,eu)=cdfu(r);  %Making the output image using       cdf as the transformation function
    end                                             
end
% Loop for Getting the Histogram of the image

for au=1:b(1)
    for bu=1:b(2)
        for cu=0:255
            if epu(au,bu)==cu
                hist4(cu+1)=hist4(cu+1)+1;
            end
        end
    end
end