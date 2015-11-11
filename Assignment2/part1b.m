img = double(rgb2gray(imread('Cross.jpg')));
subplot(1,3,1);
imshow(mat2gray(img));
title('Original Image');
imgDft = fft2(img);
subplot(1,3,2);
imshow(mat2gray(log(fftshift(abs(imgDft)) + 1)));
title('Log Magnitude Plot');
subplot(1,3,3);
imshow(angle(fftshift(imgDft)));
title('Phase Plot');

