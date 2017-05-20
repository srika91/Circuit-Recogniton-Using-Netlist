%-- Unknown date --%
svm(trainA,group,testA(40,:))
[m]=multisvm(trainA,group,testA(41,:))
[m]=multisvm(trainA,group,testA(42,:))
[m]=multisvm(trainA,group,testA(43,:))
[m]=multisvm(trainA,group,testA(44,:))
[m]=multisvm(trainA,group,testA(45,:))
[m]=multisvm(trainA,group,testA(46,:))
[m]=multisvm(trainA,group,testA(47,:))
[m]=multisvm(trainA,group,testA(49,:))
[m]=multisvm(trainA,group,testA(50,:))
[m]=multisvm(trainA,group,testA(51,:))
[m]=multisvm(trainA,group,testA(52,:))
[m]=multisvm(trainA,group,testA(53,:))
[m]=multisvm(trainA,group,testA(54,:))
[m]=multisvm(trainA,group,testA(55,:))
[m]=multisvm(trainA,group,testA(56,:))
[m]=multisvm(trainA,group,testA(57,:))
[m]=multisvm(trainA,group,testA(58,:))
[m]=multisvm(trainA,group,testA(59,:))
[m]=multisvm(trainA,group,testA(60,:))
[m]=multisvm(trainA,group,testA(61,:))
for i=1:1:1600
a(i)=1;
end
size(a)
for i=1:1:1600
a(1,i)=1;
end
size(a)
for i=1:1:1600
a2(1,i)=1;
end
size(a2)
for i=1:1:1600
end
%-- 2/7/13  9:15 AM --%
ohmtrainC=csvread('Ohm\Cvalues.txt');
ohmtrainA=csvread('Ohm\A.txt');
mutrainC=csvread('Mu\Cvalues.txt');
mutrainA=csvread('Mu\A.txt');
FtrainA=csvread('F\A.txt');
FtrainC=csvread('F\Cvalues.txt');
FtestC=csvread('Ftest\Cvalues.txt');
FtestA=csvread('Ftest\A.txt');
mutestA=csvread('mutest\A.txt');
mutestC=csvread('mutest\Cvalues.txt');
ohmtestA=csvread('ohmtest\A.txt');
ohmtestC=csvread('ohmtest\Cvalues.txt');
trainA=[ohmtrainA;mutrainA;FtrainA];
testA=[ohmtestA;mutestA;FtestA];
group=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3];
size(group)
[m]=multisvm(trainA,group,testA(1,1));
[m]=multisvm(trainA,group,testA(1,:));
[m]=multisvm(trainA,group,testA(55,:));
m
[m]=multisvm(trainA,group,testA(2,:));
[m]=multisvm(trainA,group,testA(2,:))
[m]=multisvm(trainA,group,testA(3,:))
[m]=multisvm(trainA,group,testA(4,:))
[m]=multisvm(trainA,group,testA(14,:))
[m]=multisvm(trainA,group,testA(8,:))
[m]=multisvm(trainA,group,testA(10,:))
[m]=multisvm(trainA,group,testA(11,:))
[m]=multisvm(trainA,group,testA(12,:))
[m]=multisvm(trainA,group,testA(13,:))
[m]=multisvm(trainA,group,testA(14,:))
[m]=multisvm(trainA,group,testA(15,:))
[m]=multisvm(trainA,group,testA(16,:))
[m]=multisvm(trainA,group,testA(17,:))
[m]=multisvm(trainA,group,testA(18,:))
[m]=multisvm(trainA,group,testA(19,:))
[m]=multisvm(trainA,group,testA(20,:))
[m]=multisvm(trainA,group,testA(21,:))
[m]=multisvm(trainA,group,testA(22,:))
[m]=multisvm(trainA,group,testA(23,:))
[m]=multisvm(trainA,group,testA(24,:))
[m]=multisvm(trainA,group,testA(25,:))
[m]=multisvm(trainA,group,testA(26,:))
[m]=multisvm(trainA,group,testA(27,:))
[m]=multisvm(trainA,group,testA(28,:))
[m]=multisvm(trainA,group,testA(29,:))
[m]=multisvm(trainA,group,testA(30,:))
[m]=multisvm(trainA,group,testA(31,:))
[m]=multisvm(trainA,group,testA(32,:))
[m]=multisvm(trainA,group,testA(33,:))
[m]=multisvm(trainA,group,testA(34,:))
[m]=multisvm(trainA,group,testA(35,:))
[m]=multisvm(trainA,group,testA(36,:))
[m]=multisvm(trainA,group,testA(37,:))
[m]=multisvm(trainA,group,testA(39,:))
[m]=multisvm(trainA,group,testA(38,:))
[m]=multisvm(trainA,group,testA(40,:))
[m]=multisvm(trainA,group,testA(41,:))
[m]=multisvm(trainA,group,testA(42,:))
[m]=multisvm(trainA,group,testA(43,:))
[m]=multisvm(trainA,group,testA(44,:))
[m]=multisvm(trainA,group,testA(45,:))
[m]=multisvm(trainA,group,testA(46,:))
[m]=multisvm(trainA,group,testA(49,:))
[m]=multisvm(trainA,group,testA(50,:))
[m]=multisvm(trainA,group,testA(51,:))
[m]=multisvm(trainA,group,testA(52,:))
[m]=multisvm(trainA,group,testA(53,:))
[m]=multisvm(trainA,group,testA(54,:))
[m]=multisvm(trainA,group,testA(55,:))
[m]=multisvm(trainA,group,testA(56,:))
[m]=multisvm(trainA,group,testA(57,:))
[m]=multisvm(trainA,group,testA(58,:))
[m]=multisvm(trainA,group,testA(59,:))
[m]=multisvm(trainA,group,testA(60,:))
a=imread('Ohm\ohm3105_1.jpg');
imshow(a)
[C,S] = wavedec2(a,1,'haar')
A = appcoef2(C,S,'haar',1)
imshow(A);
imshow(uint8(A));
[C,S] = wavedec2(a,1,'db2')
A = appcoef2(C,S,'db2',1)
imshow(uint8(A));
size(ohmtestA)
size(mutestA)
size(FtestA)
m=csvread('A.txt');
mm=mat2vec(m);
vv=m(:)
m=csvread{'A.txt')
m=csvread('A.txt')
size(m)
mm=csvread('A.txt');
size(mm)
group=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 ];
ohmtrainC=csvread('Ohm\Cvalues.txt');
ohmtrainA=csvread('Ohm\A.txt');
size(ohmtrainA)
mutrainA=csvread('Mu\A.txt');
mutestA=csvread('mutest\A.txt');
ohmtestA=csvread('ohmtest\A.txt');
trainA=[ohmtrainA;mutrainA];
size(trainA)
size(mutrainA)
testA=[ohmtestA;mutestA];
size(testA)
group=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
find(group==1)
find(group==2)
group=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2];
size(group)
[m]=multisvm(trainA,group,testA(3,:))
testA(3,:)
qq=testA(3,:);
[m]=multisvm(trainA,group,qq)
[m]=multisvm(trainA,group,qq')
SVMStruct = svmtrain(trainA, group);
Group = svmclassify(SVMStruct,testA(3,:))
Group = svmclassify(SVMStruct,testA(1,:))
Group = svmclassify(SVMStruct,testA(2,:))
Group = svmclassify(SVMStruct,testA(3,:))
Group = svmclassify(SVMStruct,testA(4,:))
Group = svmclassify(SVMStruct,testA(5,:))
Group = svmclassify(SVMStruct,testA(6,:))
Group = svmclassify(SVMStruct,testA(9,:))
Group = svmclassify(SVMStruct,testA(15,:))
Group = svmclassify(SVMStruct,testA(14,:))
Group = svmclassify(SVMStruct,testA(16,:))
Group = svmclassify(SVMStruct,testA(8,:))
Group = svmclassify(SVMStruct,testA(7,:))
Group = svmclassify(SVMStruct,testA(10,:))
Group = svmclassify(SVMStruct,testA(11,:))
Group = svmclassify(SVMStruct,testA(12,:))
Group = svmclassify(SVMStruct,testA(13,:))
Group = svmclassify(SVMStruct,testA(14,:))
Group = svmclassify(SVMStruct,testA(15,:))
FtestA=csvread('Ftest\A.txt');
FtrainA=csvread('F\A.txt');
testA=[ohmtestA;mutestA];
testA=[ohmtestA;mutestA;FtestA];
mutestA=csvread('mutest\A.txt');
ohmtestA=csvread('ohmtest\A.txt');
testA=[ohmtestA;mutestA;FtestA];
FtrainA=csvread('F\A.txt');
FtestA=csvread('Ftest\A.txt');
testA=[ohmtestA;mutestA;FtestA];
ohmtrainC=csvread('Ohm\Cvalues.txt');
ohmtrainA=csvread('Ohm\A.txt');
mutrainA=csvread('Mu\A.txt');
trainA=[ohmtrainA;mutrainA;FtrainA];
size(FtrainA)
group=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3];
find(group==3)
[m]=multisvm(trainA,group,testA(17,:))
[m]=multisvm(trainA,group,testA(18,:))
[m]=multisvm(trainA,group,testA(21,:))
[m]=multisvm(trainA,group,testA(14,:))
[m]=multisvm(trainA,group,testA(1,:))
size(trainA)
size(testA)
Class = knnclassify(testA(22,:), trainA,group)
Class = knnclassify(testA(23,:), trainA,group)
Class = knnclassify(testA(3,:), trainA,group)
Class = knnclassify(testA(13,:), trainA,group)
Class = knnclassify(testA(16,:), trainA,group)
Class = knnclassify(testA(23,:), trainA,group)
Class = knnclassify(testA(10,:), trainA,group)
Class = knnclassify(testA(8,:), trainA,group)
Class = knnclassify(testA(9,:), trainA,group)
%-- 2/7/13 12:13 PM --%
imshow(i45);
imshow(i5);
imshow(i7);
imwrite(i5,'i5.jpg');