clc;
close all;
clear all;
t=0:(0.0001):1;
dn=2*sin(2*pi*16*t); %desired
N=numel(dn);
un=dn(1:N)+0.5*randn(1,N);%signal with noise
u = 0.01;%step size
M = 10;%filter length
R = [];
r=xcorr(un,un); %
for i=1:1:M
 R(i)=r(N-i+1);
end
p=xcorr(dn,un); 
for i=1:1:M
 P(i)=p(N-i+1);
end
Rn=toeplitz(R); 
Wo=(inv(Rn))*P'; 
w1 = rand(M,1);
w2 = rand(M,1);
w3 = rand(M,1);
w4 = rand(M,1);
y1 = [];
y2 = [];
y3 = [];
y4 = [];
Me1 = [];
Me2 = [];
Me3 = [];
Me4 = [];
for i = M:N
 X = (un(i:-1:(i-M+1)))';
 e1(i) = dn(i) - w1'*X;
 w1 = w1 + (u*X*e1(i));
 y1(i) = w1'*X;
 Me1 = [Me1 immse(w1,Wo)];
end
figure();
subplot(3,2,1),plot(dn);title('desired signal');
subplot(3,2,2),plot(un);title('Signal  with noise');
subplot(3,2,3),plot(y1);title(' output signal');
subplot(3,2,4),plot(e1);title('Error');
subplot(3,2,5),stem(w1);title('W LMS');
subplot(3,2,6),plot(Me1);title('MSE ');
for i = M:N
 X = (un(i:-1:(i-M+1)))';
 e2(i) = dn(i) - w2'*X;
 w2 = w2 + ((u*X*e2(i))/((norm(X))^2)); 
 y2(i) = w2'*X;
 Me2 = [Me2 immse(w2,Wo)];
end
figure();
subplot(3,2,1),plot(dn);title('desired signal');
subplot(3,2,2),plot(un);title('Signal  with noise');
subplot(3,2,3),plot(y2);title('output signal');
subplot(3,2,4),plot(e2);title('Error');
subplot(3,2,5),stem(w2);title('W Normalized LMS');
subplot(3,2,6),plot(Me2);title('MSE ');
for i = M:N
 X = (un(i:-1:(i-M+1)))';
 e3(i) = dn(i) - w3'*X;
 w3 = w3 + (u*sign(X)*sign(e3(i))); 
 y3(i) = w3'*X;
 Me3 = [Me3 immse(w3,Wo)];
end
figure();
subplot(3,2,1),plot(dn);title('desired signal');
subplot(3,2,2),plot(un);title('Signal  with noise');
subplot(3,2,3),plot(y3);title('output signal');
subplot(3,2,4),plot(e3);title('Error');
subplot(3,2,5),stem(w3);title('W Sign Sign LMS');
subplot(3,2,6),plot(Me3);title('MSE ');
for i = M:N
 X = (un(i:-1:(i-M+1)))';
 e4(i) = dn(i) - w4'*X;
 w4 = w4 + (u*X*sign(e4(i))); 
 y4(i) = w4'*X;
 Me4 = [Me4 immse(w4,Wo)];
end
figure();
subplot(3,2,1),plot(dn);title('desired signal');
subplot(3,2,2),plot(un);title('Signal  with noise');
subplot(3,2,3),plot(y4);title(' output signal');
subplot(3,2,4),plot(e4);title('Error');
subplot(3,2,5),stem(w4);title('W Sign Error LMS');
subplot(3,2,6),plot(Me4);title('MSE ');
