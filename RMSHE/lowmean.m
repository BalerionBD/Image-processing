function [epl,hist6]=lowmean(Xm,a,b)

hist5 = zeros(1,256);
hist6 = zeros(1,256);
Nl=0;
r=0;
%loop to get lower mean
for i=1:b(1)
    for j=1:b(2)
        if a(i,j)<Xm
            Nl=Nl+a(i,j);
            r=r+1;     
        end
    end
end

for i=1:b(1)
    for j=1:b(2)
        for k=0:Xm
             if a(i,j)==k
                 hist5(k+1)=hist5(k+1)+1;
             end
        end
    end
end   
pdfl=(1/Nl)*hist5;
cdfl = zeros(1,256);
cdfl(1)=pdfl(1);
for gl=2:256
cdfl(gl)=cdfl(gl-1)+pdfl(gl);
end
cdfl = round(255*cdfl);
epl = zeros(b);
for dl=1:b(1)%loop tracing the rows of image
    for el=1:b(2)%loop tracing these columns of image
        o=(a(dl,el)+1);%pixel values in image
        epl(dl,el)=cdfl(o);  %Making the output image using       cdf as the transformation function
    end                                             
end
% Loop for Getting the Histogram of the image

for al=1:b(1)
    for bl=1:b(2)
        for cl=0:255
            if epl(al,bl)==cl
                hist6(cl+1)=hist6(cl+1)+1;
            end
        end
    end
end