%--------------------------Set up Computation-----------------------------%
close all; clear variables; clc;         % Clean Up Workspace
f1=@(x)(sin(3*pi*x(1)));                 % Define Observable 1
f2=@(x)(cos(12*pi*x(1))*cos(2*pi*x(2))); % Define Observable 2
delta=0.17;                              % Set Standard Map Forcing Param.
T=@(x)(Standard_Map(x));                 % Define Standard Map
Num_IC=240;                              % Set # of Intitial Conditions
Num_Iter=300;                            % Set # of Map Iterations
Box_Size=50;                             % Set Box size for 2-func. Approx.
%--------------------------Run Computation--------------------------------%
%--------------------------Generate IC Data-------------------------------%
[IC,x,y]=Generate_Standard_Map_IC(Num_IC,delta);
%--------------------------Compute F_star1--------------------------------%
tic; F_star1=Compute_Time_Avg(IC,f1,T,Num_Iter);
%--------------------------Compute F_star2--------------------------------%
F_star2=Compute_Time_Avg(IC,f2,T,Num_Iter); toc;
%---------------------Compute 2 Function Approx.--------------------------%
[Box]=Compute_2Function_Approximation(F_star1,F_star2,Num_IC);
%------------------------Plot time average--------------------------------%
fig1=figure(1); Plot_Time_Avg(x,y,F_star2,1,1,Num_IC,Num_Iter,fig1);
%------------------Plot 2-function approx and MSP-------------------------%
fig2=figure(2); Plot_2Func_MSP(x,y,F_star1,F_star2,Box,Num_IC,Box_Size,fig2)