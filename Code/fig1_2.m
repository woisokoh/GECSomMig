clc;clear all;close all

%% Load preprocessed displacement flow matrices (74×74, by year and cause)
load('dat_adj2.mat')

%% -------------------------------------------------------------------------
%  STEP 1: Compute in-degree and out-degree for each annual flow matrix
%  degcal() returns:
%    - a vector of in/outdegree values (one per district)
%    - a sorted string listing of districts by in/outdegree (for inspection)
%  'in'  = in-degree:  number of distinct origins sending people to each district
%  'out' = out-degree: number of distinct destinations receiving from each district
%% -------------------------------------------------------------------------

% --- disaster-induced: in-degree ---
[cli_d_2016_in,cli_d_2016_str_in]=degcal(cli_d_2016,'in');
[cli_d_2017_in,cli_d_2017_str_in]=degcal(cli_d_2017,'in');
[cli_d_2018_in,cli_d_2018_str_in]=degcal(cli_d_2018,'in');
[cli_d_2019_in,cli_d_2019_str_in]=degcal(cli_d_2019,'in');
[cli_d_2020_in,cli_d_2020_str_in]=degcal(cli_d_2020,'in');

% --- conflict-induced: in-degree ---
[con_d_2016_in,con_d_2016_str_in]=degcal(con_d_2016,'in');
[con_d_2017_in,con_d_2017_str_in]=degcal(con_d_2017,'in');
[con_d_2018_in,con_d_2018_str_in]=degcal(con_d_2018,'in');
[con_d_2019_in,con_d_2019_str_in]=degcal(con_d_2019,'in');
[con_d_2020_in,con_d_2020_str_in]=degcal(con_d_2020,'in');

% --- disaster-induced: out-degree ---
[cli_d_2016_out,cli_d_2016_str_out]=degcal(cli_d_2016,'out');
[cli_d_2017_out,cli_d_2017_str_out]=degcal(cli_d_2017,'out');
[cli_d_2018_out,cli_d_2018_str_out]=degcal(cli_d_2018,'out');
[cli_d_2019_out,cli_d_2019_str_out]=degcal(cli_d_2019,'out');
[cli_d_2020_out,cli_d_2020_str_out]=degcal(cli_d_2020,'out');

% --- conflict-induced: out-degree ---
[con_d_2016_out,con_d_2016_str_out]=degcal(con_d_2016,'out');
[con_d_2017_out,con_d_2017_str_out]=degcal(con_d_2017,'out');
[con_d_2018_out,con_d_2018_str_out]=degcal(con_d_2018,'out');
[con_d_2019_out,con_d_2019_str_out]=degcal(con_d_2019,'out');
[con_d_2020_out,con_d_2020_str_out]=degcal(con_d_2020,'out');

%% -------------------------------------------------------------------------
%  STEP 2: Build degree-frequency histograms for plotting
%  hist2dots() bins the in/outdegree values and returns normalised frequencies,
%  producing (bins, freq) pairs ready for scatter/log-log plots.
%  Zero-frequency bins are later filtered out with the (freq>0) mask.
%% -------------------------------------------------------------------------

% --- Disaster IDP in-degree histograms ---
[cli_d_2016_in_bins,cli_d_2016_in_freq]=hist2dots(cli_d_2016_in);
[cli_d_2017_in_bins,cli_d_2017_in_freq]=hist2dots(cli_d_2017_in);
[cli_d_2018_in_bins,cli_d_2018_in_freq]=hist2dots(cli_d_2018_in);
[cli_d_2019_in_bins,cli_d_2019_in_freq]=hist2dots(cli_d_2019_in);
[cli_d_2020_in_bins,cli_d_2020_in_freq]=hist2dots(cli_d_2020_in);

% --- Conflict IDP in-degree histograms ---
[con_d_2016_in_bins,con_d_2016_in_freq]=hist2dots(con_d_2016_in);
[con_d_2017_in_bins,con_d_2017_in_freq]=hist2dots(con_d_2017_in);
[con_d_2018_in_bins,con_d_2018_in_freq]=hist2dots(con_d_2018_in);
[con_d_2019_in_bins,con_d_2019_in_freq]=hist2dots(con_d_2019_in);
[con_d_2020_in_bins,con_d_2020_in_freq]=hist2dots(con_d_2020_in);

