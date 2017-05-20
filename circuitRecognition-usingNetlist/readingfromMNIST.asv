fid = fopen('C:\Users\kalki\Documents\MATLAB\templatesdatabase\database\t10k-images.idx3-ubyte', 'r');
magicnumber = fread(fid, 1, 'int32', 'ieee-be');
numimages   = fread(fid, 1, 'int32', 'ieee-be')
numrows     = fread(fid, 1, 'int32', 'ieee-be')
numcols     = fread(fid, 1, 'int32', 'ieee-be')


imsvec      = fread(fid, 'uchar');
digitims    = reshape(imsvec, [numrows numcols numimages]);

for k = 1:numimages;
    digitims(:, :, k) = squeeze(digitims(:, :, k)>0)';
 
end
fclose(fid);

fid = fopen('C:\Users\kalki\Documents\MATLAB\templatesdatabase\database\t10k-labels.idx1-ubyte', 'r');
magicnumber = fread(fid, 1, 'int32', 'ieee-be');
numitems    = fread(fid, 1, 'int32', 'ieee-be');
digitlabels = fread(fid, 'uchar');
for i=1:1:length(digitlabels)
    dlmwrite('labels.txt',digitlabels(i),'-append','newline', 'pc');

end
fclose(fid);
xx=find(digitlabels==1);
for i=1:1:length(xx)
    imwrite(digitims(:, :,xx(i)) ,sprintf('1(%d).jpg',i));
end
xx1=find(digitlabels==0);
for i=1:1:length(xx1)
    imwrite(digitims(:, :,xx1(i)) ,sprintf('0(%d).jpg',i));
end
xx2=find(digitlabels==2);
for i=1:1:length(xx2)
    imwrite(digitims(:, :,xx2(i)) ,sprintf('2(%d).jpg',i));
end
xx3=find(digitlabels==3);
for i=1:1:length(xx3)
    imwrite(digitims(:, :,xx3(i)) ,sprintf('3(%d).jpg',i));
end
xx4=find(digitlabels==4);
for i=1:1:length(xx4)
    imwrite(digitims(:, :,xx4(i)) ,sprintf('4(%d).jpg',i));
end
xx5=find(digitlabels==5);
for i=1:1:length(xx5)
    imwrite(digitims(:, :,xx5(i)) ,sprintf('5(%d).jpg',i));
end
xx6=find(digitlabels==6);
for i=1:1:length(xx6)
    imwrite(digitims(:, :,xx6(i)) ,sprintf('6(%d).jpg',i));
end
xx7=find(digitlabels==7);
for i=1:1:length(xx7)
    imwrite(digitims(:, :,xx7(i)) ,sprintf('7(%d).jpg',i));
end
xx8=find(digitlabels==8);
for i=1:1:length(xx8)
    imwrite(digitims(:, :,xx8(i)) ,sprintf('8(%d).jpg',i));
end
xx9=find(digitlabels==9);
for i=1:1:length(xx9)
    imwrite(digitims(:, :,xx9(i)) ,sprintf('9(%d).jpg',i));
end
