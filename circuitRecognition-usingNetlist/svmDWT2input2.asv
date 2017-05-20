clc;
clear all;


 jpgFiles = dir('*.jpg');
  
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
a = imread(filename);

    [C,S] = wavedec2(a,1,'db2');
%[cA,cH,cV,cD] = dwt2(a,'haar');
A= appcoef2(C,S,'db2',1);
%[x,y]=size(A);
vv(1,:)=A(:);
[H,V,D] = detcoef2('all',C,S,1);
H1(1,:)=H(:);
V1(1,:)=V(:);
D1(1,:)=D(:);
hsum=sum(H,2);
vsum=sum(V,2);
dsum=sum(D,2);
dlmwrite('H.txt',H1,'-append','newline', 'pc');
 dlmwrite('V.txt',V1,'-append','newline', 'pc');
 dlmwrite('D.txt',D1,'-append','newline', 'pc');
 hrsum=sum(H,1);
vrsum=sum(V,1);
drsum=sum(D,1);
dlmwrite('hrsum.txt',hrsum,'-append','newline', 'pc');
 dlmwrite('vrsum.txt',vrsum,'-append','newline', 'pc');
 dlmwrite('drsum.txt',drsum,'-append','newline', 'pc');
   

% dlmwrite('hcsum.txt',hsum,'-append','newline', 'pc');
%  dlmwrite('vcsum.txt',vsum,'-append','newline', 'pc');
%  dlmwrite('dcsum.txt',dsum,'-append','newline', 'pc');
   
end
%   dlmwrite('xmoments.txt',x, ...
%         'newline', 'pc');
   
%       dlmwrite('cA.txt',cA,'newline', 'pc');
% 
% dlmwrite('cH.txt',cH,'newline', 'pc'); 
% dlmwrite('cV.txt',cV,'newline', 'pc'); 
% dlmwrite('cD.txt',cD,'newline', 'pc');
