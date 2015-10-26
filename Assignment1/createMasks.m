function [ mask1, mask2, mask3 ] = createMasks()
    mask1 = zeros(256);
    for i = 1:256
        for j = 1:4:256
            mask1(i,j)=255;
            mask1(i,j+1)=255;
        end
    end

    mask2 = zeros(256);
    mask2(:,1:128) = 255;

    mask3 = zeros(256);
    for i = 1:256
        for j = i:256
            mask3(i,j) = 255;
        end
    end

    imwrite(uint8(mask1), 'mask1.jpg');
    imwrite(uint8(mask2), 'mask2.jpg');
    imwrite(uint8(mask3), 'mask3.jpg');
end

