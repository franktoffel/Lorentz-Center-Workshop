clc; clear variables; close all;
delt=.001;
Lambda=-2;
xo=500*rand;
Final_Time=1000;
Num_Monomials=4;
X=Generate_Linear_System_Data(Lambda,xo,Num_Monomials,Final_Time,delt);
%% Split Data Matrix
X1=X(:,1:end-1);
X2=X(:,2:end);
%% Compute Koopman Operator Approximation K
[U,S,V]=svd(X1,'econ');
S(S>0)=1./S(S>0);
K=U'*X2*V*S;
%% Eigendecomposition of K
[y,eigval]=eig(K);
Eigvec=U*y;
%% Project Initial Conditons on Eigenspace
% figure
% plot(real(diag(log(eigval)))./delt,imag(diag(log(eigval)))./delt,'o')

% subplot(1,2,1)
% hold on
% plot(real(log(eigval))./delt,imag(log(eigval))./delt,'ob')
% plot(real(Lambda),imag(Lambda),'*r')
% subplot(1,2,2)
% hold on
% plot(real(eigval),imag(eigval),'ob')
% plot(real(exp(Lambda)),imag(exp(Lambda)),'*r')
% hold on
% plot(exp(1i*[0:.1:2*pi]))