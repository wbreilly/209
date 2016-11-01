% psc209a_f16_wk6

% 26Oct2016 Petr Janata

% Generate some data to plot

% Specify a number of observations
nobs = 1000;

% Get nobs worth of normally distributed values
xdata = randn(nobs,1);

% Start a figure counter
nfig = 0;

% Start a new figure and make sure it's clear
nfig = nfig+1;
figure(nfig), clf

% Visualize our distribution by generating a histogram
hist(data)  % default is 10 bins

numBins = 30;
hist(data,numBins)

% Get information about the figure's children
get(gcf,'Children')

f = gcf;  % Get a handle to the current figure

a = gca;  % gGet a handle to the current axes

% Let's manipulate some object properties

% Change the axis limits
a.XLim = [-8 20];
a.YLim = [0 200];

% To set multiple properties all at once
set(gca, 'xlim', [-10 15], 'ylim', [-5 100], ...
  'xtick', [-5:1:10], 'ytick', [0:5:50 60:10:200])

% Label the axes
xlabel('Value', 'fontsize', 18)
ylabel('Count')

% Add a title
t = title('My first MATLAB histogram', 'fontsize', 24);

% Adding multiple axes to a figure
nfig = nfig +1;
figure(nfig), clf

% Create two axes side by side
nrows = 3;
ncols = 2;

iplot = 0;
for irow = 1:nrows
  for icol = 1:ncols
    iplot = iplot + 1;
    subplot(nrows,ncols,iplot)
    title(sprintf('Plot #%d', iplot))
  end
end

% Another way of specifying the subplot
nfig = nfig+1;
figure(nfig), clf
nrows = 4;
ncols = 3;

iplot = 0;
for irow = 1:nrows
  for icol = 1:ncols
    subplot(nrows, ncols, (irow-1)*ncols + icol)
    
    iplot = iplot+1;
    title(sprintf('Plot #%d', iplot))
    
    % Turn off tick labels if we are not on last row
    if irow < nrows
      set(gca,'xticklabel','')
    end
    
    if icol > 1
      set(gca,'yticklabel','')
    end
  end
end

% Generate a scatter plot
nfig = nfig+1;
figure(nfig), clf


% Generate some more random data
ydata = randn(size(xdata));

subplot(1,3,1)
scatter(xdata, ydata)
axis square

% Generate some data that is correlated with xdata and ydata
zdata = xdata*.5 + ydata*.5;

subplot(1,3,2)
scatter(xdata,zdata)
xlabel('xdata')
ylabel('zdata')

axis square

subplot(1,3,3)
scatter(ydata,zdata)
xlabel('ydata')
ylabel('zdata')
axis square


