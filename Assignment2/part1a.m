%Creating image by using the fiven function.
img = zeros(512);
for x = 1:512
    for y = 1:512
        img(x,y) = sin(0.1 * x) + sin(0.2 * x) + cos(0.4 * x) + sin( sqrt(x^2 + y^2) * 0.15 ) + sin ( sqrt(x^2 + y^2) * 0.35 );
    end
end
subplot(2,3,1);
imshow(mat2gray(img));
title('Generated Image');

%Finding the DFT of the image using IFFT
%Plotting the magnitude plot of the frequency domain of the image
imgDft = fft2(img);

subplot(2,3,2);
imshow(mat2gray(log(fftshift(abs(imgDft) + 1))));
title('Magnitude Plot');
subplot(2,3,3);
imshow(fftshift(angle(imgDft)));
title('Phase Plot');

%Doubling the frequency domain values
%Displaying magnitude plot offrequency domain
imgDft1 = abs(imgDft)*2;
subplot(2,3,4);
imshow(mat2gray(log(fftshift(abs(imgDft1) + 1))));
title('Magnitude Plot after Scaling');

subplot(2,3,5);
imshow(angle(imgDft1));
title('Phase Plot after Scaling');

newImg = ifft2(imgDft1);
subplot(2,3,6);
imshow(mat2gray(newImg));
title('Image after IDFT');





