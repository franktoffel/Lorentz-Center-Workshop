clc; clear variables; close all;
delt=.5; 
Final_Time=100;
Lambda=diag([-2,pi*1i/2,(-pi*1i/2)]);
% Lambda=diag([-2,-pi*1i,-5]);
xo=[500;500;500]*rand;
Num_Monomials=3;
X=Generate_Linear_System_Data(Lambda,xo,Num_Monomials,Final_Time,delt);
% SVDenhanced_DMD
%% Split Data Matrix
X1=X(:,1:end-1);
X2=X(:,2:end);
%% Compute Koopman Operator Approximation K
[U,S,V]=svd(X1,'econ');
S(S>10^-10)=1./S(S>10^-10);
% K=conj(U)*X2*V*S;
K=X2*pinv(X1);
%% Eigendecomposition of K
[y,eigval]=eig(K);
Eigvec=U*y;
eigval=diag(eigval);
Lambda=diag(Lambda);
%% Project Initial Conditons on Eigenspace
subplot(1,2,1)
hold on
plot(real(log(eigval))./delt,imag(log(eigval))./delt,'o')
plot(real(Lambda),imag(Lambda),'*r')
subplot(1,2,2)
hold on
plot(real(eigval),imag(eigval),'ob')
plot(real(exp(Lambda)),imag(exp(Lambda)),'*r')
hold on
plot(exp(1i*[0:.1:2*pi]))