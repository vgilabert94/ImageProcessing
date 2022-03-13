function img_cent = imfft(img)
    img_frec = fft2(img);
    img_cent = fftshift(img_frec);
end