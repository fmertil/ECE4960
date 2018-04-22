% Francois Mertil

% creatematrix(5)
% 
% 
% 
% function A=creatematrix(n)
% for i=1:n
%     matrix=zeros(n);
% end 
% end
% 
% function addElement(matrix, n, rowInd, colInd, value)
clc;
clear all;
n=input ('Enter the dimension of the matrix : \n')
counter=0;
k=1;
h=1;
for i=1:n
    for j=1:n
        fprintf('Enter the element %d row and %d colon : \n', i, j)
        A(i,j)=input (' ')
        counter=counter+1;
        
         if A(i,j) ~=0
            
            value(k)=A(i,j)
            rowInd(k)=i
            colInd(k)=j
            k=k+1;
            T=1;
               
 
         end
          
    end

end


for m=1:n
[x y z(m)]=find(A(m,:), 1,'first');

end 


[~,rowPtr]=ismember(z,value) 



