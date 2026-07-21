function loopDAC_pulse_1000ms(numStimuli)
%% loopDAC_pulse Sends 1000 ms 5V pulses on DAC0 at 10?2 s intervals
% Usage:
%   loopDAC_pulse(5)  % Sends 5 pulses
%   loopDAC_pulse()   % Sends pulses indefinitely

if nargin < 1
    numStimuli = Inf;  % Default: infinite pulses
elseif ~isnumeric(numStimuli) || numStimuli < 1
    error('numStimuli must be a positive integer or omitted.');
end

%% Initialize LabJack
if ~exist('ljud_LoadDriver', 'file')
    error('LabJack UD driver not found. Ensure MATLAB_LJUD.zip is in your MATLAB path.');
end

ljud_LoadDriver;
ljud_Constants;

[Error, ljHandle] = ljud_OpenLabJack(LJ_dtU3, LJ_ctUSB, '1', 1);
if Error
    error('Error opening LabJack device: %d', Error);
end

dacChannel = 0;
pulseVoltage = 5;    % Volts
pulseDuration = 1; % seconds

%% Initialize OSC
u = udp('127.0.0.1', 9000);  % match Bonsai port
fopen(u);

%% start the stimuli

try
    fprintf('Starting DAC pulse loop. Total pulses: %s\n', ...
        ternary(isinf(numStimuli), 'Infinite', num2str(numStimuli)));

    for pulseCount = 1:numStimuli
        % Wait random interval between 8 and 12 s
        waitTime = 10 + (rand()*4 - 2);
        pause(waitTime);

        % Send 5V pulse
        Error = ljud_ePut(ljHandle, LJ_ioPUT_DAC, dacChannel, pulseVoltage, 0);
        % Send OSC on signal
        oscsend(u, '/test', 'f', [pulseCount+.1]);
        if Error
            warning('Error writing pulse to DAC%d: %d', dacChannel, Error);
        end

        % Keep pulse for 1000 ms
        pause(pulseDuration);

        % Reset DAC to 0 V
        Error = ljud_ePut(ljHandle, LJ_ioPUT_DAC, dacChannel, 0, 0);
        oscsend(u, '/test', 'f', [pulseCount]);
        if Error
            warning('Error resetting DAC%d: %d', dacChannel, Error);
        end

        fprintf('Pulse %d/%s sent on DAC%d, next pulse in %.2f s\n', ...
            pulseCount, ternary(isinf(numStimuli), '?', num2str(numStimuli)), dacChannel, waitTime);
    end

catch ME
    fprintf('An error occurred: %s\n', ME.message);
end

% ljud_CloseLabJack(ljHandle);
fclose(u);
fprintf('DAC pulse loop finished.\n');

end

%% Helper ternary function
function out = ternary(cond, valTrue, valFalse)
if cond
    out = valTrue;
else
    out = valFalse;
end
end
