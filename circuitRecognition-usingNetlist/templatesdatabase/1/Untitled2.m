trainvpp0=csvread('0\vpp1.txt');
trainhpp0=csvread('0\hpp1.txt');

trainvpp1=csvread('1\vpp1.txt');
trainhpp1=csvread('1\hpp1.txt');
trainvpp2=csvread('2\vpp1.txt');
trainhpp2=csvread('2\hpp1.txt');

trainvpp3=csvread('3\vpp1.txt');
trainhpp3=csvread('3\hpp1.txt');
trainvpp4=csvread('4\vpp1.txt');

trainhpp4=csvread('4\hpp1.txt');
trainvpp5=csvread('5\vpp1.txt');
trainhpp5=csvread('5\hpp1.txt');

trainvpp6=csvread('6\vpp1.txt');
trainhpp6=csvread('6\hpp1.txt');

trainvpp7=csvread('7\vpp1.txt');
trainhpp7=csvread('7\hpp1.txt');

trainvpp8=csvread('8\vpp1.txt');
trainhpp8=csvread('8\hpp1.txt');

trainvpp9=csvread('9\vpp1.txt');
trainhpp9=csvread('9\hpp1.txt');
trainhpp=[trainhpp0;trainhpp1;trainhpp2;trainhpp3;trainhpp4;trainhpp5;trainhpp6;trainhpp7;trainhpp8;trainhpp9];
trainvpp=[trainvpp0;trainvpp1;trainvpp2;trainvpp3;trainvpp4;trainvpp5;trainvpp6;trainvpp7;trainvpp8;trainvpp9];
train=[trainhpp trainvpp];
trainvpp5=csvread('5\vpp1.txt');


traineuler9=csvread('nine\eulernumber9204.txt');
traineuler8=csvread('eight\eulernumber9204.txt');
traineuler7=csvread('seven\eulernumber9204.txt');
traineuler6=csvread('six\eulernumber9204.txt');
traineuler5=csvread('five\eulernumber9204.txt');
traineuler4=csvread('four\eulernumber9204.txt');
traineuler3=csvread('three\eulernumber9204.txt');
traineuler2=csvread('two\eulernumber9204.txt');
traineuler1=csvread('one\eulernumber9204.txt');
traineuler0=csvread('zero\eulernumber9204.txt');


train1=[traineuler0;traineuler1;traineuler2;traineuler3;traineuler4;traineuler5;traineuler6;traineuler7;traineuler8;traineuler9];