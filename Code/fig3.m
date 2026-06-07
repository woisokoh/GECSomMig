clc;close all;clear all

%% Load preprocessed displacement flow matrices (74×74, by year and cause)
load('dat_adj2.mat')

%% -------------------------------------------------------------------------
%  STEP 1: Prepare TSP analysis
%  adj_mfind2(matrix, threshold) identifies statistically significant edges
%  in each flow matrix by retaining only flows above the given percentile
%  threshold (here 100 = top percentile cut-off).
%  Results are written to text files (e.g. 'cli_d_2016_100.txt') for
%  running mfinder
%% -------------------------------------------------------------------------
adj_mfind2(cli_d_2016,100);
adj_mfind2(cli_d_2017,100);
adj_mfind2(cli_d_2018,100);
adj_mfind2(cli_d_2019,100);
adj_mfind2(cli_d_2020,100);

adj_mfind2(con_d_2016,100);
adj_mfind2(con_d_2017,100);
adj_mfind2(con_d_2018,100);
adj_mfind2(con_d_2019,100);
adj_mfind2(con_d_2020,100);
%% -------------------------------------------------------------------------
% STEP 2: RUN TSP analysis
% Download mfinder program from
% https://www.weizmann.ac.il/mcb/alon/download/network-motif-software
% move the txt file from the previous step (e.g. 'cli_d_2016_100.txt')
% run the program in terminal 
% e.g. mfinder cli_d_2016_100.txt -omat (OR sometimes: ./mfinder cli_d_2016_100.txt -omat)
% Then you will get cli_d_2016_100_MAT.txt (OR ORIGINAL_TXTNAME_MAT.txt)
%% -------------------------------------------------------------------------

%% -------------------------------------------------------------------------
% STEP 3: Visualize TSP analysis
% plot TSP trends
%% -------------------------------------------------------------------------

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
