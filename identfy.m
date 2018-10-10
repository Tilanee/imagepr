A=imread('coins.png');%read iamge
Y=im2bw(A,0.38);
[row,col]=find(Y);
[i,j]=size(row);
center=randi(i);
seed=[row(center),col(center)];

Z=zeros(size(Y));

flag=1;
no_objects=0;

while flag~=0
    
    Z=getObject(Y,seed)+Z;
    no_objects=no_objects+1;
    subplot(2,5,no_objects),imagesc(Z);
    flag=nnz(Z-Y);    

if flag~=0  
    [row,col]=find(Y-Z==1);
    seed=[row(1),col(1)];    
end
   display(no_objects); 
    
    
    
end







