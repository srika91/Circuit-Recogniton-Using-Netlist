

clc;
jpegfiles=dir('*.jpg');
for j=1:1:length(jpegfiles)
    i1=imread(jpegfiles(j).name);
%imshow(i);
%se=strel('square',1);

%i2=bwmorph(i1,'thin',inf);


i2=imresize(i1,[512 512],'bilinear');
i2=rgb2gray(i2);
i2=imcrop(i2);
%ff=graythresh(i2);
i2=imadjust(i2);i3=i2;
%ff=graythresh(i2);

%imshow(i1);
i2=imcomplement(im2bw(i2));
%i2=imclose(i2,se);
%i2=imdilate(i2,se);
%imshow(i2);
%i2=imcrop(i2);
%i4=i3;
%imshow(i3);
%i2=bwmorph(i2,'thin',inf);
h1=bwmorph(i2,'clean');
CC = bwconncomp(h1,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats=regionprops(CC,'area');
idx = find([stats.Area] >5);
stats=regionprops(CC,'BoundingBox');
for i=1:1:length(idx)
    x=stats(idx(i)).BoundingBox(1,1);
    y=stats(idx(i)).BoundingBox(1,2);
width=stats(idx(i)).BoundingBox(1,3);
height=stats(idx(i)).BoundingBox(1,4);
a=imcrop(i3,[x y width height]);
%a=imdilate(a,se);
a = imadjust(a,stretchlim(a),[1 0]);
a=imresize(a,[20 20],'bilinear');
a = padarray(a,[4,4], 0, 'both');

ce(:,:,i) =a;
%I=ce(:,:,i);
%imgname( I, 'template.jpg' );


   new_frame = ce(:,:,i); % i assume...
  
   imwrite( new_frame,sprintf('hi%d.jpg',i+(j*100)));

end

imtool(RGB);
end