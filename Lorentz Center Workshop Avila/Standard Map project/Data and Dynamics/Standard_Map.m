function X=Standard_Map(x)
X(1)=mod(x(1)+x(2)+x(3)*sin(2*pi*x(1)),1);
X(2)=mod(x(2)+x(3)*sin(2*pi*x(1)),1);
X(3)=x(3);
end