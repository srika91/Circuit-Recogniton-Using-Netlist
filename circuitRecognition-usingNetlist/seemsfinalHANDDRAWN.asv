clc;
clear all;
close all;
i1=imread('C:\Users\kalki\Pictures\IMG_3131.jpg');
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
idx = find([stats.Area] < 200 );
stats = regionprops(CC, 'PixelList');
bb=length(idx);
[r,c]=size(i2);
i34=i2;

%i7=zeros(512,512);
% for i=1:1:bb
%     
%     b1=length(stats(idx(i)).PixelList);
%     
%     for j=1:1:b1
%    
%         y1=stats(idx(i)).PixelList(j,1);
%     x1=stats(idx(i)).PixelList(j,2);
%     i34(x1,y1)=0;
%  end
% 
% end
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
 
%  [r,c]=size(v1);
% for i=2:1:r-1
% a=0;
%     for j=2:1:c-1
% 
% if(v1(i,j)==1)
% a=a+1;
% end
% end
% if(a<=2)
% for j=2:1:c-1
%     v1(i,j)=0;    
% end
% end
% end
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
%idx = find([stats.Area] > 2);
stats = regionprops(CC, 'PixelList');
b=length(stats);
[r,c]=size(a5);
i5=zeros(512,512);
i5=bwmorph(i5,'fill');
for i=1:1:b
    b1=length(stats(i).PixelList);
    q=sort(stats(i).PixelList);
    
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
% 
%  [r,c]=size(i5);
% for i=2:1:r-1
% a=0;
%     for j=2:1:c-1
% 
% if(i5(i,j)==1)
% a=a+1;
% end
% end
% if(a<=2)
% for j=2:1:c-1
%     i5(i,j)=0;    
% end
% end
% end

