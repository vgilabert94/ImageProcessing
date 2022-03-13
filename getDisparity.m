% Output -> disp = disparity map. 
% Inputs -> reference img, image to compare, size of block, movement in x-axis (x to x+limit).
function disp = getDisparity(img_ref,img_comp,N,limit,form)
    
    % Get size of image reference and create a disp matrix (same size as ref)
    imgSize = size(img_ref);
    disp = zeros(imgSize(1),imgSize(2));

    %Loops for reference image and create disparity map.
    for y=1:imgSize(1)-N
        for x=1:imgSize(2)-N
            %Define actual block.
            act_x = [x,x+N-1];
            act_y = [y,y+N-1];
            %Get best distance and save to disparity map.
            bestDistance = blockComparison(img_ref,img_comp,N,act_x,act_y,limit,form);
            disp(y,x) = bestDistance;
        end
    end
end
