function [ filteredImage ] = getNextGaussianLevel( image )
    image = double(image);
    imageSize = size(image, 1);
    filteredImage = zeros([imageSize/2 imageSize/2]);
    for i = 1:2:imageSize
        for j = 1:2:imageSize
            x = uint8((i+1)/2);
            y = uint8((j+1)/2);
            pixelValue = 0.25 * image(i,j) + 0.25 * image(i, j+1) + 0.25 * image(i+1, j) + 0.25 * image(i+1,j+1);
            filteredImage(x,y) = 0.25*image(i,j) + 0.25*image(i, j+1) + 0.25*image(i+1, j) + 0.25*image(i+1,j+1);
        end
    end
end




