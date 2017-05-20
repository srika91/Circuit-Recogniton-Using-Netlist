clc;
clear all;

 jpgFiles = dir('*.jpg');
  
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
a = imread(filename);
a1=im2bw(a);
% q=zeros(400);
% w=zeros(400);
% 
% [q1,w1]=find(a1==1);
% qq=size(q1);
% ww=size(w1);
% q=q1;
% w=w1;
% for i=qq+1:1:400
%     q(i)=0;
% end
% 
% for i=qq+1:1:400
%     w(i)=0;
% end
r(1,:)=a1(:);    
% vv=[q' w'];
% dlmwrite('coordinates.txt',vv,'-append','newline', 'pc');
dlmwrite('coodbinary.txt',r,'-append','newline', 'pc');
end

    
    
 