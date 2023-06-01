function [interpolated_pt]=updated_interpolation(interpolated_pt, angle_op, feature)
    
     [r, c]=size(feature);
     [row, col]=size(angle_op);
     
     fprintf('\n\n');
      k=1;
      while k < r
        if feature(k,1)~= 0 &&  feature(k,2)~= 0

            i= feature(k,1);
            j= feature(k,2);
          %  fprintf(' \nCoordinate (%d, %d) being interpolated ', i,j);
            
            if angle_op(i,j)==127 %FOR DEGREE 0
                [len]=new_Degree_0(i,j, angle_op, feature);
                if len~=0
                    displacement=ceil(len/2);
                    p=i;  q=j+displacement;
                    interpolated_pt(p,q)=255;
                end
            end
            
            if angle_op(i,j)==180 %FOR 180 DEGREE TRAVERSAL 
                [len]=Degree_180(i,j, angle_op, feature);
                if len ~=0
                    displacement=ceil(len/2);
                    p=i;  q=j-displacement;
                    interpolated_pt(p,q)=255;
                end
            end
            
            if angle_op(i,j)==270 %FOR 270 DEGREE TRAVERSAL
                    [len]=Degree_270(i,j, angle_op, feature);
                    if len ~=0
                        displacement=ceil(len/2);
                        p=i+displacement;  q=j;
                        interpolated_pt(p,q)=255;
                    end
            end

            if angle_op(i,j)==90 %FOR 90 DEGREE TRAVERSAL
                    [len]=Degree_90(i,j, angle_op, feature);
                    if len ~=0
                        displacement=ceil(len/2);
                        p=i-displacement;  q=j;
                        interpolated_pt(p,q)=255;
                    end
            end           
            
            if angle_op(i,j)==315 %FOR 315 DEGREE TRAVERSAL
                    [len]=Degree_315(i,j, angle_op, feature);
                    if len ~=0
                       displacement=ceil(len/2);           
                        p=i+displacement;  q=j+displacement;
                        interpolated_pt(p,q)=255;
                    end
            end
             
            if angle_op(i,j)==135 %FOR 135 DEGREE TRAVERSAL
                    [len]=Degree_135(i,j, angle_op, feature);
                    if len ~=0
                       displacement=ceil(len/2);           
                        p=i-displacement;  q=j-displacement;
                        interpolated_pt(p,q)=255;
                    end
            end            
            
            if angle_op(i,j)==225 %FOR 225 DEGREE TRAVERSAL
                [len]=new_Degree_225(i,j, angle_op, feature);             
                if len ~=0
                   % fprintf('\n Plotted for (%d, %d) as len= %d',i,j,len );
                    displacement=ceil(len/2);
                    p=i+displacement;  q=j-displacement;
                   interpolated_pt(p,q)=255;
                end
            end
            
            if angle_op(i,j)==45 %FOR 45 DEGREE TRAVERSAL
                [len]=Degree_45(i,j, angle_op, feature);             
                if len ~=0
                    displacement=ceil(len/2);
                    p=i-displacement;  q=j+displacement;
                    interpolated_pt(p,q)=255;
                end
            end
            
            
        end
        
         k=k+1;
      end
    
end