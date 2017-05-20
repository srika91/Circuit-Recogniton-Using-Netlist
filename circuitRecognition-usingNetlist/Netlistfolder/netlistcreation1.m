clc;
clear all;
R=0;C=0;H=0;v=0;
i7=imread('character1.jpg');
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
 
   labelnumber=az(len);
  image2=ce(:,:,labelnumber); 
  figure,imshow(image2);
    [C,S] = wavedec2(image2,1,'db2');
A= appcoef2(C,S,'db2',1);
vv(1,:)=A(:);


   label=knnclassify(vv,train2,a38');
   
   



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
for g=3:1:len-1
            image=ce(:,:,az(g));
            [C1,S1] = wavedec2(image,1,'db2');
             A1= appcoef2(C1,S1,'db2',1);
             vv1(1,:)=A1(:);
             train2=csvread('imageasvectorsTRAIN.txt');
             label2=
             g1=g1+1;
            valuesR(g1)=knnclassify(vv1,train2,label);
      end
        

       fid2=fopen('creatingnetlist11.txt','a');
        if(length(valuesR)==3)
            fprintf(fid2,'\r\nR%d  %c %c %c%c%c',R,az(1),az(2),valuesR(1),valuesR(2),valuesR(3));      
        end
           if(length(valuesR)==4)
            fprintf(fid2,'\r\nR%d  %c %c %c%c%c%c',R,az(1),az(2),valuesR(1),valuesR(2),valuesR(3),valuesR(4));    
           end
            if(length(valuesR)==2)
            fprintf(fid2,'\r\nR%d  %c %c %c%c',R,az(1),az(2),valuesR(1),valuesR(2));    
          end
               if(length(valuesR)==5)
            fprintf(fid2,'\r\nR%d  %c %c %c%c%c%c%c',R,az(1),az(2),valuesR(1),valuesR(2),valuesR(3),valuesR(4),valuesR(5));    
               end
    
    
    
    
    fclose(fid2);
end


if(label=='F')
        C=C+1;
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
  g1=0;
for g=3:1:len-1
            image=ce(:,:,az(g));
            [C3,S3] = wavedec2(image,1,'db2');
             A3= appcoef2(C3,S3,'db2',1);
             vv3(1,:)=A3(:);
             train2=csvread('imageasvectorsTRAIN.txt');
             label2=
             g2=g2+1;
            valuesC(g2)=knnclassify(vv3,train2,label);
      end
        

       fid2=fopen('creatingnetlist11.txt','a');
        if(length(valuesC)==3)
            fprintf(fid2,'\r\nC%d  %c %c %c%c%c',C,az(1),az(2),valuesC(1),valuesC(2),valuesC(3));      
        end
           if(length(valuesC)==4)
            fprintf(fid2,'\r\nC%d  %c %c %c%c%c%c',C,az(1),az(2),valuesC(1),valuesC(2),valuesC(3),valuesC(4));    
           end
            if(length(valuesC)==2)
            fprintf(fid2,'\r\nC%d  %c %c %c%c',C,az(1),az(2),valuesC(1),valuesC(2));    
          end
               if(length(valuesC)==5)
            fprintf(fid2,'\r\nC%d  %c %c %c%c%c%c%c',C,az(1),az(2),valuesC(1),valuesC(2),valuesC(3),valuesC(4),valuesC(5));    
               end
    
    
    
    
    fclose(fid2);
end

if(label=='H')
        H=H+1;
%         l=0;
%         for i=1:2:numbers-2
%             l=l+1;
%             ha1(l)=pp(4+i);
%             
%             %cha(i)='svminput(pp(4+i))';
%            disp(ha1(l)); 
%         end
% Hvalues=len-3;       
  valuesH=0;   
  g1=0;
for g=3:1:len-1
            image=ce(:,:,az(g));
            [C2,S2] = wavedec2(image,1,'db2');
             A2= appcoef2(C2,S2,'db2',1);
             vv2(1,:)=A2(:);
             train2=csvread('imageasvectorsTRAIN.txt');
             label2=
             g4=g4+1;
            valuesH(g4)=knnclassify(vv2,train2,label);
      end
        

        fid2=fopen('creatingnetlist11.txt','a');
        if(length(valuesH)==3)
            fprintf(fid2,'\r\nL%d  %c %c %c%c%c',H,az(1),az(2),valuesH(1),valuesH(2),valuesH(3));      
        end
           if(length(valuesH)==4)
            fprintf(fid2,'\r\nL%d  %c %c %c%c%c%c',H,az(1),az(2),valuesH(1),valuesH(2),valuesH(3),valuesH(4));    
           end
            if(length(valuesH)==2)
            fprintf(fid2,'\r\nL%d  %c %c %c%c',H,az(1),az(2),valuesH(1),valuesH(2));    
          end
               if(length(valuesH)==5)
            fprintf(fid2,'\r\nL%d  %c %c %c%c%c%c%c',H,az(1),az(2),valuesH(1),valuesH(2),valuesH(3),valuesH(4),valuesH(5));    
               end
    
    
    
    
    fclose(fid2);
end




end

    
