 clc;
 clear all;
 close all;

 
% Fs=50;
% t=0:1/Fs:1;
%x=2*sin(2*pi*16*t);
x=fir2(100,[0 0.33 0.33 1],[1 1 0 0]);
num1=[0.10557281 0 1];
den1=[1 0 0.10557281];

% second branch
x1=[];
x1=[0 x(1:length(x)-1)];

num2=[0.527864045 0 1];
%den2=[1 0 0.527864045];
den2=[0.527864045 0 1]
% down 1st branch
% L=2;
% Q0=[];
% for i=1:length(x)/L
%     Q0(i)=x(i*L);
% end
Q0=downsample(x,2)
% down 2nd branch
% L=2;
% Q1=[];
% for i=1:length(x1)/L
%     Q1(i)=x1(i*L);
% end
Q1=downsample(x1,2)
 u0=filter(num1,den1,Q0);
 u1=filter(num2,den2,Q1);
 v0=filter(num2,den2,u0);
 v1=filter(num1,den1,u1);
 
 
 L=2;
%  P0=[];
%  for i=1:length(v0)
%      P0=[P0 v0(i) zeros(1,L-1)];
%  end
P0=upsample(v0,2);

%  L=2;
%  P1=[];
%  for i=1:length(v1)
%      P1=[P1 v1(i) zeros(1,L-1)];
%  end
 P1=upsample(v1,2);
 x0=[0 P0(1:length(P0)-1)];
 
 
 y=x0+P1;
 subplot(211),plot(x)
 subplot(212),plot(y)
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
% %x=(1/4)*fir2(100,[0 0.33 0.33 1],[1 1 0 0]);
% Fs=32000;
% t=0:1/Fs:2;
% x=2*sin(2*pi*4*t);
% subplot(2,1,1),plot(x)
% %plot(x)
% % [H1,W1]=freqz(x,1,'whole',100);
% % subplot(2,1,1),plot(W1/pi,abs(H1)),title('Input signal')
% num1=[0.10557281,1];
% den1=[1,0.10557281];
% 
% num2=[0.527864045,1];
% den2=[1,0.527864045];

% q=downsample(x,2);
% A0=filter(num1,den1,q);
% 
% 
%  A1=filter(num2,den2,q);
%  
%  B0=A0+A1;
%  C0=filter(num2,den2,B0);
%  Y1=upsample(C0,2);
%  
% Y1=upsample(A1,2);
% A2=filter(num2,den2,q);
% A3=filter(num2,den2,A2);
% Y2=upsample(A3,2);
% 
% B1=A0-A1;
% C1=filter(num1,den1,B1);
% Y2=upsample(C1,2);
%  
%  
% % B1=A0-A1;
% % B2=A1-A0;
% % 
% % C0=filter()
% 
% 
% 
% % 
% %  A1=filter(num2,den2,A0);
% % 
% %  Y1=upsample(A1,2);
% %  A2=filter(num2,den2,q);
% %  A3=filter(num1,den1,A2);
% %  Y2=upsample(A3,2);
% 
% Y=Y1+Y2;
% subplot(2,1,2),plot(Y)
% % [H2,W2]=freqz(Y,1,'whole',100);
% % subplot(2,1,2),plot(W2/pi,abs(H2)),title('output signal')