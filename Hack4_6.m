% Francois Mertil

clc;
clear all;
%creatematrix(2,3)

a=[-4 1 0 0 1;4 -4 1 0 0;0 1 -4 1 0;0 0 1 -4 1;1 0 0  1 -4];
b=[1;0;0;0;0];
n = length(b);
%D=diag(diag(a))
D=a
for p=1:n
    for q=1:n
        if p~=q
            D(p,q)=0;
            
        end
    end
end
     
x = inv(D)*b;
xnew = zeros(n,1);



iterlimit = 100;
tol = 0.0000001;

for iteration = 1 : iterlimit
  convergence = true;
  for i = 1 : n  % loop of equations
    Sum = 0;
    for j = 1 : n %loop of summation
      if j ~= i
        Sum = Sum + a(i,j)*x(j);
      end
    end
    xnew(i) = -1/a(i,i) * (Sum - b(i));
    norm2(iterlimit)=max(svd(xnew));
    if abs(xnew(i) - x(i)) > tol
      convergence = false;
    end
  end
  if convergence
    break
  end
  x = xnew;
  iteration=iteration+1;
end
disp('iterations')
iteration
disp('solution')
xnew

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