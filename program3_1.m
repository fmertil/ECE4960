% Francois Mertil
%Prepare a direct full-matrix solver that has reasonable pivoting 
%checks (use the classnote ill-conditioned matrices for verification).  
%This needs to solve matrices with rank up to 4.

clc;
clear all;
 

%A=[4 4 2; 4  5 3; 2 3 3];
A=creatematrix(4,4)
[P L U]=LUDEC(A)




function A=creatematrix(M,N)
if M~=N
    disp('It should be a square matrix')
M=input ('Enter the number of row of the matrix : \n')
N=input ('Enter the number of column of the matrix : \n')
end 

for i=1:M
    for j=1:N
        fprintf('Enter the element %d row and %d colon : \n', i, j)
        A(i,j)=input (' ')
       
        
    end 
end 
end 


function [ P, L, U ] = LUDEC(A)
 
% Ensures A is n by n
sz = size(A);
if sz(1)~=sz(2)
    fprintf('A is not n by n\n');
    clear x;
    return;
end
 
n = sz(1);
L = eye(n);
P = eye(n);
U = A;
 
for i=1:sz(1)
 
    % Row reducing    
    if U(i,i)==0
        maximum = max(abs(U(i:end,1)));
        for k=1:n
           if maximum == abs(U(k,i))
               temp = U(1,:);
               U(1,:) = U(k,:);
               U(k,:) = temp;
 
               temp = P(:,1);
               P(1,:) = P(k,:);
               P(k,:) = temp;
           end
        end
 
    end
 
    if U(i,i)~=1
        temp = eye(n);
        temp(i,i)=U(i,i);
        L = L * temp;
        U(i,:) = U(i,:)/U(i,i); %Ensures the pivots are 1.
    end
 
    if i~=sz(1)
 
        for j=i+1:length(U)
            temp = eye(n);
            temp(j,i) = U(j,i);
            L = L * temp;
            U(j,:) = U(j,:)-U(j,i)*U(i,:);
 
        end
    end
 
 
end
P = P';
end