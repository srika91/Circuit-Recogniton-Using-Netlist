
clear all,close all,clc
%% Load image
I=imread('19_7.bmp');
imshow(I)
set(gcf,'position',[1 1 600 600]);


%% Binarize
J=I(:,:,1)>160;
imshow(J)
set(gcf,'position',[1 1 600 600]);

%% Thining
K=bwmorph(~J,'thin','inf');
imshow(~K)
set(gcf,'position',[1 1 600 600]);
%% Minutiae
fun=@minutie;
L = nlfilter(K,[3 3],fun);

%% Termination
LTerm=(L==1);
imshow(LTerm)
LTermLab=bwlabel(LTerm);
propTerm=regionprops(LTermLab,'Centroid');
CentroidTerm=round(cat(1,propTerm(:).Centroid));
imshow(~K)
set(gcf,'position',[1 1 600 600]);
hold on
plot(CentroidTerm(:,1),CentroidTerm(:,2),'ro')

%% Bifurcation
LBif=(L==3);
LBifLab=bwlabel(LBif);
propBif=regionprops(LBifLab,'Centroid','Image');
CentroidBif=round(cat(1,propBif(:).Centroid));
plot(CentroidBif(:,1),CentroidBif(:,2),'go')
D=6;
%% Process 1
Distance=DistEuclidian(CentroidBif,CentroidTerm);
SpuriousMinutae=Distance<D;
[i,j]=find(SpuriousMinutae);
CentroidBif(i,:)=[];
CentroidTerm(j,:)=[];

%% Process 2
Distance=DistEuclidian(CentroidBif);
SpuriousMinutae=Distance<D;
[i,j]=find(SpuriousMinutae);
CentroidBif(i,:)=[];


%% Process 3
Distance=DistEuclidian(CentroidTerm);
SpuriousMinutae=Distance<D;
[i,j]=find(SpuriousMinutae);
CentroidTerm(i,:)=[];
%%

hold off
imshow(~K)
hold on
plot(CentroidTerm(:,1),CentroidTerm(:,2),'ro')
plot(CentroidBif(:,1),CentroidBif(:,2),'go')
hold off


%% ROI

Kopen=imclose(K,strel('square',7));

KopenClean= imfill(Kopen,'holes');
KopenClean=bwareaopen(KopenClean,5);
imshow(KopenClean)
KopenClean([1 end],:)=0;
KopenClean(:,[1 end])=0;
ROI=imerode(KopenClean,strel('disk',10));
imshow(ROI)

%% 

imshow(I)
hold on
imshow(ROI)
alpha(0.5)

hold on
plot(CentroidTerm(:,1),CentroidTerm(:,2),'ro')
plot(CentroidBif(:,1),CentroidBif(:,2),'go')
hold off

%% Suppress extrema minutiae
[m,n]=size(I(:,:,1));
indTerm=sub2ind([m,n],CentroidTerm(:,1),CentroidTerm(:,2));
Z=zeros(m,n);
Z(indTerm)=1;
ZTerm=Z.*ROI';
[CentroidTermX,CentroidTermY]=find(ZTerm);

indBif=sub2ind([m,n],CentroidBif(:,1),CentroidBif(:,2));
Z=zeros(m,n);
Z(indBif)=1;
ZBif=Z.*ROI';
[CentroidBifX,CentroidBifY]=find(ZBif);



imshow(I)
hold on
plot(CentroidTermX,CentroidTermY,'ro','linewidth',2)
plot(CentroidBifX,CentroidBifY,'go','linewidth',2)





