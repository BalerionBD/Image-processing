%% Obtain the original image
I = imread("D:\Matlab Program\Image Processing Codes\MMBEBHE\test2.PNG");

%% Get histogram of the original image
figure(1)
subplot(2,1,1)
imshow(I);
title('ORIGINAL IMAGE')

%% DSIHE 
%% Obtain the original image
[X, Y] = size(I);
%% Get histogram of the original image
[H, ~] = imhist(I);
%% Calculate median of the histogram. 
[value, lm] = min (abs(H-(X*Y/2)));
%% Divide the histogram on the basis of the median in two parts.
H1 = H(1:lm);
H2 = H(lm+1:256);
%% Equalize each part independently
H1 = H1/sum(H1);
H2 = H2/sum(H2);
%% Combine both sub-images for the processed image
C1 = cumsum(H1);
C2 = cumsum(H2);
C1n = uint8(lm * C1);
C2n = uint8(lm+1 + (255-lm+1)*C2);
img_sum2 = [C1n; C2n];
%% output image of DSIHE
figure(1)
subplot(3,3,7)
imshow(intlut(I,img_sum2));
title("DSIHE IMG")
subplot(3,3,8)
imhist(intlut(I,img_sum2));

%Read Original & Distorted Images
origImg = I;
distImg = intlut(I,img_sum2);
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
