function [next_r,next_c,new_deg]= line_trace(ip, row, col, deg)

        if ip(row,col)==1 && deg==0 %Starting from Left Pels
            if ip(row,col-1)==1           next_r=row; next_c=col-1;       new_deg=315;
            elseif ip(row-1,col-1)==1     next_r=row-1; next_c=col-1;     new_deg=0;
            elseif ip(row-1,col)==1       next_r=row-1; next_c=col;       new_deg=45;
            elseif ip(row-1,col+1)==1     next_r=row-1; next_c=col+1;     new_deg=90;
            elseif ip(row,col+1)==1       next_r=row; next_c=col+1;       new_deg=135;
            elseif ip(row+1,col+1)==1     next_r=row+1; next_c=col+1;     new_deg=180;
            elseif ip(row+1,col)==1       next_r=row+1; next_c=col;       new_deg=225;
            elseif ip(row+1,col-1)==1     next_r=row+1; next_c=col-1;     new_deg=270;
            else
                fprintf('\n From Left: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        end

        if ip(row,col)==1 && deg==45 %Starting from Left-top Pels
            if ip(row-1,col-1)==1       next_r=row-1; next_c=col-1;       new_deg=0;
            elseif ip(row-1,col)==1     next_r=row-1; next_c=col;         new_deg=45;
            elseif ip(row-1,col+1)==1   next_r=row-1; next_c=col+1;       new_deg=90;
            elseif ip(row,col+1)==1     next_r=row; next_c=col+1;         new_deg=135;
            elseif ip(row+1,col+1)==1   next_r=row+1; next_c=col+1;       new_deg=180;
            elseif ip(row+1,col)==1     next_r=row+1; next_c=col;         new_deg=225;
            elseif ip(row+1,col-1)==1   next_r=row+1; next_c=col-1;       new_deg=270;
            elseif ip(row,col-1)==1     next_r=row; next_c=col-1;         new_deg=315;
            else
                fprintf('From Left-top: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        end

        if ip(row,col)==1 && deg==90 %Starting from Top Pels
            if ip(row-1,col)==1           next_r=row-1; next_c=col;       new_deg=45;
            elseif ip(row-1,col+1)==1     next_r=row-1; next_c=col+1;     new_deg=90;
            elseif ip(row,col+1)==1       next_r=row; next_c=col+1;       new_deg=135;
            elseif ip(row+1,col+1)==1     next_r=row+1; next_c=col+1;     new_deg=180;
            elseif ip(row+1,col)==1       next_r=row+1; next_c=col;       new_deg=225;
            elseif ip(row+1,col-1)==1     next_r=row+1; next_c=col-1;     new_deg=270;
            elseif ip(row,col-1)==1       next_r=row; next_c=col-1;       new_deg=315;
            elseif ip(row-1,col-1)==1     next_r=row-1; next_c=col-1;     new_deg=0;
            else
                fprintf('\n From Top Pels: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        end

        if ip(row,col)==1 && deg==135 %Starting from Top-right
            if ip(row-1,col+1)==1       next_r=row-1; next_c=col+1;       new_deg=90;
            elseif ip(row,col+1)==1     next_r=row; next_c=col+1;         new_deg=135;
            elseif ip(row+1,col+1)==1   next_r=row+1; next_c=col+1;       new_deg=180;
            elseif ip(row+1,col)==1     next_r=row+1; next_c=col;         new_deg=225;
            elseif ip(row+1,col-1)==1   next_r=row+1; next_c=col-1;       new_deg=270;
            elseif ip(row,col-1)==1     next_r=row; next_c=col-1;         new_deg=315;
            elseif ip(row-1,col-1)==1   next_r=row-1; next_c=col-1;       new_deg=0;
            elseif ip(row-1,col)==1     next_r=row-1; next_c=col;         new_deg=45;
            else
                fprintf('\n from Top-right: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        end

        if ip(row,col)==1 && deg==180 %Starting from Right
            if ip(row,col+1)==1           next_r=row; next_c=col+1;       new_deg=135;
            elseif ip(row+1,col+1)==1     next_r=row+1; next_c=col+1;     new_deg=180;
            elseif ip(row+1,col)==1       next_r=row+1; next_c=col;       new_deg=225;
            elseif ip(row+1,col-1)==1     next_r=row+1; next_c=col-1;     new_deg=270;
            elseif ip(row,col-1)==1       next_r=row; next_c=col-1;       new_deg=315;
            elseif ip(row-1,col-1)==1     next_r=row-1; next_c=col-1;     new_deg=0;
            elseif ip(row-1,col)==1       next_r=row-1; next_c=col;       new_deg=45;   
            elseif ip(row-1,col+1)==1     next_r=row-1; next_c=col+1;     new_deg=90;
            else
                fprintf('\n From Right: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        end

        if ip(row,col)==1 && deg==225 %Starting from Bottom-Right
            if ip(row+1,col+1)==1       next_r=row+1; next_c=col+1;       new_deg=180;
            elseif ip(row+1,col)==1     next_r=row+1; next_c=col;         new_deg=225;   
            elseif ip(row+1,col-1)==1   next_r=row+1; next_c=col-1;       new_deg=270;
            elseif ip(row,col-1)==1     next_r=row; next_c=col-1;         new_deg=315;
            elseif ip(row-1,col-1)==1   next_r=row-1; next_c=col-1;       new_deg=0;
            elseif ip(row-1,col)==1     next_r=row-1; next_c=col;         new_deg=45;
            elseif ip(row-1,col+1)==1   next_r=row-1; next_c=col+1;       new_deg=90;
            elseif ip(row,col+1)==1     next_r=row; next_c=col+1;         new_deg=135;
            else
                fprintf('\n From Bottom-Right: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        end

        if ip(row,col)==1 && deg==270 %Starting from Bottom
            if ip(row+1,col)==1       next_r=row+1; next_c=col;           new_deg=225;
            elseif ip(row+1,col-1)==1     next_r=row+1; next_c=col-1;     new_deg=270;
            elseif ip(row,col-1)==1   next_r=row; next_c=col-1;           new_deg=315;
            elseif ip(row-1,col-1)==1     next_r=row-1; next_c=col-1;     new_deg=0;
            elseif ip(row-1,col)==1   next_r=row-1; next_c=col;           new_deg=45;
            elseif ip(row-1,col+1)==1     next_r=row-1; next_c=col+1;     new_deg=90;
            elseif ip(row,col+1)==1   next_r=row; next_c=col+1;           new_deg=135;
            elseif ip(row+1,col+1)==1     next_r=row+1; next_c=col+1;     new_deg=180;
            else
                fprintf('\n From Bottom: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        end

        if ip(row,col)==1 && deg==315 %Starting from Bottom-left
            if ip(row+1,col-1)==1       next_r=row+1; next_c=col-1;           new_deg=270;
            elseif ip(row,col-1)==1     next_r=row; next_c=col-1;             new_deg=315;
            elseif ip(row-1,col-1)==1   next_r=row-1; next_c=col-1;           new_deg=0;
            elseif ip(row-1,col)==1     next_r=row-1; next_c=col;             new_deg=45;
            elseif ip(row-1,col+1)==1   next_r=row-1; next_c=col+1;           new_deg=90;
            elseif ip(row,col+1)==1     next_r=row; next_c=col+1;             new_deg=135;
            elseif ip(row+1,col+1)==1   next_r=row+1; next_c=col+1;           new_deg=180;
            elseif ip(row+1,col)==1     next_r=row+1; next_c=col;             new_deg=225;
            else
                fprintf('\n Bottom-left: row=%d and col=%d and deg=%d, is a isolated point \n', row,col, deg);
            end
        
        end




end