% --- Disaster IDP out-degree histograms ---
[cli_d_2016_out_bins,cli_d_2016_out_freq]=hist2dots(cli_d_2016_out);
[cli_d_2017_out_bins,cli_d_2017_out_freq]=hist2dots(cli_d_2017_out);
[cli_d_2018_out_bins,cli_d_2018_out_freq]=hist2dots(cli_d_2018_out);
[cli_d_2019_out_bins,cli_d_2019_out_freq]=hist2dots(cli_d_2019_out);
[cli_d_2020_out_bins,cli_d_2020_out_freq]=hist2dots(cli_d_2020_out);

% --- Conflict IDP out-degree histograms ---
[con_d_2016_out_bins,con_d_2016_out_freq]=hist2dots(con_d_2016_out);
[con_d_2017_out_bins,con_d_2017_out_freq]=hist2dots(con_d_2017_out);
[con_d_2018_out_bins,con_d_2018_out_freq]=hist2dots(con_d_2018_out);
[con_d_2019_out_bins,con_d_2019_out_freq]=hist2dots(con_d_2019_out);
[con_d_2020_out_bins,con_d_2020_out_freq]=hist2dots(con_d_2020_out);

%% -------------------------------------------------------------------------
%  FIGURE 1: In-degree frequency distributions (linear scale)
%  Left panel  = disaster-induced displacement
%  Right panel = conflict-induced displacement
%  Each marker shape represents one year (o=2016, x=2017, ^=2018, v=2019, s=2020)
%% -------------------------------------------------------------------------
figure(1),set(gcf, 'Position',  [100, 100, 600, 200])
subplot(1,2,1),hold on
scatter(cli_d_2016_in_bins(cli_d_2016_in_freq>0),cli_d_2016_in_freq(cli_d_2016_in_freq>0),'o')
scatter(cli_d_2017_in_bins(cli_d_2017_in_freq>0),cli_d_2017_in_freq(cli_d_2017_in_freq>0),'x')
scatter(cli_d_2018_in_bins(cli_d_2018_in_freq>0),cli_d_2018_in_freq(cli_d_2018_in_freq>0),'^')
scatter(cli_d_2019_in_bins(cli_d_2019_in_freq>0),cli_d_2019_in_freq(cli_d_2019_in_freq>0),'v')
scatter(cli_d_2020_in_bins(cli_d_2020_in_freq>0),cli_d_2020_in_freq(cli_d_2020_in_freq>0),'s')
xlabel('Indegree','Fontsize',11)
ylabel('Frequency','Fontsize',11)
box on
axis([0 80 0 1])
% legend('2016','2017','2018','2019','2020','orientation','horizontal','Location','Southoutside')
subplot(1,2,2),hold on
scatter(con_d_2016_in_bins(con_d_2016_in_freq>0),con_d_2016_in_freq(con_d_2016_in_freq>0),'o')
scatter(con_d_2017_in_bins(con_d_2017_in_freq>0),con_d_2017_in_freq(con_d_2017_in_freq>0),'x')
scatter(con_d_2018_in_bins(con_d_2018_in_freq>0),con_d_2018_in_freq(con_d_2018_in_freq>0),'^')
scatter(con_d_2019_in_bins(con_d_2019_in_freq>0),con_d_2019_in_freq(con_d_2019_in_freq>0),'v')
scatter(con_d_2020_in_bins(con_d_2020_in_freq>0),con_d_2020_in_freq(con_d_2020_in_freq>0),'s')
xlabel('Indegree','Fontsize',11)
ylabel('Frequency','Fontsize',11)
box on
axis([0 80 0 1])

