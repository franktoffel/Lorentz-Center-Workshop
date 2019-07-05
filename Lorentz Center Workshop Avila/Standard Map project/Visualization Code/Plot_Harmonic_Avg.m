function []=Plot_Harmonic_Avg(x,y,F_omega,Num_IC,Num_Iter,fig)

hold on
pcolor(x,y,abs(F_omega'))
xlim([0,1])
ylim([0,1])
shading interp
colormap jet
xlabel('$\varphi$','fontsize',24,'Interpreter','Latex')
xticks([0 0.2 0.4 0.6 0.8 1])
yl = ylabel('$I$','fontsize',24,'Interpreter','Latex',...
                                  'rot',0,...
                                  'VerticalAlignment','middle');
set(yl, 'Position', [-.075, 1/2, 0]);
yticks([0 0.2 0.4 0.6 0.8 1])
set(gca,'TickLabelInterpreter','latex','fontsize',18)
title(strcat('$T=',num2str(Num_Iter),'$, $IC=',num2str(Num_IC),'$'),...
         'fontsize',24,...
         'Interpreter','Latex')

cb = colorbar;
cb.Limits = [0 1];
cb.Label.Interpreter = 'latex';
cb.TickLabelInterpreter = 'latex';
cb.Label.String ='$|f_{1/2}(\mathbf{x}_0)|$';
cb.Label.FontSize = 24;
cb.Label.Rotation = 0;
cb.Label.VerticalAlignment = 'middle';
cb.Label.HorizontalAlignment = 'right';
cb.Label.Units = 'data';
cb.Label.Position = [1+9,(cb.Limits(2)+cb.Limits(1))/2,0];
axis square
box on
hold off

fig.Units='normalized';
fig.OuterPosition=[0 0 1 1];

end