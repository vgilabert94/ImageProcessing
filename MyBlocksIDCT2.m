function img_comp = MyBlocksIDCT2(img_DCT,N)
    imgSize = size(img_DCT);
    it_x = floor(imgSize(1)/N);
    it_y = floor(imgSize(2)/N);
    img_comp = zeros(imgSize(1),imgSize(2));
    
    for j=1:it_x
        for i=1:it_y
            block = img_DCT(((i*N)-N+1):i*N,((j*N)-N+1):j*N);
            img_comp(((i*N)-N+1):i*N,((j*N)-N+1):j*N) = idct2(block);
        end
    end
end