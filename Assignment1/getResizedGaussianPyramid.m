function [ resizedImagePyramid ] = getResizedGaussianPyramid( image )
    imagePyramid = getGaussianPyramid(image);
    resizedImagePyramid = cell(size(imagePyramid, 1));
    resizedImagePyramid{1} = imagePyramid{1};
    outputDimension = size(image, 1);
    for i = 2:size(imagePyramid, 1)
        resizedImagePyramid{i} = imresize(imagePyramid{i}, [outputDimension outputDimension], 'bilinear'); 
    end
end

