function [newgen nshape iscurve1 xmax1 ymax1 xs1 ys1 xe1 ye1 contlength2]=getlis1(xx)



     fc=xx;
       sd=bwmorph(fc,'thicken',0);
       %img_r1 = imresize(sd,[42 24],'nearest');
       sd2=bwmorph(sd,'thin',inf);
       %figure,imshow(~sd2);
            
      a=sd2;
c=bwmorph(a,'thin',inf);

z=size(c);
d=zeros(3,3);
d(2,2)=1;
c1=conv2(double(d),double(c));
fu=[0 0 0;1 1 1;0 0 0];

d21=bwmorph(c1,'branchpoints');
%d21=conv2(double(d21),double(fu));
%d21= bwmorph(d21,'thick');
%d21= bwmorph(d21,'thin');
for i=2:z(1)
    for j=2:z(2)
        if (c1(i,j)==1 && c1(i-1,j)+c1(i+1,j)+c1(i-1,j-1)+c1(i+1,j-1)+c1(i+1,j+1)+c1(i-1,j+1)+c1(i,j-1)+c1(i,j+1)>=3)
            count=count+1;
            k(count)=i;
            l(count)=j;
        end
    end
end
if(count>0)
        for m =1: count
            c1(k(m),l(m))=0;
        end
end

d41=c1;
%d41=bwareaopen(c1,9);
figure,imshow(d41);
cc1= bwconncomp(d41);
gen = false(size(d41));
[shape,nshape] = bwlabeln(d41);
xs1=zeros(nshape,1);
xe1=zeros(nshape,1);
ys1=zeros(nshape,1);
ye1=zeros(nshape,1);
distancebwpts=zeros(nshape,1);
iscurve1=zeros(nshape,1);
xmax1=zeros(nshape,1);
ymax1=zeros(nshape,1);

contlength2=zeros(nshape,1);
newgen=false(size(d41));
d81=false(size(d41));
for i=1:cc1.NumObjects
       
        contlength2(i)=0;
        %gen = false(size(d41));
        gen(cc1.PixelIdxList{i})=true;
        d81=gen;
        gen(cc1.PixelIdxList{i})=false;
        d71=bwmorph(d81,'endpoints');
        
         
        contlength1= size(cc1.PixelIdxList{i});
         %disp(contlength1);
        contlength2(i)=contlength1(1);
        
        [m n]=find(d71,1,'first');
        xs1(i)=m;
        ys1(i)=n;
        [ml nl]=find(d71,1,'last');
        xe1(i)=ml;
        ye1(i)=nl;
        
        distancebwpts(i)=((xs1(i)-xe1(i))^2+(ys1(i)-ye1(i))^2)^(.5);
  
        curvdecider=abs(contlength2(i)-distancebwpts(i));
        [xx1 yy1]=size(d81);
        
        try
  
        if(curvdecider>4)
                    
                     a1 = xe1(i)-xs1(i);
                     b1 = -(ye1(i)-ys1(i));
                     c1 = -((ys1(i)*a1)+(xs1(i)*b1));

                     y1=24;
                    x1=(-c1-(a1*y1))/b1;
                    if(x1>42||x1<1)
                        x1=42;
                        y1=(-c1-(b1*x1))/a1;
                    end
                    x2=1;
                    y2=(-c1)/a1;
                    if(y2>24||y2<1)
                        y2=1;
                        x2=(-c1)/b1;
                        if(x2<1||x2>42)
                          x2=42;
                          y2=(-c1-(b1*x1))/a1;  
                        end
                    end
                    if(y1>24||y1<1)
                        x1=1;
                        y1=(-c1)/a1;
                    end

                    rpts = linspace(x1,x2);
                    cpts = linspace(y1,y2);
                    [xx1 yy1]=size(d81);
                    index = sub2ind([xx1 yy1],round(rpts),round(cpts));
                    tempi = ones(xx1,yy1);
                    tempi(index)=0;
                    tempi = ~bwmorph(~tempi,'diag');
                    newgen1 = and(d81,tempi);
                    newgen=newgen1+newgen;
                    
                   
        else
                     newgen=d81+newgen;
        end
        
   
  %figure,imshow(newgen);
       catch exception
           disp(exception);
         
           
       end