%% -------------------------------------------------------------------------
%  FIGURE 2: Disaster IDP in-degree — log-log plot with power-law fits
%  logfit() fits y = C * x^slope in log-log space (i.e. log y = slope*log x + intercept)
%  and returns slope, intercept (log10 scale), MSE, R², and fit structure.
%  The fitted curve is reconstructed as y = 10^intercept * x^slope.
%  A straight line on a log-log plot is consistent with a power-law distribution.
%% -------------------------------------------------------------------------
figure(2),set(gcf, 'Position',  [100, 100, 200, 150])
[slope1, intercept1,MSE1, R21, S1]=logfit(cli_d_2016_in_bins(cli_d_2016_in_freq>0),cli_d_2016_in_freq(cli_d_2016_in_freq>0),'powerlaw')
[slope2, intercept2,MSE2, R22, S2]=logfit(cli_d_2017_in_bins(cli_d_2017_in_freq>0),cli_d_2017_in_freq(cli_d_2017_in_freq>0),'powerlaw')
[slope3, intercept3,MSE3, R23, S3]=logfit(cli_d_2018_in_bins(cli_d_2018_in_freq>0),cli_d_2018_in_freq(cli_d_2018_in_freq>0),'powerlaw')
[slope4, intercept4,MSE4, R24, S4]=logfit(cli_d_2019_in_bins(cli_d_2019_in_freq>0),cli_d_2019_in_freq(cli_d_2019_in_freq>0),'powerlaw')
[slope5, intercept5,MSE5, R25, S5]=logfit(cli_d_2020_in_bins(cli_d_2020_in_freq>0),cli_d_2020_in_freq(cli_d_2020_in_freq>0),'powerlaw')
x1=linspace(min(cli_d_2016_in_bins),max(cli_d_2016_in_bins),5);
x2=linspace(min(cli_d_2017_in_bins),max(cli_d_2017_in_bins),5);
x3=linspace(min(cli_d_2018_in_bins),max(cli_d_2018_in_bins),5);
x4=linspace(min(cli_d_2019_in_bins),max(cli_d_2019_in_bins),5);
x5=linspace(min(cli_d_2020_in_bins),max(cli_d_2020_in_bins),5);
y1=(10^intercept1)*x1.^(slope1);
y2=(10^intercept2)*x2.^(slope2);
y3=(10^intercept3)*x3.^(slope3);
y4=(10^intercept4)*x4.^(slope4);
y5=(10^intercept5)*x5.^(slope5);
cli_in_R2 =[R21,R22,R23,R24,R25];
loglog(cli_d_2016_in_bins(cli_d_2016_in_freq>0),cli_d_2016_in_freq(cli_d_2016_in_freq>0),'o'),hold on
loglog(cli_d_2017_in_bins(cli_d_2017_in_freq>0),cli_d_2017_in_freq(cli_d_2017_in_freq>0),'x')
loglog(cli_d_2018_in_bins(cli_d_2018_in_freq>0),cli_d_2018_in_freq(cli_d_2018_in_freq>0),'^')
loglog(cli_d_2019_in_bins(cli_d_2019_in_freq>0),cli_d_2019_in_freq(cli_d_2019_in_freq>0),'v')
loglog(cli_d_2020_in_bins(cli_d_2020_in_freq>0),cli_d_2020_in_freq(cli_d_2020_in_freq>0),'s')
ax = gca;
ax.ColorOrderIndex = 1;
loglog(x1,y1,'-')
loglog(x2,y2,'-')
loglog(x3,y3,'-')
loglog(x4,y4,'-')
loglog(x5,y5,'-')
xlabel('log(Indegree)'),ylabel('log(Frequency)')

%% -------------------------------------------------------------------------
%  FIGURE 3: Conflict IDP in-degree — log-log plot with power-law fits
%  Identical structure to Figure 2, applied to conflict displacement data.
%% -------------------------------------------------------------------------
figure(3),set(gcf, 'Position',  [100, 100, 200, 150])
[slope1, intercept1,MSE1, R21, S1]=logfit(con_d_2016_in_bins(con_d_2016_in_freq>0),con_d_2016_in_freq(con_d_2016_in_freq>0),'powerlaw')
[slope2, intercept2,MSE2, R22, S2]=logfit(con_d_2017_in_bins(con_d_2017_in_freq>0),con_d_2017_in_freq(con_d_2017_in_freq>0),'powerlaw')
[slope3, intercept3,MSE3, R23, S3]=logfit(con_d_2018_in_bins(con_d_2018_in_freq>0),con_d_2018_in_freq(con_d_2018_in_freq>0),'powerlaw')
[slope4, intercept4,MSE4, R24, S4]=logfit(con_d_2019_in_bins(con_d_2019_in_freq>0),con_d_2019_in_freq(con_d_2019_in_freq>0),'powerlaw')
[slope5, intercept5,MSE5, R25, S5]=logfit(con_d_2020_in_bins(con_d_2020_in_freq>0),con_d_2020_in_freq(con_d_2020_in_freq>0),'powerlaw')
x1=linspace(min(con_d_2016_in_bins),max(con_d_2016_in_bins),5);
x2=linspace(min(con_d_2017_in_bins),max(con_d_2017_in_bins),5);
x3=linspace(min(con_d_2018_in_bins),max(con_d_2018_in_bins),5);
x4=linspace(min(con_d_2019_in_bins),max(con_d_2019_in_bins),5);
x5=linspace(min(con_d_2020_in_bins),max(con_d_2020_in_bins),5);
y1=(10^intercept1)*x1.^(slope1);
y2=(10^intercept2)*x2.^(slope2);
y3=(10^intercept3)*x3.^(slope3);
y4=(10^intercept4)*x4.^(slope4);
y5=(10^intercept5)*x5.^(slope5);
con_in_R2 =[R21,R22,R23,R24,R25];

