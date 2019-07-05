function plot_3D_LinearSystem(Eigval,Lambda,delt)
figure('units','normalized','outerposition',[.125 .25 .75 .75])
Lambda=diag(Lambda);
Eigval=log(Eigval)./delt;
subplot(1,2,1)
hold on
plot(real(Eigval),imag(Eigval),'o')
plot(real(Lambda),imag(Lambda),'*r')
xlabel('$Real(\lambda)$','fontsize',24,'Interpreter','Latex')
ylabel('$Imag(\lambda)$','fontsize',24,'Interpreter','Latex')
legend('$\omega -DMD$','$\lambda-True$','Interpreter','Latex')
box on

subplot(1,2,2)
hold on
plot(real(exp(Eigval)),imag(exp(Eigval)),'ob')
plot(real(exp(Lambda)),imag(exp(Lambda)),'*r')
hold on
plot(exp(1i*[0:.1:2*pi]))
xlabel('$Real(\lambda)$','fontsize',24,'Interpreter','Latex')
ylabel('$Imag(\lambda)$','fontsize',24,'Interpreter','Latex')
legend('$\omega -DMD$','$\lambda-True$','Interpreter','Latex')
box on


end