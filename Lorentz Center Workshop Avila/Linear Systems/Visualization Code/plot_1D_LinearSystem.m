function plot_1D_LinearSystem(Eigval,Lambda,delt)
hold on
Eigval=log(Eigval)./delt;
plot(real(Eigval),imag(Eigval),'ob')
plot(real(Lambda),imag(Lambda),'*r')
set(gca,'TickLabelInterpreter','latex','fontsize',18)
title('$\dot{x}=\lambda x$','Interpreter','Latex')
xlabel('$Real(\frac{ln(\omega)}{\Delta t})$','fontsize',24,'Interpreter','Latex')
ylabel('$Imag(\frac{ln(\omega)}{\Delta t})$','fontsize',24,'Interpreter','Latex')
legend('$\omega -DMD$','$\lambda-True$','Interpreter','Latex')
box on
end