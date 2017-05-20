clc;
clear all;
R=0;Cap=0;L1=0;V=0;
i7=imread('i7.jpg');
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

train2=csvread('HOFVtrain.txt');
  fid2=fopen('trainlabelHOFV.txt','r');
  s1=fread(fid2);
  s1((s1==44))=[];
  s1((s1==10))=[];
  s1((s1==13))=[];
 Rtrain069=csvread('Resistor\train 0 6 9\coodbinary.txt');
 Rlabel069ID=fopen('Resistor\train 0 6 9\numbers 0 6 9 K M.txt','r');
 Rlabel069=fread(Rlabel069ID);
 Rlabel069((Rlabel069==13))=[];
 Rlabel069((Rlabel069==10))=[];
 fclose(Rlabel069ID);
 Rtrain123457=csvread('Resistor\TRAIN 1 2 3 4 5 7\coodbinary.txt');
 Rlabel123457ID=fopen('Resistor\TRAIN 1 2 3 4 5 7\numbers 1 2 3 4 5 7 K M.txt','r');
 Rlabel123457=fread(Rlabel123457ID);
 Rlabel123457((Rlabel123457==13))=[];
 Rlabel123457((Rlabel123457==10))=[];
 fclose(Rlabel123457ID);
 Rtrain8=csvread('Resistor\TRAIN 8\coodbinary.txt');
 Rlabel8ID=fopen('Resistor\TRAIN 8\numbers 8 K M.txt','r');
 Rlabel8=fread(Rlabel8ID);
 Rlabel8((Rlabel8==13))=[];
 Rlabel8((Rlabel8==10))=[];
 fclose(Rlabel8ID); 
 
 Vtrain069=csvread('Voltage\train 0 6 9\coodbinary.txt');
 Vlabel069ID=fopen('Voltage\train 0 6 9\numbers 0 6 9 m.txt','r');
 Vlabel069=fread(Vlabel069ID);
 Vlabel069((Vlabel069==13))=[];
 Vlabel069((Vlabel069==10))=[];
 fclose(Vlabel069ID);
 Vtrain123457=csvread('Voltage\train 1 2 3 4 5 7\coodbinary.txt');
 Vlabel123457ID=fopen('Voltage\train 1 2 3 4 5 7\numbers 1 2 3 4 5 7 m.txt','r');
 Vlabel123457=fread(Vlabel123457ID);
 Vlabel123457((Vlabel123457==13))=[];
 Vlabel123457((Vlabel123457==10))=[];
 fclose(Vlabel123457ID);
 Vtrain8=csvread('Voltage\train 8\coodbinary.txt');
 Vlabel8ID=fopen('Voltage\train 8\numbers 8 m.txt','r');
 Vlabel8=fread(Vlabel8ID);
 Vlabel8((Vlabel8==13))=[];
 Vlabel8((Vlabel8==10))=[];
 fclose(Vlabel8ID); 
 
 
 
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
 cnet=csvread('netlistnew.txt');
[r c]=size(cnet);

for oo=1:1:r
az1=cnet(oo,:);
az=az1(1,3:length(az1));
az(az==0)=[];

    
    len=length(az);
    %numbers=(len-2);
    
    CC=bwconncomp(h9);
 
   labelnumber=az(len);
  
  image2=ce(:,:,labelnumber); 
  figure,imshow(image2);
    [C,S] = wavedec2(image2,1,'db2');
A= appcoef2(C,S,'db2',1);
vv(1,:)=A(:);


   label=knnclassify(vv,train2,char(s1));
   
   



if(label=='O')
        R=R+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
% Rvalues=len-3;       
  valuesR=0;   
  g1=0;
for g=1:1:len-1
            image1=ce(:,:,az(g));
