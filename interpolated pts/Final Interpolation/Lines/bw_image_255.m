%This function converts binary image(input contains object with value 0) to grayscale with 255 value ROI
function [interpolated_pt] = bw_image_255(interpolated_pt)
    [r,c]=size(interpolated_pt);
    temp=zeros(r,c,'uint8');
        
    for i=1:r
        for j=1:c
            if interpolated_pt(i,j)==0
                temp(i,j)=255;
            end
        end
    end
    
    interpolated_pt= temp;
    


end