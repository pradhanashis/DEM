clc; clear;

myFolder = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Segmentation\ip\';

if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

filePattern = fullfile(myFolder, '*.png');
jpegFiles = dir(filePattern);

%READING IMAGES

for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, '\n Now reading %s', fullFileName);
  ip_image = imread(fullFileName);
  
  
  %PROCESS
  ip=im2bw(ip_image,0.5);
  %figure(1), imshow(ip);
  
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
            dest_folder='C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Segmentation\op\enclosures\';
            baseFileName = jpegFiles(k).name;
            FileName = fullfile(dest_folder, baseFileName);
            imwrite(enclosure_contour,FileName);
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
             
            dest_folder='C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Segmentation\op\lines\';
            baseFileName = jpegFiles(k).name;
            FileName = fullfile(dest_folder, baseFileName);
            imwrite(line_contour,FileName);
         end
         
         ip=erase(traced, ip);
         
    end

end 

%FOR ORGINAL IMAGES
myFolder1 = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Segmentation\ip\';
if ~isdir(myFolder1)
  errorMessage1 = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage1));
  return;
end
filePattern1 = fullfile(myFolder1, '*.png');
jpegFiles1 = dir(filePattern1);


%FOR LINES IMAGES
myFolder = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Segmentation\op\lines\';
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.png');
jpegFiles = dir(filePattern);

for k = 1:length(jpegFiles)
  %FOR ORGINAL INPUT IMAGES
  baseFileName1 = jpegFiles1(k).name;
  fullFileName1 = fullfile(myFolder1, baseFileName1);
  fprintf(1, '\n Now reading %s', fullFileName1);
  ip_image1 = imread(fullFileName1);
  ip1=im2bw(ip_image1,0.5);
    
  %FOR LINES SEGMENTED IMAGES
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, '\n Now reading %s', fullFileName);
  ip_image = imread(fullFileName);
  ip=im2bw(ip_image,0.5);
  
  [r, c]=size(ip);
  enclosure_contour=zeros(r,c,'uint8'); 
  for i=1:r
      for j=1:c
          if ip(i, j)~=0  %If non-zero in lines segmented images
              ip1(i, j)=0;
          end
          
      end
  end
  %CLEARING TOP, BOTTOM, LEFT AND RIGHT
  ip1(1,:)=0;  ip1(:,1)=0;      ip1(r,:)=0;      ip1(:,c)=0;
    
            dest_folder='C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\Segmentation\op\enclosures\';
            baseFileName1 = jpegFiles1(k).name;
            FileName1 = fullfile(dest_folder, baseFileName1);
            imwrite(ip1,FileName1);
  
end