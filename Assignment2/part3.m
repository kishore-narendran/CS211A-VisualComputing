img = double(imread('rsz_cross.jpg'));
subplot(2,5,1);
imshow(uint8(img));
title('64x64 Image');
dftImg = fftshift(fft2(img));
subplot(2,5,6);
imshow(mat2gray(log(abs(dftImg) + 1)));
title('64x64 Mag Plot');
for i = 2:4
    newImg = zeros(size(img,1)*2);
    newImg(1:size(img,1),1:size(img,1)) = img(:,:);
    subplot(2,5,i);
    imshow(uint8(newImg));
    title(sprintf('%dx%d Image', pow2(2,i+4), pow2(2,i+4)));
    dftImg = fft2(newImg);
    subplot(2,5,i+5);
    imshow(mat2gray(log(fftshift(abs(dftImg)) + 1)));
    title(sprintf('%dx%d Mag Plot', pow2(2,i+4), pow2(2,i+4)));
    img = newImg;
end
