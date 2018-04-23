for i=2:9
    e(i-1)=10^-i;
    format long
    
end
for j=1:8
matrix=[100 99; 99 98.01-e(j)];
b=[199;197];
sol(:)=matrix \ b;
x(j)=sol(1);
y(j)=sol(2);
z(:)=matrix*[x(j) y(j)]'-b
X(j)=z(1);
Y(j)=z(2);
Z(:)=[X(j) Y(j)];
mnorm(j)=max(svd(Z));
end
y=y';
second_norm=mnorm'
table(x, y, second_norm)