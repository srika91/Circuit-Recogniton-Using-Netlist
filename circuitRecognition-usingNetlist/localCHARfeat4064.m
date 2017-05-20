
clc;
jpgFiles = dir('*.jpg');
for j = 1:length(jpgFiles)
filename = jpgFiles(j).name;
I = imread(filename);
I40=imresize(I,[40 nan]);
I64=imresize(I,[64 nan]);

%[qq,qw,qv,qh]=edge(I,'sobel');
[qq,qw,qv,qh]=edge(I40,'sobel');
[zq,zw,zv,zh]=edge(I64,'sobel');
% ve64=imresize(qv,[64 nan]);
% ho64=imresize(qh,[64 nan]);
% 
% ve40=imresize(qv,[40 nan]);
% ho40=imresize(qh,[40 nan]);

vertical64=reshape(zv,1,4096);
horizontal64=reshape(zh,1,4096);
vertical40=reshape(qv,1,1600);
horizontal40=reshape(qh,1,1600);
[gw,gt,g45,g135]=edge(I40,'roberts');
[aw,at,a45,a135]=edge(I64,'roberts');
% di=imresize(g45,.5);
% andi=imresize(g135,.5);
diagonal40=reshape(di,1,1600);
antidiagonal40=reshape(andi,1,1600);
diagonal64=reshape(di,1,4096);
antidiagonal64=reshape(andi,1,4096);
dlmwrite('vertical40.txt',vertical,'-append','newline', 'pc');
dlmwrite('horizontal4.txt',horizontal,'-append','newline', 'pc');
dlmwrite('diagonal.txt',diagonal,'-append','newline', 'pc');
dlmwrite('antidiagonal.txt',antidiagonal,'-append','newline', 'pc');
dlmwrite('vertical.txt',vertical,'-append','newline', 'pc');
dlmwrite('horizontal.txt',horizontal,'-append','newline', 'pc');
dlmwrite('diagonal.txt',diagonal,'-append','newline', 'pc');
dlmwrite('antidiagonal.txt',antidiagonal,'-append','newline', 'pc');
end