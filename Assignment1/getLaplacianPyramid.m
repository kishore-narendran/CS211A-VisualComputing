function [ imagePyramid ] = getLaplacianPyramid( image )
    gaussianPyramid = getGaussianPyramid(image);
    levels = size(gaussianPyramid, 1);
    imagePyramid = cell(levels);
    for i = 1:levels-1
        imagePyramid{i} = imsubtract(gaussianPyramid{i}, imresize(gaussianPyramid{i+1}, size(gaussianPyramid{i})));
    end
    imagePyramid{levels} = gaussianPyramid{levels};
end

