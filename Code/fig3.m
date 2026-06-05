clc;close all;clear all


% load TSP analysis results for disaster-induced displacement
cli_d_2016_100 = out2mat('cli_d_2016_100_MAT.txt');
cli_d_2017_100 = out2mat('cli_d_2017_100_MAT.txt');
cli_d_2018_100 = out2mat('cli_d_2018_100_MAT.txt');
cli_d_2019_100 = out2mat('cli_d_2019_100_MAT.txt');
cli_d_2020_100 = out2mat('cli_d_2020_100_MAT.txt');

% load TSP analysis results for conflict-induced displacement
con_d_2016_100 = out2mat('con_d_2016_100_MAT.txt');
con_d_2017_100 = out2mat('con_d_2017_100_MAT.txt');
con_d_2018_100 = out2mat('con_d_2018_100_MAT.txt');
con_d_2019_100 = out2mat('con_d_2019_100_MAT.txt');
con_d_2020_100 = out2mat('con_d_2020_100_MAT.txt');

% plot
figure(1)
subplot(2,1,1), hold on
plot([1:13],cli_d_2016_100,'-o')
plot([1:13],cli_d_2017_100,'-x')
plot([1:13],cli_d_2018_100,'-^')
plot([1:13],cli_d_2019_100,'-v')
plot([1:13],cli_d_2020_100,'-s')
% plot([1:13],cli_d_100,'-','LineWidth',1.5,'Color','r')
ax= gca;
ax.XAxisLocation='origin';
set(gca,'xtick',[])
set(gca,'xticklabel',[])
yticks([-0.5 0 0.5])
ylim([-1 1])
legend('2016','2017','2018','2019','2020','Location','EastOutside')
title('Disaster-induced IDP')
subplot(2,1,2), hold on
plot([1:13],con_d_2016_100,'-o')
plot([1:13],con_d_2017_100,'-x')
plot([1:13],con_d_2018_100,'-^')
plot([1:13],con_d_2019_100,'-v')
plot([1:13],con_d_2020_100,'-s')
% plot([1:13],con_d_100,'-','LineWidth',1.5,'Color','r')
ax= gca;
ax.XAxisLocation='origin';
set(gca,'xtick',[])
set(gca,'xticklabel',[])
yticks([-0.5 0 0.5])
ylim([-1 1])
legend('2016','2017','2018','2019','2020','Location','EastOutside')
title('Conflict-induced IDP')
% sgtitle('All IDP flows')

figure(2)
subplot(2,1,1), hold on
plot([1:13],cli_d_2016_up,'-o')
plot([1:13],cli_d_2017_up,'-x')
plot([1:13],cli_d_2018_up,'-^')
plot([1:13],cli_d_2019_up,'-v')
plot([1:13],cli_d_2020_up,'-s')
plot([1:13],cli_d_up,'-','LineWidth',1.5,'Color','r')
ax= gca;
ax.XAxisLocation='origin';
set(gca,'xtick',[])
set(gca,'xticklabel',[])
yticks([-0.5 0 0.5])
ylim([-1 1])
legend('2016','2017','2018','2019','2020','5yr agg.','Location','EastOutside')
title('Climate-induced IDP')
subplot(2,1,2), hold on
plot([1:13],con_d_2016_up,'-o')
plot([1:13],con_d_2017_up,'-x')
plot([1:13],con_d_2018_up,'-^')
plot([1:13],con_d_2019_up,'-v')
plot([1:13],con_d_2020_up,'-s')
plot([1:13],con_d_up,'-','LineWidth',1.5,'Color','r')
ax= gca;
ax.XAxisLocation='origin';
set(gca,'xtick',[])
set(gca,'xticklabel',[])
yticks([-0.5 0 0.5])
ylim([-1 1])
legend('2016','2017','2018','2019','2020','5yr agg.','Location','EastOutside')
title('Conflict-induced IDP')
sgtitle('Strong IDP flows (pop size > 50%)')

figure(3)
subplot(2,1,1), hold on
plot([1:13],cli_d_2016_dw,'-o')
plot([1:13],cli_d_2017_dw,'-x')
plot([1:13],cli_d_2018_dw,'-^')
plot([1:13],cli_d_2019_dw,'-v')
plot([1:13],cli_d_2020_dw,'-s')
plot([1:13],cli_d_dw,'-','LineWidth',1.5,'Color','r')
ax= gca;
ax.XAxisLocation='origin';
set(gca,'xtick',[])
set(gca,'xticklabel',[])
yticks([-0.5 0 0.5])
ylim([-1 1])
legend('2016','2017','2018','2019','2020','5yr agg.','Location','EastOutside')
title('Climate-induced IDP')
subplot(2,1,2), hold on
plot([1:13],con_d_2016_dw,'-o')
plot([1:13],con_d_2017_dw,'-x')
plot([1:13],con_d_2018_dw,'-^')
plot([1:13],con_d_2019_dw,'-v')
plot([1:13],con_d_2020_dw,'-s')
plot([1:13],con_d_dw,'-','LineWidth',1.5,'Color','r')
ax= gca;
ax.XAxisLocation='origin';
set(gca,'xtick',[])
set(gca,'xticklabel',[])
yticks([-0.5 0 0.5])
ylim([-1 1])
legend('2016','2017','2018','2019','2020','5yr agg.','Location','EastOutside')
title('Conflict-induced IDP')
sgtitle('Weak IDP flows (pop size < 50%)')