for j=2:1:c-1
    for i=2:1:r-1
        if(v1(i,j)==1)
            q=j;
            w=i;
        end
    end
end
for j=2:1:c-1
    for i=2:1:r-1
        a=j;
        if(v1(i,a)==1)
       continue;
        else if(v1(i+1,a+1)==1)
                a=a+1;
  
        else if(v1(i-1,a+1)==1)
                a=a-1;
            
            else if(v1(i-1,a+1)==0 && v1(i+1,a+1)==0 && v1(i,a+1)==0)
                    endx=i;
                    endy=y;
                end
            end
            end
        end
    end
end

i5=zeros([m5 n5]);
   i5(r3:r4,c3)=1;