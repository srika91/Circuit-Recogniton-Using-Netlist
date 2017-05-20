clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3123.jpg');
se=strel('diamond',2);
%i2=bwmorph(i1,'thin',inf);
i2=imresize(i1,[512 512],'bilinear');
i2=rgb2gray(i2);
i2=imcrop(i2);
i2=imadjust(i2);
%imshow(i1);
i2=imcomplement(im2bw(i2));
%i2=imclose(i2,se);
%i2=imdilate(i2,se);
%imshow(i2);
%i2=imcrop(i2);
i2=bwmorph(i2,'thin',inf);
%disp(size(i4));
%imshow(i4);
%i4=bwperim(i4);
%imshow(i4);
i2=bwmorph(i2,'clean');
CC=bwconncomp(i2);
stats = regionprops(CC, 'area');
idx = find([stats.Area] < 100 );
stats = regionprops(CC, 'PixelList');
bb=length(idx);
[r,c]=size(i2);
i34=i2;

%i7=zeros(512,512);
for i=1:1:bb
    
    b1=length(stats(idx(i)).PixelList);
    
    for j=1:1:b1
   
        y1=stats(idx(i)).PixelList(j,1);
    x1=stats(idx(i)).PixelList(j,2);
    i34(x1,y1)=0;
 end

end
%imtool(i34);
%i7=bwmorph(i7,'clean');


%d=cellfun('length',B);
%[maxd,k]=max(d);
[m5,n5]=size(i2);
 %i5=zeros([m5 n5]);
 for i=2:1:m5-1
    for j=2:1:n5-3
        if(i2(i,j)==1)
            %if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           if(i34(i,j+1)==1 || i34(i,j+2)==1 || i34(i,j+3)==1) % || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
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
%imshow(v1);

se=strel('square',3);


a2=imclose(v1,se);
a3=bwmorph(a2,'clean');


a4=imdilate(a3,se);
%imshow(a4);
a5=bwmorph(a4,'thin');
%imshow(a5);
CC = bwconncomp(a5,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 20);
stats = regionprops(CC, 'PixelList');
b=length(idx);
[r,c]=size(a5);
i5=zeros(512,512);
for i=1:1:b
    b1=length(stats(idx(i)).PixelList);
    q=sort(stats(idx(i)).PixelList);
    
    y1=q(1,1);
    x1=q(1,2);
    y2=q(b1,1);
    x2=q(b1,2);
    
    %DD=sqrt(((x1-x2).^2) +((y1-y2).^2));
   %if(DD>=4)
    %i5(x1,y1:y2)=1;
   %else
     %   y2=stats(idx(i)).PixelList(b1-DD,1);
   % x2=stats(idx(i)).PixelList(b1-DD,2);
       i5(x1,y1:y2)=1;
   %end
end


for j=2:1:n5-1
    for i=2:1:m5-3
        if(i2(i,j)==1)
            %if(i2(i,j+1)==1 && i2(i,j-1)==1) 
            %if(i2(i+1,j)==1 && i2(i-1,j)==1)     
           if(i34(i+1,j)==1 || i34(i+2,j)==1 || i34(i+3,j)==1) % || c21(i+1,j)==1 || c21(i-1,j-1)==1 || c21(i+1,j-1)==1)
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
%imshow(v1);
i2=bwmorph(i2,'clean');
CC=bwconncomp(i2);
stats = regionprops(CC, 'area');
idx = find([stats.Area] < 100 );
stats = regionprops(CC, 'PixelList');
bb=length(idx);
[r,c]=size(i2);

i7=zeros(512,512);
for i=1:1:bb
    
    b1=length(stats(idx(i)).PixelList);
    
    for j=1:1:b1
   
        y1=stats(idx(i)).PixelList(j,1);
    x1=stats(idx(i)).PixelList(j,2);
    i7(x1,y1)=1;
 end

end

i7=bwmorph(i7,'clean');
%imtool(i7);
 

se=strel('square',3);


a2=imclose(v1,se);
a3=bwmorph(a2,'clean');


a4=imdilate(a3,se);
%imshow(a4);
a5=bwmorph(a4,'thin');
%imshow(a5);
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
    q=sort(stats(idx(i)).PixelList);
    
    y1=q(1,1);
    x1=q(1,2);
    y2=q(b1,1);
    x2=q(b1,2);
    
    i5(x1:x2,y1)=1;
