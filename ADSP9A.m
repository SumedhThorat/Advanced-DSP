clc;
clear all;
close all;
t=0.001:0.001:1
d=2*sin(2*pi*50*t);%desired signal
v=randn(size(d));%noise signal
u=d+v;%input signal
M=10;
w=zeros(M,1);
de=0.001;
p=(1/de)*eye(M);
la=0.97;
y=zeros(length(u),1);
for i=M:length(u)
    k=((1/la)*p*u(i:-1:i-M+1)')/(1+((1/la)*u(i:-1:i-M+1)*p*u(i:-1:i-M+1)'));
    e(i)=d(i)-w'*u(i:-1:i-M+1)';
    w=w+k*e(i);
    p=(1/la)*p-(1/la)*k*u(i:-1:i-M+1)*p;
    y(i)=w'*u(i:-1:i-M+1)'; 
end
subplot(511);plot(d);title('original signal');
subplot(512);plot(u);title('signal with noise');
subplot(513);plot(y);title('filtered output');
subplot(514);plot(e);title('error signal');
subplot(515);stem(w);title('W');