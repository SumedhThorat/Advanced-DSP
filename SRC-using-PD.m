clc;
clear all;
close all;
L=2;
M=3; 
Fs=32000;
t=0:1/Fs:2;

%x=2*sin(2*pi*16*t)+4*sin(2*pi*16*t)+2*randn(1,length(t));%generated signal with random noise
x=2*sin(2*pi*8*t);

%generating LPF of cut off pi/3
h=L*fir2(100,[0 0.33 0.33 1],[1 1 0 0]);
%[H1,W1]=freqz(h,1,'whole',100);
%plot(W1/pi,abs(H1));
x=filtfilt(h,1,x);
%[H2,W2]=freqz(x,1,'whole',100);
%plot(W2/pi,abs(H2));

%filter for L branch
tic
F1=zeros(L,ceil(length(h)/L));

for i=1:L
    temp=h(i:L:end);
    F1(i,1:length(temp))=temp;
end

%[H2,W2]=freqz(temp,1,'whole',100);
%plot(W2/pi,abs(H2));

%signal for L branches
for i=1:L
    X1(i,:)=[zeros(1,L-i) x(1:length(x)-(L-i))];
end
%plot(Xl)

%filter for M branches
for j=1:L
    F2=zeros(M,ceil(length(F1(j,:))/M));

  for k=1:M
      temp=F1(j,k:M:end);
      F2(k,1:length(temp))=temp;
  end
  %design signal for M branches
  for k=1:M
      X2(k,:)=[zeros(1,k-1) X1(j,1:length(x)-(k-1))];
  end
  %downsampled signal in M branches
  for k=1:M
      Xd(k,:)=X2(k,1:M:end);
  end
  %passing down sampled signal through a filter
  for k=1:M
       Yd(k,:) =filtfilt(F2(k,:),1,Xd(k,:));
  end
  %upsampling the filtered signal by factor of L
  Y=upsample(sum(Yd),L);
  Yo(j,:)=[zeros(1,j-1) Y(1:length(Y)-(j-1))];
end
Yo=sum(Yo);
toc
%plot(Yo)

tic
A=upsample(x,L);
B=filtfilt(h,1,A);
C=downsample(B,M);
toc
figure
subplot(3,1,1),plot(x),title('input')
subplot(3,1,2),plot(Yo);title('output by PD')
subplot(3,1,3),plot(C);title('output by Regular method')


    
      
  
      
    





