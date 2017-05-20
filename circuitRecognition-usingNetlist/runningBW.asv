clc;

for i=1:1:980
zero1(i)=0;
end
for i=1:1:1135
one1(i)=1;
end

for i=1:1:1032
two1(i)=2;
end

for i=1:1:1010
three1(i)=3;
end
for i=1:1:982
four1(i)=4;
end
for i=1:1:892
five1(i)=5;
end



for i=1:1:958
six1(i)=6;
end

for i=1:1:1028
seven1(i)=7;
end
for i=1:1:974
eight1(i)=8;
end

for i=1:1:1009
nine1(i)=9;
end
testlabel=[zero1';one1';two1';three1';four1';five1';six1';seven1';eight1';nine1'];
test=csvread('testHVPP.txt');
train=csvread('trainHVPP.txt');
trainlabel=csvread('trainlabel.txt');



for i=1:1:795
    predic(i)=knnclassify(test(i,:),train,trainlabel);
end
C=confusionmat(testlabel,predic');
