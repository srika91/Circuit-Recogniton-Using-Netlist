
clear all,close all,clc
%% Load image
I=imread('C:\Users\kalki\Pictures\37_5_2.bmp');
I=imresize(I,[300 300]);
%% Binarize
J=I(:,:,1)>160;
%% Thining
K=bwmorph(~J,'thin','inf');
%% Minutiae
fun=@minutie;
L = nlfilter(K,[3 3],fun);
%% Termination
LTerm=(L==1);
LTermLab=bwlabel(LTerm);
propTerm=regionprops(LTermLab,'Centroid');
CentroidTerm=round(cat(1,propTerm(:).Centroid));

%% Bifurcation
LBif=(L==3);
LBifLab=bwlabel(LBif);
propBif=regionprops(LBifLab,'Centroid','Image');
CentroidBif=round(cat(1,propBif(:).Centroid));
D=6;

%% Middle point
MTerm=(L==2);
MTermLab=bwlabel(MTerm);
propMid=regionprops(MTermLab,'Centroid');
CentroidMid=round(cat(1,propMid(:).Centroid));
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

d=15

%% Process 4
Distance=DistEuclidian(CentroidBif,CentroidMid);
SpuriousMinutae=Distance<d;
[i,j]=find(SpuriousMinutae);
%%CentroidBif(i,:)=[];
CentroidMid(j,:)=[];

%% Process 5
Distance=DistEuclidian(CentroidMid,CentroidTerm);
SpuriousMinutae=Distance<d;
[i,j]=find(SpuriousMinutae);
CentroidMid(i,:)=[];
%%CentroidTerm(j,:)=[];

%% Process 6
Distance=DistEuclidian(CentroidMid);
SpuriousMinutae=Distance<d;
[i,j]=find(SpuriousMinutae);
CentroidMid(i,:)=[];

%% ROI
Kopen=imclose(K,strel('square',7));
KopenClean= imfill(Kopen,'holes');
KopenClean=bwareaopen(KopenClean,5);
KopenClean([1 end],:)=0;
KopenClean(:,[1 end])=0;
ROI=imerode(KopenClean,strel('disk',10));

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

indMid=sub2ind([m,n],CentroidMid(:,1),CentroidMid(:,2));
Z=zeros(m,n);
Z(indMid)=1;
ZMid=Z.*ROI';
[CentroidMidX,CentroidMidY]=find(ZMid);

%% Save in a text file
MinutiaTerm=[CentroidTermX,CentroidTermY];
MinutiaBif=[CentroidBifX,CentroidBifY];
MinutiaMid=[CentroidMidX,CentroidMidY];
saveMinutia('sos',MinutiaTerm,MinutiaBif,MinutiaMid);

