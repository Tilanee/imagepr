clc
clear
close all

%construct binary image using roipoly
I=zeros(256,256);
M1=roipoly(I);
%M2=roipoly(I);
%M3=roipoly(I);
I=M1; 
subplot(1,2,1);imshow(I);

%create an output image of all zeros & one seed point
Ioutput=zeros(256,256);
Ioutput(129,129)=1;  

%create an structural element
ker=strel('square',3);
flag=1;
while (flag~=0)
    Id=imdilate(Ioutput,ker);
    Id=Id & I;
    flag=nnz(Id-Ioutput);
    Ioutput=Id;  
end

subplot(1,2,2);imshow(Ioutput);
