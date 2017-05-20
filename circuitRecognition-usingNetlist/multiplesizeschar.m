
clc;
jpegfiles=dir('*.jpg');
for j=1:1:length(jpegfiles)
    i1=imread(jpegfiles(j).name);
    a2=imresize(i1,[100 100],'bilinear');
    a3=imresize(i1,[64 64],'bilinear');
    a4=imresize(i1,[80 80],'bilinear');
    a5=imresize(i1,[128 128],'bilinear');
    imwrite( a2,sprintf('s100(%d).jpg',i));
imwrite( a3,sprintf('s64(%d).jpg',i));
imwrite( a4,sprintf('s80(%d).jpg',i));
imwrite( a5,sprintf('s128(%d).jpg',i));
end