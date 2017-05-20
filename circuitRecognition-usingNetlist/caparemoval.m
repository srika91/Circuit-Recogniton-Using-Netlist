clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3081.jpg');
%imshow(i);
se=strel('diamond',2);

%i2=bwmorph(i1,'thin',inf);

i2=imresize(i1,[512 512],'bilinear');
%imshow(i1);
i2=imcomplement(im2bw(i2));
%i2=imclose(i2,se);
%i2=imdilate(i2,se);
%imshow(i2);
i2=imcrop(i2);
%i4=i3;
%imshow(i3);
i2=bwmorph(i2,'thin',inf);
%disp(size(i4));
%imshow(i4);
%i4=bwperim(i4);
%imshow(i4);

%d=cellfun('length',B);
%[maxd,k]=max(d);
[m5,n5]=size(i2);

for j=2:1:n5-1
    for i=2:1:m5-1
        if(i2(i,j)==1)
            %if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           if(i2(i+1,j)==1 || i2(i+2,j)==1 || i2(i+3,j)==1) % || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
                v1(i,j)=1;
            else
                v1(i,j)=0;
            end
        end
    end
 end
 
 [r,c]=size(v1);
for j=2:1:c-1
a=0;
for i=2:1:r-1

if(v1(i,j)==1)
a=a+1;
end
if((a<=2 && i==10))
for k=2:1:i
v1(i,j)=0;
end
end

if(a<=5)
for i=2:1:r-1
    v1(i,j)=0;    
end
end
end
end
imshow(v1);

se=strel('square',3);


a2=imclose(v1,se);
a3=bwmorph(a2,'clean');


a4=imdilate(a3,se);
%imshow(a4);
a5=bwmorph(a4,'thin');
imshow(a5);
[r,c]=size(v1);


CC = bwconncomp(a5,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 20);
stats = regionprops(CC, 'PixelList');
b=length(idx);
i5=zeros([r c]);
for i=1:1:b
    b1=length(stats(idx(i)).PixelList);
    y1=stats(idx(i)).PixelList(1,1);
    x1=stats(idx(i)).PixelList(1,2);
 
    y2=stats(idx(i)).PixelList(b1,1);
    x2=stats(idx(i)).PixelList(b1,2);
    i5(x1:x2,y1)=1;
end

se=strel('square',15);
ww=imdilate(i5,se);
figure,imshow(ww);
qw=bwmorph(ww,'thin',inf);
figure,imshow(qw);

for i=1:1:b
aa(i)=length(stats(idx(i)).PixelList);
end
ss=sort(aa);




