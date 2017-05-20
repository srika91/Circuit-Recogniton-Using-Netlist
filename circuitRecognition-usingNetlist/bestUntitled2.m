clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3080.jpg');
%imshow(i);
se=strel('diamond',2);

%i2=bwmorph(i1,'thin',inf);
 


i2=imresize(i1,[512 512],'bilinear');
w1=rgb2gray(i2);
w1=imadjust(w1);

%imshow(w1);
w2=im2bw(i2);
imshow(w2);

%imshow(i1);
%i2=imcomplement(im2bw(i2));
%i2=imclose(i2,se);
%i2=imdilate(i2,se);
%imshow(i2);
i2=imcrop(w2);
i3=imcomplement(i2);
i4=imdilate(i3,se);
%i4=i3;
imshow(i2);
i4=bwmorph(i4,'thin',inf);
%disp(size(i4));
imshow(i2);
%i4=bwperim(i4);
%imshow(i4);
i2=i4;
%d=cellfun('length',B);
%[maxd,k]=max(d);
[m5,n5]=size(i2);
 %i5=zeros([m5 n5]);
 for i=2:1:m5-1
    for j=2:1:n5-1
        if(i2(i,j)==1)
            %if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           if(i2(i,j+1)==1 || i2(i,j+2)==1 || i2(i,j+3)==1) % || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
                v1(i,j)=1;
            else
                v1(i,j)=0;
            end
        end
    end
 end
 
 [r,c]=size(v1);
for i=2:1:r-1
a=0;
    for j=2:1:c-1

if(v1(i,j)==1)
a=a+1;
end
end
if(a<=8)
for j=2:1:c-1
    v1(i,j)=0;    
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
CC = bwconncomp(a5,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 20);
stats = regionprops(CC, 'PixelList');
b=length(idx);
[r,c]=size(a5);
i5=zeros([r c]);
for i=1:1:b
    b1=length(stats(idx(i)).PixelList);
    y1=stats(idx(i)).PixelList(1,1);
    x1=stats(idx(i)).PixelList(1,2);
    y2=stats(idx(i)).PixelList(b1,1);
    x2=stats(idx(i)).PixelList(b1,2);
    i5(x1,y1:y2)=1;
end

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
end
if(a<=5)
for i=2:1:r-1
    v1(i,j)=0;    
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
for i=1:1:b
    b1=length(stats(idx(i)).PixelList);
    y1=stats(idx(i)).PixelList(1,1);
    x1=stats(idx(i)).PixelList(1,2);
    y2=stats(idx(i)).PixelList(b1,1);
    x2=stats(idx(i)).PixelList(b1,2);
    i5(x1:x2,y1)=1;
end

se=strel('square',10);
ww=imdilate(i5,se);
figure,imshow(ww);
qw=bwmorph(ww,'thin',inf);
figure,imshow(qw);
qw=imresize(qw,size(i3));

for i=1:1:b
aa(i)=length(stats(idx(i)).PixelList);
end
ss=sort(aa);
qq=0;
 for i=1:1:b-1
    if(ss(i+1)-ss(i)<=5)
        %zz=ss(i+1);
        qq=qq+1;
   if(qq~=0)
        zz=ss(i+1);
   else
       zz=ss(1);
   end
    end
 end
stats = regionprops(CC, 'PixelList');

minlength=zz;
for i=1:1:b

    if(aa(i)<=minlength)
     xx(i)=idx(i);
    end
end

xx(xx==0) = [];

combi=factorial(length(xx))/(2*factorial(length(xx)-2));
%if(length(xx)>1)
for i=1:1:length(xx)
   objleni=length(stats(xx(i)).PixelList);
for j=1:1:length(xx)
     objlenj=length(stats(xx(j)).PixelList);
    x1=stats(xx(i)).PixelList(1,1);
   
    y1=stats(xx(i)).PixelList(1,2);
    x2=stats(xx(j)).PixelList(1,1);
    y2=stats(xx(j)).PixelList(1,2);
        xend1=stats(xx(i)).PixelList(objleni,1);
        yend1=stats(xx(i)).PixelList(objleni,2);
        xend2=stats(xx(j)).PixelList(objlenj,1);
        yend2=stats(xx(j)).PixelList(objlenj,2);
            D1=distance([x1 y1],[x2 y2]);
            D2=distance([xend1 yend1],[xend2 yend2]);
            Dista=D1+D2;
           mat1(i,j)=Dista;
            
            
%cc=cc+1;end
end
end
%mat2=mat1;
qr=0;
for i=1:1:length(xx)
for j=1:1:length(xx)
     
     if(i~=j)
         %s=mat1(i,j);
         
qr=qr+1;
    minarray(qr)=mat1(i,j);
     end
end
end

minimumdista=min(minarray);
if(minimumdista<=47)
kk=0;
for i=1:1:length(xx)-1
   
for j=i+1:1:length(xx)
   
       if(mat1(i,j)==minimumdista)
           kk=kk+2;
           object(kk-1)=i;
           object(kk)=j;
   %    end
   end
end
end
end

