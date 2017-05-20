fid=fopen('netlist.txt','r');
R=0;C=0;H=0;v=0;
i7=imread('character1.jpg');
h9=im2bw(i7);
%i2=bwmorph(i2,'thin',inf);
h9=bwmorph(i2,'clean');
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
a=imcrop(i7,[x y width height]);
%a=imdilate(a,se);
%a = imadjust(a,stretchlim(a),[1 0]);
a=imresize(a,[20 20],'bilinear');
a = padarray(a,[4,4], 0, 'both');

ce(:,:,i) =a;
%I=ce(:,:,i);
%imgname( I, 'template.jpg' );


%    new_frame = ce(:,:,i); % i assume...
%   
%    imwrite( new_frame,sprintf('hi%d.jpg',i));

end


for oo=1:1:length(csvread('netlist.txt'))
pp=fgetl(fid);

    
    len=length(pp);
    numbers=(len-4);
    
    CC=bwconncomp(i2);
   % fid2=fopen('creatingnetlist.txt','r');
%    image=stats(pp(length)).PixelList;
%    image1=imresize(image,[20 20],'bilinear');
% image2= padarray(image1,[4,4], 0, 'both');
   %label='svminput(pp(len))';
  image2=ce(:,:,pp(len)); 
    [C,S] = wavedec2(image2,1,'db2');
A= appcoef2(C,S,'db2',1);
vv(1,:)=A(:);

  train2=csvread('train.txt');
  trainlabel=csvread('trainlabel.txt');
   label=knnclassify(vv,train2,trainlabel);
    %label=pp(length(pp));
    if(label=='O')
        R=R+1;
        l=0;
        for i=1:2:numbers-2
            l=l+1;
            ha1(l)=pp(4+i);
            
            %cha(i)='svminput(pp(4+i))';
           disp(ha1(l)); 
        end
        
        for g=1:1:length(ha1)
            image=ce(:,:,ha1(g));
            [C1,S1] = wavedec2(image,1,'db2');
             A1= appcoef2(C1,S1,'db2',1);
             vv1(1,:)=A1(:);
             train2=csvread('imageasvectorsTRAIN.txt');
             label2=
             
            ha(g)=knnclassify(vv1,train,label);
      end
        

        fid2=fopen('creatingnetlist11.txt','a');
        if(length(ha1)==3)
            fprintf(fid2,'\r\nR%d  %c %c %c%c%c',R,pp(1),pp(3),ha(1),ha(2),ha(3));      
        end
           if(length(ha1)==4)
            fprintf(fid2,'\r\nR%d  %c %c %c%c%c%c',R,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4));    
           end
            if(length(ha1)==2)
            fprintf(fid2,'\r\nR%d  %c %c %c%c',R,pp(1),pp(3),ha(1),ha(2));    
          end
               if(length(ha1)==5)
            fprintf(fid2,'\r\nR%d  %c %c %c%c%c%c%c',R,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4),ha(5));    
               end
    
    
    
    
    fclose(fid2);
    end
    if(label=='F')
        C=C+1;
        l=0;
        for i=1:2:numbers-2
            l=l+1;
            ha(l)=pp(4+i);
            %cha(i)='svminput(pp(4+i))';
           disp(ha(l)); 
        end
    
        

        fid2=fopen('creatingnetlist11.txt','a');
        if(length(ha)==3)
            fprintf(fid2,'\r\nC%d  %c %c %c%c%c',C,pp(1),pp(3),ha(1),ha(2),ha(3));      
        end
           if(length(ha)==4)
            fprintf(fid2,'\r\nC%d  %c %c %c%c%c%c',C,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4));    
           end
            if(length(ha)==2)
            fprintf(fid2,'\r\nC%d  %c %c %c%c',C,pp(1),pp(3),ha(1),ha(2));    
          end
               if(length(ha)==5)
            fprintf(fid2,'\r\nC%d  %c %c %c%c%c%c%c',C,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4),ha(5));    
               end
    
    
    
    
    fclose(fid2);
    
  end

    if(label=='H')
        H=H+1;
        l=0;
        for i=1:2:numbers-2
            l=l+1;
            ha(l)=pp(4+i);
            %cha(i)='svminput(pp(4+i))';
           disp(ha(l)); 
        end
    
        

        fid2=fopen('creatingnetlist11.txt','a');
        if(length(ha)==3)
            fprintf(fid2,'\r\nL%d  %c %c %c%c%c',H,pp(1),pp(3),ha(1),ha(2),ha(3));      
        end
           if(length(ha)==4)
            fprintf(fid2,'\r\nL%d  %c %c %c%c%c%c',H,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4));    
           end
            if(length(ha)==2)
            fprintf(fid2,'\r\nL%d  %c %c %c%c',H,pp(1),pp(3),ha(1),ha(2));    
          end
               if(length(ha)==5)
            fprintf(fid2,'\r\nL%d  %c %c %c%c%c%c%c',H,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4),ha(5));    
               end
    
    
    
    
    fclose(fid2);
    
    
    
    
    
    
    
    
    
    
    end
    
if(label=='V')
        v=v+1;
        l=0;
        for i=1:2:numbers-2
            l=l+1;
            ha(l)=pp(4+i);
            %cha(i)='svminput(pp(4+i))';
           disp(ha(l)); 
        end
    
        

        fid2=fopen('creatingnetlist11.txt','a');
        if(length(ha)==3)
            fprintf(fid2,'\r\nVCC%d  %c %c %c%c%cV',v,pp(1),pp(3),ha(1),ha(2),ha(3));      
        end
           if(length(ha)==4)
            fprintf(fid2,'\r\nVCC%d  %c %c %c%c%c%cV',v,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4));    
           end
            if(length(ha)==2)
            fprintf(fid2,'\r\nVCC%d  %c %c %c%cV',v,pp(1),pp(3),ha(1),ha(2));    
          end
               if(length(ha)==5)
            fprintf(fid2,'\r\nVCC%d  %c %c %c%c%c%c%cV',v,pp(1),pp(3),ha(1),ha(2),ha(3),ha(4),ha(5));    
               end
    
    
    
    
    fclose(fid2);
    
    
    
    
    
    
    
    
    
    
    end    
    
    
ha=0;    
end

fclose(fid);