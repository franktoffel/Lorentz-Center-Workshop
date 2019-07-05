function [X]=Generate_Linear_System_Data(Lambda,xo,Num_Monomials,Final_Time,delt)
time=0:delt:Final_Time;                   % Create Time Vector
x=zeros(length(Lambda),length(time));     % Allocate Trajectory
for t=1:length(time)                      % For Loop Over Time
x(:,t)=exp(Lambda*time(t))*xo;            % Compute & Store Trajectory
end                                       % End For Loop Over Time
X=[];                                     % Create Empty Data Matrix
for j=1:Num_Monomials                     % For Loop Over Monomial Dim.
X=[X;x.^j];                               % Comptue & Store Data Matrix
end                                       % End For Loop Over Monomial Dim.
end