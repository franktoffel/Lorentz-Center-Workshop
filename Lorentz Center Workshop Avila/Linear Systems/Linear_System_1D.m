%--------------------------Set up Computation-----------------------------%
clc; clear variables; close all;          % Clean Up Workspace
delt=.1;                                  % Set Timestep
Lambda=-2;                                % Set System Eigenvalue
xo=500*rand;                              % Set Random Initial Condition
Final_Time=100;                           % Set Total Time
Num_Monomials=4;                          % Set Dimension of Monomial Basis
%----------------------------Generate Data--------------------------------%
X=Generate_Linear_System_Data(Lambda,xo,Num_Monomials,Final_Time,delt);
%-----------------------------Compute DMD---------------------------------%
[Modes,Eigval,~]=SVDenhanced_DMD(X);
%----------------------------Plot Spectrum--------------------------------%
plot_1D_LinearSystem(Eigval,Lambda,delt)
