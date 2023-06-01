%FOLDER 1

myFolder = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Paper\Final Op\postprocessing\';
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.png');
jpegFiles = dir(filePattern);

%FOLDER 2
%destFolder = 'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Paper\Final Op\postprocessing\op\';
%if ~isdir(myFolder)
%  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
%  uiwait(warndlg(errorMessage));
%  return;
%end
%filePattern1 = fullfile(destFolder, '*.png');
%jpegFiles1 = dir(filePattern1);



%READING IMAGES
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, '\n Now reading %s', fullFileName);
  
  ip_image = im2bw(imread(fullFileName),0.8);
  ip_image=1-ip_image;
  se = strel('square', 3) ;
  ip_image = imdilate(ip_image, se);
  
  ip_image=1-ip_image;  
  
  %FOR WRITING MANY IMAGES
 % baseFileName1 = jpegFiles1(k).name;
 % fullFileName1 = fullfile(destFolder, baseFileName1);
 % imwrite(ip_image,fullFileName1);
     
  figure(k), imshow(ip_image);
end