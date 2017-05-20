clc;
clear all;


 jpgFiles = dir('*.jpg')
  
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
a = imread(filename);
a1=im2bw(a);
    [C,S] = wavedec2(a1,1,'db2');
%[cA,cH,cV,cD] = dwt2(a,'haar');
A= appcoef2(C,S,'db2',1);
%[x,y]=size(A);
vv(1,:)=A(:);

dlmwrite('Abin.txt',vv,'-append','newline', 'pc');
% a2=bwconncomp(a1);
% stats=regionprops(a2,'EulerNumber');
% dlmwrite('eulernumber.txt',stats(1).EulerNumber,'-append','newline', 'pc');
%  %dlmwrite('Cvalues.txt',C','-append','newline', 'pc'); 
 
   
end
%   dlmwrite('xmoments.txt',x, ...
%         'newline', 'pc');
   
%       dlmwrite('cA.txt',cA,'newline', 'pc');
% 
% dlmwrite('cH.txt',cH,'newline', 'pc'); 
% dlmwrite('cV.txt',cV,'newline', 'pc'); 
% dlmwrite('cD.txt',cD,'newline', 'pc');
