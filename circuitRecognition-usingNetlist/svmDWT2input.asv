clc;
clear all;


 jpgFiles = dir('*.jpg')
  
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
a = imread(filename);

%    [C,S] = wavedec2(a,1,'db2');
%[cA,cH,cV,cD] = dwt2(a,'haar');
%A= appcoef2(C,S,'db2',1);
%[x,y]=size(A);
%vv(1,:)=A(:);

% dlmwrite('A.txt',vv,'-append','newline', 'pc');
%  dlmwrite('Cvalues.txt',C','-append','newline', 'pc'); 
%    
n=10;
m=4;
p=logical(not(a));
[x(i) y(i) z(i)]=Zernikmoment(p,n,m);
end
dlmwrite('xmoments.txt',x, ...
         'newline', 'pc');
dlmwrite('ymoments.txt',y, ...
         'newline', 'pc');   
%       dlmwrite('cA.txt',cA,'newline', 'pc');
% 
% dlmwrite('cH.txt',cH,'newline', 'pc'); 
% dlmwrite('cV.txt',cV,'newline', 'pc'); 
% dlmwrite('cD.txt',cD,'newline', 'pc');
