function []=Plot_Time_Avg(x,y,F_star,k,l,Num_IC,Num_Iter,fig)

subplot(length(Num_Iter),length(Num_IC),k+(l-1)*length(Num_IC))

hold on

set(gca,'TickLabelInterpreter','latex','fontsize',18)
title(strcat('$T=',num2str(Num_Iter(l)),'$, $IC=',num2str(Num_IC(k)),'$'),...
         'fontsize',24,...
         'Interpreter','Latex')

pcolor(x,y,F_star'); 
xlim([0,1]); ylim([0,1]); shading interp; colormap jet;
xticks([0 0.2 0.4 0.6 0.8 1])
yticks([0 0.2 0.4 0.6 0.8 1])

if(l==length(Num_Iter))
xlabel('$\varphi$','fontsize',24,'Interpreter','Latex')
end


if(k==1)
yl = ylabel('$I$','fontsize',24,'Interpreter','Latex',...
            'rot',0,'VerticalAlignment','middle');
yl.Position=[-.2, 1/2, 0];
end

if k+1==2
yl.Position=[-.075, 1/2, 0];

end

cb = colorbar; 
cb.TickLabelInterpreter = 'latex'; 
set(cb,'FontSize',18)
if(k==length(Num_IC))
cb.Label.Interpreter = 'latex';
cb.Label.String ='$f^*(\mathbf{x}_0)$';
cb.Label.FontSize = 24;
cb.Label.Rotation = 0;
cb.Label.VerticalAlignment = 'middle';
cb.Label.HorizontalAlignment = 'right';
cb.Label.Units = 'data';
cb.Label.Position = [1+6.75,(cb.Limits(2)+cb.Limits(1))/2,0];
end
axis square; box on; hold off

if k+l==length(Num_IC)+length(Num_Iter)
fig.Units='normalized';
fig.OuterPosition=[0 0 1 1];
end



end