clc; clear;

%FOR ORGINAL IP IMAGES
myFolder1 = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\SuperImpose\ip\';
if ~isdir(myFolder1)
  errorMessage1 = sprintf('Error: The following folder does not exist:\n%s', myFolder1);
  uiwait(warndlg(errorMessage1));
  return;
end
filePattern1 = fullfile(myFolder1, '*.png');
jpegFiles1 = dir(filePattern1);

%FOR LINES IP IMAGES
myFolder2 = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\SuperImpose\lines_op\';
if ~isdir(myFolder2)
  errorMessage2 = sprintf('Error: The following folder does not exist:\n%s', myFolder2);
  uiwait(warndlg(errorMessage2));
  return;
end
filePattern2 = fullfile(myFolder2, '*.png');
jpegFiles2 = dir(filePattern2);

%FOR ENCLOSURES IP IMAGES
myFolder3 = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\SuperImpose\en_op\';
if ~isdir(myFolder3)
  errorMessage3 = sprintf('Error: The following folder does not exist:\n%s', myFolder3);
  uiwait(warndlg(errorMessage3));
  return;
end
filePattern3 = fullfile(myFolder3, '*.png');
jpegFiles3 = dir(filePattern3);



for k = 1:length(jpegFiles1)
  %FOR ORGINAL INPUT IMAGES
  baseFileName1 = jpegFiles1(k).name;
  fullFileName1 = fullfile(myFolder1, baseFileName1);
  fprintf(1, '\n Now reading %s', fullFileName1);
  ip_image1 = imread(fullFileName1);
  ip1=im2bw(ip_image1,0.5);
  %ip1=ip_image1;
  
  
  
  %FOR LINES OP IMAGES
  baseFileName2 = jpegFiles2(k).name;
  fullFileName2 = fullfile(myFolder2, baseFileName2);
  fprintf(1, '\n Now reading %s', fullFileName2);
  ip_image2 = imread(fullFileName2);  
  ip2=im2bw(ip_image2,0.5);
 %  ip2=ip_image2;
  
  %FOR ENCLOSURES OP IMAGES
  baseFileName3 = jpegFiles3(k).name;
  fullFileName3 = fullfile(myFolder3, baseFileName3);
  fprintf(1, '\n Now reading %s', fullFileName3);
  ip_image3 = imread(fullFileName3);
  ip3=im2bw(ip_image3,0.5);
  %ip3=ip_image3;
  
  [r, c]=size(ip1);
  
  for i=1:r
      for j=1:c
          if ip2(i,j)~=0 
              ip1(i,j)=1;
          end
          
          if ip3(i,j)~=0 
              ip1(i,j)=1;
          end
          
      end
  end
  
  %CLEARING TOP, BOTTOM, LEFT AND RIGHT
  ip1(1,:)=0;  ip1(:,1)=0;      ip1(r,:)=0;      ip1(:,c)=0;
   
  dest_folder='C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Final Interpolation\SuperImpose\FinalOP\';
  baseFileName1 = jpegFiles1(k).name;
  FileName1 = fullfile(dest_folder, baseFileName1);
  imwrite(ip1,FileName1);
  
  
end