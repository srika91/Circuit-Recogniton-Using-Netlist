

clc;
clear all;


 jpgFiles = dir('*.jpg');
  
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
a = imread(filename);
ze=0;on=0;tw=0;th=0;fo=0;fi=0;si=0;se=0;
a1=im2bw(a);
b=bwboundaries(a1);

c=fchcode(b{1});
for i=1:1:length(c.fcc)
    if(c.fcc(i)==0)
        ze=ze+1;
    else if(c.fcc(i)==1)
            on=on+1;
       else if(c.fcc(i)==2)
            tw=tw+1;
            else if(c.fcc(i)==3)
            th=th+1;
            else if(c.fcc(i)==4)
            fo=fo+1;
            else if(c.fcc(i)==5)
            fi=fi+1;
            else if(c.fcc(i)==6)
            si=si+1;
                else
            se=se+1;
                end
                end
                end
                end
           end
        end
    end
end
a=[0 1 2 3 4 5 6 7];
b=[ze on tw th fo fi si se];
%norma=[b];

dlmwrite('normchaincode.txt',b,'-append', ...
              'newline', 'pc');
end