function [ blendedImage ] = blendImages( imga, imgb, mask )
    laplacianPyramidA = getResizedLaplacianPyramid(imga);
    laplacianPyramidB = getResizedLaplacianPyramid(imgb);
    levels = size(laplacianPyramidA, 1);
    
    mask(mask > 0) = 1;
    mask(mask <= 0) = 0;

    gaussianPyramidMask = getResizedGaussianPyramid(mask);
    laplacianPyramidC = cell(9);
    blendedImage = zeros(256);

    for i = 1:levels
        laplacianLevelC = gaussianPyramidMask{i}.*laplacianPyramidA{i} + (1-gaussianPyramidMask{i}).*laplacianPyramidB{i};
        laplacianPyramidC{i} = laplacianLevelC;
        blendedImage = blendedImage + laplacianLevelC;
    end
end