loglog(con_d_2016_in_bins(con_d_2016_in_freq>0),con_d_2016_in_freq(con_d_2016_in_freq>0),'o'),hold on
loglog(con_d_2017_in_bins(con_d_2017_in_freq>0),con_d_2017_in_freq(con_d_2017_in_freq>0),'x')
loglog(con_d_2018_in_bins(con_d_2018_in_freq>0),con_d_2018_in_freq(con_d_2018_in_freq>0),'^')
loglog(con_d_2019_in_bins(con_d_2019_in_freq>0),con_d_2019_in_freq(con_d_2019_in_freq>0),'v')
loglog(con_d_2020_in_bins(con_d_2020_in_freq>0),con_d_2020_in_freq(con_d_2020_in_freq>0),'s')
ax = gca;
ax.ColorOrderIndex = 1;
loglog(x1,y1,'-')
loglog(x2,y2,'-')
loglog(x3,y3,'-')
loglog(x4,y4,'-')
loglog(x5,y5,'-')
xlabel('log(Indegree)'),ylabel('log(Frequency)')

%% -------------------------------------------------------------------------
%  FIGURE 4: Out-degree frequency distributions (linear scale)
%  Same layout as Figure 1 but for out-degree.
%  Narrower x-axis (0–15) reflects that most districts send to few destinations,
%  whereas in-degree is more spread (districts can receive from many origins).
%% -------------------------------------------------------------------------
figure(4),set(gcf, 'Position',  [100, 100, 600, 200])
subplot(1,2,1),hold on
scatter(cli_d_2016_out_bins(cli_d_2016_out_freq>0),cli_d_2016_out_freq(cli_d_2016_out_freq>0),'o')
scatter(cli_d_2017_out_bins(cli_d_2017_out_freq>0),cli_d_2017_out_freq(cli_d_2017_out_freq>0),'x')
scatter(cli_d_2018_out_bins(cli_d_2018_out_freq>0),cli_d_2018_out_freq(cli_d_2018_out_freq>0),'^')
scatter(cli_d_2019_out_bins(cli_d_2019_out_freq>0),cli_d_2019_out_freq(cli_d_2019_out_freq>0),'v')
scatter(cli_d_2020_out_bins(cli_d_2020_out_freq>0),cli_d_2020_out_freq(cli_d_2020_out_freq>0),'s')
xlabel('Outdegree','Fontsize',11)
ylabel('Frequency','Fontsize',11)
box on
axis([0 15 0 1])
% legend('2016','2017','2018','2019','2020','Location','NorthEast')

subplot(1,2,2),hold on
scatter(con_d_2016_out_bins(con_d_2016_out_freq>0),con_d_2016_out_freq(con_d_2016_out_freq>0),'o')
scatter(con_d_2017_out_bins(con_d_2017_out_freq>0),con_d_2017_out_freq(con_d_2017_out_freq>0),'x')
scatter(con_d_2018_out_bins(con_d_2018_out_freq>0),con_d_2018_out_freq(con_d_2018_out_freq>0),'^')
scatter(con_d_2019_out_bins(con_d_2019_out_freq>0),con_d_2019_out_freq(con_d_2019_out_freq>0),'v')
scatter(con_d_2020_out_bins(con_d_2020_out_freq>0),con_d_2020_out_freq(con_d_2020_out_freq>0),'s')
xlabel('Outdegree','Fontsize',11)
ylabel('Frequency','Fontsize',11)
box on
axis([0 15 0 1])
