clc;
clear all;
close all;
%part A
%x=fir2(100, [0 0.45 0.45 1], [1 1 0 0]); %generating input
Fs=50;
t=0:1/Fs:1;
x=sin(2*pi*4*t);
%[H1,W1]=freqz(x,1,'whole',100);
% plot(W1/pi,abs(H1))
% H0=(1/sqrt(2))*(1+z^(-1));
% H1=zeros(ceil(length(x)));

num1=[1 1];
den=[sqrt(2) 0];
H0=filter(num1,den,x);
%plot(H0)
V1=downsample(H0,2);
%plot(V1)
V2=upsample(V1,2);
%plot(V2)
G0=filter(num1,den,V2);
% [H1,W1]=freqz(G0,1,'whole',100);
% plot(W1/pi,abs(H1))
num2=[1 -1];
num3=[-1 1];

H1=filter(num2,den,x);
V3=downsample(H1,2);
V4=upsample(V3,2);
G1=filter(num3,den,V4);
Y=G1+G2;
plot(Y)






