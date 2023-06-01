%function [Enclosure_op]=get_Enclosure(line_contour, ip)
clear; clc;
line_contour = imread('C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\temp\line_contourr_op.png');
ip = imread('C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\temp\final_ip.png');

figure(1), imshow(ip);
figure(2), imshow(line_contour);

    whos;
    [r, c]=size(ip);
    Enclosure_op=zeros(r,c,'uint8');
    
    for i=1:r
        for j=1:c
            if line_contour(i,j)==255
                ip(i,j)=0;
            end
        end
    end
    Enclosure_op=ip;
    figure(3), imshow(Enclosure_op);
imwrite(Enclosure_op,'C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\temp\Enclosure_op.png');