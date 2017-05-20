clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3096.jpg');
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
 %i5=zeros([m5 n5]);
 for i=2:1:m5-1
    for j=2:1:n5-3
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
    y1=stats(idx(i)).PixelList(1,1);
    x1=stats(idx(i)).PixelList(1,2);
    y2=stats(idx(i)).PixelList(b1,1);
    x2=stats(idx(i)).PixelList(b1,2);
    i5(x1,y1:y2)=1;
end

for j=2:1:n5-1
    for i=2:1:m5-3
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
%imshow(v1);
CC=bwconncomp(i2);
stats = regionprops(CC, 'area');
idx = find([stats.Area] < 100);
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


imtool(i7);
 

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
    y1=stats(idx(i)).PixelList(1,1);
    x1=stats(idx(i)).PixelList(1,2);
    y2=stats(idx(i)).PixelList(b1,1);
    x2=stats(idx(i)).PixelList(b1,2);
    i5(x1:x2,y1)=1;
end
%figure,imshow(i5);
%i45=imcrop(i5);
i5=bwmorph(i5,'clean');
imtool(i5);
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
i45=imcrop(i45);
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
imtool(i5);
% xkr=double(xkr);
% cob=bwconncomp(i5);
% statsob=regionprops(cob,'PixelList');

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


        
        
        
        
        %         row=statsob(i).PixelList(j,2);
%         col=statsob(i).PixelList(j,1);
%        ckr=(i5(row-1,col-1)*xkr(1,1))+(i5(row-1,col)*xkr(1,2))+(i5(row-1,col+1)*xkr(1,3))+(i5(row,col-1)*xkr(2,1))+(i5(row,col+1)*xkr(2,3))+(i5(row+1,col-1)*xkr(3,1))+(i5(row+1,col)*xkr(3,2))+(i5(row+1,col+1)*xkr(3,3));
 
%         if(ckr==1)
%             pip1=[row col];
%             dlmwrite('pip1.txt',pip1,'-append', ...
%              'newline', 'pc');
%         end
%         if(ckr==2)
%             pip2=[row col];
%             dlmwrite('pip2.txt',pip2,'-append', ...
%                 'newline','pc');
%         end
%         if(ckr>2)
%             pip3=[row col];
%             dlmwrite('pip3.txt',pip3,'-append', ...
%                 'newline','pc');
%         end
%         
        %if((i5(row-1,col)==0 && i5(row+1,col)==1 && i5(row,col+1)==0 && i5(row,col-1)==0 || (i5(row+1,col)==0 && i5(row-1,col)==1 && i5(row,col+1
                
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

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
       
% I=i5;
% imshow(I);
% k = waitforbuttonpress;
% point1 = get(gca,'CurrentPoint');  %button down detected
% rectregion = rbbox;  %%%return figure units
% point2 = get(gca,'CurrentPoint');%%%%button up detected
% point1 = point1(1,1:2); %%% extract col/row min and maxs
% point2 = point2(1,1:2);
% 
% 
% lowerleft = min(point1, point2);
% upperright = max(point1, point2); 
% ymin = round(lowerleft(1)); %%% arrondissement aux nombrs les plus proches
% ymax = round(upperright(1));
% xmin = round(lowerleft(2));
% xmax = round(upperright(2));
% %***********************************
% Aj=1;
% cmin=xmin-Aj; cmax=xmax+Aj; rmin=ymin-Aj; rmax=ymax+Aj;
% min_N=12;max_N=16;
% %%%%%%%%%%%%%%Intrest Points %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sigma=2; Thrshold=20; r=6; disp=1;
% dx = [-1 0 1; -1 0 1; -1 0 1]; % The Mask 
%     dy = dx';
%     %%%%%% 
%     Ix = conv2(double(I(cmin:cmax,rmin:rmax)), dx, 'same');   
%     Iy = conv2(double(I(cmin:cmax,rmin:rmax)), dy, 'same');
%     g = fspecial('gaussian',max(1,fix(6*sigma)), sigma); %%%%%% Gaussien Filter
%     
%     %%%%% 
%     Ix2 = conv2(Ix.^2, g, 'same');  
%     Iy2 = conv2(Iy.^2, g, 'same');
%     Ixy = conv2(Ix.*Iy, g,'same');
%     %%%%%%%%%%%%%%
%     k = 0.04;
%     R11 = (Ix2.*Iy2 - Ixy.^2) - k*(Ix2 + Iy2).^2;
%     R11=(1000/max(max(R11)))*R11;
%     R=R11;
%     ma=max(max(R));
%     sze = 2*r+1; 
%     MX = ordfilt2(R,sze^2,ones(sze));
%     R11 = (R==MX)&(R>Thrshold); 
%     count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5)));
%     
%     
%     loop=0;
%     while (((count<min_N)|(count>max_N))&(loop<30))
%         if count>max_N
%             Thrshold=Thrshold*1.5;
%         elseif count < min_N
%             Thrshold=Thrshold*0.5;
%         end
%         
%         R11 = (R==MX)&(R>Thrshold); 
%         count=sum(sum(R11(5:size(R11,1)-5,5:size(R11,2)-5)));
%         loop=loop+1;
%     end
%     
%     
% 	R=R*0;
%     R(5:size(R11,1)-5,5:size(R11,2)-5)=R11(5:size(R11,1)-5,5:size(R11,2)-5);
% 	[r1,c1] = find(R);
%     PIP=[r1+cmin,c1+rmin]%% IP 
%    %%%%%%%%%%%%%%%%%%%% Display
%    
%    Size_PI=size(PIP,1);
% %    m=[];
% %    n=[];
% %    m=PIP(:,1);
% %    n=PIP(:,2);
% %    [mpip,npip]=size(I);
%     
% %    xconvkr=im2bw(xconvkr);
% %    I=double(I);
% %    
%    
% %    for r=1:1:size(PIP)
% %       %if((PIP(r,1)~=0) && PIP(r,2)~=0)
% %    I(PIP(r,1)-2:PIP(r,1)+2,PIP(r,2)-2)=1;
% %    I(PIP(r,1)-2:PIP(r,1)+2,PIP(r,2)+2)=1;
% %    I(PIP(r,1)-2,PIP(r,2)-2:PIP(r,2)+2)=1;
% %    I(PIP(r,1)+2,PIP(r,2)-2:PIP(r,2)+2)=1;
% %      %end
% %    end               
%     k=1;
%    imshow(I)
%    for ii=1:1:length(PIP)
%     %if((PIP(ii,1)~=0)   && (PIP(ii,2)~=0))
%     lbl = strtrim(cellstr(num2str(ii)'));   
%     text(PIP(ii,2),PIP(ii,1),lbl(:),'color','red','FontSize',18);
%     %k=k+1;
%    end

 i8=i7+i5;
 CC=bwconncomp(i7);
 stats=regionprops(CC,'BoundingBox');
 for i=1:1:length(stats)
 centroid(i,:)=[stats(i).BoundingBox(1,1)+(stats(i).BoundingBox(1,3))/2 stats(i).BoundingBox(1,2)+(stats(i).BoundingBox(1,4))/2];
 %xyz=[centroid(i,:) stats(i).BoundingBox(1,:)];
 xyz=[centroid(i,:) i];
 dlmwrite('centroidboundingbox.txt',xyz,'-append', ...
             'newline', 'pc');
 
 end