clc;
close all;
clear all;

I = imread("D:\Matlab Program\Pictures\WhatsApp Image 2022-02-06 at 11.59.53 AM.jpeg");

if size(I,3) == 3
    %I = rgb2gray(I);
end

[Xt , mmbebhe_error , mmbebhe] = MMBEBHE(I);


figure ;
subplot(1,2,1);
imshow(I);
title(' Original image ');

subplot(1,2,2);
imshow(mmbebhe);
title([{' after MMBEBHE ' ,' AMBE : ' num2str(mmbebhe_error) ,'Xt = ' num2str(Xt) }] );

%%%%%%%%%%%%%%%%%%%%%%%

