img1 = double(imread('CARTOON.jpg'));
img2 = double(imread('kitty.jpg'));

[mask1, mask2, mask3] = createMasks();

bimg = blendImages(img1, img2, mask1);

subplot(2,2,1);
imshow(uint8(img1));
title('Image 1');
subplot(2,2,2);
imshow(uint8(img2));
title('Image 2');
subplot(2,2,3);
imshow(uint8(mask1));
title('Mask');
subplot(2,2,4);
imshow(uint8(bimg));
title('Blended Image');



