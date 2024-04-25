clc;
clear all;

%% Parameters
% Copy the data indented to be plotted in the test_import.xlsx file,
% withouth headers, first colums should be the X axis, second is the y
% axis. Pay attention of the usage of , . and ; in the demo files...



filePath = 'test_import.xls';   %The name of the xls file (must be in the working directory)

%Use the following line in newer versions than 2019a, works with xlsx, csv
%and xls, if using older MATLAB, comment out.
dataTable = readmatrix(filePath);

%In versions older than 2019a use the following line, othervise comment
%out:

%[dataTable, tmp, tmp2] = xlsread(filePath);


graphTitle = 'Demo Title';
yLabel = 'Output Voltage (V)';
xLabel = 'Phase difference (rad)';
legend_1 = 'U_d';

y_overhead = 0.1;               %Determines how much headroom the graph will have in the window
Tick_count_X = 10;              %Determines how many major (numbered) ticks the grapsh will have on the X axis
Tick_count_Y = 15;              %Determines how many major (numbered) ticks the grapsh will have on the y axis

export_file_name = 'exportTest.tif';


%% Demo data generation
% Comment out for real usacesaes

%X = -1.1*pi:0.1:1.1*pi;
%Y = 1*sin(X);

%% Format Matrice data

X = dataTable(:,1);
Y = dataTable(:,2);


%% Clear plot if existing (breaks MATLAB otherwise)

if exist('plot', 'var') == 1
    clear plot;
end

%% Plotting

plot = plot(X, Y);

set(plot,'LineWidth',2);

%% Legend text
 
hTitle  = title (graphTitle);
hYLabel = ylabel(yLabel);
hXLabel = xlabel(xLabel);

hLegend = legend([plot],legend_1);

set( gca                       , ...
    'FontName'   , 'Helvetica' );

set([hTitle, hXLabel, hYLabel], ...
    'FontName'   , 'Helvetica');

set([hLegend, gca]             , ...
    'FontSize'   , 8           );

set([hXLabel, hYLabel]  , ...
    'FontSize'   , 10          );

set( hTitle                    , ...
    'FontSize'   , 12          , ...
    'FontWeight' , 'bold'      );


%% Chart area formatting

set(gcf, ...
    'Color'     ,[1 1 1]    , ...
    'Position'  ,[500 400 800 400]);

%% Axis Fromatting


Y_max = max(Y)*(1+y_overhead);
Y_min = min(Y)*(1+y_overhead);

X_min = min(X);
X_max = max(X);

tick_step_X = abs(X_max-X_min)/Tick_count_X;
tick_step_Y = abs(Y_max-Y_min)/Tick_count_Y;

set(gca, ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'XGrid'       , 'on'      , ...
  'GridLineStyle', ':'     , ...
  'XColor'      , [.1 .1 .1], ...
  'YColor'      , [.1 .1 .1], ...
  'GridColor'   , [0.1 0.1 0.1], ...
  'YLim'        , [Y_min, Y_max], ...
  'YTick'       , Y_min:tick_step_Y:Y_max, ...
  'XTick'       , X_min:tick_step_X:X_max, ...
  'LineWidth'   , 1         ,   ...
  'XAxisLocation', 'origin',    ...
  'Box'         , 'on');


exportgraphics(gcf,export_file_name,'Resolution',300)

