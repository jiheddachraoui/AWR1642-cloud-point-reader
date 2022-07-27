clearvars; close all
delete(instrfind);

N = 100;

% Setup radar with the parameters from the configuration file
configFile = "AWR1642_SDK3.5.cfg";
[DATA_sphandle,UART_sphandle, ConfigParameters] = radarSetup16XX(configFile);

%% Initialize the figure
figure;
set(gcf, 'Position', get(0, 'Screensize'));
H = uicontrol('Style', 'PushButton', ...
                    'String', 'Stop', ...
                    'Callback', 'stopVal = 1','Position',[100 600 100 30]);
h = scatter([],[],'filled');
% axis([-0.5,0.5,0,1.5]);
axis([-1,1,1,10]);
xlabel('X (m)'); ylabel('Y (m)');
grid minor

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                   MAIN   LOOP              %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&%%%%%%%%%%%%%%%%%%%%%%%%%

myInd = 1;
lastreadTime = 0;
dataOk = 0;
stopVal = 0;
prevSeparation = -0.3;
previousTime = 0;
prevCentroidPos = nan(1,6);
shoeSize = 26.5/100; % 26.5 cm

tic
while (myInd <= N)
    dataOk = 0;
    timeNow = toc;
    elapsedTime = timeNow - lastreadTime;
    
    % Read the data from the radar:
    [dataOk, frameNumber, detObj] = readAndParseData16XX(DATA_sphandle, ConfigParameters);
    lastreadTime = timeNow;
    
    if dataOk == 1    
        
        % Store all the data from the radar
        frame{myInd} = detObj;
        
        % Plot the radar points
        h.XData = -detObj.x;
        h.YData = detObj.y;
        drawnow limitrate;
        pause(0.05);
               
        myInd = myInd + 1;     
    end
    
    if stopVal == 1
        stopVal = 0;
        break;
    end
        
end
fprintf(UART_sphandle, 'sensorStop');
delete(instrfind);
close all
        



















