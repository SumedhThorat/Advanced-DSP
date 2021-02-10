clc; clear all; close all;
Fs=50;t=0:1/Fs:1;
x=fir2(100,[0 0.33 0.33 1],[1 1 0 0]);%define a low pass signsl
subplot(2,1,1),plot(x),title('input')
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
Y=G1+G0;
subplot(2,1,2),plot(Y),title('Output')