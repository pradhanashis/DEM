clc; clear;

%READING IMAGES

  ip_image = imread('C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\temp\final_ip.jpg');
  
  %PROCESS
  ip=im2bw(ip_image,0.4);
  
 % imwrite(ip,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\temp\ip.png');
  figure(1), imshow(ip);
  
    [r, c]=size(ip);
    
    enclosure_contour=zeros(r,c,'uint8');         
    line_contour=zeros(r,c,'uint8');             
        
    traced=zeros(r,c,'uint8'); %TO HIGHLIGHT TRACED PIXEL
    plot_op=traced;
    angle_op=zeros(r,c,'double'); %FOR STORING ANGLE
    %CLEARING TOP, BOTTOM, LEFT AND RIGHT
    ip(1,:)=0;  ip(:,1)=0;      ip(r,:)=0;      ip(:,c)=0;
    ip=refine_isolated_points(ip);
    
    image_center_flag=-1;
    
    while image_center_flag~=1
        
        enclosure= -1;   line= -1;
        
        [row, col,image_center_flag]=spiral(ip, image_center_flag);
         deg=0;     neighbor=-1;
         next_r=-1;   next_c=-1;
         
         start_r= row;      start_c= col;
         
         while ip(row,col)==1 %&& neighbor~=1 
                 
                  traced(row,col)=255;
                  [next_r,next_c,new_deg]= line_trace(ip,row, col, deg);
                   
                   row=next_r;    col=next_c;     deg=new_deg;   
                   
                   tmp(1)=ip(row-1,col-1);      tmp(2)=ip(row-1,col);       tmp(3)=ip(row-1,col+1);
                   tmp(4)=ip(row,col-1);        tmp(5)=ip(row,col);         tmp(6)=ip(row,col+1);
                   tmp(7)=ip(row+1,col-1);      tmp(8)=ip(row+1,col);       tmp(9)=ip(row+1,col+1);
                   
                   neighbor=sum(tmp)-1;
                   
                   if next_r==start_r && next_c==start_c
                     enclosure=1;
                     break;
                   end
                   
                   if neighbor==1
                       line=1;
                       break;
                   end
                  
         end
         
          traced(row,col)=255; 
          figure(2), imshow(traced);
          ip=erase(traced, ip);
        if enclosure==1
             enclosure= -1;
             %[enclosure_contour]= append_enclosure(traced, enclosure_contour);
             
             for i=1:r
                 for j=1:c
                     if traced(i,j)~=0
                        enclosure_contour(i,j)=255;
                     end
                 end
             end
             figure(10), imshow(enclosure_contour);
         
          
         end
         
         if line==1
             line= -1;
             %[line_contour]= append_lines(traced, lines_contour);
             for i=1:r
                 for j=1:c
                     if traced(i,j)~=0
                         line_contour(i,j)=255;
                     end
                 end
             end
             %CLEARING TOP, BOTTOM, LEFT AND RIGHT
             line_contour(1,:)=0;  line_contour(:,1)=0;      line_contour(r,:)=0;      line_contour(:,c)=0;
             figure(20), imshow(line_contour);

            
         end
         imwrite(line_contour,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\temp\line_contourr_op.png');
         
        
    end
    

    
  
   


