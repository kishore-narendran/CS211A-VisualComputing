function [ imagePyramid ] = getGaussianPyramid( image )
    levels = log2(size(image, 1)) + 1;
    imagePyramid = cell(9);
    imagePyramid{1} = image;
    for i = 2:levels
        resizedImage = getNextGaussianLevel(image);
        imagePyramid{i} = resizedImage;
        image = resizedImage;
    end
end

