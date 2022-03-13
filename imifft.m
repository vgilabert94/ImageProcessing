function img_out = imifft(img)
    img_frec = ifftshift(img);
    img_out = ifft2(img_frec);
end