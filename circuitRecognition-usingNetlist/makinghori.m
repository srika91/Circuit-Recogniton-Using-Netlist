for i=1:1length(c.fcc)
    if(c.fcc(i)==0)
        c.fcc(i)=0;
    end
    if(c.fcc(i)==1 || c.fcc(i)==7)
        if(c.fcc(i+1)==0 || c.fcc(i+2)==0 || c.fcc(i+3)==0 || c.fcc(i-1)==0 || c.fcc(i-2)==0 || c.fcc(i-3)==0)
            c.fcc(i)=0;
        end
    end
    if(c.fcc(i)!=0 || c.fcc(i)!=1 || c.fcc(i)!=7)
    end
    
   
  
    end
  disp(c.fcc);  