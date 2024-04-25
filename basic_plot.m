clc;
clear all;


%% Demo data generation

%X = -1.1*pi:0.1:1.1*pi;
%Y = 1*sin(X);

%% Import Excel data
% Specify the path to the Excel file
filePath = 'test_import.xlsx';  % Update this with your actual file path

% Read the Excel file into a MATLAB table
dataTable = readmatrix(filePath);

x1 = dataTable(:,1);
y1 = dataTable(:,2);


%% Clear plot if existing (breaks MATLAB otherwise)

if exist('plot', 'var') == 1
    clear plot;
end

%% Plotting

plot = plot(x1, y1);


set(plot,'LineWidth',2);

%% Legend text
 
hTitle  = title ('Demo Title');
hYLabel = ylabel('Output Voltage (V)');
hXLabel = xlabel('Phase difference (rad)');

hLegend = legend([plot],'test');

%set( gca                       , ...
%    'FontName'   , 'Helvetica' );

set([hTitle, hXLabel, hYLabel], ...
    'FontName'   , 'ComicSans');

%set([hLegend, gca]             , ...
%    'FontSize'   , 8           );

%set([hXLabel, hYLabel]  , ...
%    'FontSize'   , 10          );

%set( hTitle                    , ...
%    'FontSize'   , 12          , ...
%    'FontWeight' , 'bold'      );


%% Chart area formatting

set(gcf, ...
    'Color'     ,[1 1 1]    , ...
    'Position'  ,[500 400 800 400]);

%% Axis Fromatting

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
  'YLim'        , [-1.2, 1.2], ...
  'YTick'       , -1:0.25:1, ...
  'XTick'       , -2*pi:pi/2:2*pi, ...
  'LineWidth'   , 1         ,   ...
  'XAxisLocation', 'origin',    ...
  'Box'         , 'on');


exportgraphics(gcf,'test2.tif','Resolution',300)

%saveas(gcf,'Test', 'tiff');

