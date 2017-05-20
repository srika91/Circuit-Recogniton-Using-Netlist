%testadaptivethresh.m
clear;close all;
im1=imread('nfliver2.jpg');
bwim1=adaptivethreshold(im1,11,0.03,0);
figure,imshow(im1);
figure,imshow(bwim1);
imwrite(bwim1,'at2.jpg');