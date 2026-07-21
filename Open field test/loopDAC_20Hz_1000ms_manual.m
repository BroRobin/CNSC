function loopDAC_20Hz_1000ms_manual(numStimuli)
%% Sends 20 Hz pulse trains (20 ms ON / 20 ms OFF)
% Each train starts when SPACE is pressed

if nargin < 1
    numStimuli = Inf;
elseif ~isnumeric(numStimuli) || numStimuli < 1
    error('numStimuli must be a positive integer or omitted.');
end

%% Initialize LabJack
if ~exist('ljud_LoadDriver', 'file')
    error('LabJack UD driver not found.');
end

ljud_LoadDriver;
ljud_Constants;

[Error, ljHandle] = ljud_OpenLabJack(LJ_dtU3, LJ_ctUSB, '1', 1);
if Error
    error('Error opening LabJack device: %d', Error);
end

dacChannel = 0;
pulseVoltage = 5;

%% 20 Hz parameters
onTime  = 0.025;  % 25 ms ON
offTime = 0.025;  % 25 ms OFF
trainDuration = 1; % seconds (EDIT THIS if needed)

numPulsesPerTrain = floor(trainDuration / (onTime + offTime));

%% Initialize OSC
u = udp('127.0.0.1', 9000);
fopen(u);

%% Figure for keyboard capture
hFig = figure('Name','Press SPACE to trigger 20Hz train (Q to quit)', ...
              'NumberTitle','off', ...
              'MenuBar','none', ...
              'ToolBar','none');

pulseCount = 0;

try
    fprintf('Press SPACE to send 20Hz train. Press Q to quit.\n');

    while pulseCount < numStimuli && ishandle(hFig)

        waitforbuttonpress;
        key = get(hFig, 'CurrentCharacter');

        if strcmp(key, ' ')
            pulseCount = pulseCount + 1;

            fprintf('Starting train %d...\n', pulseCount);
            oscsend(u, '/test', 'f', [pulseCount + .1]);

            for k = 1:numPulsesPerTrain

                % ON (5V)
                Error = ljud_ePut(ljHandle, LJ_ioPUT_DAC, dacChannel, pulseVoltage, 0);
                if Error
                    warning('Error writing DAC: %d', Error);
                end
                pause(onTime);

                % OFF (0V)
                Error = ljud_ePut(ljHandle, LJ_ioPUT_DAC, dacChannel, 0, 0);
                if Error
                    warning('Error resetting DAC: %d', Error);
                end
                pause(offTime);

            end

            oscsend(u, '/test', 'f', [pulseCount]);
            fprintf('Train %d finished (%d pulses at 20 Hz)\n', ...
                    pulseCount, numPulsesPerTrain);

        elseif lower(key) == 'q'
            fprintf('Manual quit requested.\n');
            break;
        end
    end

catch ME
    fprintf('An error occurred: %s\n', ME.message);
end

%% Cleanup
if ishandle(hFig)
    close(hFig);
end

% ljud_CloseLabJack(ljHandle); % Uncomment if desired
fclose(u);
fprintf('20 Hz stimulus loop finished.\n');

end