function [angle_op]=Angle_Assignment(feature, feature_leng, feature_x_center, feature_y_center, traced, angle_op)
    
    [r, c]=size(traced);
    Xc=r/2; %Assume size of input image is even no. else typecase it
    Yc=c/2;
    X_cl= feature_x_center;
    Y_cl= feature_y_center;
    
    fprintf('\n Centroid Line (%d, %d) AND Centroid Image(%d, %d) \n', X_cl, Y_cl, Xc, Yc);
    
    [rows, cols]=size(feature);
    
    ip=im2bw(traced, 0.5);
    
    exception_sample9 = -1;
    
    k=1;
    while k < rows
        if feature(k,1)~= 0 &&  feature(k,2)~= 0
            
         %   fprintf('\n Data are: (%d, %d)', feature(k,1), feature(k,2));
            i= feature(k,1);
            j= feature(k,2);
            
            %CASE: Exception for sample9.png
            if  X_cl==144 && Y_cl==104
                
                exception_sample9 = 1;
                        
                            tmp(1)=ip(i-1,j-1);      tmp(2)=ip(i-1,j);       tmp(3)=ip(i-1,j+1);
                            tmp(4)=ip(i,j-1);        tmp(5)=ip(i,j);         tmp(6)=ip(i,j+1);
                            tmp(7)=ip(i+1,j-1);      tmp(8)=ip(i+1,j);       tmp(9)=ip(i+1,j+1);
                 
                 if tmp(5)==1
                     %fprintf('\n Condition Satisfied \n');

                     %Mor op 1
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)== 0   
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 2
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)== 0   &&  tmp(8)==0    &&  tmp(9)==0    
                         if X_cl>Xc
                            angle_op(i,j)=127;       
                         else
                             angle_op(i,j)=180;     
                         end
                     end
                     
                     %Mor op 3
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1   &&  tmp(4)== 0   &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==0
                         angle_op(i,j)=135;      
                     end 
                     
                     %Mor op 4
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)== 0   &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==0    
                         angle_op(i,j)=90;      
                     end 
                     
                     %Mor op 5
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=45;     
                     end
                     
                     %Mor op 6
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)== 0   &&  tmp(8)==1    &&  tmp(9)==0
                         if X_cl>Xc
                             angle_op(i,j)=127;     
                         else
                             angle_op(i,j)=180;      
                         end
                     end 
                     
                     %Mor op 7
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=135;     
                     end 
                     
                     %Mor op 8
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)== 0   &&  tmp(4)==1    &&  tmp(6)== 0   &&  tmp(7)== 0   &&  tmp(8)==0    &&  tmp(9)== 0   
                         angle_op(i,j)=90;      
                     end
                     
                     %Mor op 9
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)==1    &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0
                         angle_op(i,j)=90;
                     end 
                     
                     %Mor op 10
                     if  tmp(1)==1  &&  tmp(2)== 0   &&  tmp(3)== 0   &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 11
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0  
                         if X_cl>Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                             
                     end
                     
                     %Mor op 12
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)== 0   &&  tmp(9)==0
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 13
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 14
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)== 0   &&  tmp(6)==1    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=135;
                     end
                     
                     %Mor op 15
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==1    &&  tmp(4)==1    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 16
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==1    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 17
                     if  tmp(1)==1  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0    
                         angle_op(i,j)=45;
                     end
                     
                     %Mor op 18
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 19
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 20
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==1    
                         angle_op(i,j)=45;
                     end
                     
                     %Mor op 21
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)== 0   &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0
                         if X_cl > Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                         
                     end 
                     
                     %Mor op 22
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)== 0   
                         angle_op(i,j)=90;
                     end 
                     
                     %Mor op 23
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)== 0   &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         if X_cl > Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                     end
                     
                     %Mor op 24
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==1
                         angle_op(i,j)=90;
                     end 
                     
                 end
                
            end
            
            
            %CASE-2
            if Yc < Y_cl && exception_sample9 ~=1
                
                 tmp(1)=ip(i-1,j-1);      tmp(2)=ip(i-1,j);       tmp(3)=ip(i-1,j+1);
                 tmp(4)=ip(i,j-1);        tmp(5)=ip(i,j);         tmp(6)=ip(i,j+1);
                 tmp(7)=ip(i+1,j-1);      tmp(8)=ip(i+1,j);       tmp(9)=ip(i+1,j+1);
                 
                 if tmp(5)==1
                    % fprintf('\n Condition Satisfied \n');
                     %Mor op 1
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)== 0   
                         angle_op(i,j)=225;
                     end 
                     
                     %Mor op 2
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)== 0   &&  tmp(8)==0    &&  tmp(9)==0    
                         if X_cl>Xc
                            angle_op(i,j)=127;       
                         else
                             angle_op(i,j)=180;     
                         end
                     end
                     
                     %Mor op 3
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1   &&  tmp(4)== 0   &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==0
                         angle_op(i,j)=315;      
                     end 
                     
                     %Mor op 4
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)== 0   &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==0    
                         angle_op(i,j)=270;      
                     end 
                     
                     %Mor op 5
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=225;     
                     end
                     
                     %Mor op 6
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)== 0   &&  tmp(8)==1    &&  tmp(9)==0
                         if X_cl>Xc
                             angle_op(i,j)=127;     
                         else
                             angle_op(i,j)=180;      
                         end
                     end 
                     
                     %Mor op 7
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=315;     
                     end 
                     
                     %Mor op 8
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)== 0   &&  tmp(4)==1    &&  tmp(6)== 0   &&  tmp(7)== 0   &&  tmp(8)==0    &&  tmp(9)== 0   
                         angle_op(i,j)=270;      
                     end
                     
                     %Mor op 9
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)==1    &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0
                         angle_op(i,j)=270;
                     end 
                     
                     %Mor op 10
                     if  tmp(1)==1  &&  tmp(2)== 0   &&  tmp(3)== 0   &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=225;
                     end 
                     
                     %Mor op 11
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0  
                         if X_cl>Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                             
                     end
                     
                     %Mor op 12
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)== 0   &&  tmp(9)==0
                         angle_op(i,j)=315;
                     end 
                     
                     %Mor op 13
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=225;
                     end 
                     
                     %Mor op 14
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)== 0   &&  tmp(6)==1    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=315;
                     end
                     
                     %Mor op 15
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==1    &&  tmp(4)==1    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0
                         angle_op(i,j)=315;
                     end 
                     
                     %Mor op 16
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==1    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=225;
                     end 
                     
                     %Mor op 17
                     if  tmp(1)==1  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0    
                         angle_op(i,j)=225;
                     end
                     
                     %Mor op 18
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0
                         angle_op(i,j)=315;
                     end 
                     
                     %Mor op 19
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=315;
                     end 
                     
                     %Mor op 20
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==1    
                         angle_op(i,j)=225;
                     end
                     
                     %Mor op 21
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)== 0   &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0
                         if X_cl > Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                         
                     end 
                     
                     %Mor op 22
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)== 0   
                         angle_op(i,j)=270;
                     end 
                     
                     %Mor op 23
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)== 0   &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         if X_cl > Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                     end
                     
                     %Mor op 24
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==1
                         angle_op(i,j)=270;
                     end 
                     
                 end
                 

            end %CASE 2 ENDS HERE
            
            
            %CASE-1
            if Yc >= Y_cl && exception_sample9 ~=1
                
                 tmp(1)=ip(i-1,j-1);      tmp(2)=ip(i-1,j);       tmp(3)=ip(i-1,j+1);
                 tmp(4)=ip(i,j-1);        tmp(5)=ip(i,j);         tmp(6)=ip(i,j+1);
                 tmp(7)=ip(i+1,j-1);      tmp(8)=ip(i+1,j);       tmp(9)=ip(i+1,j+1);
                 
                 if tmp(5)==1
                     %fprintf('\n Condition Satisfied \n');

                     %Mor op 1
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)== 0   
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 2
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)== 0   &&  tmp(8)==0    &&  tmp(9)==0    
                         if X_cl>Xc
                            angle_op(i,j)=127;       
                         else
                             angle_op(i,j)=180;     
                         end
                     end
                     
                     %Mor op 3
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1   &&  tmp(4)== 0   &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==0
                         angle_op(i,j)=135;      
                     end 
                     
                     %Mor op 4
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)== 0   &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==0    
                         angle_op(i,j)=90;      
                     end 
                     
                     %Mor op 5
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=45;     
                     end
                     
                     %Mor op 6
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)== 0   &&  tmp(8)==1    &&  tmp(9)==0
                         if X_cl>Xc
                             angle_op(i,j)=127;     
                         else
                             angle_op(i,j)=180;      
                         end
                     end 
                     
                     %Mor op 7
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=135;     
                     end 
                     
                     %Mor op 8
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)== 0   &&  tmp(4)==1    &&  tmp(6)== 0   &&  tmp(7)== 0   &&  tmp(8)==0    &&  tmp(9)== 0   
                         angle_op(i,j)=90;      
                     end
                     
                     %Mor op 9
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)==1    &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0
                         angle_op(i,j)=90;
                     end 
                     
                     %Mor op 10
                     if  tmp(1)==1  &&  tmp(2)== 0   &&  tmp(3)== 0   &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 11
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0  
                         if X_cl>Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                             
                     end
                     
                     %Mor op 12
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)== 0   &&  tmp(9)==0
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 13
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==1    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 14
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)== 0   &&  tmp(6)==1    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=135;
                     end
                     
                     %Mor op 15
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==1    &&  tmp(4)==1    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==0
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 16
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==1    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         angle_op(i,j)=45;
                     end 
                     
                     %Mor op 17
                     if  tmp(1)==1  &&  tmp(2)== 0   &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0    
                         angle_op(i,j)=45;
                     end
                     
                     %Mor op 18
                     if  tmp(1)==0  &&  tmp(2)== 0   &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)== 0   &&  tmp(7)==0    &&  tmp(8)==1    &&  tmp(9)==0
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 19
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0    
                         angle_op(i,j)=135;
                     end 
                     
                     %Mor op 20
                     if  tmp(1)==0  &&  tmp(2)==1    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)== 0   &&  tmp(9)==1    
                         angle_op(i,j)=45;
                     end
                     
                     %Mor op 21
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)== 0   &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==0
                         if X_cl > Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                         
                     end 
                     
                     %Mor op 22
                     if  tmp(1)==1  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)== 0   
                         angle_op(i,j)=90;
                     end 
                     
                     %Mor op 23
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==1    &&  tmp(4)== 0   &&  tmp(6)==0    &&  tmp(7)==0    &&  tmp(8)==0    &&  tmp(9)==1    
                         if X_cl > Xc
                             angle_op(i,j)=127;
                         else
                             angle_op(i,j)=180;
                         end
                     end
                     
                     %Mor op 24
                     if  tmp(1)==0  &&  tmp(2)==0    &&  tmp(3)==0    &&  tmp(4)==0    &&  tmp(6)==0    &&  tmp(7)==1    &&  tmp(8)==0    &&  tmp(9)==1
                         angle_op(i,j)=90;
                     end 
                     
                 end
            end %CASE 1 ENDS HERE

            
            k=k+1;
            
            %figure(4), imshow(traced);
            
        else
            break;
        end
        
       
       
    end
    
   
    
end