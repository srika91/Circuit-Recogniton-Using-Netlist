clc;
clear all;
%testlabel=[zero1';one1';two1';three1';four1';five1';six1';seven1';eight1';nine1'];
test=csvread('testlocalgray.txt');
train=csvread('voltage\train 8\coodbinary.txt');
trainlabel1=csvread('trainlabel.txt');
%trainlabel1=csvread('trainlabel.txt');

fid=fopen('trainingalphaun.txt');
testlabel2=fread(fid);
testlabel1=csvread('trainlabel.txt');

fid=fopen('alphaun.txt');
testlabel2=fread(fid);
%testlabel2=f('trainlabel.txt');


for i=1:1:905
    predic(i)=knnclassify(test(i,:),train,trainlabel);
end
C=confusionmat(testlabel,predic');
