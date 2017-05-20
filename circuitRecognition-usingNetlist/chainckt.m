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
%d=cellfun('length',B);
%[maxd,k]=max(d);
[m5,n5]=size(i2);
 i5=zeros([m5 n5]);
 for i=2:1:m5-1
    for j=2:1:n5-1
        if(i2(i,j)==1)
            %if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           if(i2(i+1,j)==1 || i2(i-1,j)==1 || i2(i+1,j+1)==1 || i2(i-1,j-1)==1) % || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
                v1(i,j)=1;
            else
                v1(i,j)=0;
            end
        end
    end
 end
imshow(v1);
 
 
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
    if(x{y}.fcc(i)==0)
        x{y}.fcc(i)=0;
    end
    if(x{y}.fcc(i)==1 || x{y}.fcc(i)==7)
        if(x{y}.fcc(i+1)==0 || x{y}.fcc(i+2)==0 || x{y}.fcc(i+3)==0 || x{y}.fcc(i-1)==0 || x{y}.fcc(i-2)==0 || x{y}.fcc(i-3)==0)
            x{y}.fcc(i)=0;
        end
    end
    if(x{y}.fcc(i)~=0 || x{y}.fcc(i)~=1 || x{y}.fcc(i)~=7)
    end
    
   
  
end
z=0;
 % disp(x{y}.fcc);  
  
 for q=1:1:len
          
     if (x{y}.fcc(q)==0)
              z=z+1;
              if(z==1)
              r1=B{1}(1,1);
              c1=B{1}(1,2);
              else
              r2=B{1}(q,1);
              c2=B{1}(q,2);
              
              end
              end
          end
          
 [m5,n5]=size(i2);
 i5=zeros([m5 n5]);
 i5(r1,c1:c2)=1;
end
 imshow(i5);
   
              
 
