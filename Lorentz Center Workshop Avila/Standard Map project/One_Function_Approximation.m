%--------------------------Set up Computation-----------------------------%
close all; clear variables; clc;    % Clean Up Workspace
f1=@(x)(sin(2*pi*x(1)));            % Define Observable 1
f2=@(x)(sin(3*pi*x(1)));            % Define Observable 2
delta=0.17;                         % Set Standard Map Forcing Paramter
T=@(x)(Standard_Map(x));            % Define Standard Map
Num_IC=[10 50];%[10 100 400];       % Set # of Total Intitial Conditions
Num_Iter=[100 300];%[100 1000];     % Set # of Total Map Iterations
%--------------------------Run Computation--------------------------------%
tic
for k=1:length(Num_IC)              % Loop Over # Total Initial Conditions
for l=1:length(Num_Iter)            % loop Over # Total Iterations
%--------------------------Generate IC Data-------------------------------%
[IC,x,y]=Generate_Standard_Map_IC(Num_IC(k),delta);
%--------------------------Compute F_star1--------------------------------%
tic; F_star1=Compute_Time_Avg(IC,f1,T,Num_Iter(l));
%--------------------------Compute F_star2--------------------------------%
F_star2=Compute_Time_Avg(IC,f2,T,Num_Iter(l)); toc;
%---------------------------Plot F_star1----------------------------------%
fig1=figure(1); Plot_Time_Avg(x,y,F_star1,k,l,Num_IC,Num_Iter,fig1)
%---------------------------Plot F_star2----------------------------------%
fig2=figure(2); Plot_Time_Avg(x,y,F_star2,k,l,Num_IC,Num_Iter,fig2)
end
end
toc