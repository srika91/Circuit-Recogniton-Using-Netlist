clc;
clear all;




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
    
    
%d=(vx(2)-vx(1))*2;

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
if(length(vx)>1)    
ar2=[];
 for i=1:1:length(vx)-1
     a=vx(i);
    b=vx(i+1);
    %diff=b-a;
    g=0;
    for j=a+1:1:b
        for k=1:1:2
            g=g+1;
        ar2(g)=obleft(j,k);
%        disp(g);
        end
    end
    
        ar2=unique(ar2(:));
        ar2(ar2==0)=[];
 dlmwrite('leftobj.txt',ar2','-append', ...
              'newline', 'pc');   
    
 end

end
 obup=csvread('centroidsequp.txt');


    a=0;
    for i=1:1:length(obup)-1
x1=obup(i,1);
y1=obup(i,2);
y2=obup(i+1,2);
x2=obup(i+1,1);
if(x2~=y1)
%%disp(y1);
a=a+1;
vx1(a)=i;
end
end
vx1(a+1)=length(obup);
    
%d=(vx1(2)-vx1(1))*2;
ar1=[];
for j=1:1:vx1(1)
    for k=1:1:2
        ar1(j*k)=obup(j,k);
       
end
end
        ar1=unique(ar1(:));
        ar1(ar1==0)=[];
 dlmwrite('upobj.txt',ar1','-append', ...
              'newline', 'pc');       
if(length(vx1)>1)    
ar2=[];
 for i=1:1:length(vx1)-1
     a=vx1(i);
    b=vx1(i+1);
    %diff=b-a;
    g=0;
   
    for j=a+1:1:b
        for k=1:1:2
            g=g+1;
        ar2(g)=obup(j,k);
       disp(g);
        end
    end
    
        ar2=unique(ar2(:));
        ar2(ar2==0)=[];
 dlmwrite('upobj.txt',ar2','-append', ...
              'newline', 'pc');   
    
 end
 
end