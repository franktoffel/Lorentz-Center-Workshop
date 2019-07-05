function []=Plot_Finite_Section(x,y,Eigenfunctions,lambda,Num_Eigenfunctions)
Mag=sqrt(sum(abs(Eigenfunctions).^2));
[B,Index] = maxk(Mag,Num_Eigenfunctions);
if length(Mag)<Num_Eigenfunctions
Num_Eigenfunctions=length(Mag);
end
for k=1:Num_Eigenfunctions

figure('units','normalized','outerposition',[0 0 1 1])

phi=reshape(abs(Eigenfunctions(:,Index(k))),length(x),length(y));
pcolor(x,y,phi')

shading interp
colormap jet
xlabel('$\varphi$','fontsize',24,'Interpreter','Latex')
xlim([0 1])
yl = ylabel('$I$','fontsize',24,'Interpreter','Latex',...
    'rot',0,...
    'VerticalAlignment','middle');
set(yl, 'Position', [0.5*-.24, 0.5, 0]);
ylim([0 1])
set(gca,'TickLabelInterpreter','latex','fontsize',18)
cb = colorbar;
cb.TickLabelInterpreter = 'latex';
cb.Label.Interpreter = 'latex';
cb.Label.String ='$|\phi_i(\mathbf{x})|$';
cb.Label.FontSize = 24;
cb.Label.Rotation = 0;
cb.Label.VerticalAlignment = 'middle';
cb.Label.HorizontalAlignment = 'right';
cb.Label.Units = 'data';
cb.Label.Position = [1+(6),(cb.Limits(2)+cb.Limits(1))/2,0];
axis square
box on

if(abs(imag(lambda(Index(k))))<1e-4)
title(strcat('$\lambda=',num2str(real(lambda(Index(k)))),'$'),...
    'fontsize',24,'Interpreter','Latex')
elseif(abs(real(lambda(Index(k))))<1e-4)
title(strcat('$\lambda=',num2str(imag(lambda(Index(k)))),'\,i$'),...
    'fontsize',24,'Interpreter','Latex')
elseif(imag(lambda(Index(k)))>1e-4)
title(strcat('$\lambda=',num2str(real(lambda(Index(k)))),'+',...
    num2str(imag(lambda(Index(k)))),'\,i$'),...
    'fontsize',24,'Interpreter','Latex')
else
title(strcat('$\lambda=',num2str(real(lambda(Index(k)))),...
    num2str(imag(lambda(Index(k)))),'\,i$'),...
    'fontsize',24,'Interpreter','Latex')
end


end




figure('units','normalized','outerposition',[0 0 1 1])

subplot(1,2,1)
hold on
col = zeros(length(lambda),3);
for i=1:length(lambda) 
col(i,:) = [rand rand rand];
scatter(real(lambda(i)),imag(lambda(i)),[],col(i,:),'filled')   
end
xlabel('$\mathrm{Re}(\lambda_i)$','fontsize',24,'Interpreter','Latex')
xlim([-1-.15 1+.15])
xticks([-1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1])
yl = ylabel('$\mathrm{Im}(\lambda_i)$','fontsize',24,'Interpreter',...
    'Latex','rot',0,'VerticalAlignment','middle');
set(yl, 'Position', [-1+2*-.24, 0, 0]);
ylim([-1-.15 1+.15])
yticks([-1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1])
set(gca,'TickLabelInterpreter','latex','fontsize',18)
axis square
grid on
box on


subplot(1,2,2)
hold on

for i=1:length(lambda)
scatter(angle(lambda(i)),Mag(i),[],col(i,:),'filled')
line([angle(lambda(i)) angle(lambda(i))],[0 Mag(i)],'Color',col(i,:),'LineWidth',1.2)
end
set(gca,'TickLabelInterpreter','latex','fontsize',18)
xlabel('$\mathrm{Arg}(\lambda_i)$','fontsize',24,'Interpreter','Latex')
xlim([-pi-.15 pi+.15])
xticks([-pi -3*pi/4 -pi/2 -pi/4 0 pi/4 pi/2 3*pi/4 pi])
xticklabels({'$-\pi$' '$-3\pi/4$' '$-\pi/2$' '$-\pi/4$' '0' '$\pi/4$' '$\pi/2$' '$3\pi/4$' '$\pi$'})
yl = ylabel('$||\phi_i||$','fontsize',24,'Interpreter','Latex','rot',0,'VerticalAlignment','middle');
ylimits = get(gca,'YLim');
CENTER_Y_SPECTRUM = (ylimits(2)+ylimits(1))/2;
set(yl, 'Position', [-pi+2*pi*-.24, CENTER_Y_SPECTRUM, 0]);
axis square
box on
end