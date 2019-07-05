function []=Plot_2Func_MSP(x,y,F_star1,F_star2,Box,Num_IC,Box_Size,fig)

s(1)=subplot(1,2,1);
pos1 = get(s(1),'Position');
hold on
axis square
plot(reshape(F_star1,Num_IC^2,1),reshape(F_star2,Num_IC^2,1),'-bo',...
    'MarkerSize',1,'MarkerFaceColor','b','LineStyle','none')
RL=[-ones(1,Box_Size-1); ones(1,Box_Size-1)];
LL=[linspace(-1,1,49); linspace(-1,1,49)];
line(LL,RL,'Color','k','LineWidth',.075);  
line(RL,LL,'Color','k','LineWidth',.075);
set(gca,'TickLabelInterpreter','latex','fontsize',18)
xlabel('$f_1^*(\mathbf{x}_i)$','fontsize',24,'Interpreter','Latex')
xticks([-1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1])
yl = ylabel('$f_2^*(\mathbf{x}_i)$','fontsize',24,'Interpreter','Latex',...
                                   'rot',0,...
                                   'VerticalAlignment','middle');
yticks([-1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1])                              
set(yl, 'Position', [-1+2*1.2*-.1, 0, 0]);
box on








s(2)=subplot(1,2,2);
pos2 = get(s(2),'Position');
hold on
axis square
pcolor(x,y,Box')
shading interp
colormap jet
xlabel('$\varphi$','fontsize',24,'Interpreter','Latex')
xticks([0 0.2 0.4 0.6 0.8 1])
yl = ylabel('$I$','fontsize',24,'Interpreter','Latex',...
                                   'rot',0,...
                                   'VerticalAlignment','middle');
set(yl, 'Position', [-.1, 1/2, 0]);
yticks([0 0.2 0.4 0.6 0.8 1])
set(gca,'TickLabelInterpreter','latex','fontsize',18)
cb = colorbar;
cb.Limits = [-1 1];
cb.TickLabelInterpreter = 'latex';
cb.Label.Interpreter = 'latex';
cb.Label.String ='$g_L(\mathbf{x}_0)$';
cb.Label.FontSize = 24;
cb.Label.Rotation = 0;
cb.Label.VerticalAlignment = 'middle';
cb.Label.HorizontalAlignment = 'right';
cb.Label.Units = 'data';
cb.Label.Position = [1+(6),(cb.Limits(2)+cb.Limits(1))/2,0];
box on

set(s(1),'Position',pos1)
set(s(2),'Position',pos2)

fig.Units='normalized';
fig.OuterPosition=[0 0 1 1];
end