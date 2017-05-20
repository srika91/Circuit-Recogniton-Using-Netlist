clc;
clear all;
bb=imread('3080.jpg');
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
[r c]=size(left);
if(r>1)
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
end

 
 up=csvread('upnode.txt');

down=csvread('downnode.txt');
[r1 c1]=size(up);
if(r1>1)
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
 
end

if(r>1)
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
end

if(r1>1)
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
end


if(r1==1)
    down=csvread('downnode.txt');
    aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=down(1,1);
    y1=down(1,2);
    
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
%end
up=csvread('upnode.txt');
%if(length(up)==1)
    aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=up(1,1);
    y1=up(1,2);
    
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

left=csvread('leftnode.txt');
[r c]=size(left);
if(r==1)
    
    aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=left(1,1);
    y1=left(1,2);
    
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
%end
right=csvread('rightnode.txt');
%if(length(right)==1)
    aa=bwconncomp(bb);
L = labelmatrix(aa);
RGB = label2rgb(L);
statsqq=regionprops(aa,'PixelList');
 x1=right(1,1);
    y1=right(1,2);
    
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



    