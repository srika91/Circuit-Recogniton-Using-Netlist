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

dlmwrite('A.txt',vv,'-append','newline', 'pc');
 dlmwrite('Cvalues.txt',C','-append','newline', 'pc'); 
   
end
FtestA=csvread('Ftest\A.txt');
KtestA=csvread('Ktest\A.txt');
% ohmtestA=csvread('ohmtest\A.txt');
% mutestA=csvread('mutest\A.txt');
% HtestA=csvread('Htest\A.txt');
% ntestA=csvread('ntest\A.txt');

%  ohmtrainA=csvread('Ohm\A.txt');
% mutrainA=csvread('Mu\A.txt');
FtrainA=csvread('F\A.txt');
%HtrainA=csvread('H\A.txt');
KtrainA=csvread('K\A.txt');
%ntrainA=csvread('n\A.txt');
%mtrainA=csvread('m\A.txt');
trainA=[ohmtrainA;mutrainA;FtrainA;HtrainA;KtrainA;ntrainA;mtrainA];
testA=[ohmtestA;mutestA;FtestA;HtestA;KtestA;ntestA];
trainA=[FtrainA;KtrainA;];
testA=[FtestA;KtestA];
% a1=size(ntrainA);
% b1=size(mutrainA);
%c1=size(HtrainA);
d1=size(KtrainA);
%e1=size(OhmtrainA);
%f1=size(mtrainA);
g1=size(FtrainA);
% for i=1:1:a1
% aa(i)=1;
% end
% for i=1:1:b1
% bb(i)=2;
% end
% for i=1:1:c1
% cc(i)=3;
% end
for i=1:1:d1
dd(i)=4;
end
% for i=1:1:e1
% ee(i)=5;
% end
% for i=1:1:f1
% ff(i)=6;
% end

for i=1:1:g1
gg(i)=7;

end
%group=[aa bb cc dd ee ff gg];
group=[dd gg];