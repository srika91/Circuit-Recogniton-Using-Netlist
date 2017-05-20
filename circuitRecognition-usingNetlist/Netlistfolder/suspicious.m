clear all;
a=imread('circuit2.png');
xy=zeros(size(im2bw(a)));
newgen=zeros(426,737);

[newgen xy nshape iscurve1 xmax1 ymax1 xs1 ys1 xe1 ye1 contlength2]=getlis1(~im2bw(a),xy);
figure,imshow(newgen);
%figure,imshow(xyx);
c=1;
xyq=xy;
while(c==1)
 
if(sum(iscurve1)==0)
break;
else[newgen xy nshape iscurve1 xmax1 ymax1 xs1 ys1 xe1 ye1 contlength2]=getlis1(newgen,xy);
end
end
figure,imshow(newgen);

xy2=bwareaopen(newgen,40,8);
figure,imshow(xy2);
xy=im2bw(xy);
bew=zeros(size(xy));
bwo=zeros(size(xy));
xy1=zeros(size(xy));
bwo=bwareaopen(newgen,40,8);
bew=im2bw((newgen-bwo));
xy1=or(xy,bew);
figure,imshow(xy1);


cc1= bwconncomp(xy1);
gen = false(size(xy1));
[shape,nshape] = bwlabeln(xy1);
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
       
        d61=0;
        contlength2(i)=0;
        %gen = false(size(d41));
        gen(cc1.PixelIdxList{i})=true;
        d61=gen;
        gen(cc1.PixelIdxList{i})=false;
        d51=bwmorph(d61,'endpoints');
     % figure,imshow(d61);
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
        curvdecider=abs(contlength2(i)-distancebwpts(i))
        if(contlength2(i)<=20)
             xy2=xy2+d61;
             xy1(cc1.PixelIdxList{i})=false;
            
        end
end
figure,imshow(xy2);
figure,imshow(xy1);



function [d41 xy nshape iscurve1 xmax1 ymax1 xs1 ys1 xe1 ye1 contlength2]=getlis1(xx,xy)



     fc=xx;
       sd=bwmorph(fc,'thicken',0);
       %img_r1 = imresize(sd,[42 24],'nearest');
       sd2=bwmorph(sd,'thin',inf);
       %figure,imshow(~sd2);
           
      a=sd2;
c=bwmorph(a,'thin',inf);
count=0;
z=size(c);
c1=c;
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
            xy(k(m),l(m))=1;
        end
end

d41=c1;
%d41=bwareaopen(c1,9);
%figure,imshow(d41);
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
     % figure,imshow(d61);
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
       
       
       
        if(distancebwpts(i)<.85*contlength2(i))
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
           d41(xmax1(i),ymax1(i))=0;
           xy(xmax1(i),ymax1(i))=1;
       
            
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
      
end
     % ss=[nshape iscurve1 xmax1 ymax1 xs1 ys1 xe1 ye1 contlength2];
   
     