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
%i4=i3;
%imshow(i3);
i2=bwmorph(i2,'thin',inf);
%disp(size(i4));
%imshow(i4);
%i4=bwperim(i4);
%imshow(i4);
[m5,n5]=size(i2);
 %i5=zeros([m5 n5]);

B=bwboundaries(i2,'noholes');
disp(B);
%d=cellfun('length',B);
%[maxd,k]=max(d);
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
disp(c);
end
for y=1:1:length(B)
len=length(x{y}.fcc);
for i=1:1:len
    if(x{y}.fcc(i)==6)
        x{y}.fcc(i)=6;
    end
    if(x{y}.fcc(i)==5 || x{y}.fcc(i)==7)
        if(x{y}.fcc(i+1)==6 || x{y}.fcc(i+2)==6 || x{y}.fcc(i+3)==6 || x{y}.fcc(i-1)==6 || x{y}.fcc(i-2)==6 || x{y}.fcc(i-3)==6)
            x{y}.fcc(i)=6;
        end
    end
    if(x{y}.fcc(i)~=6 || x{y}.fcc(i)~=5 || x{y}.fcc(i)~=7)
    end
    
   
  
end
z=0;
 % disp(x{y}.fcc);  
  
 for q=1:1:len
          
     if (x{y}.fcc(q)==6)
              z=z+1;
              if(z==1)
              r3=B{1}(1,1);
              c3=B{1}(1,2);
              else
              r4=B{1}(q,1);
              c4=B{1}(q,2);
              
              end
              end
          end
          
 [m5,n5]=size(i2);
 i5=zeros([m5 n5]);
 i5(r3:r4,c3)=1;
end
 imshow(i5);
   