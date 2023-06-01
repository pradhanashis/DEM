clc; clear;
ip_interpolated=im2bw(imread('10_1.png'), 0.5);
org=im2bw(imread('10.png'), 0.5);
op= ip_interpolated;

[r,c]=size(org);


for i=1:r
    for j=1:c
        if ip_interpolated(i,j)== org(i,j)
            op(i,j)=0;
        end
    end
end

ip_interpolated=1-ip_interpolated;
org=1-org;
op=1-op;
figure(1), imshow(ip_interpolated);
figure(2), imshow(org);
figure(3), imshow(op);

imwrite(org,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Paper\10\org.png');

temp=imread('final_ip.jpg');
for i=1:r
    for j=1:c
        
            temp(i,j,1)=255;
            temp(i,j,2)=255;
            temp(i,j,3)=255;
       
    end
end


for i=1:r
    for j=1:c
        if  op(i,j)==0
            temp(i,j,1)=0;
            temp(i,j,2)=0;
            temp(i,j,3)=255;
        end
    end
end
figure(4), imshow(temp);
imwrite(temp,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Paper\10\ip_interpolated.png');


for i=1:r
    for j=1:c
        if  org(i,j)==0
            temp(i,j,1)=0;
            temp(i,j,2)=0;
            temp(i,j,3)=0;
        end
    end
end
figure(5), imshow(temp);
imwrite(temp,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\Paper\10\10_final.png');






