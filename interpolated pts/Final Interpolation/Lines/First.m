%THIS PROGRAM IS TO PREPARE A DATASET OF LINE FEATURES IN A FORMAT 3D
%EVERY LAYER REPRESENTS ONE FEATURE WITH I, J, PEX CNT, F_CEN_X, F_CEN_Y
clc; clear;

db_feature_row_col(:,:,:)=0;  %3D-DATABASE with five column (r,c, length, feature_x_centroid, feature_y_centroid)
%Note last layer of database is empty layer

ip=im2bw(imread('line_contourr_op.png'),0.5);

[r, c]=size(ip);

traced=zeros(r,c,'uint8'); %TO HIGHLIGHT TRACED PIXEL
plot_op=traced;
angle_op=zeros(r,c,'double'); %FOR STORING ANGLE

%CLEARING TOP, BOTTOM, LEFT AND RIGHT
ip(1,:)=0;  ip(:,1)=0;      ip(r,:)=0;      ip(:,c)=0;
ip=refine_isolated_points(ip);
figure(1), imshow(ip);

image_center_flag=-1;

db_layer=1; %Every feature stored in layers form
 
while image_center_flag~=1
    
    [row, col,image_center_flag]=spiral(ip, image_center_flag);
    
     deg=0;     neighbor=-1;

     next_r=-1;   next_c=-1;
     
     %DATABASE VARIABLES
     db_index_cnt=1;         %Every feature stored in layers form
     count=1;     line_x=row;        line_y=col;
     
        while ip(row,col)==1 && neighbor~=1 
                 
                  traced(row,col)=255; 
                %  figure(2), imshow(traced);
                  
                  %STORE ROW AND COL INDEX
                  db_feature_row_col(db_index_cnt, 1, db_layer)=row;
                  db_feature_row_col(db_index_cnt, 2, db_layer)=col;
                  db_index_cnt=db_index_cnt+1;
                  
                 % db_feature_row_col(db_layer).row=row;
                 % db_feature_row_col(db_layer).col=col;
                 %  db_index_cnt=db_index_cnt+1;
                  
                  
                 
                 [next_r,next_c,new_deg]= line_trace(ip,row, col, deg);
                %fprintf('\n Traced Cood: row=%d and col=%d', next_r,next_c);

                 row=next_r;    col=next_c;     deg=new_deg;   

                 count=count+1;      line_x=line_x+row;        line_y=line_y+col;

                 tmp(1)=ip(row-1,col-1);      tmp(2)=ip(row-1,col);       tmp(3)=ip(row-1,col+1);
                 tmp(4)=ip(row,col-1);        tmp(5)=ip(row,col);         tmp(6)=ip(row,col+1);
                 tmp(7)=ip(row+1,col-1);      tmp(8)=ip(row+1,col);       tmp(9)=ip(row+1,col+1);

                 neighbor=sum(tmp)-1;  
                 
        end
     
     
     
     traced(row,col)=255;
   
    
     
     count=count+1;      line_x=line_x+row;        line_y=line_y+col;
     
     xc=ceil(line_x/count);      yc=ceil(line_y/count);
     
     %STORE ROW AND COL INDEX
     db_feature_row_col(db_index_cnt, 1, db_layer)=row;
     db_feature_row_col(db_index_cnt, 2, db_layer)=col;
 
     db_feature_row_col(1, 3, db_layer)=count; %Storing length of feature in column 3
     db_feature_row_col(1, 4, db_layer)=xc; %Storing x centroid in column 4
     db_feature_row_col(1, 5, db_layer)=yc; %Storing y centroid in column 5
     
     db_layer=db_layer+1;
     
     ip=erase(traced, ip);
   
end

traced(r,c)=0;

db_feature_row_col=uint8(db_feature_row_col);

%[db_r, db_c, db_layers]=size(db_feature_row_col);
%fprintf('\n db_r= %d, db_c= %d, db_layers= %d  \n', db_r, db_c, db_layers);

sorted_db_feature_row_col= sorting_db(db_feature_row_col);

%plot_points(plot_op, sorted_db_feature_row_col);

[db_r, db_c, db_layers]=size(sorted_db_feature_row_col);

%figure(2), imshow(traced);

for i=1:(db_layers-1)  %FOR ASSIGNMENT OF ANGLE FOR TRAVERSAL TO INTERPOLATION
    
   % fprintf('\n Iteration in reverse: %d', i);
    
    feature=sorted_db_feature_row_col(:, :, i);
    
    feature_leng= feature(1,3);
    feature_x_center= feature(1,4);
    feature_y_center= feature(1,5);
    [angle_op]=Angle_Assignment(feature, feature_leng, feature_x_center, feature_y_center, traced, angle_op);
   
    
    fprintf('\n');
end

%INTERPOLATE POINTS BASED ON ANGLE ASSIGNED

[r, c]=size(ip);
interpolated_pt =zeros(r, c, 'uint8');

[db_r, db_c, db_layers]=size(sorted_db_feature_row_col);
for i=1:(db_layers-1)  
    
    feature=sorted_db_feature_row_col(:, :, i);
    %fprintf('\n Feature = %d being interpolated \n', i);
    [interpolated_pt]=updated_interpolation(interpolated_pt, angle_op, feature);
    
end
%figure(100), imshow(interpolated_pt);
%POST PROCESSING (Dilation, then, thinning and may be m-connectiviyty may also be used)
se = strel('square', 3);
interpolated_pt = imdilate(interpolated_pt, se);
interpolated_pt= im2bw(interpolated_pt, 0.5);
[interpolated_pt]= ashis_thin_v1(interpolated_pt);

[interpolated_pt] = bw_image_255(interpolated_pt);
imwrite(interpolated_pt,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Lines\lines_op\interpolated_line_contourr_op.png');


[op]=new_final_line_op(interpolated_pt, traced);
op=refine_isolated_points(op);

[op]= m_connectivity_v1(op);
figure(200), imshow(op);
imwrite(op,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Lines\lines_op\line_contourr_op.png');


%imtool(op);


%whos;