end
%figure,imshow(i5);
%i45=imcrop(i5);
%i5=bwmorph(i5,'clean');
%imtool(i5);
% 
% cc=bwconncomp(i5);
% statso=regionprops(cc,'PixelList');
% 
% for i=1:1:length(statso)
%     for h=1:1:length(statso(i).PixelList)
%         x3=statso(i).PixelList(h,2);
%         y3=statso(i).PixelList(h,1);
%         if(i5(x3-1,y3)==0 && i5(x3+1,y3)==1)
%             j=1;
%             while(i5(x3+j,y3)~=0 && j<25)
%                 j=j+1;
%                 if(i5(x3+j,y3-1)==1 || i5(x3+j,y3-3) || i5(x3+j,y3-3)==1 || i5(x3+j,y3-4)==1 || i5(x3+j,y3-5)==1|| i5(x3+j,y3+2)==1 || i5(x3+j,y3+1)==1 || i5(x3+j+1,y3+1)==1 )
%                     i5(x3:x3+j,y3)=0;
%                     k=1;
%                     while(i5(x3+j+k,y3)~=0)
%                         i5(x3+j:x3+j+k,y3)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         if(i5(x3,y3-1)==0 && i5(x3,y3+1)==1)
%             j=1;
%             while(i5(x3,y3+j)~=0 && j<25)
%                 j=j+1;
%                 if(i5(x3-1,y3+j)==1 || i5(x3-2,y3+j)==1 || i5(x3-3,y3+j)==1 ||i5(x3-4,y3+j)==1 || i5(x3-5,y3+j)==1 ||i5(x3+2,y3+j)==1 || i5(x3+1,y3+j)==1 || i5(x3-1,y3+j+1)==1 || i5(x3+1,y3+j+1)==1)
%                     i5(x3,y3:y3+j)=0;
%                     k=1;
%                     while(i5(x3,y3+j+k)~=0)
%                         i5(x3,y3+j:y3+j+k)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         
%         
%     end
% end

%imtool(i5);

i5=bwmorph(i5,'clean'); % VV important
xkr=[1 1 1;1 0 1;1 1 1];
i45=i5;
cob=bwconncomp(i45,8);
statsob=regionprops(cob,'PixelList');

[i5xs,i5ys]=size(i45);
%xkr=double(xkr);
%i45=im2double(i45);


for i=1:1:length(statsob)-1
    jsiz=length(statsob(i).PixelList);
    for jj=i+1:1:length(statsob)
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        %if((x1<i5xs) && (y1<i5ys))
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<10)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<10)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                   
            
            
            end
             
           end
                      
        end
        end
    end
    end
end


for i=length(statsob):-1:2
    jsiz=length(statsob(i).PixelList);
    for jj=i-1:-1:1
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        %if((x1<i5xs) && (y1<i5ys))
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<10)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<10)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                   
          
            end
             
           end
                      
        end
        end
    end
    end
end

%imtool(i45);
% se=strel('square',2);
% ww=imdilate(i45,se);
% figure,imshow(ww);
% qw=bwmorph(ww,'thin',inf);

cob=bwconncomp(i45,8);
statsob=regionprops(cob,'PixelList');
for i=1:1:length(statsob)
    if(length(statsob(i).PixelList)<40)
        
    for j=1:1:length(statsob(i).PixelList)
        x11=statsob(i).PixelList(j,2);
        y11=statsob(i).PixelList(j,1);
        i45(x11,y11)=0;
    end
    end
end
i45=bwmorph(i45,'spur');
%i45=imcrop(i45);
i45=bwmorph(i45,'clean');
cob=bwconncomp(i45,8);
vv=labelmatrix(cob);
vv1=label2rgb(vv);
statsob=regionprops(cob,'PixelList');

       
for i=1:1:length(statsob)
    siz1=length(statsob(i).PixelList);
        for ii=1:1:siz1
             
            x4=statsob(i).PixelList(ii,2);
            y4=statsob(i).PixelList(ii,1);
            
            if(i45(x4,y4-1)==1 && i45(x4-1,y4)==1)
                j=1;
                while(i45(x4-j,y4)~=0 && j<16)
                    
                    j=j+1;
                    kk=1;
                    while(i45(x4-j,y4+kk)~=0)
                        i45(x4,y4+kk)=1;
                        i45(x4-j,y4+kk)=0;
                        kk=kk+1;
                    end
                    
                end
                if(i45(x4-j-1,y4)==0)
                i45(x4-j:x4-1,y4)=0;
                end
            end
                if(i45(x4,y4-1)==1 && i45(x4-1,y4)==1)
                    j=1;
                    while(i45(x4,y4-j)~=0 && j<16)
                    
                    j=j+1;
                    kk=1;
                    while(i45(x4+kk,y4-j)~=0)
                        i45(x4+kk,y4)=1;
                        i45(x4+kk,y4-j)=0;
                        kk=kk+1;
                    end
                   
                    end
                    if(i45(x4,y4-j-1)==0)
                 i45(x4,y4-j:y4-1)=0;
                    end
            end
            
%             if(i45(x4+1,y4)==1 && i45(x4,y4+1)==1)
%                 j=1;
%                while(i45(x4+j,y4)~=0 && j<16)
%                    
%                    j=j+1;
%                     kk=1;
%                     while(i45(x4+j,y4-kk)~=0)
%                         i45(x4,y4-kk)=1;
%                         i45(x4+j,y4-kk)=0;
%                         kk=kk+1;
%                     end
%                     
%                end
%                if(i45(x4+j+1,y4)==0)
%                i45(x4+1:x4+j,y4)=0;
%                end
%             end
            
