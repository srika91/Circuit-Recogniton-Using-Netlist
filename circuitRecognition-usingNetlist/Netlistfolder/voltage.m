clc;
clear all;
R=0;C=0;H=0;V=0;
i7=imread('character1.jpg');
h9=im2bw(i7);
h9=bwmorph(h9,'clean');
CC = bwconncomp(h9,8);
L = labelmatrix(CC);
VGB = label2rgb(L);
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
  
%   for pp1=1:2:length(s1)-1
% a11(pp1)=s1(pp1);
%   end
%     a11(a11==0)=[];  
%     a22=char(a11);  
%     a38=a22(1:length(a22));
 cnet=importdata('netlist.txt');
[r c]=size(cnet);

for oo=1:1:r
az=cnet(oo,:);
az(find(isnan(az)))=[];
    
    len=length(az);
    numbers=(len-2);
    
    CC=bwconncomp(h9);
 
   labelnumber=az(len);
  image2=ce(:,:,labelnumber); 
  %figure,imshow(image2);
    [C6,S6] = wavedec2(image2,1,'db2');
A6= appcoef2(C6,S6,'db2',1);
v6(1,:)=A6(:);


   label=knnclassify(v6,train2,char(s1))
   
   



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
for g=3:1:len-1
            image=ce(:,:,az(g));
%             [C1,S1] = wavedec2(image,1,'db2');
%              A1= appcoef2(C1,S1,'db2',1);
%              vv1(1,:)=A1(:);
vvV(1,:)=image(:);
             sepa=bwconncomp(image);
             statschar=regionprops(sepa,'Eulernumber');
             gV=gV+1;
             if(statschar.EulerNumber==0)
               valuesV(gV)=knnclassify(vvV,Vtrain069,Vlabel069);
             end
             if(statschar.EulerNumber==1)
             valuesV(gV)=knnclassify(vvV,Vtrain123457,Vlabel123457);
             end
 
             if(statschar.EulerNumber<=-1)
             valuesV(gV)=knnclassify(vvV,Vtrain8,Vlabel8);
             end
             
             
end
        

       fid2=fopen('creatingnetlist11.txt','a');
        if(length(valuesV)==3)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c',V,az(1),az(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)));      
        end
           if(length(valuesV)==4)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c%c',V,az(1),az(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)),char(valuesV(4)));    
           end
            if(length(valuesV)==2)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c',V,az(1),az(2),char(valuesV(1)),char(valuesV(2)));    
          end
               if(length(valuesV)==5)
            fprintf(fid2,'\r\nVCC%d  %d %d %c%c%c%c%c',V,az(1),az(2),char(valuesV(1)),char(valuesV(2)),char(valuesV(3)),char(valuesV(4)),char(valuesV(5)));    
               end
    if(length(valuesV)==1)
            fprintf(fid2,'\r\nVCC%d  %d %d %c',V,az(1),az(2),char(valuesV(1)));   
               end
    
    
    
    fclose(fid2);
end



end