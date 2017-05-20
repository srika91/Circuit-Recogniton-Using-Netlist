close all
clear all;
tic;
a=imread('IMG_3122.png');
ww=a;
%a-imcrop(a);
%a=imresize(a,[512 512]);
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
else[newgen xy nshape iscurve1 xmax1 ymax1 xs1 ys1 xe1 ye1 contlength2]=getlis2(newgen,xy);
end
end
figure,imshow(newgen);

xy2=bwareaopen(newgen,50,8);
figure,imshow(xy2);
xy=im2bw(xy);
bew=zeros(size(xy));
bwo=zeros(size(xy));
xy1=zeros(size(xy));
bwo=bwareaopen(newgen,50,8);
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
if(contlength2(i)<=5)
xy2=xy2+d61;
xy1(cc1.PixelIdxList{i})=false;

end
end
figure,imshow(xy2);
figure,imshow(xy1);
toc;