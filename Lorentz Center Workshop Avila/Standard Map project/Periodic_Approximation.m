%--------------------------Set up Computation-----------------------------%
close all; clear variables; clc;    % Clean Up Workspace
f=@(x)(cos(2*pi*(x(1)+x(2))));      % Define Observable 
delta=0.17;                         % Set Standard Map Forcing Paramter
omega=1/2;                          % Set Harmonic Frequency Paramter
T=@(x)(Standard_Map(x));            % Define Standard Map
Num_IC=200;%400                     % Set # of Total Intitial Conditions
Num_Iter=40;%1000                   % Set # of Total Map Iterations
%--------------------------Run Computation--------------------------------%
%--------------------------Generate IC Data-------------------------------%
[IC,x,y]=Generate_Standard_Map_IC(Num_IC,delta);
%--------------------------Compute F_omega--------------------------------%
tic; F_omega=Compute_Harmonic_Avg(IC,f,T,Num_Iter,omega); toc;
%---------------------------Plot F_omega----------------------------------%
fig1=figure(1); Plot_Harmonic_Avg(x,y,F_omega,Num_IC,Num_Iter,fig1)