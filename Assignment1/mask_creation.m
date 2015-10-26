mask1 = zeros(256);
for i = 1:256
    for j = 1:4:256
        mask1(i,j)=255;
        mask1(i,j+1)=255;
    end
end

mask1 = uint8(mask1);
imwrite(mask, 'mask1.jpg');