%             if(i45(x4+1,y4)==1 && i45(x4,y4+1)==1)
%                 j=1;
%                while(i45(x4,y4+j)~=0 && j<16)
%                     
%                    j=j+1;
%                     kk=1;
%                     while(i45(x4-kk,y4+j)~=0)
%                         i45(x4-kk,y4)=1;
%                         i45(x4-kk,y4+j)=0;
%                         kk=kk+1;
%                     end
%                    
%                end
%                if(i45(x4,y4+j+1)==0)
%                  i45(x4,y4+1:y4+j)=0;
%                end
%             end
               
            if(i45(x4+1,y4)==1 && i45(x4,y4-1)==1)
                j=1;
               while(i45(x4+j,y4)~=0 && j<16)
                    
                   j=j+1;
                    kk=1;
                    while(i45(x4+j,y4+kk)~=0)
                        i45(x4,y4+kk)=1;
                        i45(x4+j,y4+kk)=0;
                        kk=kk+1;
                    end
                    
               end
               if(i45(x4+j+1,y4)==0)
               i45(x4+1:x4+j,y4)=0;
               end
            end
            
%             if(i45(x4+1,y4)==1 && i45(x4,y4-1)==1)
%                 j=1;
%                while(i45(x4,y4-j)~=0 && j<16)
%                     
%                    j=j+1;
%                     kk=1;
%                     while(i45(x4-kk,y4-j)~=0)
%                         i45(x4-kk,y4)=1;
%                         i45(x4-kk,y4-j)=0;
%                         kk=kk+1;
%                     end
%                    
%                end
%                if(i45(x4,y4-j-1)==0)
%                 i45(x4,y4-j:y4-1)=0;
%                end
%             end
            
%             
%             if(i45(x4-1,y4)==1 && i45(x4,y4+1)==1)
%                 j=1;
%                while(i45(x4-j,y4)~=0 && j<16)
%                     
%                    j=j+1;
%                     kk=1;
%                     while(i45(x4-j,y4-kk)~=0)
%                         i45(x4,y4-kk)=1;
%                         i45(x4-j,y4-kk)=0;
%                         kk=kk+1;                
%                     end
%                     
%                end
%                if(i45(x4-j-1,y4)==0)
%                i45(x4-j:x4-1,y4)=0;
%                end
%             end
%              
           if(i45(x4-1,y4)==1 && i45(x4,y4+1)==1)
                j=1;    
               while(i45(x4,y4+j)~=0 && j<16)
                   
                   j=j+1;
                    kk=1;
                    while(i45(x4+kk,y4+j)~=0)
                        i45(x4+kk,y4)=1;
                        i45(x4+kk,y4+j)=0;
                        kk=kk+1;
                        
                    end
                    
               end
               if(i45(x4,y4+j+1)==0)
            i45(x4,y4+1:y4+j)=0;
               end
           end
 
        end
end

%imtool(i45);
cob=bwconncomp(i45,8);
statsob=regionprops(cob,'PixelList');

[i5xs,i5ys]=size(i45);
%xkr=double(xkr);
%i45=im2double(i45);


for i=1:1:length(statsob)-1
    jsiz=length(statsob(i).PixelList);
    for jj=length(statsob):-1:1
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        %if((x1<i5xs) && (y1<i5ys))
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<16)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<16)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                end
            end   
        end
        end
    end
    end
