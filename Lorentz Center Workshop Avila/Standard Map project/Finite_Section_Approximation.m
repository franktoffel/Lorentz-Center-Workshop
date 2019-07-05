%--------------------------Set up Computation-----------------------------%
close all; clear variables; clc;    % Clean Up Workspace
f=@(x)(cos(2*pi*(x(1)+x(2))));      % Define Observable 
delta=0.17;                         % Set Standard Map Forcing Paramter
T=@(x)(Standard_Map(x));            % Define Standard Map
Num_IC=400;                         % Set # of Total Intitial Conditions
Num_Iter=200;                       % Set # of Total Map Iterations
Num_Eigenfunctions=6;               % Set # of Eigenfunctions to Plot
%--------------------------Run Computation--------------------------------%
%--------------------------Generate IC Data-------------------------------%
[IC,x,y]=Generate_Standard_Map_IC(Num_IC,delta);
%---------------------Generate Finite Section Data------------------------%
[FK,FK2]=Generate_Krylov_Finite_Section_Data(IC,f,T,Num_IC,Num_Iter);
%-----------------------Compute Finite Section----------------------------%
[EigenfunctionsK,LambdaK]=Compute_Finite_Section(FK,FK2);
%-----------------------Plot the main eigenfunctions----------------------%
Plot_Finite_Section(x,y,EigenfunctionsK,LambdaK,Num_Eigenfunctions)




