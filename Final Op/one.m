clc; clear;

%headers={'Row', 'Col', 'height'};
%i=100;
%j=200;
%h=500;
%values={i, j, h};
%xlswrite('plot_data1.xlsx',[headers; values])

p=1;
enclosure=-1;
line=-1;
 
ip=imread('5_org.png');      figure(1), imshow(ip);
ip=imcomplement(ip);

%Added Codes (for org ip, comment thin, complement, m connectivity),
%however this also for works by ensuring same
ip=im2bw(ip,0.3);
ip=ashis_thin_v1(ip);
ip=imcomplement(ip);
ip=m_connectivity_v1(ip);


[r, c]=size(ip);

%CLEARING TOP, BOTTOM, LEFT AND RIGHT
ip(1,:)=0;  ip(:,1)=0;      ip(r,:)=0;      ip(:,c)=0;

traced=zeros(r,c,'uint8'); %TO HIGHLIGHT TRACED PIXEL
image_center_flag=-1;

while image_center_flag~=1
    
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
                   traced(row,col)=255; 
                   figure(2), imshow(traced);
                   
                   coordinate(p,1)= row;
                   coordinate(p,2)= col;
                   p=p+1;
                   
                  
                   
                   
         end
         coordinate(p,1)= row;
         coordinate(p,2)= col;
         p=p+1;
         xlswrite('plot_data1.xlsx',coordinate, 1, 'A');
          
          
          if enclosure==1 || line==1
                        coordinate(p,1)= -999;
                        coordinate(p,2)= -999;
                        xlswrite('plot_data1.xlsx',coordinate, 1, 'A');
                        p=p+1;
          end
          
          ip=erase(traced, ip);
          ip=refine_isolated_points(ip);
end

