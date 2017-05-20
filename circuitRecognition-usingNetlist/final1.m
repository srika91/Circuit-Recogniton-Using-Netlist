clc;
clear all;
bb=imread('C:\Users\kalki\Documents\MATLAB\3080\3126.jpg');
bb=im2bw(bb);
i5=bb;
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
 
 
 left1=csvread('corresLEFT.txt');

%right=csvread('rightnode.txt');

aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(left)
    x1=left1(i,1);
    y1=left1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                disp(y2);
                dlmwrite('mergedleftnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
right1=csvread('corresRIGHT.txt');


%right=csvread('rightnode.txt');

aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(right1)
    x1=right1(i,1);
    y1=right1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                disp(y2);
                dlmwrite('mergedrightnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end

up1=csvread('corresup.txt');


%right=csvread('rightnode.txt');

aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(up1)
    x1=up1(i,1);
    y1=up1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                disp(y2);
                dlmwrite('mergedupnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
down1=csvread('corresdown.txt');


%right=csvread('rightnode.txt');

aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
for i=1:1:length(down1)
    x1=down1(i,1);
    y1=down1(i,2);
    
    for j=1:1:length(statsqq)
        
        for k=1:1:length(statsqq(j).PixelList)
        
            x2=statsqq(j).PixelList(k,2);
            y2=statsqq(j).PixelList(k,1);
          
            if((x2==x1) && (y2==y1))
                disp(y2);
                dlmwrite('mergeddownnode.txt',j,'-append', ...
              'newline', 'pc');  
            end
        end
    end
end
 i7=imread('characters2.jpg');
 i7=im2bw(i7);
 CC=bwconncomp(i7);
 stats=regionprops(CC,'BoundingBox');
 for i=1:1:length(stats)
 centroid(i,:)=[stats(i).BoundingBox(1,1)+(stats(i).BoundingBox(1,3))/2 stats(i).BoundingBox(1,2)+(stats(i).BoundingBox(1,4))/2];
 %xyz=[centroid(i,:) stats(i).BoundingBox(1,:)];
 centroidindex(i,:)=[centroid(i,:) i];
%  dlmwrite('centroidindex.txt',xyz,'-append', ...
%              'newline', 'pc');
%  
 end
 
 
 m1=csvread('corresLEFT.txt');
% m1=m1(2,:);
 dist=[];
 
  [xm,ym]=size(m1);
 
 for ii=1:1:xm
 jj=1;
 j=1;
 for i=1:1:length(centroid)
    
     
         
     if(centroid(i,2)<m1(ii,1))
         dist(jj,1)=sqrt(((centroid(i,2)-m1(ii,1)).^2) + ((centroid(i,1)-m1(ii,2)).^2));
         dist(jj,2)=i;
         jj=jj+1;
              
     end
  
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
 obleft=csvread('centroidseqleft.txt');

%for j=1:1:length(obleft)
    %a=0;
    a=0;
    for i=1:1:length(obleft)-1
x1=obleft(i,1);
y1=obleft(i,2);
y2=obleft(i+1,2);
x2=obleft(i+1,1);
if(x2~=y1)
%%disp(y1);
a=a+1;
vx(a)=i;
end
    end
    vx(a+1)=length(obleft);
    
d=(vx(2)-vx(1))*2;
ar1=[];
    for j=1:1:vx(1)
        for k=1:1:2
        ar1(j*k)=obleft(j,k);
       
        end
    end
        ar1=unique(ar1(:));
        ar1(ar1==0)=[];
 dlmwrite('leftobj.txt',ar1','-append', ...
              'newline', 'pc');       
    
ar2=[];
 for i=1:1:length(vx)-1
     a=vx(i);
    b=vx(i+1);
    diff=b-a;
    g=0;
    for j=a+1:1:b
        for k=1:1:2
            g=g+1;
        ar2(g)=obleft(j,k);
       disp(g);
        end
    end
    
        ar2=unique(ar2(:));
        ar2(ar2==0)=[];
 dlmwrite('leftobj.txt',ar2','-append', ...
              'newline', 'pc');   
    
 end

 
 obleft=csvread('centroidsequp.txt');

%for j=1:1:length(obleft)
    %a=0;
    a=0;
    for i=1:1:length(obleft)-1
x1=obleft(i,1);
y1=obleft(i,2);
y2=obleft(i+1,2);
x2=obleft(i+1,1);
if(x2~=y1)
%%disp(y1);
a=a+1;
vx(a)=i;
end
    end
    vx(a+1)=length(obleft);
    
d=(vx(2)-vx(1))*2;
ar1=[];
    for j=1:1:vx(1)
        for k=1:1:2
        ar1(j*k)=obleft(j,k);
       
        end
    end
        ar1=unique(ar1(:));
        ar1(ar1==0)=[];
 dlmwrite('upobj.txt',ar1','-append', ...
              'newline', 'pc');       
    
ar2=[];
 for i=1:1:length(vx)-1
     a=vx(i);
    b=vx(i+1);
    diff=b-a;
    g=0;
    for j=a+1:1:b
        for k=1:1:2
            g=g+1;
        ar2(g)=obleft(j,k);
       disp(g);
        end
    end
    
        ar2=unique(ar2(:));
        ar2(ar2==0)=[];
 dlmwrite('upobj.txt',ar2','-append', ...
              'newline', 'pc');   
    
 end
 downnode=csvread('mergeddownnode.txt');
upnode=csvread('mergedupnode.txt');
leftnode=csvread('mergedleftnode.txt');
rightnode=csvread('mergedrightnode.txt');
obleft=csvread('leftobj.txt');
obup=csvread('upobj.txt');
for i=1:1:length(leftnode)
    a=[leftnode(i) rightnode(i) obleft(i,:)];
    a(a==0)=[];
    dlmwrite('netlist.txt',a,'-append', ...
              'newline', 'pc');
end
for i=1:1:length(upnode)
    a=[upnode(i) downnode(i) obup(i,:)];
    a(a==0)=[];
    dlmwrite('netlist.txt',a,'-append', ...
              'newline', 'pc');
end
 