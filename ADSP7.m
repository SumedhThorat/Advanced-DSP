clc;
clear all;
close all;

M=10;
Fs=1000;
t=0:1/Fs:1;
d=2*sin(2*pi*16*t);
N=numel(d);
v=0.4*randn(size(t));
u=d+v;
R=xcorr(u,u);
P=xcorr(d,u);
r=[];
p=[];

%weinerfilter method
for i=1:M
    r(i)=R(N-i+1);
    p(i)=P(N-i+1);
end
T=toeplitz(r);
w_opt=(inv(T))*p';
y=zeros(N,1);
for i=M:N
    m=u(i:-1:i-M+1);
    y(i)=(w_opt')*m';
end
e=y'-d;

%steepest descent method
w=zeros(10,1);
ss=0.00001;
for j=1:N
    W=w+ss*(p'-T*w);
    w=W;
end
Y=zeros(N,1);
for i=M:N
    n=u(i:-1:i-M+1);
    Y(i)=(w')*n';
end
E=Y'-d;

figure()
subplot(421),plot(d),title('Original signal')
subplot(422),plot(u),title('Noise corrupted signal')
subplot(423),plot(y),title('weiner filter output')
subplot(424),plot(Y),title('steepest descent output')
subplot(425),plot(e),title('weiner filter error')
subplot(426),plot(E),title('steepest descent error')
subplot(427),stem(w_opt),title('weinner filter ')
subplot(428),stem(w),title('steppest descent op')























