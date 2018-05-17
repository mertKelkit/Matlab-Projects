

% Mert KELKİT - 150115013
% Rümeysa ELİÖZ - 150114016

% Test script for conv2d function

% Getting kernels from fspecial
laplacian = fspecial('laplacian', 0.5);
gaussian = fspecial('gaussian', 5, 5);
sobel = fspecial('sobel');
motion = fspecial('motion', 40, 135);

% Sample image
img = imread('cameraman.tif');

% Getting images which are filtered by gaussian filter
% Gaussian filter blurs image
% 1 -> image with zero padding , 2 -> image with border replication
[gaussian_zero, gaussian_border] = conv2d(img, gaussian);

% Getting images which are filtered by laplacian filter
% Laplacian filter extracts edges efficiently
% 1 -> image with zero padding , 2 -> image with border replication
[laplacian_zero, laplacian_border] = conv2d(img, laplacian);

% Getting images which are filtered by sobel filter
% Sobel filter can be used for edge detection, but not as good as laplacian
% filter for this image
% 1 -> image with zero padding , 2 -> image with border replication
[sobel_zero, sobel_border] = conv2d(img, sobel);

% Getting images which are filtered by motion filter
% Image looks like moving with this filter
% 1 -> image with zero padding , 2 -> image with border replication
[motion_zero, motion_border] = conv2d(img, motion);

% Original filtered images, used MATLAB built-in imfilter function
original_laplacian = imfilter(img, laplacian);
original_gaussian = imfilter(img, gaussian);
original_sobel = imfilter(img, sobel);
original_motion = imfilter(img, motion);

% Displaying images with our convolutions
figure()
subplot(2,4,1), imshow(gaussian_zero);
title('Gaussian filter with zero padding', 'Color', 'b');
subplot(2,4,2), imshow(laplacian_zero);
title('Laplacian filter with zero padding', 'Color', 'b');
subplot(2,4,3), imshow(sobel_zero);
title('Sobel filter with zero padding', 'Color', 'b');
subplot(2,4,4), imshow(motion_zero);
title('Motion filter with zero padding', 'Color', 'b');
subplot(2,4,5), imshow(gaussian_border);
title('Gaussian filter with replicated borders', 'Color', 'r');
subplot(2,4,6), imshow(laplacian_border);
title('Laplacian filter with replicated borders', 'Color', 'r');
subplot(2,4,7), imshow(sobel_border);
title('Sobel filter with replicated borders', 'Color', 'r');
subplot(2,4,8), imshow(motion_border);
title('Motion filter with replicated borders', 'Color', 'r');

% Displaying images which have been filtered with MATLAB built-in function
figure()
subplot(1,4,1), imshow(original_gaussian);
title('Original Gaussian filtered', 'Color', 'b');
subplot(1,4,2), imshow(original_laplacian);
title('Original Laplacian filtered', 'Color', 'b');
subplot(1,4,3), imshow(original_sobel);
title('Original Sobel filtered', 'Color', 'b');
subplot(1,4,4), imshow(original_motion);
title('Original Motion filtered', 'Color', 'b');

% Saving sample outputs
imwrite(gaussian_zero, 'gaussian_zero.png');
imwrite(gaussian_border, 'gaussian_border.png');
imwrite(laplacian_zero, 'laplacian_zero.png');
imwrite(laplacian_border, 'laplacian_border.png');
imwrite(sobel_zero, 'sobel_zero.png');
imwrite(sobel_border, 'sobel_border.png');
imwrite(motion_zero, 'motion_zero.png');
imwrite(motion_border, 'motion_border.png');

