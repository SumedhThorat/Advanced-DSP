clc;
clear all;
close all;

A=1;
u=0;
H=1;
Q=10^-6;
xk(1)=-0.1;
Pk(1)=1;
x=-0.37727;%true value
z=x+(0.1)*randn(1,100);

z=z-mean(z)+x;
R=0.01;
for i=2:length(z)
    
    x_=xk(i-1);%estimation
    P_=Pk(i-1)+Q;
    
    K=P_/(P_+R);%correction
    xk(i)=x_+K*(z(i)-x_);
    Pk(i)=(1-K)*P_;
end
figure
plot(x*ones(1,length(xk)),'k'),hold on
plot(xk,'r'),hold on
plot(z,'+')





