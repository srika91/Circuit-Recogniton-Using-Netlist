clc;
jpgFiles = dir('*.jpg');
for i = 1:length(jpgFiles)
filename = jpgFiles(i).name;
I = imread(filename);
p=logical(not(I));

    [x(1,i) y(1,i) z(1,i)]=Zernikmoment(p,10,2);
   
end
  dlmwrite('xmoments10.txt',x, ...
        'newline', 'pc');
     dlmwrite('ymoments10.txt',y, ...
         'newline', 'pc'); 
     % dlmwrite('zmoments.txt',z, ...
       %  'newline', 'pc');
     x=0;y=0;z=0;