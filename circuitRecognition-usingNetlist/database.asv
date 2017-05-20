clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3101.jpg');
%imshow(i);
se=strel('diamond',2);

%i2=bwmorph(i1,'thin',inf);

i2=imresize(i1,[512 512],'bilinear');
i2=rgb2gray(i2);
i2=imcrop(i2);
%ff=graythresh(i2);
i2=imadjust(i2);
%ff=graythresh(i2);
i2=medfilt2(i2);
%imshow(i1);
i2=imcomplement(im2bw(i2,graythresh(i2)));
i3=imcrop(i2);
i4=bwmorph(i3,'thin',inf);
i5=bwmorph(i4,'clean');
CC = bwconncomp(i5,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 4);


stats=regionprops(CC,'BoundingBox');
for i=1:1:length(idx)
    x=stats(idx(i)).BoundingBox(1,1);
    y=stats(idx(i)).BoundingBox(1,2);
width=stats(idx(i)).BoundingBox(1,3);
height=stats(idx(i)).BoundingBox(1,4);
a=imcrop(i5,[x y width height]);
ce(:,:,i)=imresize(a,[40 40],'bilinear');
end