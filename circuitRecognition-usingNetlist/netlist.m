clc;
clear all;
downnode=csvread('mergeddownnode.txt');
upnode=csvread('mergedupnode.txt');
leftnode=csvread('mergedleftnode.txt');
rightnode=csvread('mergedrightnode.txt');
obleft=csvread('leftobj.txt');
obup=csvread('upobj.txt');
for i=1:1:length(leftnode)
    a=[leftnode(i) rightnode(i) obleft(i,:)];
    a(a==0)=[];
    dlmwrite('netlist.txt',a,'-append', ...
              'newline', 'pc');
end
for i=1:1:length(upnode)
    a=[upnode(i) downnode(i) obup(i,:)];
    a(a==0)=[];
    dlmwrite('netlist.txt',a,'-append', ...
              'newline', 'pc');
end