end
for i=length(statsob):-1:2
    jsiz=length(statsob(i).PixelList);
    for jj=1:1:length(statsob)
    ksiz=length(statsob(jj).PixelList);
    for j=1:1:jsiz
        x1=statsob(i).PixelList(j,2);
        y1=statsob(i).PixelList(j,1);
        %if((x1<i5xs) && (y1<i5ys))
        ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
           
        if(ckr1==1)
          % [x1,y1]
           for k=1:1:ksiz
            
            x2=statsob(jj).PixelList(k,2);    
            y2=statsob(jj).PixelList(k,1);
           %if((x2<i5xs) && (y2<i5ys))
            %[x2,y2]
            if(x1==x2)
                
                %[x2,y2]
                if(abs(y1-y2)<10)
                    if(y1<y2)
                    i45(x1,y1:y2)=1;
                    end
                    if(y1>y2)
                        i45(x1,y2:y1)=1;
                    end
                end
            end
            if(y1==y2)
                %[x2,y2]
                if(abs(x1-x2)<10)
                    if(x1<x2)
                    i45(x1:x2,y1)=1;
                    end
                    if(x1>x2)
                        i45(x2:x1,y1)=1;
                    end
                end
            end 
            ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
            if(ckr2==1)
                 
                if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
                    
                    if(x1<x2 && y1<y2)
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y1:y2)=1;
                            
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x1:x2,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1<x2 && y1>y2)
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x1:x2,y2)=1;
                        end
                        if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
                            i45(x1:x2,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                    end
                    if(x1>x2 && y1<y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2,y1:y2)=1;
                            i45(x2:x1,y1)=1;
                        end
                        if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
                            i45(x2:x1,y2)=1;
                            i45(x1,y1:y2)=1;
                        end
                    end
                    if(x1>x2 && y1>y2)
                        if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
                            i45(x2:x1,y1)=1;
                            i45(x2,y2:y1)=1;
                        end
                        if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
                            i45(x1,y2:y1)=1;
                            i45(x2:x1,y2)=1;
                        end
                    end
                   
          
            end
             
           end
                      
        end
        end
    end
    end
end
i46=i5;

i5=i45;

% for i=1:1:length(statso)
%     for h=1:1:length(statso(i).PixelList)
%         x3=statso(i).PixelList(h,2);
%         y3=statso(i).PixelList(h,1);
%         if(i5(x3-1,y3)==0 && i5(x3+1,y3)==1)
%             j=1;
%             while(i5(x3+j,y3)~=0 && j<20)
%                 j=j+1;
%                 if(i5(x3+j,y3-1)==1 || i5(x3+j,y3-3) || i5(x3+j,y3-3)==1 || i5(x3+j,y3-4)==1 || i5(x3+j,y3-5)==1|| i5(x3+j,y3+2)==1 || i5(x3+j,y3+1)==1 || i5(x3+j+1,y3+1)==1 )
%                     i5(x3:x3+j,y3)=0;
%                     k=1;
%                     while(i5(x3+j+k,y3)~=0)
%                         i5(x3+j:x3+j+k,y3)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         if(i5(x3,y3-1)==0 && i5(x3,y3+1)==1)
%             j=1;
%             while(i5(x3,y3+j)~=0 && j<20)
%                 j=j+1;
%                 if(i5(x3-1,y3+j)==1 || i5(x3-2,y3+j)==1 || i5(x3-3,y3+j)==1 ||i5(x3-4,y3+j)==1 || i5(x3-5,y3+j)==1 ||i5(x3+2,y3+j)==1 || i5(x3+1,y3+j)==1 || i5(x3-1,y3+j+1)==1 || i5(x3+1,y3+j+1)==1)
%                     i5(x3,y3:y3+j)=0;
%                     k=1;
%                     while(i5(x3,y3+j+k)~=0)
%                         i5(x3,y3+j:y3+j+k)=0;
%                         k=k+1;
%                     end
%                 end
%             end
%         end
%         
%    %     if(i5(
%         
%         
%     end
% end

xkr=[1 1 1;1 0 1;1 1 1];
%imtool(i5);
% xkr=double(xkr);
% cob=bwconncomp(i5);   
% statsob=regionprops(cob,'PixelList');
i65=i5;
for i=2:1:511
    for j=2:1:511
        
        if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i+1,j)==1 && i5(i,j+1)==1))
            kr=1;    
            while(i5(i+kr,j)~=0 && kr<8)
                %xkrw=kr;
                
                  if(i5(i+kr+1,j)==0)
             i5(i+1:i+kr,j)=0;
                  end
             kr=kr+1;      
            end
        end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;    
         
            while(i5(i-kr,j)~=0 && kr<8)
               % xkrw=kr;
                 
                 if(i5(i-kr-1,j)==0)
            i5(i-kr:i-1,j)=0;
                 end
            kr=kr+1;     
            end
           end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;    
        
            while(i5(i,j+kr)~=0 && kr<8)
                if(i5(i,j+kr+1)==0)
                    i5(i,j+1:j+kr)=0;
                end
                kr=kr+1;
            end
           end
           if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
            kr=1;
            while(i5(i,j-kr)~=0 && kr<8)
            if(i5(i,j-kr-1)==0)
             i5(i,j-kr:j-1)=0;
            end
            kr=kr+1;
            end
         end    
   
    end
end
 
                

imtool(i5);


for i=2:1:511
    for j=2:1:511
        if(i5(i,j)==1)
            if((i5(i-1,j)==1 && i5(i,j+1)==1 && i5(i+1,j)==0 && i5(i,j-1)==0) || (i5(i+1,j)==1 && i5(i,j+1)==1 && i5(i,j-1)==0 && i5(i-1,j)==0) || (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i-1,j)==0 && i5(i,j+1)==0) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i+1,j)==0 && i5(i,j+1)==0))
            nodepoint2=[i j];
            dlmwrite('nodepoint2.txt',nodepoint2,'-append', ...
             'newline', 'pc');
            end
            
            if((i5(i-1,j)==1 && i5(i,j+1)==1 && i5(i+1,j)==1 && i5(i,j-1)==1) || (i5(i+1,j)==1 && i5(i,j+1)==1 && i5(i,j-1)==1 && i5(i-1,j)==1) || (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1))
                nodepoint4=[i j];
                 dlmwrite('nodepoint4.txt',nodepoint4,'-append', ...
             'newline', 'pc');
            end
            
            if((i5(i-1,j)==1 && i5(i,j+1)==1 && i5(i+1,j)==1 && i5(i,j-1)==0) || (i5(i-1,j)==1 && i5(i,j+1)==1 && i5(i+1,j)==0 && i5(i,j-1)==1)|| (i5(i-1,j)==1 && i5(i,j+1)==0 && i5(i+1,j)==1 && i5(i,j-1)==1)|| (i5(i-1,j)==0 && i5(i,j+1)==1 && i5(i+1,j)==1 && i5(i,j-1)==1))
                nodepoint3=[i j];
                dlmwrite('nodepoint3.txt',nodepoint3,'-append', ...
             'newline', 'pc');
            end
        end
    end
