%Creating the mask
mask = uint8(zeros([256 256]));
for i = 1:256
    for j = 1:256
        if mod(j,2) == 1
            mask(i,j) = 1;
        else
            mask(i,j) = 0;
        end
    end
end
imwrite(mask, 'mask.jpg');

gaussianPyramid = getResizedGaussianPyramid(mask);