CC = bwconncomp(i5,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats = regionprops(CC, 'area');
idx = find([stats.Area] > 10);
stats = regionprops(CC, 'PixelList');
b=length(idx);
%[r,c]=size(i5);
p5=zeros(512,512);
for i=1:1:b
    b1=length(stats(idx(i)).PixelList);
    %q=sort(stats(idx(i)).PixelList);

    for k=1:1:b1
        
     y1=stats(idx(i)).PixelList(k,1);
     x1=stats(idx(i)).PixelList(k,2);
     %y2=stats(idx(i)).PixelList(1,2);
     %x2=q(b1,2);
%     
%     %DD=sqrt(((x1-x2).^2) +((y1-y2).^2));
   %if(DD>=4)
    %i5(x1,y1:y2)=1;
   %else
     %   y2=stats(idx(i)).PixelList(b1-DD,1);
   % x2=stats(idx(i)).PixelList(b1-DD,2);
       p5(x1,y1)=1;
   end
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
%  
%  [r,c]=size(v1);
% for j=2:1:c-1
% a=0;
%     for i=2:1:r-1
% 
% if(v1(i,j)==1)
% a=a+1;
% end
% end
% if(a<=5)
% for i=2:1:r-1
%     v1(i,j)=0;    
% end
% end
% end
% %imshow(v1);
% i2=bwmorph(i2,'clean');
% CC=bwconncomp(i2);
% stats = regionprops(CC, 'area');
% idx = find([stats.Area] < 100 );
% stats = regionprops(CC, 'PixelList');
% bb=length(idx);
% [r,c]=size(i2);
% 
% i7=zeros(512,512);
% for i=1:1:bb
%     
%     b1=length(stats(idx(i)).PixelList);
%     
%     for j=1:1:b1
%    
%         y1=stats(idx(i)).PixelList(j,1);
%     x1=stats(idx(i)).PixelList(j,2);
%     i7(x1,y1)=1;
%  end
% 
% end
% 
% i7=bwmorph(i7,'clean');
% %imtool(i7);
%  
% 
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
%idx = find([stats.Area] > 20);

stats = regionprops(CC, 'PixelList');

b=length(stats);

for i=1:1:b
    b1=size(stats(i).PixelList,1);
    %b1=length(stats(i).PixelList);
    q=sort(stats(i).PixelList);
    
    y1=q(1,1);
    x1=q(1,2);
    y2=q(b1,1);
    x2=q(b1,2);
    
    i50(x1:x2,y1)=1;
end

CC1 = bwconncomp(i50,8);
L1 = labelmatrix(CC1);
RGB1 = label2rgb(L1);
stats1 = regionprops(CC1, 'area');
idx1 = find([stats1.Area] > 30);
stats1 = regionprops(CC1, 'PixelList');
b1=length(idx1);
%[r,c]=size(i5);
p55=zeros(512,512);
for i=1:1:b1
    b11=size(stats1(idx1(i)).PixelList,1);
    %q=sort(stats(idx(i)).PixelList);

    for k=1:1:b11
        
     y1=stats1(idx1(i)).PixelList(k,1);
     x1=stats1(idx1(i)).PixelList(k,2);
     %y2=stats(idx(i)).PixelList(1,2);
     %x2=q(b1,2);
%     
%     %DD=sqrt(((x1-x2).^2) +((y1-y2).^2));
   %if(DD>=4)
    %i5(x1,y1:y2)=1;
   %else
     %   y2=stats(idx(i)).PixelList(b1-DD,1);
   % x2=stats(idx(i)).PixelList(b1-DD,2);
       p55(x1,y1)=1;
   end
end
i51=p55+p5;

% 
% 
% i5=bwmorph(i5,'clean'); % VV important
% xkr=[1 1 1;1 0 1;1 1 1];
% i45=i5;
% cob=bwconncomp(i45,8);
% statsob=regionprops(cob,'PixelList');
% 
% [i5xs,i5ys]=size(i45);
% %xkr=double(xkr);
% %i45=im2double(i45);
% 
% 
% for i=1:1:length(statsob)-1
%     jsiz=length(statsob(i).PixelList);
%     for jj=i+1:1:length(statsob)
%     ksiz=length(statsob(jj).PixelList);
%     for j=1:1:jsiz
%         x1=statsob(i).PixelList(j,2);
%         y1=statsob(i).PixelList(j,1);
%         %if((x1<i5xs) && (y1<i5ys))
%         ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
%            
%         if(ckr1==1)
%           % [x1,y1]
%            for k=1:1:ksiz
%             
%             x2=statsob(jj).PixelList(k,2);    
%             y2=statsob(jj).PixelList(k,1);
%            %if((x2<i5xs) && (y2<i5ys))
%             %[x2,y2]
%             if(x1==x2)
%                 
%                 %[x2,y2]
%                 if(abs(y1-y2)<10)
%                     if(y1<y2)
%                     i45(x1,y1:y2)=1;
%                     end
%                     if(y1>y2)
%                         i45(x1,y2:y1)=1;
%                     end
%                 end
%             end
%             if(y1==y2)
%                 %[x2,y2]
%                 if(abs(x1-x2)<10)
%                     if(x1<x2)
%                     i45(x1:x2,y1)=1;
%                     end
%                     if(x1>x2)
%                         i45(x2:x1,y1)=1;
%                     end
%                 end
%             end 
%             ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
%             if(ckr2==1)
%                  
%                 if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
%                     
%                     if(x1<x2 && y1<y2)
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y1:y2)=1;
%                             
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x1:x2,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1<x2 && y1>y2)
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x1:x2,y2)=1;
%                         end
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                     end
%                     if(x1>x2 && y1<y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2,y1:y2)=1;
%                             i45(x2:x1,y1)=1;
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x2:x1,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1>x2 && y1>y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2:x1,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x2:x1,y2)=1;
%                         end
%                     end
%                    
%             
%             
%             end
%              
%            end
%                       
%         end
%         end
%     end
%     end
% end
% 
% 
% for i=length(statsob):-1:2
%     jsiz=length(statsob(i).PixelList);
%     for jj=i-1:-1:1
%     ksiz=length(statsob(jj).PixelList);
%     for j=1:1:jsiz
%         x1=statsob(i).PixelList(j,2);
%         y1=statsob(i).PixelList(j,1);
%         %if((x1<i5xs) && (y1<i5ys))
%         ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
%            
%         if(ckr1==1)
%           % [x1,y1]
%            for k=1:1:ksiz
%             
%             x2=statsob(jj).PixelList(k,2);    
%             y2=statsob(jj).PixelList(k,1);
%            %if((x2<i5xs) && (y2<i5ys))
%             %[x2,y2]
%             if(x1==x2)
%                 
%                 %[x2,y2]
%                 if(abs(y1-y2)<10)
%                     if(y1<y2)
%                     i45(x1,y1:y2)=1;
%                     end
%                     if(y1>y2)
%                         i45(x1,y2:y1)=1;
%                     end
%                 end
%             end
%             if(y1==y2)
%                 %[x2,y2]
%                 if(abs(x1-x2)<10)
%                     if(x1<x2)
%                     i45(x1:x2,y1)=1;
%                     end
%                     if(x1>x2)
%                         i45(x2:x1,y1)=1;
%                     end
%                 end
%             end 
%             ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
%             if(ckr2==1)
%                  
%                 if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
%                     
%                     if(x1<x2 && y1<y2)
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y1:y2)=1;
%                             
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x1:x2,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1<x2 && y1>y2)
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x1:x2,y2)=1;
%                         end
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                     end
%                     if(x1>x2 && y1<y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2,y1:y2)=1;
%                             i45(x2:x1,y1)=1;
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x2:x1,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1>x2 && y1>y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2:x1,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x2:x1,y2)=1;
%                         end
%                     end
%                    
%           
%             end
%              
%            end
%                       
%         end
%         end
%     end
%     end
% end
% 
% cob=bwconncomp(i45,8);
% statsob=regionprops(cob,'PixelList');
% for i=1:1:length(statsob)
%     if(length(statsob(i).PixelList)<40)
%         
%     for j=1:1:length(statsob(i).PixelList)
%         x11=statsob(i).PixelList(j,2);
%         y11=statsob(i).PixelList(j,1);
%         i45(x11,y11)=0;
%     end
%     end
% end
% i45=bwmorph(i45,'spur');
% %i45=imcrop(i45);
% i45=bwmorph(i45,'clean');
% cob=bwconncomp(i45,8);
% vv=labelmatrix(cob);
% vv1=label2rgb(vv);
% statsob=regionprops(cob,'PixelList');
% 
%        
% for i=1:1:length(statsob)
%     siz1=length(statsob(i).PixelList);
%         for ii=1:1:siz1
%              
%             x4=statsob(i).PixelList(ii,2);
%             y4=statsob(i).PixelList(ii,1);
%             
%             if(i45(x4,y4-1)==1 && i45(x4-1,y4)==1)
%                 j=1;
%                 while(i45(x4-j,y4)~=0 && j<16)
%                     
%                     j=j+1;
%                     kk=1;
%                     while(i45(x4-j,y4+kk)~=0)
%                         i45(x4,y4+kk)=1;
%                         i45(x4-j,y4+kk)=0;
%                         kk=kk+1;
%                     end
%                     
%                 end
%                 if(i45(x4-j-1,y4)==0)
%                 i45(x4-j:x4-1,y4)=0;
%                 end
%             end
%                 if(i45(x4,y4-1)==1 && i45(x4-1,y4)==1)
%                     j=1;
%                     while(i45(x4,y4-j)~=0 && j<16)
%                     
%                     j=j+1;
%                     kk=1;
%                     while(i45(x4+kk,y4-j)~=0)
%                         i45(x4+kk,y4)=1;
%                         i45(x4+kk,y4-j)=0;
%                         kk=kk+1;
%                     end
%                    
%                     end
%                     if(i45(x4,y4-j-1)==0)
%                  i45(x4,y4-j:y4-1)=0;
%                     end
%             end
%          if(i45(x4+1,y4)==1 && i45(x4,y4-1)==1)
%                 j=1;
%                while(i45(x4+j,y4)~=0 && j<16)
%                     
%                    j=j+1;
%                     kk=1;
%                     while(i45(x4+j,y4+kk)~=0)
%                         i45(x4,y4+kk)=1;
%                         i45(x4+j,y4+kk)=0;
%                         kk=kk+1;
%                     end
%                     
%                end
%                if(i45(x4+j+1,y4)==0)
%                i45(x4+1:x4+j,y4)=0;
%                end
%             end
%              if(i45(x4-1,y4)==1 && i45(x4,y4+1)==1)
%                 j=1;    
%                while(i45(x4,y4+j)~=0 && j<16)
%                    
%                    j=j+1;
%                     kk=1;
%                     while(i45(x4+kk,y4+j)~=0)
%                         i45(x4+kk,y4)=1;
%                         i45(x4+kk,y4+j)=0;
%                         kk=kk+1;
%                         
%                     end
%                     
%                end
%                if(i45(x4,y4+j+1)==0)
%             i45(x4,y4+1:y4+j)=0;
%                end
%            end
%  
%         end
% end
% 
% cob=bwconncomp(i45,8);
% statsob=regionprops(cob,'PixelList');
% 
% [i5xs,i5ys]=size(i45);
% %xkr=double(xkr);
% %i45=im2double(i45);
% 
% 
% for i=1:1:length(statsob)-1
%     jsiz=length(statsob(i).PixelList);
%     for jj=length(statsob):-1:1
%     ksiz=length(statsob(jj).PixelList);
%     for j=1:1:jsiz
%         x1=statsob(i).PixelList(j,2);
%         y1=statsob(i).PixelList(j,1);
%         %if((x1<i5xs) && (y1<i5ys))
%         ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
%            
%         if(ckr1==1)
%           % [x1,y1]
%            for k=1:1:ksiz
%             
%             x2=statsob(jj).PixelList(k,2);    
%             y2=statsob(jj).PixelList(k,1);
%            %if((x2<i5xs) && (y2<i5ys))
%             %[x2,y2]
%             if(x1==x2)
%                 
%                 %[x2,y2]
%                 if(abs(y1-y2)<16)
%                     if(y1<y2)
%                     i45(x1,y1:y2)=1;
%                     end
%                     if(y1>y2)
%                         i45(x1,y2:y1)=1;
%                     end
%                 end
%             end
%             if(y1==y2)
%                 %[x2,y2]
%                 if(abs(x1-x2)<16)
%                     if(x1<x2)
%                     i45(x1:x2,y1)=1;
%                     end
%                     if(x1>x2)
%                         i45(x2:x1,y1)=1;
%                     end
%                 end
%             end 
%             ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
%             if(ckr2==1)
%                  
%                 if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
%                     
%                     if(x1<x2 && y1<y2)
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y1:y2)=1;
%                             
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x1:x2,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1<x2 && y1>y2)
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x1:x2,y2)=1;
%                         end
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                     end
%                     if(x1>x2 && y1<y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2,y1:y2)=1;
%                             i45(x2:x1,y1)=1;
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x2:x1,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1>x2 && y1>y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2:x1,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x2:x1,y2)=1;
%                         end
%                     end
%                 end
%             end   
%         end
%         end
%     end
%     end
% end
% for i=length(statsob):-1:2
%     jsiz=length(statsob(i).PixelList);
%     for jj=1:1:length(statsob)
%     ksiz=length(statsob(jj).PixelList);
%     for j=1:1:jsiz
%         x1=statsob(i).PixelList(j,2);
%         y1=statsob(i).PixelList(j,1);
%         %if((x1<i5xs) && (y1<i5ys))
%         ckr1=((xkr(1,1)*i45(x1-1,y1-1))+(xkr(1,2)*i45(x1,y1-1))+(xkr(1,3)*i45(x1+1,y1-1))+(xkr(2,1)*i45(x1-1,y1))+(xkr(2,2)*i45(x1,y1))+(xkr(2,3)*i45(x1+1,y1))+(xkr(3,1)*i45(x1-1,y1+1))+(xkr(3,2)*i45(x1,y1+1))+(xkr(3,3)*i45(x1+1,y1+1)));
%            
%         if(ckr1==1)
%           % [x1,y1]
%            for k=1:1:ksiz
%             
%             x2=statsob(jj).PixelList(k,2);    
%             y2=statsob(jj).PixelList(k,1);
%            %if((x2<i5xs) && (y2<i5ys))
%             %[x2,y2]
%             if(x1==x2)
%                 
%                 %[x2,y2]
%                 if(abs(y1-y2)<10)
%                     if(y1<y2)
%                     i45(x1,y1:y2)=1;
%                     end
%                     if(y1>y2)
%                         i45(x1,y2:y1)=1;
%                     end
%                 end
%             end
%             if(y1==y2)
%                 %[x2,y2]
%                 if(abs(x1-x2)<10)
%                     if(x1<x2)
%                     i45(x1:x2,y1)=1;
%                     end
%                     if(x1>x2)
%                         i45(x2:x1,y1)=1;
%                     end
%                 end
%             end 
%             ckr2=(xkr(1,1)*i45(x2-1,y2-1))+(xkr(1,2)*i45(x2,y2-1))+(xkr(1,3)*i45(x2+1,y2-1))+(xkr(2,1)*i45(x2-1,y2))+(xkr(2,3)*i45(x2+1,y2))+(xkr(3,1)*i45(x2-1,y2+1))+(xkr(3,2)*i45(x2,y2+1))+(xkr(3,3)*i45(x2+1,y2+1));
%             if(ckr2==1)
%                  
%                 if(((abs(x1-x2) < 20) && (abs(y1-y2))<20))
%                     
%                     if(x1<x2 && y1<y2)
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y1:y2)=1;
%                             
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x1:x2,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1<x2 && y1>y2)
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x1:x2,y2)=1;
%                         end
%                         if(i45(x1-1,y1)==1 && i45(x1+1,y1)==0)
%                             i45(x1:x2,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                     end
%                     if(x1>x2 && y1<y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2,y1:y2)=1;
%                             i45(x2:x1,y1)=1;
%                         end
%                         if(i45(x1,y1-1)==1 && i45(x1,y1+1)==0)
%                             i45(x2:x1,y2)=1;
%                             i45(x1,y1:y2)=1;
%                         end
%                     end
%                     if(x1>x2 && y1>y2)
%                         if(i45(x1-1,y1)==0 && i45(x1+1,y1)==1)
%                             i45(x2:x1,y1)=1;
%                             i45(x2,y2:y1)=1;
%                         end
%                         if(i45(x1,y1-1)==0 && i45(x1,y1+1)==1)
%                             i45(x1,y2:y1)=1;
%                             i45(x2:x1,y2)=1;
%                         end
%                     end
%                    
%           
%             end
%              
%            end
%                       
%         end
%         end
%     end
%     end
% end
% i46=i5;
% 
% i5=i45;
% 
% xkr=[1 1 1;1 0 1;1 1 1];
% %imtool(i5);
% % xkr=double(xkr);
% % cob=bwconncomp(i5);   
% % statsob=regionprops(cob,'PixelList');
% i65=i5;
% for i=2:1:511
%     for j=2:1:511
%         
%         if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i+1,j)==1 && i5(i,j+1)==1))
%             kr=1;    
%             while(i5(i+kr,j)~=0 && kr<8)
%                 %xkrw=kr;
%                 
%                   if(i5(i+kr+1,j)==0)
%              i5(i+1:i+kr,j)=0;
%                   end
%              kr=kr+1;      
%             end
%         end
%            if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
%             kr=1;    
%          
%             while(i5(i-kr,j)~=0 && kr<8)
%                % xkrw=kr;
%                  
%                  if(i5(i-kr-1,j)==0)
%             i5(i-kr:i-1,j)=0;
%                  end
%             kr=kr+1;     
%             end
%            end
%            if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
%             kr=1;    
%         
%             while(i5(i,j+kr)~=0 && kr<8)
%                 if(i5(i,j+kr+1)==0)
%                     i5(i,j+1:j+kr)=0;
%                 end
%                 kr=kr+1;
%             end
%            end
%            if(i5(i,j)==1 && (i5(i,j-1)==1 && i5(i+1,j)==1 && i5(i,j+1)==1) || (i5(i-1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1) || (i5(i,j-1)==1 && i5(i-1,j)==1 && i5(i,j+1)==1) || (i5(i+1,j)==1 && i5(i,j-1)==1 && i5(i,j+1)==1))
%             kr=1;
%             while(i5(i,j-kr)~=0 && kr<8)
%             if(i5(i,j-kr-1)==0)
%              i5(i,j-kr:j-1)=0;
%             end
%             kr=kr+1;
%             end
%          end    
%    
%     end
% end
%  
%                 
% 
% imtool(i5);
% 
% for i=2:1:511
%     
%     for j=2:1:511
%         if(i5(i,j)==1)
%             if(i5(i,j-1)==1 && i5(i,j+1)==0 && i5(i-1,j-1)==0  && i5(i-1,j)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j)==0 && i5(i+1,j+1)==0)
%             leftnode=[i j];
%             dlmwrite('leftnode.txt',leftnode,'-append', ...
%              'newline', 'pc');
%             end
%             if(i5(i,j+1)==1 && i5(i,j-1)==0 && i5(i-1,j-1)==0  && i5(i-1,j)==0 && i5(i-1,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j)==0 && i5(i+1,j+1)==0)
%             rightnode=[i j];
%             dlmwrite('rightnode.txt',rightnode,'-append', ...
%              'newline', 'pc');
%             end
%             
%         end
% end
% end
% 
% for j=2:1:511
%     for i=2:1:511
%         if(i5(i,j)==1)
%             if(i5(i-1,j)==1 && i5(i+1,j)==0 && i5(i-1,j-1)==0  && i5(i-1,j+1)==0 && i5(i,j-1)==0 && i5(i,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
%             upnode=[i j];
%             dlmwrite('upnode.txt',upnode,'-append', ...
%              'newline', 'pc');
%             end
%             if(i5(i-1,j)==0 && i5(i+1,j)==1 && i5(i-1,j-1)==0  && i5(i-1,j+1)==0 && i5(i,j-1)==0 && i5(i,j+1)==0 && i5(i+1,j-1)==0 && i5(i+1,j+1)==0)
%             downnode=[i j];
%             dlmwrite('downnode.txt',downnode,'-append', ...
%              'newline', 'pc');
%             end
%             
%         end        
%     end
% end
% 
% left=csvread('leftnode.txt');
% 
% right=csvread('rightnode.txt');
% [r c]=size(left);
% if(r>1)
%  for i=1:1:length(left)
%      x1=left(i,1);
%      y1=left(i,2);
%  for j=1:1:length(left)    
%      x2=right(j,1);
%      y2=right(j,2);
%      k(i,j)=2000;
% %if(i1(x2,y1:y2)~=0 || i1(x1,y1:y2)~=0)
%     if(y1<y2)
% k(i,j)=sqrt((abs(x1-x2).^2) + (abs(y1-y2).^2));
%     end
% end
%  
%  mini=min(k(i,:));
%  [x,y]=find(k==mini);
%  leftu=[left(i,1) left(i,2)];
%             dlmwrite('corresLEFT.txt',leftu,'-append', ...
%               'newline', 'pc');
% 
%  rightu=[right(y,1) right(y,2)];
%             dlmwrite('corresRIGHT.txt',rightu,'-append', ...
%               'newline', 'pc');
%  
%  end
% end
% 
%  
%  up=csvread('upnode.txt');
% 
% down=csvread('downnode.txt');
% [r1 c1]=size(up);
% if(r1>1)
%  for i=1:1:length(up)
%      x1=up(i,1);
%      y1=up(i,2);
%  for j=1:1:length(up)    
%      x2=down(j,1);
%      y2=down(j,2);
%      k(i,j)=2000;
% %if(i1(x2,y1:y2)~=0 || i1(x1,y1:y2)~=0)
%     if(x1<x2)
% k(i,j)=sqrt((abs(x1-x2).^2) + (abs(y1-y2).^2));
%     end
% end
%  
%  mini=min(k(i,:));
%  [x,y]=find(k==mini);
%  upu=[up(i,1) up(i,2)];
%             dlmwrite('corresup.txt',upu,'-append', ...
%               'newline', 'pc');
% 
%  downu=[down(y,1) down(y,2)];
%             dlmwrite('corresdown.txt',downu,'-append', ...
%               'newline', 'pc');
%  
%  end
%  
% end
% 
% if(r>1)
% left1=csvread('corresLEFT.txt');
% 
% %right=csvread('rightnode.txt');
% 
% aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
% for i=1:1:length(left)
%     x1=left1(i,1);
%     y1=left1(i,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergedleftnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% end
% right1=csvread('corresRIGHT.txt');
% 
% 
% %right=csvread('rightnode.txt');
% 
% aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
% for i=1:1:length(right1)
%     x1=right1(i,1);
%     y1=right1(i,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergedrightnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% end
% end
% 
% if(r1>1)
% up1=csvread('corresup.txt');
% 
% 
% %right=csvread('rightnode.txt');
% 
% aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
% for i=1:1:length(up1)
%     x1=up1(i,1);
%     y1=up1(i,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergedupnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% end
% 
% down1=csvread('corresdown.txt');
% 
% 
% %right=csvread('rightnode.txt');
% 
% aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
% for i=1:1:length(down1)
%     x1=down1(i,1);
%     y1=down1(i,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergeddownnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% end
% end
% 
% 
% if(r1==1)
%     down=csvread('downnode.txt');
%     aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
%  x1=down(1,1);
%     y1=down(1,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergeddownnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% %end
% up=csvread('upnode.txt');
% %if(length(up)==1)
%     aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
%  x1=up(1,1);
%     y1=up(1,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergedupnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% end
% 
% left=csvread('leftnode.txt');
% [r c]=size(left);
% if(r==1)
%     
%     aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
%  x1=left(1,1);
%     y1=left(1,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergedleftnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% %end
% right=csvread('rightnode.txt');
% %if(length(right)==1)
%     aa=bwconncomp(i5);
% L = labelmatrix(aa);
% RGB = label2rgb(L);
% statsqq=regionprops(aa,'PixelList');
%  x1=right(1,1);
%     y1=right(1,2);
%     
%     for j=1:1:length(statsqq)
%         
%         for k=1:1:length(statsqq(j).PixelList)
%         
%             x2=statsqq(j).PixelList(k,2);
%             y2=statsqq(j).PixelList(k,1);
%           
%             if((x2==x1) && (y2==y1))
%                 disp(y2);
%                 dlmwrite('mergedrightnode.txt',j,'-append', ...
%               'newline', 'pc');  
%             end
%         end
%     end
% end
% 
% [r c]=size(csvread('leftnode.txt'));
% 
% CC=bwconncomp(i7);
%  stats=regionprops(CC,'BoundingBox');
%  for i=1:1:length(stats)
%  centroid(i,:)=[stats(i).BoundingBox(1,1)+(stats(i).BoundingBox(1,3))/2 stats(i).BoundingBox(1,2)+(stats(i).BoundingBox(1,4))/2];
%  %xyz=[centroid(i,:) stats(i).BoundingBox(1,:)];
%  centroidindex(i,:)=[centroid(i,:) i];
%  end
% 
% if(r==1)
%  m1=csvread('leftnode.txt');
% % m1=m1(2,:);
%  else
%      m1=csvread('corresLEFT.txt');
% end
% 
%      dist=[];
%  
%   [xm,ym]=size(m1);
%  
%  for ii=1:1:xm
%  jj=1;
%  j=1;
%  for i=1:1:length(centroid)
%     
%      
%          
%      if(centroid(i,2)<m1(ii,1))
%          dist(jj,1)=sqrt(((centroid(i,2)-m1(ii,1)).^2) + ((centroid(i,1)-m1(ii,2)).^2));
%          dist(jj,2)=i;
%          jj=jj+1;
%               
%      end
%   
%  end
%      xdd=min(dist(:,1));
%  
%  [xd,yd]=find(dist==xdd);
%  yy(ii,1)=dist(xd,2);
%  
%     for i=1:1:length(centroid)
%         y5=centroid(yy(ii,1),1);
%         x5=centroid(yy(ii,1),2);
%         y6=centroid(i,1);
%         x6=centroid(i,2);
%         sq(j,1)=sqrt(((x6-x5).^2) +((y6-y5).^2));
%         if(sq(j,1)<40 && sq(j,1)~=0)
%             xl=[yy(ii,1) i];
%             dlmwrite('centroidseqleft.txt',xl,'-append', ...
%               'newline', 'pc');
%             yy(ii,1)=i;
%         end
%         j=j+1;
%     end
%  end
%  [r1 c1]=size(csvread('upnode.txt'));
%  if(r1==1)
%  m1=csvread('upnode.txt');
% % m1=m1(2,:);
%  else
%      m1=csvread('corresup.txt');
%  end
%  
%   [xm,ym]=size(m1);
%   
%  for ii=1:1:xm
%     kk=1;  
%     jj=1;  
%     for i=1:1:length(centroid)
%       if(centroid(i,1)>m1(ii,2))
%          distp(kk,1)=sqrt(((centroid(i,2)-m1(ii,1)).^2) + ((centroid(i,1)-m1(ii,2)).^2));
%          distp(kk,2)=i;
%          kk=kk+1;
%       end
%     end
%      ydd=min(distp(:,1));
%      [xpd,ypd]=find(distp==ydd);
%      xx(ii,1)=distp(xpd,2);
%      for i=1:1:length(centroid)
%         y5=centroid(xx(ii,1),1);
%         x5=centroid(xx(ii,1),2);
%         y6=centroid(i,1);
%         x6=centroid(i,2);
%         sq(jj,1)=sqrt(((x6-x5).^2) +((y6-y5).^2));
%         if(sq(jj,1)<40 && sq(jj,1)~=0)
%             xu=[xx(ii,1) i];
%             dlmwrite('centroidsequp.txt',xu,'-append', ...
%               'newline', 'pc');
%             xx(ii,1)=i;
%         end
%         jj=jj+1;
%      end
%  end
% 
% 
% obleft=csvread('centroidseqleft.txt');
% 
% %for j=1:1:length(obleft)
%     %a=0;
%     a=0;
%     for i=1:1:length(obleft)-1
% x1=obleft(i,1);
% y1=obleft(i,2);
% y2=obleft(i+1,2);
% x2=obleft(i+1,1);
% if(x2~=y1)
% %%disp(y1);
% a=a+1;
% vx(a)=i;
% end
%     end
%     vx(a+1)=length(obleft);
%     
%     
% %d=(vx(2)-vx(1))*2;
% 
% ar1=[];
%     for j=1:1:vx(1)
%         for k=1:1:2
%         ar1(j*k)=obleft(j,k);
%        
%         end
%     end
%         ar1=unique(ar1(:));
%         ar1(ar1==0)=[];
%  dlmwrite('leftobj.txt',ar1','-append', ...
%               'newline', 'pc');       
% if(length(vx)>1)    
% ar2=[];
%  for i=1:1:length(vx)-1
%      a=vx(i);
%     b=vx(i+1);
%     %diff=b-a;
%     g=0;
%     for j=a+1:1:b
%         for k=1:1:2
%             g=g+1;
%         ar2(g)=obleft(j,k);
% %        disp(g);
%         end
%     end
%     
%         ar2=unique(ar2(:));
%         ar2(ar2==0)=[];
%  dlmwrite('leftobj.txt',ar2','-append', ...
%               'newline', 'pc');   
%     
%  end
% 
% end
%  obup=csvread('centroidsequp.txt');
% 
% 
%     a=0;
%     for i=1:1:length(obup)-1
% x1=obup(i,1);
% y1=obup(i,2);
% y2=obup(i+1,2);
% x2=obup(i+1,1);
% if(x2~=y1)
% %%disp(y1);
% a=a+1;
% vx1(a)=i;
% end
% end
% vx1(a+1)=length(obup);
%     
% %d=(vx1(2)-vx1(1))*2;
% ar1=[];
% for j=1:1:vx1(1)
%     for k=1:1:2
%         ar1(j*k)=obup(j,k);
%        
% end
% end
%         ar1=unique(ar1(:));
%         ar1(ar1==0)=[];
%  dlmwrite('upobj.txt',ar1','-append', ...
%               'newline', 'pc');       
% if(length(vx1)>1)    
% ar2=[];
%  for i=1:1:length(vx1)-1
%      a=vx1(i);
%     b=vx1(i+1);
%     %diff=b-a;
%     g=0;
%    
%     for j=a+1:1:b
%         for k=1:1:2
%             g=g+1;
%         ar2(g)=obup(j,k);
%        disp(g);
%         end
%     end
%     
%         ar2=unique(ar2(:));
%         ar2(ar2==0)=[];
%  dlmwrite('upobj.txt',ar2','-append', ...
%               'newline', 'pc');   
%     
%  end
%  
% end
% 
% 
% 
%  downnode=csvread('mergeddownnode.txt');
% upnode=csvread('mergedupnode.txt');
% leftnode=csvread('mergedleftnode.txt');
% rightnode=csvread('mergedrightnode.txt');
% obleft=csvread('leftobj.txt');
% obup=csvread('upobj.txt');
% for i=1:1:length(leftnode)
%     a=[leftnode(i) rightnode(i) obleft(i,:)];
%     a(a==0)=[];
%     dlmwrite('netlist.txt',a,'-append', ...
%               'newline', 'pc');
% end
% for i=1:1:length(upnode)
%     a=[upnode(i) downnode(i) obup(i,:)];
%     a(a==0)=[];
%     dlmwrite('netlist.txt',a,'-append', ...
%               'newline', 'pc');
% end
 