
clc;
jpgFiles = dir('*.jpg');
for j = 1:length(jpgFiles)
filename = jpgFiles(j).name;
I = imread(filename);
[qq,qw,qv,qh]=edge(I,'sobel');
ve=imresize(qv,.5);
ho=imresize(qh,.5);
vertical=reshape(ve,1,196);
horizontal=reshape(ho,1,196);
[gw,gt,g45,g135]=edge(I,'roberts');
di=imresize(g45,.5);
andi=imresize(g135,.5);
diagonal=reshape(di,1,196);
antidiagonal=reshape(andi,1,196);
dlmwrite('vertical.txt',vertical,'-append','newline', 'pc');
dlmwrite('horizontal.txt',horizontal,'-append','newline', 'pc');
dlmwrite('diagonal.txt',diagonal,'-append','newline', 'pc');
dlmwrite('antidiagonal.txt',antidiagonal,'-append','newline', 'pc');
end