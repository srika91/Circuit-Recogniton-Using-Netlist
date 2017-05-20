clc;
clear all;


 jpgFiles = dir('*.jpg');
  
for k = 1:length(jpgFiles)
filename = jpgFiles(k).name;
a = imread(filename);
a=im2bw(a);
a=imresize(a,[20,20],'bilinear');
aa=zeros(28,28);
for i=1:1:20
for j=1:1:20
if(a(i,j)==1)
aa(i+4,j+4)=1;
end
end
end

 %new_frame = aa; % i assume...
  
   imwrite( aa,sprintf('1(%d).jpg',k));
end
