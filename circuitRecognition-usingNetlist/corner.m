clear all;
clc;
close all;
im1=imread('C:\Users\kalki\Pictures\resiscir.jpg');
im1=imrotate(im1,90);
im3=imcrop(im1);
im3=im2bw(im3);
im3=imcomplement(im3);
%im3=bwmorph(im3,'thin',2.000000000000000201);
%im3=bwmorph(im3,'thin');
%im3=bwmorph(im3,'thin');
%se=strel('diamond',5);
%im3=imopen(im3,se);
[m n]=size(im3);
for i=2:1:m-1
    for j=2:1:n-1
        if(i<m && j<n)
            if(im3(i,j)==0)
            v(i,j)=0;
                 
            
                
        else if((im3(i+1,j-1)==1 && im3(i+1,j+1)==1) || (im3(i-1,j-1)==1 && im3(i-1,j+1)==1))
                v(i,j)=1;
            else
                v(i,j)=0;
            end
            end
        end
    end
end
imshow(v);

