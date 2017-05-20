    for i=1:1:b-1
    if(ss(i+1)-ss(1)<=5)
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
if(length(xx)>1)
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

%mat1(mat1==0)=[];
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
if(minimumdista<=15)
kk=0;
for i=1:1:length(xx)-1
   
for j=i+1:1:length(xx)
   if(i~=j)
       if(mat1(i,j)==minimumdista)
           kk=kk+2;
           object(kk-1)=i;
           object(kk)=j;
       end
   end
end
end
end

for i=1:1:length(object)
    qw(stats(xx(i)).PixelList(:,:))=0;
end

end