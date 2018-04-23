% Francois Mertil

clc;
clear all;
n=input ('Enter the dimension of the matrix : \n')

for i=1:n
    for j=1:n
        fprintf('Enter the element %d row and %d colon : \n', i, j)
        A(i,j)=input (' ')
       
        
    end 
end 
fprintf('The first norm is : %d',  norm_1(A))
fprintf('The infinite norm is : %d', norm_inf(A))

function x=norm_1(A)
x=max(sum(abs(A)))
end 



function y=norm_inf(A)
y=max(sum(abs(A')))
end 