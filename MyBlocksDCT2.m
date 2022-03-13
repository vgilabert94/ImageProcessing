function img_DCT = MyBlocksDCT2(img,N,mask)
    imgSize = size(img);
    it_x = floor(imgSize(1)/N);
    it_y = floor(imgSize(2)/N);
    img_DCT = zeros(imgSize(1),imgSize(2));
    
    for j=1:it_x
        for i=1:it_y
            block = img(((i*N)-N+1):i*N,((j*N)-N+1):j*N);
            img_DCT(((i*N)-N+1):i*N,((j*N)-N+1):j*N) = mask.*dct2(block);
        end
    end
end