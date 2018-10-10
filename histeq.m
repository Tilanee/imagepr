clc
clear
close all
I = imread('cameraman.tif');
for i=1:256
   P(i)=length(find(I==(i-1)));
   i=i+1;
end
f=imhist(I); 
[x,y]=size(I)
N=x*y;      %num of all pixels
p=f/N; %probability
plot(p) %probabbility density function
prob=zeros(256,1);  %cumilative distribution
for j=1:256
    prob(j)=round(sum(p(1:j))*255);    
end

Iout=zeros(256,256);
for i=1:256
    for j=1:256
        h=I(i,j);
        Iout(i,j)= prob(h+1);
    end
end
Iout = uint8(Iout);

Ie=histeq(I,255);
subplot(3,3,1)
imagesc(I)
axis image
axis off
subplot(3,3,2)
imshow(Iout)
axis image
axis off
subplot(3,3,3)
imagesc(I)
axis image
axis off
subplot(3,3,4)
imhist(I)

subplot(3,3,5)
imhist(Iout)

subplot(3,3,6)
imhist(Ie)

colormap(gray)


        
