%--------------------------Set up Computation-----------------------------%
clc; clear variables; close all;                   % Clean Up Workspace
delt=.05;                                          % Set Timestep
Lambda=diag([-2,-1+(pi*1i/2),-1+(-pi*1i/2)]);      % Set System Eigenvalue
% Lambda=diag([-2,(pi*1i/2),(-pi*1i/2)]);             % Set System Eigenvalue
Final_Time=100;                                    % Set Total Time
Num_Monomials=5;                          % Set Dimension of Monomial Basis
xo=[500;500;500]*rand;                    % Set Random Initial Condition
%----------------------------Generate Data--------------------------------%
X=Generate_Linear_System_Data(Lambda,xo,Num_Monomials,Final_Time,delt);
%-----------------------------Compute DMD---------------------------------%
[Modes,Eigval,~]=SVDenhanced_DMD(X);
%----------------------------Plot Spectrum--------------------------------%
plot_3D_LinearSystem(Eigval,Lambda,delt)