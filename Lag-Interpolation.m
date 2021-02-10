%lagrange interpolation
clc;
clear all;
close all;
Fs=50;
L=input('enter the value of upsampling factor');%defined upsampling and downsampling factor , order
M=input('enter the value of Downsampling factor');
order=2;

%x=1:7; 
t=0:1/Fs:1;
x=sin(2*pi*4*t);%define input signal
N=fix(length(x)*(L/M));
H=zeros(L,order); 
Ft=(L/M)*Fs;
alpha =M/L;


for k=0:order
    j=1;
    for a1=0:alpha:M-alpha
        t1=1;
        for l=0:order
            if(l~=k)
                t1=t1*((a1-l)/(k-l));%Lagrange polynomial implimentation
            end
        end
        H(j,k+1)=t1;
        j=j+1;
    end
end

%Interpolation
y=[];
 for s=1:1:fix(N/L)
     yt=zeros(L,1);
     xt=x((s-1)*M+1:1:(s-1)*M+3)';
     yt=H*xt
     y=[y;yt]
 end
 figure
 subplot(211),stem(x),title('Original Signal')
 %t2=linspace(0,1,length(y));
 subplot(212),stem(y),title('Lagrange Interpolation output')
 
    






        
        
        
            
            
    
    
    
    
    
    
    
    
    
    
    
    
    
