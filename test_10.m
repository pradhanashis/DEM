clc; clear;
ip_interpolated=imread('ip_interpolated.png');
org=imread('org.png');
op= ip_interpolated;

[r,c]=size(org);


figure(1), imshow(ip_interpolated);
figure(2), imshow(org);

for i=1:r
    for j=1:c
        if  org(i,j)==0
          ip_interpolated(i,j,1)= 0;
          ip_interpolated(i,j,2)= 0;
          ip_interpolated(i,j,3)= 0;
        end
    end
end
figure(3), imshow(ip_interpolated);
imwrite(ip_interpolated,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Paper\10\10_final.png');