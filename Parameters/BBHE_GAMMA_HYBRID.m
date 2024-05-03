%% Obtain the original image
input_image = imread("C:\\Users\\shuch\\Downloads\\Cambridge\\test2.tif");

%% Get histogram of the original image
figure(1)
subplot(1,2,1)
imshow(input_image);
title('ORIGINAL IMAGE')
%% BBHE
%% Calculate mean of the histogram
bbhe_mean = round(mean(input_image(:)));
%% Divide the histogram on the basis of the mean in two parts
[H, ~] = imhist(input_image);
H1 = H(1:bbhe_mean);
H2 = H(bbhe_mean+1:256);
%% Equalize each part independently
H1 = H1/sum(H1);
H2 = H2/sum(H2);
%% Combine both sub-images for the processed image
C1 = cumsum(H1);
C2 = cumsum(H2);
C1n = uint8(bbhe_mean * C1);
C2n = uint8(bbhe_mean+1 + (255-bbhe_mean+1)*C2);
img_sum1 = [C1n; C2n];
s=(intlut(input_image,img_sum1));

a=double(s);
[r,c]=size(a);
gamma_c= 0.45;
out= abs((1*a).^gamma_c);
maxr=max(out(:));
minc=min(out(:));
for i=1:r;
  for j=1:c;
    out(i,j)= (255*out(i,j))/ (maxr-minc);

  end
end
result= uint8(out);
figure(1)
subplot(1,2,2)
imshow(result)
title('bbhe_gammaa')

%Read Original & Distorted Images
origImg = input_image;
distImg = result;
%If the input image is rgb, convert it to gray image
noOfDim = ndims(origImg);
if(noOfDim == 3)
    origImg = rgb2gray(origImg);
end
noOfDim = ndims(distImg);
if(noOfDim == 3)
    distImg = rgb2gray(distImg);
end
%Size Validation
origSiz = size(origImg);
distSiz = size(distImg);
sizErr = isequal(origSiz, distSiz);
if(sizErr == 0)
    disp('Error: Original Image & Distorted Image should be of same dimensions');
    return;
end

%Mean Square Error
MSE = MeanSquareError(origImg, distImg);
disp('Mean Square Error = ');
disp(MSE);
%Peak Signal to Noise Ratio
PSNR = PeakSignaltoNoiseRatio(origImg, distImg);
disp('Peak Signal to Noise Ratio = ');
disp(PSNR);
%Normalized Cross-Correlation
NK = NormalizedCrossCorrelation(origImg, distImg);
disp('MNormalized Cross-Correlation  = ');
disp(NK);
%Average Difference
AD = AverageDifference(origImg, distImg);
disp('Average Difference  = ');
disp(AD);
%Structural Content
SC = StructuralContent(origImg, distImg);
disp('Structural Content  = ');
disp(SC);
%Maximum Difference
MD = MaximumDifference(origImg, distImg);
disp('Maximum Difference = ');
disp(MD);
%Normalized Absolute Error
NAE = NormalizedAbsoluteError(origImg, distImg);
disp('Normalized Absolute Error = ');
disp(NAE);

%%Measure of MS SSIM
I_3 = imnoise(distImg,'salt & pepper',0.05);
score3 = multissim(I_3,distImg);
disp('Multiscale SSIM');
disp(score3);
%%Measure of SSIM
H3= fspecial("Gaussian",[11 11],1.5);
A3 = imfilter(distImg,H3,"replicate");
ssimval3 = ssim(A3,distImg);
disp('SSIM VALUE=');
disp(ssimval3);