for i=1:1:length(object)
     b2=length(stats(xx(i)).PixelList);
    y1=stats(xx(i)).PixelList(1,1);
    x1=stats(xx(i)).PixelList(1,2);
    y2=stats(xx(i)).PixelList(b2,1);
    x2=stats(xx(i)).PixelList(b2,2);
    i5(x1:x2,y1)=0;
end


I=qw;
imshow(I);
k = waitforbuttonpress;
point1 = get(gca,'CurrentPoint');  %button down detected
rectregion = rbbox;  %%%return figure units
point2 = get(gca,'CurrentPoint');%%%%button up detected
point1 = point1(1,1:2); %%% extract col/row min and maxs
point2 = point2(1,1:2);
lowerleft = min(point1, point2);
upperright = max(point1, point2); 
ymin = round(lowerleft(1)); %%% arrondissement aux nombrs les plus proches
ymax = round(upperright(1));
xmin = round(lowerleft(2));
xmax = round(upperright(2));
%***********************************
Aj=1;
cmin=xmin-Aj; cmax=xmax+Aj; rmin=ymin-Aj; rmax=ymax+Aj;
min_N=12;max_N=16;
%%%%%%%%%%%%%%Intrest Points %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
sigma=2; Thrshold=20; r=6; disp=1;
dx = [-1 0 1; -1 0 1; -1 0 1]; % The Mask 
    dy = dx';
    %%%%%% 
    Ix = conv2(double(I(cmin:cmax,rmin:rmax)), dx, 'same');   
    Iy = conv2(double(I(cmin:cmax,rmin:rmax)), dy, 'same');
    g = fspecial('gaussian',max(1,fix(6*sigma)), sigma); %%%%%% Gaussien Filter
    
    %%%%% 
    Ix2 = conv2(Ix.^2, g, 'same');  
    Iy2 = conv2(Iy.^2, g, 'same');
    Ixy = conv2(Ix.*Iy, g,'same');
    %%%%%%%%%%%%%%
    k = 0.04;
    R11 = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2;
    R11=(1000/max(max(R11)))*R11;
    R=R11;
    ma=max(max(R));
    sze = 2*r+1; 
    MX = ordfilt2(R,sze^2,ones(sze));
    R11 = (R==MX)&(R>Thrshold); 
    count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5)));
    
    
    loop=0;
    while (((count<min_N)|(count>max_N))&(loop<30))
        if count>max_N
            Thrshold=Thrshold*1.5;
        elseif count < min_N
            Thrshold=Thrshold*0.5;
        end
        
        R11 = (R==MX)&(R>Thrshold); 
        count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5)));
        loop=loop+1;
    end
    
    
	R=R*0;
    R(5:size(R11,1)-5,5:size(R11,2)-5)=R11(5:size(R11,1)-5,5:size(R11,2)-5);
	[r1,c1] = find(R);
    PIP=[r1+cmin,c1+rmin]%% IP 







   Size_PI=size(PIP,1);
   for r=1: Size_PI
   I(PIP(r,1)-2:PIP(r,1)+2,PIP(r,2)-2)=255;
   I(PIP(r,1)-2:PIP(r,1)+2,PIP(r,2)+2)=255;
   I(PIP(r,1)-2,PIP(r,2)-2:PIP(r,2)+2)=255;
   I(PIP(r,1)+2,PIP(r,2)-2:PIP(r,2)+2)=255;
   
   end
   
   imshow(I);
CC = bwconncomp(i3,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] < 200);

stats=regionprops(CC, 'PixelList');
g1=zeros(size(i2));
for i=1:1:length(idx)
    b1=length(stats(idx(i)).PixelList);
  for j=1:1:b1
    y1=stats(idx(i)).PixelList(j,1);
    x1=stats(idx(i)).PixelList(j,2);
    %y2=stats(idx(i)).PixelList(b1,1);
    %x2=stats(idx(i)).PixelList(b1,2);
    g1(x1,y1)=1;

  end

end 

for i=1:1:length(PIP)-1
    x1=PIP(i,1);
    y1=PIP(i,2);
  for j=1:1:length(PIP)
    x2=PIP(j,1);
    y2=PIP(j,2);
    D1=distance([x1 y1],[x2 y2]);
    mat1(i,j)=D1;
  end
end
qr=0;
for i=1:1:length(PIP)
for j=1:1:length(PIP)
     
     if(i~=j)
         %s=mat1(i,j);
         
qr=qr+1;
    minarray(qr)=mat1(i,j);
     end
end
end

minimumdista=min(minarray);
if(minimumdista<=47)
kk=0;
for i=1:1:length(PIP)-1
   
for j=1:1:length(PIP)
   
       if(mat1(i,j)==minimumdista)
           kk=kk+2;
           object(kk-1)=i;
           object(kk)=j;
   %    end
       end
end
end
end


CC = bwconncomp(qw,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 20);
stats=regionprops(CC, 'PixelList');

%g1=zeros(size(qw));
for i=1:1:length(idx)
    b1=length(stats(idx(i)).PixelList);
  for j=1:1:b1
    y1=stats(idx(i)).PixelList(j,1);
    x1=stats(idx(i)).PixelList(j,2);
    %y2=stats(idx(i)).PixelList(b1,1);
    %x2=stats(idx(i)).PixelList(b1,2);
    g1(x1,y1)=1;

  end
end

