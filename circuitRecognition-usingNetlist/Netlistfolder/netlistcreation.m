clc;
clear all;
% fid=fopen('netlist.txt','r');
R=0;C=0;H=0;v=0;
i7=imread('character1.jpg');
h9=im2bw(i7);
%i2=bwmorph(i7,'thin',inf);
h9=bwmorph(h9,'clean');
CC = bwconncomp(h9,8);
L = labelmatrix(CC);
RGB = label2rgb(L);
stats=regionprops(CC,'area');
idx = find([stats.Area] >5);
stats=regionprops(CC,'BoundingBox');
for i=1:1:length(idx)
    x=stats(idx(i)).BoundingBox(1,1);
    y=stats(idx(i)).BoundingBox(1,2);
width=stats(idx(i)).BoundingBox(1,3);
height=stats(idx(i)).BoundingBox(1,4);
a=imcrop(h9,[x y width height]);
%a=imdilate(a,se);
%a = imadjust(a,stretchlim(a),[1 0]);
a=imresize(a,[20 20],'bilinear');
a = padarray(a,[4,4], 0, 'both');

ce(:,:,i) =a;
%I=ce(:,:,i);
%imgname( I, 'template.jpg' );


%    new_frame = ce(:,:,i); % i assume...
%   
    imwrite(ce(:,:,i),sprintf('%d.jpg',i));

end

train2=csvread('HOFVtrain.txt');
  fid2=fopen('trainlabelHOFV.txt','r');
  s1=fread(fid2,'*char');
  for pp1=1:2:length(s1)-1
a11(pp1)=s1(pp1);
  end
    a11(a11==0)=[];  
    a22=char(a11);  
    a38=a22(1:length(a22));
 cnet=importdata('netlist.txt');
[r c]=size(cnet);

for oo=1:1:r
az=cnet(oo,:);
az(find(isnan(az)))=[];
    
    len=length(az);
    numbers=(len-2);
    
    CC=bwconncomp(h9);
   % fid2=fopen('creatingnetlist.txt','r');
%    image=stats(pp(length)).PixelList;
%    image1=imresize(image,[20 20],'bilinear');
% image2= padarray(image1,[4,4], 0, 'both');
   %label='svminput(pp(len))';
   labelnumber=az(len);
  image2=ce(:,:,labelnumber); 
  figure,imshow(image2);
    [C,S] = wavedec2(image2,1,'db2');
A= appcoef2(C,S,'db2',1);
vv(1,:)=A(:);

%   train2=csvread('HOFVtrain.txt');
%   fid2=fopen('trainlabelHOFV.txt','r');
%   s1=fread(fid2,'*char');
%   for pp1=1:2:length(s1)-1
% a11(pp1)=s1(pp1);
%   end
%     a11(a11==0)=[];  
%     a22=char(a11);  
%     a38=a22(1:length(a22));
   label=knnclassify(vv,train2,a38');
   
   
   
   
end