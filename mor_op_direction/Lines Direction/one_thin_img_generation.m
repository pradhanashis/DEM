clc; clear;

%ip = imread('s3.bmp');

ip = imread('C:\Users\Mr. Ashis Pradhan\Documents\MATLAB\mor_op_direction\Lines Direction\op_lines.jpg');
SE=strel('square',3);
ip=im2bw(imdilate(ip, SE),0.4);

topo_data_prep_v1(ip);