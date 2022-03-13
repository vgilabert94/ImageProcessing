% corners = morphCornerDetector(img,num_op,debugMode,showResult)
% ---INPUTS:
% img       -> img to get corners
% num_op    -> number of iterations of every dilate and erode. 
%           [dilate erode dilate erode] -> [1 1 1 1]
% debugMode=1   -> Show subplot of every step of algorithm.
% showResult=1  -> Show plot and save fused image (img + corners).
% ---OUTPUT:
% result    -> fused imagen between original image and corners detection.
% corners   -> binarized image with corners detection.
function [result,corners] = morphCornerDetector(img,num_op,debugMode,showResult)
    %% Check image.
    [H,W,c] = size(img);
    if c > 1
        img = rgb2gray(img);
    end

    %% Define kernels of morphological operations.
    % Cross (+) (5x5)
    e1 = zeros(5);
    e1(3,1:5) = 1; e1(1:5,3) = 1;
    % Diamond (5x5)
    e2 = strel('diamond',2);
    % Cross (X) (5x5)
    e3 = zeros(5);
    e3(1,1) = 1; e3(2,2) = 1; e3(3,3) = 1; e3(4,4) = 1; e3(5,5) = 1;
    e3(1,5) = 1; e3(2,4) = 1; e3(4,2) = 1; e3(5,1) = 1;
    % Square (5x5)
    e4 = strel('square',5);
    
    %% Close 1 (Dilate + Erode)
    for i=1:num_op(1)
        close1 = imdilate(img,e1);
    end
    for i=1:num_op(2)
        close1 = imerode(close1,e2);
    end
    %% Close 2 (Dilate + Erode)
    for i=1:num_op(3)
        close2 = imdilate(img,e3);
    end
    for i=1:num_op(4)
        close2 = imerode(close2,e4);
    end
    
    %% get corners result
    corners = imbinarize(close1 - close2,"global");
    result = imfuse(img,corners);
    
    %% Plot to show the steps of algorithm and final result of corner detection.
    if debugMode==1
        figure
        subplot(221),imshow(img),title("Original image")
        subplot(222),imshow(corners),title("Corners (Close 1 - Close 2)")
        subplot(223),imshow(close1),title("Close 1")
        subplot(224),imshow(close2),title("Close 2")
    end
    if showResult==1
        figure
        imshow(result)
        %imwrite(result, "fused_corner_result.jpg", "Quality", 100)
    end
end