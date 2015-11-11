img = double(imread('moonlanding.png'));

subplot(2,2,1);
imshow(uint8(img));
title('Original Image');
%FFT of the image
img_fft = fft2(img);
img_fft = fftshift(img_fft);

subplot(2,2,2);
imshow(mat2gray(log(abs(img_fft) + 1)));
title('Magnitude Plot of Image');

%Mask to discard points close to the centre
distance = 40;
[h,w] = size(img_fft);
dist_mask = zeros(h,w);
centre = size(img_fft)/2;
for i=1:h
    for j=1:w
        i_j_dist = sqrt(power(i - centre(1), 2) + power(j - centre(2), 2));
        if (i_j_dist > distance)
            dist_mask(i, j) = 1;
        end
    end

end

%Mask to find magnitude greater than threshold
low_fft = img_fft;
low_fft(logical(dist_mask)) = 0;

notch_fft = img_fft;
threshold = 35000;
notch_fft(logical(dist_mask) & (abs(notch_fft) > threshold)) = 0;

subplot(2,2,3);
imshow(mat2gray(log(abs(notch_fft) + 1)));
notch_img = ifft2(ifftshift(notch_fft));
title('Filtered Image Magnitude Plot');
subplot(2,2,4);
imshow(uint8(notch_img));
title('Notch Filtered Image');

% Plot the fft
% subplot(1,2,1);
% imshow(mat2gray(log(abs(img_mag_fft) + 1)));
% 
% low_img = ifft2(ifftshift(low_fft)); 
% subplot(2,1,1);
% imshow(uint8(low_img));
% 
% notch_img = ifft2(ifftshift(notch_fft)); 
% subplot(2,1,2);
% imshow(uint8(notch_img));
% 
% imshow(mat2gray (log(abs(fftshift(fft2(notch_img)))+1)));
