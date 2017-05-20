
clc;
clear all;
R=0;Cap=0;L1=0;v=0;
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
 Ltrain069=csvread('Inductor\train 0 6 9\Abin11.txt');
 Llabel069=csvread('Inductor\train 0 6 9\numbers 0 6 9.txt');
%  Llabel069ID=fopen('Inductor\train 0 6 9\numbers 0 6 9.txt','r');
%  Llabel069=fread(Llabel069ID);
%  fclose(Llabel069ID);
  Ltrain123457=csvread('Inductor\train 1 2 3 4 5 7\Abin11.txt');
Llabel123457=csvread('Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt');
  %  Llabel123457ID=fopen('Inductor\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7.txt','r');
%  Llabel123457=fread(Llabel123457ID);
%  fclose(Llabel123457ID);
  %Ltrain8=csvread('Inductor\train 8\coodbinary.txt');
%  LlabelunID=fopen('Inductor\alphaun.txt','r');
 % Llabelun=fread(LlabelunID);
  %fclose(LlabelunID); 

Ltrainchar=csvread('Inductor\Abin11.txt');
 LlabelcharID=fopen('Inductor\train 0 6 9\alpham.txt','r');
 Llabelchar=fread(LlabelcharID);
 fclose(LlabelcharID); 
 
 
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
   
   if(label=='H')
        L1=L1+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
% Cvalues=len-3;       
  valuesL=0;   
  g3=0;
  imagechar=ce(:,:,az(len-1));
   [Ca,Sa] = wavedec2(imagechar,1,'db2');
 Aa= appcoef2(Ca,Sa,'db2',1);
vva(1,:)=Aa(:);
unit=knnclassify(vva,Ltrainchar,Llabelchar);
  
for g=1:1:len-2
            image=im2bw(ce(:,:,az(g)));
            [C3,S3] = wavedec2(image,1,'db2');
             A3= appcoef2(C3,S3,'db2',1);
             vv3(1,:)=A3(:);
             sepa=bwconncomp(image);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber
             g3=g3+1;
             if(euler==0)
               valuesL(g3)=knnclassify(vv3,Ltrain069,Llabel069);
             end
             if(euler==1)
             valuesL(g3)=knnclassify(vv3,Ltrain123457,Llabel123457);
             end
 
             if(euler<=-1)
             %valuesL(g2)=knnclassify(vv3,Ltrain8,Llabel8);
             valuesL(g3)=8;
             end
             
             
             
         
end
        

       fid2=fopen('creatingnetlist22.txt','a');
        if(length(valuesL)==2)
            fprintf(fid2,'\r\nL%d  %d %d %d%d%c',L1,az1(1),az1(2),valuesL(1),valuesL(2),unit);      
        end
           if(length(valuesL)==3)
            fprintf(fid2,'\r\nL%d  %d %d %d%d%d%c',L1,az1(1),az1(2),valuesL(1),valuesL(2),valuesL(3),unit);    
           end
            if(length(valuesL)==1)
            fprintf(fid2,'\r\nL%d  %d %d %d%c',L1,az1(1),az1(2),valuesL(1),unit);    
            end
               if(length(valuesL)==4)
            fprintf(fid2,'\r\nL%d  %d %d %d%d%d%d%c',L1,az1(1),az1(2),valuesL(1),valuesL(2),valuesL(3),valuesL(4),unit);    
               end
    
    
    
    
    fclose(fid2);
    end
end





