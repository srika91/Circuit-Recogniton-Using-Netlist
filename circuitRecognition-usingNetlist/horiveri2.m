clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3079.jpg');
%imshow(i);
se=strel('diamond',2);

%i2=bwmorph(i1,'thin',inf);

i2=imresize(i1,[512 512],'bilinear');
%imshow(i1);
i2=imcomplement(im2bw(i1));
%i2=imclose(i2,se);
%i2=imdilate(i2,se);
%imshow(i2);
i2=imcrop(i2);
%[r2 c2]=size(i2);
%i4=i3;
%imshow(i3);
i2=bwmorph(i2,'thin',inf);
%disp(size(i4));
%imshow(i4);
%i4=bwperim(i4);
%imshow(i4);
B=bwboundaries(i2,'noholes');
disp(B);
%d=cellfun('length',B);
%[maxd,k]=max(d);
[m2 n2]=size(i2);
 i5=zeros([m2 n2]);
 for i=2:1:m2-1
    for j=2:1:n2-1
        if(i2(i,j)==1)
            if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           % if(c21(i,j+1)==1 || c21(i,j-1)==1 || c21(i+1,j+1)==1 || c21(i-1,j+1)==1 || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
                v1(i,j)=1;
            else
                v1(i,j)=0;
            end
        end
    end
 end
imshow(v1);