end

for i=2:1:511
    for j=2:1:511
        if(i5(i,j)==1)
            if(i5(i,j-1)==1 && i5(i,j+1)==0 && i5(i-1,j-1)==0  && i5(i-1,j)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j)==0 && i5(i+1,j+1)==0)
            leftnode=[i j];
            dlmwrite('leftnode.txt',leftnode,'-append', ...
             'newline', 'pc');
            end
            if(i5(i,j+1)==1 && i5(i,j-1)==0 && i5(i-1,j-1)==0  && i5(i-1,j)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j)==0 && i5(i+1,j+1)==0)
            rightnode=[i j];
            dlmwrite('rightnode.txt',rightnode,'-append', ...
             'newline', 'pc');
            end
            
        end
end
end
        
for j=2:1:511
    for i=2:1:511
        if(i5(i,j)==1)
            if(i5(i-1,j)==1 && i5(i+1,j)==0 && i5(i-1,j-1)==0  && i5(i-1,j+1)==0 && i5(i,j-1)==0 && i5(i,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
            upnode=[i j];
            dlmwrite('upnode.txt',upnode,'-append', ...
             'newline', 'pc');
            end
            if(i5(i-1,j)==0 && i5(i+1,j)==1 && i5(i-1,j-1)==0  && i5(i-1,j+1)==0 && i5(i,j-1)==0 && i5(i,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
            downnode=[i j];
            dlmwrite('downnode.txt',downnode,'-append', ...
             'newline', 'pc');
            end
            
        end        
    end
end
 
 i8=i7+i5;
 CC=bwconncomp(i7);
 stats = regionprops(CC, 'area');
idx = find([stats.Area] > 10);

 stats=regionprops(CC,'BoundingBox');
 for i=1:1:length(idx)
 centroid(i,:)=[stats(idx(i)).BoundingBox(1,1)+(stats(idx(i)).BoundingBox(1,3))/2 stats(idx(i)).BoundingBox(1,2)+(stats(idx(i)).BoundingBox(1,4))/2];
 %xyz=[centroid(i,:) stats(i).BoundingBox(1,:)];
 centroidindex(i,:)=[centroid(i,:) idx(i)];
%  dlmwrite('centroidindex.txt',xyz,'-append', ...
%              'newline', 'pc');
%  
 end
 %i1=imread('C:\Users\kalki\Documents\MATLAB\allnodes\check3.jpg');
left=csvread('leftnode.txt');

right=csvread('rightnode.txt');
 for i=1:1:length(left)
     x1=left(i,1);
     y1=left(i,2);
 for j=1:1:length(left)    
     x2=right(j,1);
     y2=right(j,2);
     k(i,j)=2000;
%if(i1(x2,y1:y2)~=0 || i1(x1,y1:y2)~=0)
    if(y1<y2)
k(i,j)=sqrt((abs(x1-x2).^2) + (abs(y1-y2).^2));
    end
end
 
 mini=min(k(i,:));
 [x,y]=find(k==mini);
 leftu=[left(i,1) left(i,2)];
            dlmwrite('corresLEFT.txt',leftu,'-append', ...
              'newline', 'pc');

 rightu=[right(y,1) right(y,2)];
            dlmwrite('corresRIGHT.txt',rightu,'-append', ...
              'newline', 'pc');
 
 end
 up=csvread('upnode.txt');

down=csvread('downnode.txt');
 for i=1:1:length(up)
     x1=up(i,1);
     y1=up(i,2);
 for j=1:1:length(up)    
     x2=down(j,1);
     y2=down(j,2);
     k(i,j)=2000;
%if(i1(x2,y1:y2)~=0 || i1(x1,y1:y2)~=0)
    if(x1<x2)
k(i,j)=sqrt((abs(x1-x2).^2) + (abs(y1-y2).^2));
    end
end
 
 mini=min(k(i,:));
 [x,y]=find(k==mini);
 upu=[up(i,1) up(i,2)];
            dlmwrite('corresup.txt',upu,'-append', ...
              'newline', 'pc');

 downu=[down(y,1) down(y,2)];
            dlmwrite('corresdown.txt',downu,'-append', ...
              'newline', 'pc');
 
 end
 
 
 m1=csvread('corresLEFT.txt');
% m1=m1(2,:);
 dist=[];
 
  [xm,ym]=size(m1);
 
 for ii=1:1:xm
 jj=1;
 j=1;
 for i=1:1:length(centroid)
    
     dist(jj,1)=2000;
     dist(jj,2)=2000;
         
     if(centroid(i,2)<m1(ii,1))
         dist(jj,1)=sqrt(((centroid(i,2)-m1(ii,1)).^2) + ((centroid(i,1)-m1(ii,2)).^2));
         dist(jj,2)=i;
     end
         jj=jj+1;
              
     
  
 end
     xdd=min(dist(:,1));
 
 [xd,yd]=find(dist==xdd);
 yy(ii,1)=dist(xd,2);
 
    for i=1:1:length(centroid)
        y5=centroid(yy(ii,1),1);
        x5=centroid(yy(ii,1),2);
        y6=centroid(i,1);
        x6=centroid(i,2);
        sq(j,1)=sqrt(((x6-x5).^2) +((y6-y5).^2));
        if(sq(j,1)<40 && sq(j,1)~=0)
            xl=[yy(ii,1) i];
            dlmwrite('centroidseqleft.txt',xl,'-append', ...
              'newline', 'pc');
            yy(ii,1)=i;
        end
        j=j+1;
    end
 end
 
 m1=csvread('corresup.txt');
  [xm,ym]=size(m1);
  
 for ii=1:1:xm
    kk=1;  
    jj=1;  
    for i=1:1:length(centroid)
      if(centroid(i,1)>m1(ii,2))
         distp(kk,1)=sqrt(((centroid(i,2)-m1(ii,1)).^2) + ((centroid(i,1)-m1(ii,2)).^2));
         distp(kk,2)=i;
         kk=kk+1;
      end
    end
     ydd=min(distp(:,1));
     [xpd,ypd]=find(distp==ydd);
     xx(ii,1)=distp(xpd,2);
     for i=1:1:length(centroid)
        y5=centroid(xx(ii,1),1);
        x5=centroid(xx(ii,1),2);
        y6=centroid(i,1);
        x6=centroid(i,2);
        sq(jj,1)=sqrt(((x6-x5).^2) +((y6-y5).^2));
        if(sq(jj,1)<40 && sq(jj,1)~=0)
            xu=[xx(ii,1) i];
            dlmwrite('centroidsequp.txt',xu,'-append', ...
              'newline', 'pc');
            xx(ii,1)=i;
        end
        jj=jj+1;
     end
 end
%  if(exist('nodepoint2.txt'))
%      m5=csvread('nodepoint2.txt');
%      dlmwrite('fornodemerge.txt',m5,'-append', ...
%               'newline', 'pc');
%  end
%  
%  if(exist('nodepoint3.txt'))
%      m5=csvread('nodepoint3.txt');
%       dlmwrite('fornodemerge.txt',m5,'-append', ...
%               'newline', 'pc');
%  end
%  if(exist('nodepoint4.txt'))
%      m5=csvread('nodepoint4.txt');
%       dlmwrite('fornodemerge.txt',m5,'-append', ...
%               'newline', 'pc');
%  end
%  
%m5=csvread('fornodemerge.txt'); 
aa=bwconncomp(i5);
statsaa=regionprops(aa,'PixelList');

if(exist('nodepoint2.txt')~=0)
    m5=csvread('nodepoint2.txt');
    [m5x,m5y]=size(m5);
    ii=1;
for i=1:1:length(statsaa)
    
    for j=1:1:length(statsaa(i).PixelList)
        x1=statsaa(i).PixelList(j,2);
        y1=statsaa(i).PixelList(j,1);
        for kk=1:1:m5x
        if((x1==m5(kk,1)) && (y1==m5(kk,2)))
            xcoun(ii,:)=[i x1 y1];
            ii=ii+1;
        end
        
        end
        end
         
         
         
    end
end
if(exist('nodepoint3.txt')~=0)
     m6=csvread('nodepoint3.txt');
             [m6x,m6y]=size(m6);
             jj=1;
for i=1:1:length(statsaa)
    
    for j=1:1:length(statsaa(i).PixelList)
        x1=statsaa(i).PixelList(j,2);
        y1=statsaa(i).PixelList(j,1);
        
            
             for kk=1:1:m6x
             if(x1==m6(kk,1) && y1==m6(kk,2))
                 ycoun(jj,:)=[i x1 y1];
                 jj=jj+1;
             end
             
             end
        end
    end
end

if(exist('nodepoint4.txt')~=0)
     m7=csvread('nodepoint4.txt');
             [m7x,m7y]=size(m7);
             ww=1;
for i=1:1:length(statsaa)
    
    for j=1:1:length(statsaa(i).PixelList)
        x1=statsaa(i).PixelList(j,2);
        y1=statsaa(i).PixelList(j,1);
        
            
             for kk=1:1:m7x
             if(x1==m7(kk,1) && y1==m7(kk,2))
                 zcoun(ww,:)=[i x1 y1];
                 ww=ww+1;
             end
             end
        end
end
     dlmwrite('mergednodes.txt',zcoun,'-append', ...
                          'newline', 'pc'); 
end
%Second Method of merging(1 node per object)
m8=csvread('mergednodes.txt');
[m8x,m8y]=size(m8);
kk=1;
disp(m8x);
for i=1:1:length(statsaa)
%     x8=statsaa(i).PixelList(k,2);
%     y8=statsaa(i).PixelList(k,1);
    for j=1:1:m8x
        if(i~=m8(j,1))
            znot(kk,1)=i;
            kk=kk+1;
        end
    end
end
if(exist('znot') && exist('nodepoint3.txt'))
    [znotx,znoty]=size(znot);
    kk=1;
    [ycounx,ycouny]=size(ycoun);
    for i=1:1:znotx
        nan=1;
        for j=1:1:ycounx
            if(ycoun(j,1)==znot(i,1) && nan==1)
                dlmwrite('mergednodes.txt',ycoun(j,:),'-append', ...
                            'newline', 'pc');
                        nan=nan+1;
            end
            
        end
    end
end
        
m81=csvread('mergednodes.txt');
[m81x,m81y]=size(m81);
kk=1;
m82=sort(m81);

for i=1:1:length(statsaa)
%     x8=statsaa(i).PixelList(k,2);
%     y8=statsaa(i).PixelList(k,1);
nan=1;
disp(i);
    for j=1:1:m81x
        if(i~=m82(j,1) && nan==1)
            ynot(kk,1)=i;
            kk=kk+1;
            nan=nan+1;
        end
    end
end
    


if(exist('ynot') && exist('nodepoint2.txt'))
    [ynotx,ynoty]=size(ynot);
    [xcounx,xcouny]=size(xcoun);
    kk=1;
    for i=1:1:ynotx
        nan=1;
        for j=1:1:xcounx
            if(xcoun(j,1)==ynot(i,1) && nan==1)
                dlmwrite('mergednodes.txt',xcoun(j,:),'-append', ...
                            'newline', 'pc');
                        nan=nan+1;
            end
            
        end
    end
end
    

       
%First method of node merging lines 1254-1469
%         if(exist('nodepoint2.txt')~=0 && exist('nodepoint3.txt')~=0 && exist('nodepoint4.txt')~=0)
%             [xcounx,xcouny]=size(xcoun);
%             [ycounx,ycouny]=size(ycoun);
%             [zcounx,zcouny]=size(zcoun);
%             nan=1;
%             
%             for a7=1:1:zcounx
%                 for b7=1:1:ycounx
%                     for c7=1:1:xcounx
%                         if((zcoun(a7,1)==ycoun(b7,1) || zcoun(a7,1)==xcoun(c7,1)) && nan==1)
%                             dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
%                             'newline', 'pc');
%                         nan=nan+1;
%                         end
%                          if(exist('mergednodes.txt') &&( zcoun(a7,1)==xcoun(c7,1) || zcoun(a7,1)==ycoun(b7,1)) && nan>1)
%                             
%                             mer=csvread('mergednodes.txt');
%                             [merx,mery]=size(mer);
%                             for e=1:1:merx
%                                 if(zcoun(a7,1)~=mer(e,1))
%                                     dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
%                                     'newline', 'pc');
%                                 end
%                             end
%                         end
%                         
% %                         if((zcoun(a7,1)==ycoun(b7,1) && zcoun(a7,1)~=xcoun(c7,1)))
% %                             dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
% %                             'newline', 'pc');
% %                             dlmwrite('mergednodes.txt',xcoun(c7,:),'-append', ...
% %                             'newline', 'pc');
% %                         end
% %                          if((zcoun(a7,1)~=ycoun(b7,1) && zcoun(a7,1)==xcoun(c7,1)))
% %                              dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
% %                             'newline', 'pc');
% %                              dlmwrite('mergednodes.txt',ycoun(b7,:),'-append', ...
% %                             'newline', 'pc');
% %                          end
%                     end
%                 end
%             end
%         end
%         
%         
%         if(exist('nodepoint2.txt')~=0 && exist('nodepoint3.txt')~=0 && exist('nodepoint4.txt')==0)
%             [xcounx,xcouny]=size(xcoun);
%             [ycounx,ycouny]=size(ycoun);
%             nan=1;
%             
%             for b7=1:1:ycounx
%                     for c7=1:1:xcounx
%                         if(ycoun(b7,1)==xcoun(c7,1) && nan==1)
%                             dlmwrite('mergednodes.txt',ycoun(b7,:),'-append', ...
%                             'newline', 'pc');
%                             nan=nan+1;
%                         end
%                         if(exist('mergednodes.txt') && ycoun(b7,1)==xcoun(c7,1) && nan>1)
%                             
%                             mer=csvread('mergednodes.txt');
%                             [merx,mery]=size(mer);
%                             for e=1:1:merx
%                                 if(ycoun(b7,1)~=mer(e,1))
%                                     dlmwrite('mergednodes.txt',ycoun(b7,:),'-append', ...
%                                     'newline', 'pc');
%                                 end
%                             end
%                         end
%                             
% %                         if(ycoun(b7,1)~=xcoun(c7,1))
% % %                             dlmwrite('mergednodes.txt',ycoun(b7,:),'-append', ...
% % %                             'newline', 'pc');
% %                             dlmwrite('mergednodes.txt',xcoun(c7,:),'-append', ...
% %                             'newline', 'pc');
% %                         end
%                     end
%             end
%         end
%         
%         
%         if(exist('nodepoint2.txt')~=0 && exist('nodepoint3.txt')==0 && exist('nodepoint4.txt')~=0)
%             [xcounx,xcouny]=size(xcoun);
%             
%             [zcounx,zcouny]=size(zcoun);
%             nan=1;
%             for a7=1:1:zcounx
%                     for c7=1:1:xcounx
%                         if(zcoun(a7,1)==xcoun(c7,1) && nan==1)
%                             dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
%                             'newline', 'pc');
%                         nan=nan+1;
%                         end
%                          if(exist('mergednodes.txt') && zcoun(a7,1)==xcoun(c7,1) && nan>1)
%                             
%                             mer=csvread('mergednodes.txt');
%                             [merx,mery]=size(mer);
%                             for e=1:1:merx
%                                 if(zcoun(a7,1)~=mer(e,1))
%                                     dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
%                                     'newline', 'pc');
%                                 end
%                             end
%                         end
%                         
% %                         if(zcoun(a7,1)~=xcoun(c7,1))
% %                             dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
% %                             'newline', 'pc');
% %                             dlmwrite('mergednodes.txt',xcoun(c7,:),'-append', ...
% %                             'newline', 'pc');
%                         end
%                     end
%             end
%        % end
%         
%         if(exist('nodepoint2.txt')==0 && exist('nodepoint3.txt')~=0 && exist('nodepoint4.txt')~=0)
%             
%             [ycounx,ycouny]=size(ycoun);
%             [zcounx,zcouny]=size(zcoun);
%             nan=1;
%             for a7=1:1:zcounx
%                     for b7=1:1:ycounx
%                         if(zcoun(a7,1)==ycoun(b7,1) && nan==1)
%                             dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
%                             'newline', 'pc');
%                         nan=nan+1;
%                         end
%                          if(exist('mergednodes.txt') && zcoun(a7,1)==ycoun(b7,1) && nan>1)
%                             
%                             mer=csvread('mergednodes.txt');
%                             [merx,mery]=size(mer);
%                             for e=1:1:merx
%                                 if(zcoun(a7,1)~=mer(e,1))
%                                     dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
%                                     'newline', 'pc');
%                                 end
%                             end
%                         end
% %                         if(zcoun(a7,1)~=ycoun(b7,1))
% %                             dlmwrite('mergednodes.txt',zcoun(a7,:),'-append', ...
% %                             'newline', 'pc');
% %                             dlmwrite('mergednodes.txt',xcoun(c7,:),'-append', ...
% %                             'newline', 'pc');
%                         end
%                     end
%             end
%        % end
%         
%         m8=csvread('mergednodes.txt');
%         lsta=length(statsaa);
%         krish=1;
%         [m8x,m8y]=size(m8);
%         for km=1:1:lsta
%             nan=1;
%         for kr=1:1:m8x
%                 if(km~=m8(kr,1))
%                     krish=krish+1;
%                 end
%                 if(krish>=m8x)
%                     if(exist('nodepoint4.txt'))
%                         for i=1:1:zcounx
%                             if(zcoun(i,1)==km && nan==1)
%                                 dlmwrite('mergednodes.txt',zcoun(i,:),'-append', ...
%                                 'newline', 'pc');
%                                nan=nan+1;
%                             end
%                         end
%                     end
%                 end
%         end
%         end
%         
%          m8=csvread('mergednodes.txt');
%         lsta=length(statsaa);
%         krish=1;
%         [m8x,m8y]=size(m8);
%          for km=1:1:lsta
%              nan=1;
%         for kr=1:1:m8x
%                 if(km~=m8(kr,1))
%                     krish=krish+1;
%                 end
%                 if(krish>=m8x)
%                     if(exist('nodepoint3.txt')~=0)
%                         for i=1:1:ycounx
%                             if(ycoun(i,1)==km && nan==1)
%                                 dlmwrite('mergednodes.txt',ycoun(i,:),'-append', ...
%                                 'newline', 'pc');
%                             nan=nan+1;
%                             end
%                         end
%                     end
%                 end
%         end
%          end
%           m8=csvread('mergednodes.txt');
%         lsta=length(statsaa);
%         krish=1;
%         [m8x,m8y]=size(m8);
%           for km=1:1:lsta
%             nan=1;
%             for kr=1:1:m8x
%                 if(km~=m8(kr,1))
%                     krish=krish+1;
%                 end
%                 if(krish>=m8x)
%                     if(exist('nodepoint2.txt'))
%                         for i=1:1:xcounx
%                             if(xcoun(i,1)==km && nan==1)
%                                 dlmwrite('mergednodes.txt',xcoun(i,:),'-append', ...
%                                 'newline', 'pc');
%                             nan=nan+1;
%                             end
%                         end
%                     end
%                 end
%         end
%           end