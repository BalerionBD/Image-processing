clc;
clear;
close;
a=imread("D:\Matlab Program\Pictures\WhatsApp Image 2022-02-06 at 11.59.53 AM.jpeg");% Read the image 
%a = rgb2gray(a);% Convert to grayscale incase it is color
b=size(a);
a=double(a);
hist1 = zeros(1,256);
hist2 = zeros(1,256);

% Loop for Getting the Histogram of the image
for i=1:b(1)
    for j=1:b(2)
        for k=0:255
            if a(i,j)==k
                hist1(k+1)=hist1(k+1)+1;
            end
        end
    end
end

pdf=(1/(b(1)*b(2)))*hist1;
cdf = zeros(1,256);
cdf(1)=pdf(1);
for gg=2:256
cdf(gg)=cdf(gg-1)+pdf(gg);
end
cdf = round(255*cdf);
ep = zeros(b);
for dd=1:b(1)%loop tracing the rows of image
    for ee=1:b(2)%loop tracing these columns of image
        t=(a(dd,ee)+1);%pixel values in image
        ep(dd,ee)=cdf(t);  %Making the output image using       cdf as the transformation function
    end                                             
end
% Loop for Getting the Histogram of the image
for aa=1:b(1)
    for bb=1:b(2)
        for cc=0:255
            if ep(aa,bb)==cc
                hist2(cc+1)=hist2(cc+1)+1;
            end
        end
    end
end 

subplot(2,2,1);
imshow(uint8(a));
title('original image');
subplot(2,2,2);
stem(hist1);
%{
subplot(2,2,3);
imshow(uint8(ep));
subplot(2,2,4);
stem(hist2);
%}
e=sum(hist1);%total number of pixels(rk)=329511
p=sum(a);                
q=sum(p);%total nk of rk pixels= 3615642                
Xm=round(q/e);%mean is 11
t=0;
Nu=0;
count=0;
epl1=0;
epu1=0;
hist4u = zeros(1,256);
hist6l = zeros(1,256);


    [epu,hist4]=upmean(Xm,a,b);
       eu=sum(hist4);%number of pixels
       pu=sum(epu);                
       qu=sum(pu);% nk of rk pixels              
       Xmu=round(qu/eu);%mean
                while(hist1 <= Xm)
                    eu=sum(hist4);%number of pixels
                    pu=sum(epu);                
                    qu=sum(pu);% nk of rk pixels              
                    Xmu=round(qu/eu);%mean
                    while(hist4 > Xmu)
                    i=0:hist4;
                    eu=sum(hist4);%number of pixels
                    pu=sum(epu);                
                    qu=sum(pu);% nk of rk pixels              
                    Xmu=round(qu/eu);%mean
                    i=i+1;
                    [epu(i),hist4(i)]=upmean(Xm,a,b);
                    if i==5
                        break;
                    end
                    end
                    while(hist4 < Xmu)
                        j=0:hist4;
                    eu=sum(hist4);%number of pixels
                    pu=sum(epu);                
                    qu=sum(pu);% nk of rk pixels              
                    Xmu=round(qu/eu);%mean
                    j=j+1;
                    [epu(j),hist4(j)]=lowmean(Xm,a,b);
                   if j==5
                        break;
                    end
                    end
                end
                while(hist1 >= Xm)
                    eu=sum(hist4);%number of pixels
                    pu=sum(epu);                
                    qu=sum(pu);% nk of rk pixels              
                    Xmu=round(qu/eu);%mean
                    while(hist4 > Xmu)
                    k=0:hist4;
                    eu=sum(hist4);%number of pixels
                    pu=sum(epu);                
                    qu=sum(pu);% nk of rk pixels              
                    Xmu=round(qu/eu);%mean
                    k=k+1;
                    [epu(k),hist4(k)]=lowmean(Xm,a,b);
                    if k==5
                        break;
                    end
                    end
                    while(hist4 < Xmu)
                        l=0:hist4;
                    eu=sum(hist4);%number of pixels
                    pu=sum(epu);                
                    qu=sum(pu);% nk of rk pixels              
                    Xmu=round(qu/eu);%mean
                    l=l+1;
                    [epu(l),hist4(l)]=lowmean(Xm,a,b);
                    if l==5
                        break;
                    end
                    end
                end
       
    [epl,hist6]=lowmean(Xm,a,b);
       el=sum(hist6);%number of pixels
       pl=sum(epl);                
       ql=sum(pl);% nk of rk pixels              
       Xml=round(ql/el);%mean   
            while(hist1 <= Xm)
                    el=sum(hist6);%number of pixels
                    pl=sum(epl);                
                    ql=sum(pl);% nk of rk pixels              
                    Xml=round(qu/eu);%mean
                    while(hist6 > Xml)
                    i=0:hist6;
                    el=sum(hist6);%number of pixels
                    pl=sum(epl);                
                    ql=sum(pl);% nk of rk pixels              
                    Xml=round(ql/el);%mean
                    i=i+1;
                    [epl(i),hist6(i)]=lowmean(Xm,a,b);
                    if i==5
                        break;
                    end
                    end
                    while(hist6 < Xmu)
                        j=0:hist6;
                    el=sum(hist6);%number of pixels
                    pl=sum(epl);                
                    ql=sum(pl);% nk of rk pixels              
                    Xml=round(ql/el);%mean
                    j=j+1;
                    [epl(j),hist6(j)]=lowmean(Xm,a,b);
                   if j==5
                        break;
                    end
                    end
             end
                while(hist1 >= Xm)
                    el=sum(hist6);%number of pixels
                    pl=sum(epl);                
                    ql=sum(pl);% nk of rk pixels              
                    Xml=round(ql/el);%mean
                    while(hist4 > Xml)
                    k=0:hist6;
                    el=sum(hist6);%number of pixels
                    pl=sum(epl);                
                    ql=sum(pl);% nk of rk pixels              
                    Xml=round(ql/el);%mean
                    k=k+1;
                    [epl(k),hist6(k)]=lowmean(Xm,a,b);
                    if k==5
                        break;
                    end
                    end
                    while(hist4 < Xmu)
                        l=0:hist4;
                    el=sum(hist6);%number of pixels
                    pl=sum(epl);                
                    ql=sum(pl);% nk of rk pixels              
                    Xml=round(ql/el);%mean
                    l=l+1;
                    [epl(l),hist6(l)]=lowmean(Xm,a,b);
                    if l==5
                        break;
                    end
                    end
               end
%{
subplot(3,2,1);
imshow(uint8(epu));
subplot(3,2,2);
stem(hist4);
subplot(3,2,3);
imshow(uint8(epl));
subplot(3,2,4);
stem(hist6);
%}
               
       subplot(2,2,3);
       epf=epu+epl;
       hist=hist4+hist6;
imshow(uint8(epf));
subplot(2,2,4);
stem(hist);