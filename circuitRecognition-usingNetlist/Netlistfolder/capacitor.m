
clc;
clear all;
R=0;Cap=0;H=0;v=0;
i7=imread('7rep9.jpg');
h9=im2bw(i7);
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
a=imresize(a,[20 20],'bilinear');
a = padarray(a,[4,4], 0, 'both');

ce(:,:,i) =a;
imwrite(ce(:,:,i),sprintf('%d.jpg',i));

end
% 
train2=csvread('HOFVtrain.txt');
   fid2=fopen('trainlabelHOFV.txt','r');
   s1=fread(fid2,'*char');
  s1((s1==44))=[];
  s1((s1==10))=[];
  s1((s1==13))=[];
 Ctrain069=csvread('Inductor\train 0 6 9\coodbinary11.txt');
 Clabel069=csvread('Inductor\train 0 6 9\numbers 0 6 9.txt');
%  Clabel069ID=fopen('Inductor\train 0 6 9\numbers 0 6 9.txt','r');
%  Clabel069=fread(Clabel069ID);
%  fclose(Clabel069ID);
  Ctrain123457=csvread('Inductor\train 1 2 3 4 5 7\coodbinary11.txt');
Clabel123457=csvread('Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt');
  %  Clabel123457ID=fopen('Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt','r');
%  Clabel123457=fread(Clabel123457ID);
%  fclose(Clabel123457ID);
  %Ctrain8=csvread('Inductor\train 8\coodbinary.txt');
%  ClabelunID=fopen('Inductor\alphaun.txt','r');
 % Clabelun=fread(ClabelunID);
  %fclose(ClabelunID); 

Ctrainchar=csvread('Capacitor\Abin11.txt');
 ClabelcharID=fopen('Capacitor\train 0 6 9\alphaun.txt','r');
 Clabelchar=fread(ClabelcharID);
 fclose(ClabelcharID); 
 
 
%   for pp1=1:2:length(s1)-1
% a11(pp1)=s1(pp1);
%   end
%     a11(a11==0)=[];  
%     a22=char(a11);  
%     a38=a22(1:length(a22));
 cnet=csvread('7netlist.txt');
[r c]=size(cnet);

for oo=1:1:r
az1=cnet(oo,:);
az=az1(1,3:length(az1));
az(az==0)=[];
    
    len=length(az);
  %  numbers=(len-2);
    
    CC=bwconncomp(h9);
 
   labelnumber=az(len);
  image2=ce(:,:,labelnumber); 
  figure,imshow(image2);
    [C,S] = wavedec2(image2,1,'db2');
A= appcoef2(C,S,'db2',1);
vv(1,:)=A(:);


   label=knnclassify(vv,train2,s1);
   
   if(label=='F')
        Cap=Cap+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
% Cvalues=len-3;       
  valuesC=0;   
  g2=0;
  imagechar=ce(:,:,az(len-1));
   [Ca,Sa] = wavedec2(imagechar,1,'db2');
 Aa= appcoef2(Ca,Sa,'db2',1);
vva(1,:)=Aa(:);
unit=knnclassify(vva,Ctrainchar,Clabelchar);
  
for g=1:1:len-2
            image=ce(:,:,az(g));
%             [C3,S3] = wavedec2(image,1,'db2');
%              A3= appcoef2(C3,S3,'db2',1);
             vv3(1,:)=image(:);
             sepa=bwconncomp(image);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             g2=g2+1;
             if(euler==0)
               valuesC(g2)=knnclassify(vv3,Ctrain069,Clabel069);
             end
             if(euler==1)
             valuesC(g2)=knnclassify(vv3,Ctrain123457,Clabel123457);
             end
 
             if(euler<=-1)
             %valuesC(g2)=knnclassify(vv3,Ctrain8,Clabel8);
             valuesC(g2)=8;
             end
             
             
             
         
end
        

       fid2=fopen('creatingnetlist1111.txt','a');
        if(length(valuesC)==2)
            fprintf(fid2,'\r\nC%d  %d %d %d%d%c',Cap,az1(1),az1(2),valuesC(1),valuesC(2),unit);      
        end
           if(length(valuesC)==3)
            fprintf(fid2,'\r\nC%d  %d %d %d%d%d%c',Cap,az1(1),az1(2),valuesC(1),valuesC(2),valuesC(3),unit);    
           end
            if(length(valuesC)==1)
            fprintf(fid2,'\r\nC%d  %d %d %d%c',Cap,az1(1),az1(2),valuesC(1),unit);    
            end
               if(length(valuesC)==4)
            fprintf(fid2,'\r\nC%d  %d %d %d%d%d%d%c',Cap,az1(1),az1(2),valuesC(1),valuesC(2),valuesC(3),valuesC(4),unit);    
               end
    
    
    
    
    fclose(fid2);
    end
end





