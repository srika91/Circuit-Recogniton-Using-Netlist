v=imread('C:\Users\kalki\Pictures\complex3.bmp');


for j=150:1:430
    for i=3:1:400
        if ((v(i,j)== 1) && (v(i,j-1)==0) && (v(i,j-3)== 1) && (v((i+3 || i+2) ,j)== 1) ) 
          v(i,j-1)=1;
          v(i,j-2)=1;
          v(i,j-3)=1;
          v(i,j+1)=1;v(i,j+2)=1;
          v(i,j+3)=1;
          %v(i,j+4)=1;
          %a(i,j)=1;
          %a(i-1,j)=1;
          %a(i+1,j)=1;
          %a(i-1,j-1)=1;
          %a(i+1,j+1)=1;
          %a(i-1,j+1)=1;
          %a(i+1,j-1)=1;
          %a(i,j+2)=1;
          %a(i,j-2)=1;
          %a(i,j-2)=1;
          %a(i-2,j-2)=1;
          %%a(i+2,j+2)=1;
          %a(i-2,j+2)=1;
          %a(i+2,j-2)=1;
        else
             v(i,j)=0;
            
        end
        
        
        
    end
end
%a1=imfill(a);
imshow(v);
%figure,imshow(close);