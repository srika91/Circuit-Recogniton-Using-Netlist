

traina1=csvread('vertical64.txt');
traina2=csvread('vertical100.txt');
traina3=csvread('horizontal64.txt');
traina4=csvread('horizontal100.txt');
traina5=csvread('diagonal64.txt');
traina6=csvread('diagonal100.txt');
traina7=csvread('antidiagonal64.txt');
traina8=csvread('antidiagonal100.txt');
traina9=csvread('VPPTHIN64.txt');
traina10=csvread('VPPTHIN28.txt');
traina11=csvread('VPPTHIN100.txt');
traina12=csvread('HPPTHIN64.txt');
traina13=csvread('HPPTHIN28.txt');
traina14=csvread('HPPTHIN100.txt');
traina15=csvread('coodbinaryTHIn.txt');
train28=[train10 train13];
train64=[train9 train12];
train100=[train11 train14];
train64LOCAL=[train1 train3 train5 train7];
train100LOCAL=[train2 train4 train6 train8];

test=csvread('testHVPP.txt');
train=csvread('trainHVPP.txt');
trainlabel=csvread('trainlabel.txt');



for i=1:1:795
    predic(i)=knnclassify(test(i,:),train,trainlabel);
end
C=confusionmat(testlabel,predic');

