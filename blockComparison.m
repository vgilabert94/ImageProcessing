% Output -> posBestDistance = pixel distance to best block.
% Inputs -> reference img, image to compare, size of block, actual block x, 
% actual block y, movement in x-axis (x-limit to x+limit).
function bestDistance = blockComparison(img_ref,img_comp,N,act_x,act_y,limit,form)
    %Get comparision image size 
    img_size = size(img_comp);
    %Extract a reference block
    block_ref = img_ref(act_y(1):act_y(2),act_x(1):act_x(2));
    best = 0;
    px=0;

    % loop to run the distance between the limit (x-axis).
    for i=act_x(1):act_x(1)+limit
        %make sure that we are in image dimesnions.
        if i<=img_size(2)-N
            %Extract a comparision block
            block_comp = img_comp(act_y(1):act_y(2),i:i+N-1);
            
            switch form
                case 'ssd' 
                    ssd = sum(sum((block_ref-block_comp).^2));
                    result = 1/(1+ssd);
                case 'sad'
                    sad = sum(sum(abs(block_ref-block_comp)));
                    result = 1/(1+sad);
                otherwise
                    warning('Error en la eleccion del tipo de operacion. ssd o sad.')
            end
            % result -> cuanto mas cercano 1 mas parecido con el otro bloque y cuanto mas cerca de 0 menos se parece.

            if result>best
                best=result;
                px=i;
            end
        end
    end
    
    bestDistance = px-act_x(1);
    
end