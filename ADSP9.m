clc
close all
clear all
M=input('M = ');
Fs=1000;
t=[0:1/Fs:1];
del=0.001;
I=ones(1,M);
P=del*I;
w0=0.001;  phi=0.1;
d=sin(2*pi*16*t);
x=d+randn(size(M));
w=zeros(1,M); 
for i=1:M
   y(i) = w(i)' * x(i);
   e(i) = d(i) - y(i)';
   z(i) = P(i) * x(i);
   q = x(i)' * z(i);
   v = 1/(1+q);
   zz(i) = v * z(i);
   w(i+1) = w(i) + e(i)*zz(i);
   P(i+1) = P(i) - zz(i)*z(i);
end
for i=1:M
yd(i) = y(i)  
end
subplot(221),plot(d),title('Desired Signal'),
subplot(222),plot(x),title('Input Signal+Noise'),
subplot(223),plot(e),title('Error'),
subplot(224),plot(yd),title(' Desired output');