%% author: Meghna Kapoor

%Example
%Training network
clc;
clear;
load data.mat
% h=input('enter hidden layer neurons');
net = newff(posn,thn,[24],{'tansig'}); 
%You can increase no of hidden layers
% net=feedforwardnet(20,'trainlm');
net.trainparam.epoch=8000;
net.trainparam.goal=1e-25;
net.trainparam.lr=0.01;
net = train(net,posn,thn);
outputs = net(posn);
errors = outputs - thn;
perf = perform(net,outputs,thn);

%% Generating the angles
a=input('enter the co-ordinates ');
out=net(a');

%% Finding errors
P=forward(out);
b=P(1:3,4);
error=b-a';
disp(error);