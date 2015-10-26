img = double(imread('polarcities.jpg'));
gaussianPyramid = getResizedGaussianPyramid(img);
for i = 1:size(gaussianPyramid, 1)
    subplot(3,3,i);
    imshow(uint8(gaussianPyramid{i}));
    title(sprintf('Gaussian Level %d', i-1));
end