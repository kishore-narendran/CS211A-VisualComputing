imga = double(imread('CARTOON.jpg'));
imgb = double(imread('kitty.jpg'));

laplacianPyramidA = getResizedLaplacianPyramid(imga);
laplacianPyramidB = getResizedLaplacianPyramid(imgb);
levels = size(laplacianPyramidA, 1);

mask = zeros(256);
for i = 1:256
    for j = 1:4:256
        mask(i,j)=1;
        mask(i,j+1)=1;
    end
end

gaussianPyramidMask = getResizedGaussianPyramid(mask);
laplacianPyramidC = cell(9);
temp = zeros(256);

for i = 1:levels
    laplacianLevelC = gaussianPyramidMask{i}.*laplacianPyramidA{i} + (1-gaussianPyramidMask{i}).*laplacianPyramidB{i};
    laplacianPyramidC{i} = laplacianLevelC;
    temp = temp + laplacianLevelC;
end
imshow(uint8(temp));

% temp = laplacianPyramidC{levels};
% for i = levels-1:-1:1
%     resizedTemp = imresize(temp, size(laplacianPyramidC{i}));
%     temp = resizedTemp + laplacianPyramidC{i};
% end
% 
% imshow(temp);