end


clearvars cc1 nshape contlength1 contlength2 xs1 ys1 ye1 xe1 i curvdecider;

%figure;imshow(newgen),title('124545');
cc1= bwconncomp(newgen);
nshape=cc1.NumObjects;
xs1=zeros(nshape,1);
xe1=zeros(nshape,1);
ys1=zeros(nshape,1);
ye1=zeros(nshape,1);
distancebwpts=zeros(nshape,1);
iscurve1=zeros(nshape,1);
xmax1=zeros(nshape,1);
ymax1=zeros(nshape,1);
contlength2=zeros(nshape,1);
for i=1:cc1.NumObjects
        %count=0;
        try
        d61=0;
        contlength2(i)=0;
        %gen = false(size(d41));
        gen(cc1.PixelIdxList{i})=true;
        d61=gen;
        gen(cc1.PixelIdxList{i})=false;
        d51=bwmorph(d61,'endpoints');
      figure,imshow(d61);
        contlength1= size(cc1.PixelIdxList{i});
         %disp(contlength1);
        contlength2(i)=contlength1(1);
        
        [my ny]=find(d51,1,'first');
        xs1(i)=my;
        ys1(i)=ny;
        [ml nl]=find(d51,1,'last');
        xe1(i)=ml;
        ye1(i)=nl;
        
        
        hold on;
         %figure,imshow(~d61);
         
         
         
        d=0;
        distancebwpts(i)=((xs1(i)-xe1(i))^2+(ys1(i)-ye1(i))^2)^(.5);
        curvdecider=abs(contlength2(i)-distancebwpts(i));
        x2=0;
        
        
        
        if(curvdecider>4)
            iscurve1(i)=1;
            %{
            m = ((xe1(i)-xs1(i))/(ye1(i)-ys1(i)))
            c = (-m*ys1(i))+xs1(i)
            [x y] = find(d61==1)
            den = sqrt(1+(m^2))
            siz = numel(y)
            clearvars d;
            d=zeros(siz,1)
            for z=1:siz
                d(z) = abs(((m*y(z))-x(z)+c))/den
            end
            %}
          %  disp('*****************');
            a1 = xe1(i)-xs1(i);
            b1 = -(ye1(i)-ys1(i));
            c1 = -((ys1(i)*a1)+(xs1(i)*b1));
            den = sqrt((a1^2)+(b1^2));
            [x y] = find(d61==1);
            siz = numel(y);
            d=zeros(siz,1);
            for z=1:siz
                d(z) = abs(((a1*y(z))+(b1*x(z))+c1))/den;
            end
           
            f=find(d==max(d),1);
   %figure, imshow(~d61); line([ys1(i) ye1(i)],[xs1(i) xe1(i)]);hold on;
   %{
   plot(y(f),x(f),'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',20);hold off;
   %}
            %clearvars d;
            xmax1(i)=x(f);
            ymax1(i)=y(f);
            newgen(xmax1(i))=0;
            newgen(ymax1(i))=0;
             
        else
            iscurve1(i)=0;
            xmax1(i)=0;
            ymax1(i)=0;
        end
        
        
       

catch exception
             disp('iiiiiiii');
             disp(exception);
             xs1(i)=0;
             ys1(i)=0;
        %[ml nl]=find(d51,1,'last');
             xe1(i)=0;
             ye1(i)=0;
             iscurve1(i)=0;
             xmax1(i)=0;
             ymax1(i)=0;
          
        end
        
end

      nshape = cc1.NumObjects;
      nshape
      iscurve1
      xmax1
      ymax1
      xs1
      ys1
      xe1 
      ye1 
      contlength2
      figure,imshow(newgen);
     % ss=[nshape iscurve1 xmax1 ymax1 xs1 ys1 xe1 ye1 contlength2];
    
      
end
