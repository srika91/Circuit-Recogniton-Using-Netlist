clc;
clear all;
i1=imread('C:\Users\kalki\Documents\MATLAB\allnodes\check2.jpg');
i5=im2bw(i1);
imtool(i5);
left=csvread('leftnode.txt');
right=csvread('rightnode.txt');
leng=length(left);
a0=zeros(size(i5));
a1=zeros(size(i5));
for i=1:1:leng
    x1=left(i,1);
    y1=left(i,2);
    x2=right(i,1);
    y2=right(i,2);
  % DD=sqrt(((x1-x2).^2) +((y1-y2).^2));

%for j1=1:1:round(DD)
for l=y1:1:y2
for k=x1:1:x1+15
   i5(k,l)=0;
end
end
%end

%for j=1:1:round(DD)
for l=y1:1:y2
for k=x1:-1:x1-15
   i5(k,l)=0;
   
end
end
end
%end


up=csvread('upnode.txt');
down=csvread('downnode.txt');
leng=length(up);
a0=zeros(size(i5));
a1=zeros(size(i5));
for i=1:1:leng
    x1=up(i,1);
    y1=up(i,2);
    x2=down(i,1);
    y2=down(i,2);
  % DD=sqrt(((x1-x2).^2) +((y1-y2).^2));

%for j1=1:1:round(DD)
for k=x1:1:x2
for l=y1:1:y1+15
   i5(k,l)=0;
end
end
%end

%for j=1:1:round(DD)
for k=x1:1:x2
for l=y1:-1:y1-15
   i5(k,l)=0;
   
end
end
end
imshow(i5);
