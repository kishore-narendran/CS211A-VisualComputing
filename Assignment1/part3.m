image = double(imread('CARTOON.jpg'));
resizedGaussianPyramid = getResizedGaussianPyramid(image);
levels = size(resizedGaussianPyramid, 1);
dimension = size(resizedGaussianPyramid{1}, 1);
secondOrderImages = cell(levels);
pixelVariances = cell(levels);
laplacianOperator = [-1/8 -1/8 -1/8; -1/8 1 -1/8; -1/8 -1/8 -1/8];
zeroCrossingFlags = cell(levels);

%Finding the second order dervivative images, defining variances and zero
%crossing
for i = 1:levels
    secondOrderImages{i} = imfilter(resizedGaussianPyramid{i}, laplacianOperator);
    pixelVariances{i} = stdfilt(resizedGaussianPyramid{i}).^2;
    zeroCrossingFlags{i} = zeros([dimension dimension]);
end

%Thresholding the second order derivative images
%And finding the zero crossing pixels
for i = 1:levels
    secondOrderImage = secondOrderImages{i};
    secondOrderImage(secondOrderImage <= 0) = 0;
    secondOrderImage(secondOrderImage > 0) = 1;
    secondOrderImages{i} = secondOrderImage;
    zeroCrossingFlags{i} = findZeroCrossingPixels(secondOrderImage);
end

for x = 1:levels
    for i = 1:dimension
        for j = 1:dimension
            if zeroCrossingFlags{x}(i,j) == 1 && pixelVariances{x}(i,j) > 120
                secondOrderImages{x}(i,j) = 255;
            else
                secondOrderImages{x}(i,j) = 0;
            end
        end
    end
    subplot(3,3,x);
    imshow(uint8(secondOrderImages{x}));
    title(sprintf('Borders on Laplacian Level %d', x));
end




