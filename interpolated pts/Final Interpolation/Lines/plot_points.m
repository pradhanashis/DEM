%This function simply plots points (for visualization) based on features
%length
function[]= plot_points(plot_op, sorted_db_feature_row_col)
    
    [db_r, db_c, db_layers]=size(sorted_db_feature_row_col);
    fprintf('\n db_r= %d, db_c= %d, db_layers= %d  \n', db_r, db_c, db_layers);
    
    for i=1:(db_layers-1)
        data= sorted_db_feature_row_col(:,:,i);
        
        k=1;
        while data(k,1) ~=0 && k < db_r
            row=data(k,1);          col=data(k,2);
            plot_op(row, col)= 255;
            k=k+1;
            
            figure(3), imshow(plot_op); %Uncomment to visualize data is
           % now in sorted as per its length
        end
        
    end
    


end