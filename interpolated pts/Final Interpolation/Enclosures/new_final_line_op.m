function [op]=new_final_line_op(interpolated_pt, traced)

    [r,c]=size(traced);
    op=zeros(r, c, 'uint8');

    for i=1:r
        for j=1:c
            if traced(i,j)~=0 
                op(i,j)=255;
            end
            if interpolated_pt(i,j)~=0
                op(i,j)=255;
            end
            


        end
    end
end