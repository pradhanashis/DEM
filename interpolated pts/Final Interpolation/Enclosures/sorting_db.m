function [sorted_db_feature_row_col]= sorting_db(db_feature_row_col)
    
    [db_r, db_c, db_layers]=size(db_feature_row_col);
   % fprintf('\n db_r= %d, db_c= %d, db_layers= %d  \n', db_r, db_c, db_layers);
    
    db_layers=db_layers-1;
  
    for i=1:(db_layers)
        for j=1:(db_layers-i)
            data1=db_feature_row_col(1,3,j);
            data2=db_feature_row_col(1,3,j+1);
            if data1>data2
                temp= db_feature_row_col(:,:,j);
                db_feature_row_col(:,:,j)=db_feature_row_col(:,:,j+1);
                db_feature_row_col(:,:,j+1)=temp;
            end
        end
    end
    
    sorted_db_feature_row_col=db_feature_row_col;

end