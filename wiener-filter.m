clc;
clear all;
close all;

t=0:0.1:50
d=2*sin(2*pi*t)%define desired
v=randn(size(d))% noise
u1=d+v%input signal
M=10%length of filter
R2=xcorr(u1,u1,M-1,'unbiased')%auto correlation matrix
R=zeros(1,M)
R=R2(M:1:2*M-1)
t=toeplitz(R)


P2=xcorr(u1,d,M-1,'unbiased')%cross correlation matrix
P=zeros(1,M)
P=P2(M:1:2*M-1)%P matrix
P1=zeros(M,1)
R1=inv(t)%R inverse
P1=P'
wopt=R1*P1%calculating W_optimum
y=[]
e=[]
for i=M:length(u1)
    u=u1(i:-1:i-M+1)
    y1(i)=wopt'*u'
end
    y2=y1'
    y=[y;y2]
    k=[]
    k=y(1:1:length(u1))
    y0=k'
e=d-y0
subplot(411),plot(d),title('input signal')
subplot(412),plot(u1),title('distorted input signal')
subplot(413),plot(y0),title('filtered output signal')
subplot(414),plot(e),title('noise signal')



