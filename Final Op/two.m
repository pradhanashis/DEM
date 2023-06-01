clc; clear;

ip=imread('4_org.png');
ip=imcomplement(ip);
figure(1), imshow(ip);
whos;