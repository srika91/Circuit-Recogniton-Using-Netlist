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
            if(length(values(H))==2)
            fprintf(fid2,'\r\nL%d  %c %c %c%c',H,az(1),az(2),valuesH(1),valuesH(2));    
          end
               if(length(valuesH)==5)
            fprintf(fid2,'\r\nL%d  %c %c %c%c%c%c%c',H,az(1),az(2),valuesH(1),valuesH(2),valuesH(3),valuesH(4),valuesH(5));    
               end
    
    
    
    
    fclose(fid2);
end

