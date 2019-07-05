function [X]=Generate_Linear_System_Data(Lambda,xo,Num_Monomials,Final_Time,delt)
time=0:delt:Final_Time;
x=zeros(length(Lambda),length(time));
for t=1:length(time)
x(:,t)=real(exp(Lambda*time(t))*xo);
end
X=[];
for j=1:Num_Monomials
X=[X;x.^j];
end
end