%             [C1,S1] = wavedec2(image1,1,'db2');
%              A1= appcoef2(C1,S1,'db2',1);
%              vv1(1,:)=A1(:);
              vv1(1,:)=image1(:);
             sepa=bwconncomp(image1);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             g1=g1+1;
             if(euler==0)
               valuesR(g1)=knnclassify(vv1,Rtrain069,Rlabel069);
             end
             if(euler==1)
             valuesR(g1)=knnclassify(vv1,Rtrain123457,Rlabel123457);
             end
 
             if(euler<=-1)
             valuesR(g1)=knnclassify(vv1,Rtrain8,Rlabel8);
             end
          dd=length(valuesR)-1;
          for i=1:1:dd
              if(valuesR(i)==75)
             valuesR(i)=49;
              end
          end
          
             
end
        

       fid2=fopen('creatingnetlist0.txt','a');
        if(length(valuesR)==3)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)));      
        end
           if(length(valuesR)==4)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)),char(valuesR(4)));    
           end
            if(length(valuesR)==2)
            fprintf(fid2,'\r\nR%d  %d %d %c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)));    
          end
               if(length(valuesR)==5)
            fprintf(fid2,'\r\nR%d  %d %d %c%c%c%c%c',R,az1(1),az1(2),char(valuesR(1)),char(valuesR(2)),char(valuesR(3)),char(valuesR(4)),char(valuesR(5)));    
               end
     if(length(valuesR)==1)
            fprintf(fid2,'\r\nR%d  %d %d %c',R,az1(1),az1(2),char(valuesR(1)));    
          end
    
    
    
    fclose(fid2);
end

if(label=='V')
        V=V+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
%Vvalues=len-3;       
  valuesV=0;   
  gV=0;
for g=1:1:len-1
            image2=ce(:,:,az(g));
%             [C1,S1] = wavedec2(image,1,'db2');
%              A1= appcoef2(C1,S1,'db2',1);
%              vv1(1,:)=A1(:);
vvV(1,:)=image2(:);
             sepa=bwconncomp(image2);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             gV=gV+1;
             
             if(euler==0)
               valuesV(gV)=knnclassify(vvV,Vtrain069,Vlabel069);
             end
             if(euler==1)
             valuesV(gV)=knnclassify(vvV,Vtrain123457,Vlabel123457);
             end
 
             if(euler<=-1)
             valuesV(gV)=knnclassify(vvV,Vtrain8,Vlabel8);
             end
             if(length(valuesV)~=1)
             dd1=length(valuesV)-1;
    for i=1:1:dd1
        if(valuesV(i)==109)
            valuesV(i)=48;
        end
    end
             end
             
             
end
        

       fid2=fopen('creatingnetlist0.txt','a');
        if(length(valuesV)==3)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)));      
        end
           if(length(valuesV)==4)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)),char(valuesV(4)));    
           end
            if(length(valuesV)==2)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)));    
          end
               if(length(valuesV)==5)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c%c%c',V,az1(1),az1(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)),char(valuesV(4)),char(valuesV(5)));    
               end
    if(length(valuesV)==1)
            fprintf(fid2,'\r\nVCC%d  %d %d %c',V,az1(1),az1(2),char(valuesV(1)));   
               end
    
    
    
    fclose(fid2);
end


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
            imageL=im2bw(ce(:,:,az(g)));
            [C3,S3] = wavedec2(imageL,1,'db2');
             A33= appcoef2(C3,S3,'db2',1);
             vv33(1,:)=A33(:);
             sepa=bwconncomp(imageL);
             statschar=regionprops(sepa,'Eulernumber');
             euler=statschar.EulerNumber;
             g3=g3+1;
             if(euler==0)
               valuesL(g3)=knnclassify(vv33,Ltrain069,Llabel069);
             end
             if(euler==1)
             valuesL(g3)=knnclassify(vv33,Ltrain123457,Llabel123457);
             end
 
             if(euler<=-1)
             %valuesL(g2)=knnclassify(vv3,Ltrain8,Llabel8);
             valuesL(g3)=8;
             end
             
             
             
         
end
        

       fid2=fopen('creatingnetlist0.txt','a');
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
        

       fid2=fopen('creatingnetlist0.txt','a');
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