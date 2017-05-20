clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3079.jpg');
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
B=bwboundaries(i2,'noholes');
disp(B);
x=cell(length(B));
for i=1:1:length(B)
    b=B{i};
%[m n]=size(i2);
%i5=i4;
%i4=bound2im(b);
%[s,su]=bsubsamp(b,5);
%g2=bound2im(s,m,n);
%cn=connectpoly(s(:,1),s(:,2));
%g3=bound2im(cn);
c=fchcode(b);
x{i}=c;
disp(x{i});
end
 [m5,n5]=size(i2);
 m=zeros([m5 n5]);
for y=1:1:length(B)
%len=length(x{y}.fcc);
for i=1:1:length(x{y}.fcc)
%if(x{y}.fcc(i)==1 || x{y}.fcc(i)==3 || x{y}.fcc(i)==5 || x{y}.fcc(i)==7)
a=B{y}(i,:);
m(a(1),a(2))=1;
end
end

figure,imshow(m);
%m2=imssubtract(i2,m);
%a3=imcomplement(m);
%m2=imssubtract(i2,m);
aa=abs(m-i2)
figure,imshow(aa);
B1=bwboundaries(aa,'noholes');
disp(B1);
y=cell(length(B1));
for i=1:1:length(B1)
    b1=B1{i};
%[m n]=size(i2);
%i5=i4;
%i4=bound2im(b);
%[s,su]=bsubsamp(b,5);
%g2=bound2im(s,m,n);
%cn=connectpoly(s(:,1),s(:,2));
%g3=bound2im(cn);
c1=fchcode(b1);
y{i}=c1;
disp(y{i});
end
