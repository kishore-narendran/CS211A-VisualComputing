img = double(imread('polarcities.jpg'));
laplacianPyramid = getLaplacianPyramid(img);
dimensions = size(laplacianPyramid{1});
for i = 1:size(laplacianPyramid, 1)
    subplot(3,3,i);
    imshow(uint8(imresize(laplacianPyramid{i}, dimensions)));
    title(sprintf('Laplacian Level %d', i));
end