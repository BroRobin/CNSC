% SC_multisensory_extrac
% Analyse spike responses to LED flashes, sound stimuli and whisker air
% puffs
% by R. Broersen; 01-08-2024
% Optimized copy by Codex; 30-04-2026

close all;
clearvars;
set(0,'DefaultFigureVisible','off');
OutputVars=[];
OutputLabels = getOutputLabelsOptimized();
CellSummary = cell(0,5);
for counter = 1:68 % Indicate which cell to analyse for example: (for counter = 1:3) or (for counter = 3)
    close all;
    clearvars -except OutputVars OutputLabels CellSummary counter

    if counter ==1
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17001';
        P.fileName_sound = '25o17004';
        P.fileName_puff = '25o17003'; % whisker
        P.cellID = '251017_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==2
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17001';%no data
        P.fileName_sound = '25o17004';%no data
        P.fileName_puff = '25o17007'; % whisker
        P.cellID = '251017_2';
        P.pksThreshold_LED = 100; % Spike detection threshold in mV
        P.pksThreshold_sound = 100; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==3
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17011';
        P.fileName_sound = '25o17010';
        P.fileName_puff = '25o17009'; % whisker
        P.cellID = '251017_3';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==4
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17012';
        P.fileName_sound = '25o17015';
        P.fileName_puff = '25o17014'; % whisker
        P.cellID = '251017_4';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 2; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==5
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17017';
        P.fileName_sound = '25o17019';
        P.fileName_puff = '25o17018'; % whisker
        P.cellID = '251017_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==6
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17021';
        P.fileName_sound = '25o17024';
        P.fileName_puff = '25o17023'; % whisker
        P.cellID = '251017_6';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % Spike detection threshold in mV
        P.pksThreshold_puff = 2 ;
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==7
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17030';
        P.fileName_sound = '25o17025';
        P.fileName_puff = '25o17031'; % whisker
        P.cellID = '251017_7';
        P.pksThreshold_LED = 3; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % Spike detection threshold in mV
        P.pksThreshold_puff = 3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==8
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17032';
        P.fileName_sound = '25o17034';
        P.fileName_puff = '25o17035'; % whisker
        P.cellID = '251017_8';
        P.pksThreshold_LED = 3; % Spike detection threshold in mV
        P.pksThreshold_sound = 7; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==9
        %% 210309_1
        P.datapath = 'path\20251017';
        P.fileName_LED = '25o17036';
        P.fileName_sound = '25o17040';
        P.fileName_puff = '25o17039'; % whisker
        P.cellID = '251017_9';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spike

    elseif counter ==10
        %% 210309_1
        P.datapath = 'path\20251021';
        P.fileName_LED = '25o21001';
        P.fileName_sound = '25o21004';
        P.fileName_puff = '25o21003'; % whisker
        P.cellID = '251021_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 3.8; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==11
        %% 210309_1
        P.datapath = 'path\20251021';
        P.fileName_LED = '25o21009';
        P.fileName_sound = '25o21007';
        P.fileName_puff = '25o21005'; % whisker
        P.cellID = '251021_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==12
        %% 210309_1
        P.datapath = 'path\20251022';
        P.fileName_LED = '25o22000';
        P.fileName_sound = '25o22004';
        P.fileName_puff = '25o22003'; % whisker
        P.cellID = '251022_1';
        P.pksThreshold_LED = 100; % Spike detection threshold in mV
        P.pksThreshold_sound = 150; % Spike detection threshold in mV
        P.pksThreshold_puff = 150; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==13
        %% 210309_1
        P.datapath = 'path\20251022';
        P.fileName_LED = '25o22005';
        P.fileName_sound = '25o22004';%no data
        P.fileName_puff = '25o22008'; % whisker
        P.cellID = '251022_2';
        P.pksThreshold_LED = 80; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 30; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==14
        %% 210309_1
        P.datapath = 'path\20251022';
        P.fileName_LED = '25o22010';
        P.fileName_sound = '25o22004';%no data
        P.fileName_puff = '25o22008'; %no data
        P.cellID = '251022_3';
        P.pksThreshold_LED = 50; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==15
        %% 210309_1
        P.datapath = 'path\20251022';
        P.fileName_LED = '25o22015';
        P.fileName_sound = '25o22004';%no data
        P.fileName_puff = '25o22008'; %no data
        P.cellID = '251022_4';
        P.pksThreshold_LED = 75; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==16
        %% 210309_1
        P.datapath = 'path\20251022';
        P.fileName_LED = '25o22020';
        P.fileName_sound = '25o22004'; %no data
        P.fileName_puff = '25o22008'; %no data
        P.cellID = '251022_6';
        P.pksThreshold_LED = 40; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==17
        %% 210309_1
        P.datapath = 'path\20251104';
        P.fileName_LED = '25n04001';
        P.fileName_sound = '25n04006';
        P.fileName_puff = '25n04005'; % whisker
        P.cellID = '251104_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==18
        %% 210309_1
        P.datapath = 'path\20251104';
        P.fileName_LED = '25n04001';%no data
        P.fileName_sound = '25n04006';%no data
        P.fileName_puff = '25n04005'; % whisker
        P.cellID = '251104_2';
        P.pksThreshold_LED = 1000; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==19
        %% 210309_1
        P.datapath = 'path\20251104';
        P.fileName_LED = '25n04009';
        P.fileName_sound = '25n04006';%no data
        P.fileName_puff = '25n04005'; % whisker %no data
        P.cellID = '251104_3';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==20
        %% 210309_1
        P.datapath = 'path\20251104';
        P.fileName_LED = '25n04011';
        P.fileName_sound = '25n04015';
        P.fileName_puff = '25n04014'; % whisker
        P.cellID = '251104_4';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 1.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==21
        %% 210309_1
        P.datapath = 'path\20251104';
        P.fileName_LED = '25n04019';
        P.fileName_sound = '25n04020';
        P.fileName_puff = '25n04016'; % whisker
        P.cellID = '251104_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==22
        %% 210309_1
        P.datapath = 'path\20251104';
        P.fileName_LED = '25n04021';
        P.fileName_sound = '25n04020';%no data
        P.fileName_puff = '25n04016'; % whisker %no data
        P.cellID = '251104_6';
        P.pksThreshold_LED = 4; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000 ;
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==23
        %% 210309_1
        P.datapath = 'path\20251105';
        P.fileName_LED = '25n05001';
        P.fileName_sound = '25n05010';%no data
        P.fileName_puff = '25n05004'; % whisker
        P.cellID = '251105_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==24
        %% 210309_1
        P.datapath = 'path\20251105';
        P.fileName_LED = '25n05001';%no data
        P.fileName_sound = '25n05010';%no data
        P.fileName_puff = '25n05005'; % whisker
        P.cellID = '251105_2';
        P.pksThreshold_LED = 1000; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==25
        %% 210309_1
        P.datapath = 'path\20251105';
        P.fileName_LED = '25n05007';
        P.fileName_sound = '25n05010';
        P.fileName_puff = '25n05011'; % whisker
        P.cellID = '251105_3';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==26
        %% 210309_1
        P.datapath = 'path\20251105';
        P.fileName_LED = '25n05012';
        P.fileName_sound = '25n05015';
        P.fileName_puff = '25n05016'; % whisker
        P.cellID = '251105_4';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 1.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==27
        %% 210309_1
        P.datapath = 'path\20251105';
        P.fileName_LED = '25n05022';
        P.fileName_sound = '25n05021';
        P.fileName_puff = '25n05017'; % whisker
        P.cellID = '251105_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==28
        %% 210309_1
        P.datapath = 'path\20251106';
        P.fileName_LED = '25n06000';
        P.fileName_sound = '25n06004';
        P.fileName_puff = '25n06003'; % whisker
        P.cellID = '251106_1';
        P.pksThreshold_LED = 4; % Spike detection threshold in mV
        P.pksThreshold_sound = 13; % Spike detection threshold in mV
        P.pksThreshold_puff = 13; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==29
        %% 210309_1
        P.datapath = 'path\20251106';
        P.fileName_LED = '25n06005';
        P.fileName_sound = '25n06009';
        P.fileName_puff = '25n06008'; % whisker
        P.cellID = '251106_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==30
        %% 210309_1
        P.datapath = 'path\20251106';
        P.fileName_LED = '25n06010';
        P.fileName_sound = '25n06009';%no data
        P.fileName_puff = '25n06008'; % whisker %no data
        P.cellID = '251106_3';
        P.pksThreshold_LED = 8; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==31
        %% 210309_1
        P.datapath = 'path\20251106';
        P.fileName_LED = '25n06014';
        P.fileName_sound = '25n06015';
        P.fileName_puff = '25n06011'; % whisker
        P.cellID = '251106_4';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 1.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==32
        %% 210309_1
        P.datapath = 'path\20251106';
        P.fileName_LED = '25n06016';
        P.fileName_sound = '25n06009';%no data
        P.fileName_puff = '25n06008'; % whisker %no data
        P.cellID = '251106_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==33
        %% 210309_1
        P.datapath = 'path\20251106';
        P.fileName_LED = '25n06017';
        P.fileName_sound = '25n06009';%no data
        P.fileName_puff = '25n06008'; % whisker %no data
        P.cellID = '251106_6';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==34
        %% 210309_1
        P.datapath = 'path\20251106';
        P.fileName_LED = '25n06019';
        P.fileName_sound = '25n06009';%no data
        P.fileName_puff = '25n06008'; % whisker %no data
        P.cellID = '251106_7';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==35
        %% 210309_1
        P.datapath = 'path\20251107';
        P.fileName_LED = '25n07000';
        P.fileName_sound = '25n07004';
        P.fileName_puff = '25n07003'; % whisker
        P.cellID = '251107_1';
        P.pksThreshold_LED = 4; % Spike detection threshold in mV
        P.pksThreshold_sound = 8; % Spike detection threshold in mV
        P.pksThreshold_puff = 10; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==36
        %% 210309_1
        P.datapath = 'path\20251107';
        P.fileName_LED = '25n07005';
        P.fileName_sound = '25n07009';
        P.fileName_puff = '25n07008'; % whisker
        P.cellID = '251107_2';
        P.pksThreshold_LED = 2.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==37
        %% 210309_1
        P.datapath = 'path\20251107';
        P.fileName_LED = '25n07010';
        P.fileName_sound = '25n07014';
        P.fileName_puff = '25n07013'; % whisker
        P.cellID = '251107_3';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==38
        %% 210309_1
        P.datapath = 'path\20251107';
        P.fileName_LED = '25n07016';
        P.fileName_sound = '25n07020';
        P.fileName_puff = '25n07019'; % whisker
        P.cellID = '251107_4';
        P.pksThreshold_LED = 4; % Spike detection threshold in mV
        P.pksThreshold_sound = 1.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==39
        %% 210309_1
        P.datapath = 'path\20251107';
        P.fileName_LED = '25n07021';
        P.fileName_sound = '25n07025';
        P.fileName_puff = '25n07024'; % whisker
        P.cellID = '251107_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==40
        %% 210309_1
        P.datapath = 'path\20251107';
        P.fileName_LED = '25n07026';
        P.fileName_sound = '25n07030';
        P.fileName_puff = '25n07029'; % whisker
        P.cellID = '251107_6';
        P.pksThreshold_LED = 0.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 0.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 0.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==41
        %% 210309_1
        P.datapath = 'path\20251111';
        P.fileName_LED = '25n11000';
        P.fileName_sound = '25n11004';
        P.fileName_puff = '25n11003'; % whisker
        P.cellID = '251111_1';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 0.75; % Spike detection threshold in mV
        P.pksThreshold_puff = 1.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==42
        %% 210309_1
        P.datapath = 'path\20251111';
        P.fileName_LED = '25n11005';
        P.fileName_sound = '25n11009';
        P.fileName_puff = '25n11008'; % whisker
        P.cellID = '251111_2';
        P.pksThreshold_LED = 2.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==43
        %% 210309_1
        P.datapath = 'path\20251111';
        P.fileName_LED = '25n11010';% no data
        P.fileName_sound = '25n11014';
        P.fileName_puff = '25n11013'; % whisker
        P.cellID = '251111_3';
        P.pksThreshold_LED = 1000; % Spike detection threshold in mV
        P.pksThreshold_sound = 0.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 0.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==44
        %% 210309_1
        P.datapath = 'path\20251111';
        P.fileName_LED = '25n11015';
        P.fileName_sound = '25n11019';
        P.fileName_puff = '25n11018'; % whisker
        P.cellID = '251111_4';
        P.pksThreshold_LED = 1.75; % Spike detection threshold in mV
        P.pksThreshold_sound = 10; % Spike detection threshold in mV
        P.pksThreshold_puff = 7.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==45
        %% 210309_1
        P.datapath = 'path\20251111';
        P.fileName_LED = '25n11020';
        P.fileName_sound = '25n11024';
        P.fileName_puff = '25n11023'; % whisker
        P.cellID = '251111_5';
        P.pksThreshold_LED = 1.2; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==46
        %% 210309_1
        P.datapath = 'path\20251111';
        P.fileName_LED = '25n11025';
        P.fileName_sound = '25n11029';
        P.fileName_puff = '25n11023'; % whisker %no data
        P.cellID = '251111_6';
        P.pksThreshold_LED = 2.3; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % Spike detection threshold in mV
        P.pksThreshold_puff = 3000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==47
        %% 210309_1
        P.datapath = 'path\20251111';
        P.fileName_LED = '25n11034';
        P.fileName_sound = '25n11033';
        P.fileName_puff = '25n11030'; % whisker
        P.cellID = '251111_7';
        P.pksThreshold_LED = 13; % Spike detection threshold in mV
        P.pksThreshold_sound = 10; % Spike detection threshold in mV
        P.pksThreshold_puff = 10; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==48
        %% 210309_1
        P.datapath = 'path\20251119';
        P.fileName_LED = '25n19000';
        P.fileName_sound = '25n19004';
        P.fileName_puff = '25n19003'; % whisker
        P.cellID = '251119_1';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==49
        %% 210309_1
        P.datapath = 'path\20251119';
        P.fileName_LED = '25n19005';
        P.fileName_sound = '25n19009';
        P.fileName_puff = '25n19008'; % whisker
        P.cellID = '251119_2';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 25; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==50
        %% 210309_1
        P.datapath = 'path\20251119';
        P.fileName_LED = '25n19010';
        P.fileName_sound = '25n19014';
        P.fileName_puff = '25n19013'; % whisker
        P.cellID = '251119_3';
        P.pksThreshold_LED = 0.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 0.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 0.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==51
        %% 210309_1
        P.datapath = 'path\20251119';
        P.fileName_LED = '25n19015';
        P.fileName_sound = '25n19019';
        P.fileName_puff = '25n19018'; % whisker
        P.cellID = '251119_4';
        P.pksThreshold_LED = 1.75; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==52
        % 210309_1
        P.datapath = 'path\20251119';
        P.fileName_LED = '25n19020';
        P.fileName_sound = '25n19024';
        P.fileName_puff = '25n19023'; % whisker
        P.cellID = '251119_5';
        P.pksThreshold_LED = 0.35; % Spike detection threshold in mV
        P.pksThreshold_sound = 0.4; % Spike detection threshold in mV
        P.pksThreshold_puff = 0.4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==53
        % 260205_1
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205000';
        P.fileName_sound = '26205014';% no data
        P.fileName_puff = '26205006'; % whisker % no data
        P.cellID = '260205_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual= 12;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==54
        % 260205_2
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205001';
        P.fileName_sound = '26205014';% no data
        P.fileName_puff = '26205006'; % whisker % no data
        P.cellID = '260205_2';
        P.pksThreshold_LED = 0.85; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==55
        % 260205_3
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205004';
        P.fileName_sound = '26205014';% no data
        P.fileName_puff = '26205006'; % whisker % no data
        P.cellID = '260205_3';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==56
        % 260205_4
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205007';
        P.fileName_sound = '26205014';% no data
        P.fileName_puff = '26205006'; % whisker % no data
        P.cellID = '260205_4';
        P.pksThreshold_LED = 0.25; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=10;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==57
        % 260205_5
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205008';
        P.fileName_sound = '26205014';% no data
        P.fileName_puff = '26205006'; % whisker % no data
        P.cellID = '260205_5';
        P.pksThreshold_LED = 0.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=25;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==58
        % 260205_6
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205009';
        P.fileName_sound = '26205014';% no data
        P.fileName_puff = '26205011'; % whisker
        P.cellID = '260205_6';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=27;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==59
        % 260205_7
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205012';
        P.fileName_sound = '26205014';% no data
        P.fileName_puff = '26205011'; % whisker % no data
        P.cellID = '260205_7';
        P.pksThreshold_LED = 0.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=15;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==60
        % 260205_8
        P.datapath = 'path\20260205';
        P.fileName_LED = '26205012';% no data
        P.fileName_sound = '26205014';
        P.fileName_puff = '26205011'; % whisker % no data
        P.cellID = '260205_8';
        P.pksThreshold_LED = 1000; % Spike detection threshold in mV
        P.pksThreshold_sound = 0.25; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=28;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==61
        % 260206_1
        P.datapath = 'path\20260206';
        P.fileName_LED = '26206001';
        P.fileName_sound = '26206004';
        P.fileName_puff = '26206003'; % whisker
        P.cellID = '260206_1';
        P.pksThreshold_LED = 1.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==62
        % 260206_2
        P.datapath = 'path\20260206';
        P.fileName_LED = '26206005';
        P.fileName_sound = '26206008';
        P.fileName_puff = '26206007'; % whisker
        P.cellID = '260206_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==63
        % 260206_3
        P.datapath = 'path\20260206';
        P.fileName_LED = '26206009';
        P.fileName_sound = '26206008';% no data
        P.fileName_puff = '26206007'; % whisker % no data
        P.cellID = '260206_3';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=12;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==64
        % 260206_4
        P.datapath = 'path\20260206';
        P.fileName_LED = '26206010';
        P.fileName_sound = '26206008';% no data
        P.fileName_puff = '26206007'; % whisker % no data
        P.cellID = '260206_4';
        P.pksThreshold_LED = 0.2; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==65
        % 260206_5
        P.datapath = 'path\20260206';
        P.fileName_LED = '26206011';
        P.fileName_sound = '26206014';
        P.fileName_puff = '26206013'; % whisker
        P.cellID = '260206_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==66
        % 260206_6
        P.datapath = 'path\20260206';
        P.fileName_LED = '26206015';
        P.fileName_sound = '26206014';% no data
        P.fileName_puff = '26206013'; % whisker % no data
        P.cellID = '260206_6';
        P.pksThreshold_LED = 0.3; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 1000; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==67
        % 260206_7
        P.datapath = 'path\20260206';
        P.fileName_LED = '26206015';% no data
        P.fileName_sound = '26206014';% no data
        P.fileName_puff = '26206016'; % whisker
        P.cellID = '260206_7';
        P.pksThreshold_LED = 1000; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 0.28; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=35;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==68
        % 260212_1
        P.datapath = 'path\20260212';
        P.fileName_LED = '26212003';% no data
        P.fileName_sound = '26212002';% no data
        P.fileName_puff = '26212000'; % whisker
        P.cellID = '260212_1';
        P.pksThreshold_LED = 1000; % Spike detection threshold in mV
        P.pksThreshold_sound = 1000; % Spike detection threshold in mV
        P.pksThreshold_puff = 0.2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==69
        % 260212_2
        P.datapath = 'path\20260212';
        P.fileName_LED = '26212003';
        P.fileName_sound = '26212002';
        P.fileName_puff = '26212004'; % whisker
        P.cellID = '260212_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==70
        % 260212_3
        P.datapath = 'path\20260212';
        P.fileName_LED = '26212007';
        P.fileName_sound = '26212008';
        P.fileName_puff = '26212005'; % whisker
        P.cellID = '260212_3';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==71
        % 260212_4
        P.datapath = 'path\20260212';
        P.fileName_LED = '26212012';
        P.fileName_sound = '26212010';
        P.fileName_puff = '26212009'; % whisker
        P.cellID = '260212_4';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 0.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 0.58; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==72
        % 260212_5
        P.datapath = 'path\20260212';
        P.fileName_LED = '26212013';
        P.fileName_sound = '26212016';
        P.fileName_puff = '26212015'; % whisker
        P.cellID = '260212_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=30;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==73
        % 260212_6
        P.datapath = 'path\20260212';
        P.fileName_LED = '26212020';
        P.fileName_sound = '26212019';
        P.fileName_puff = '26212017'; % whisker
        P.cellID = '260212_6';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==74
        % 260212_7
        P.datapath = 'path\20260212';
        P.fileName_LED = '26212024';
        P.fileName_sound = '26212023';
        P.fileName_puff = '26212021'; % whisker
        P.cellID = '260212_7';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_LED_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_sound_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.numStim_puff_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.LED_optoduration = 0.5; % duration of the opto stim in s
        P.sound_optoduration = 0.8;% duration of the opto stim in s
        P.puff_optoduration = 0.5;% duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes
    end

    %% Shared analysis parameters
    % The cell-specific spike thresholds above are intentionally preserved.
    % The settings below define common analysis windows and output behavior.
    P.stimOrder = [1 2]; %1=no opto, 2=opto
    P.medianFiltWindow = 0.01; % 2.5 ms window median filter
    P.filtCutLow = 100; %low cut frequency in Hz
    % P.filtCutLow = 5; %low cut frequency in Hz
    P.filtOrder = 1; %Order of the filter
    P.cutoff  =   500;  % gaussian filter cutoff
    %P.cutoff  =   3000;  % gaussian filter cutoff
    P.TTLThreshold = 0.025;
    % Response windows in seconds after sensory stimulus onset.
    % All modalities use the same 0.5 s post-stimulus response window.
    P.LEDWindow = [0 0.5];
    P.soundWindow = [0 0.5];
    P.puffWindow = [0 0.5];
    P.LEDStimWindow = [0 0.02];
    P.soundStimWindow = [0 0.06];
    P.puffStimWindow = [0 0.15]; % Whisker stimulus display window: 150 ms
    P.ROCBaselineWindow = [-0.5 0];
    % ROC compares spike counts in equal-duration baseline and response
    % windows. Using a fixed 500 ms baseline count against a shorter response
    % window can falsely label quiet, non-responsive cells as suppressed.
    P.ROC_LEDBaselineWindow = matchedBaselineWindow(P.LEDWindow);
    P.ROC_soundBaselineWindow = matchedBaselineWindow(P.soundWindow);
    P.ROC_puffBaselineWindow = matchedBaselineWindow(P.puffWindow);
    % Thresholds at or above this value mean that stimulus was not recorded.
    % This lets a cell run with only one or two available stimulus files and
    % avoids wasting time opening placeholder ABFs.
    P.missingThreshold = 100;
    P.has_LED = isStimRecorded(P.fileName_LED,P.pksThreshold_LED,P.missingThreshold);
    P.has_sound = isStimRecorded(P.fileName_sound,P.pksThreshold_sound,P.missingThreshold);
    P.has_puff = isStimRecorded(P.fileName_puff,P.pksThreshold_puff,P.missingThreshold);
    if ~any([P.has_LED P.has_sound P.has_puff])
        warning('Cell %s has no recorded stimulus files; output values will be NaN.',P.cellID);
    end
    % Keep 1000 shuffles for compatibility with the old statistics.
    P.nShuffles = 1000;
    % Figure export switches. Default keeps editable MATLAB figures and SVG
    % vector graphics; PDF/JPG are off to avoid unnecessary duplicate files.
    P.saveExcel = true;
    P.saveDetectionFigures = false;
    P.saveFigFiles = true;
    P.saveSvgFiles = true;
    P.savePdfFiles = false;
    P.saveJpgFiles = false;
    cd(P.datapath)
    P.outputpath = [P.datapath '\AnalysisOutput' ];
    try
        cd(P.outputpath)
    catch
        mkdir(P.outputpath);
    end
    cd(P.datapath)

    %% Import ABF data
    % Each recorded ABF file is opened only once and all needed channels are
    % read together. Stimuli marked missing above are skipped completely,
    % which saves most of the runtime for cells with only one modality.
    D = struct();

    if P.has_LED
        ledChannels = {'IN 0','LED_L','Opto'};
        [raw_LED,D.si_LED,D.h_LED]=abf2load([P.datapath '\' num2str(P.fileName_LED) '.abf'],'channels',ledChannels);
        D.d_LED = getAbfChannelTrials(raw_LED,D.h_LED,ledChannels,'IN 0');
        D.d_LED_TTL = getAbfChannelTrials(raw_LED,D.h_LED,ledChannels,'LED_L');
        D.d_LED_opto_TTL = getAbfChannelTrials(raw_LED,D.h_LED,ledChannels,'Opto');
        clear raw_LED
        D.fs_LED = 10^6/D.si_LED; % Sampling frequency in Hz
        D.recLength_LED = size(D.d_LED,2)/D.fs_LED; % One-trial recording length in s
        D.Ts_LED = 1/D.fs_LED; % Sampling point duration in s
        D.trial_timestamps_LED = D.Ts_LED:D.Ts_LED:D.recLength_LED; % Time vector trial
        P.numStim_LED = size(D.d_LED_TTL,1);
    else
        [D,P] = markStimulusMissing(D,P,'LED');
    end

    if P.has_sound
        soundChannels = {'IN 0','Sound','Opto'};
        [raw_sound,D.si_sound,D.h_sound]=abf2load([P.datapath '\' num2str(P.fileName_sound) '.abf'],'channels',soundChannels);
        D.d_sound = getAbfChannelTrials(raw_sound,D.h_sound,soundChannels,'IN 0');
        D.d_sound_TTL = getAbfChannelTrials(raw_sound,D.h_sound,soundChannels,'Sound');
        D.d_sound_opto_TTL = getAbfChannelTrials(raw_sound,D.h_sound,soundChannels,'Opto');
        clear raw_sound
        D.fs_sound = 10^6/D.si_sound; % Sampling frequency in Hz
        D.recLength_sound = size(D.d_sound,2)/D.fs_sound; % One-trial recording length in s
        D.Ts_sound = 1/D.fs_sound; % Sampling point duration in s
        D.trial_timestamps_sound = D.Ts_sound:D.Ts_sound:D.recLength_sound; % Time vector trial
        P.numStim_sound = size(D.d_sound_TTL,1);
    else
        [D,P] = markStimulusMissing(D,P,'sound');
    end

    if P.has_puff
        puffChannels = {'IN 0','Puff','Opto'};
        [raw_puff,D.si_puff,D.h_puff]=abf2load([P.datapath '\' num2str(P.fileName_puff) '.abf'],'channels',puffChannels);
        D.d_puff = getAbfChannelTrials(raw_puff,D.h_puff,puffChannels,'IN 0');
        D.d_puff_TTL = getAbfChannelTrials(raw_puff,D.h_puff,puffChannels,'Puff');
        D.d_puff_opto_TTL = getAbfChannelTrials(raw_puff,D.h_puff,puffChannels,'Opto');
        clear raw_puff
        D.fs_puff = 10^6/D.si_puff; % Sampling frequency in Hz
        D.recLength_puff = size(D.d_puff,2)/D.fs_puff; % One-trial recording length in s
        D.Ts_puff = 1/D.fs_puff; % Sampling point duration in s
        D.trial_timestamps_puff = D.Ts_puff:D.Ts_puff:D.recLength_puff; % Time vector trial
        P.numStim_puff = size(D.d_puff_TTL,1);
    else
        [D,P] = markStimulusMissing(D,P,'puff');
    end

    D = fillMissingSampling(D,P);



    %% Merge all trials for spike detection
    % abf2load returns trial-by-time matrices. The original code detects
    % spikes on one continuous trace, then maps spike indices back to each
    % trial using TTL timestamps.
    D.d_LED_full = flattenTrialMatrix(D.d_LED);
    D.d_LED_TTL_full = flattenTrialMatrix(D.d_LED_TTL);
    D.d_LED_opto_TTL_full = flattenTrialMatrix(D.d_LED_opto_TTL);

    D.d_sound_full = flattenTrialMatrix(D.d_sound);
    D.d_sound_TTL_full = flattenTrialMatrix(D.d_sound_TTL);
    D.d_sound_opto_TTL_full = flattenTrialMatrix(D.d_sound_opto_TTL);

    D.d_puff_full = flattenTrialMatrix(D.d_puff);
    D.d_puff_TTL_full = flattenTrialMatrix(D.d_puff_TTL);
    D.d_puff_opto_TTL_full = flattenTrialMatrix(D.d_puff_opto_TTL);
    %% Filter traces and detect spikes
    % Missing modalities return empty spike vectors here, so all downstream
    % response metrics for that stimulus become NaN instead of stopping the run.
    D.pks = {}; D.locs = {};
    [D.d_LED_full_filt,D.pks_LED,D.locs_LED,h(1)] = filterAndDetectSpikes(...
        D.d_LED_full,D.fs_LED,P.pksThreshold_LED,P.spikeDetMode,P.filtTrace,50,'LED',spkpause);
    [D.d_sound_full_filt,D.pks_sound,D.locs_sound,h(2)] = filterAndDetectSpikes(...
        D.d_sound_full,D.fs_sound,P.pksThreshold_sound,P.spikeDetMode,P.filtTrace,50,'sound',spkpause);
    puffHighpassCutoff = 50;
    if counter==4
        puffHighpassCutoff = 200;
    end
    [D.d_puff_full_filt,D.pks_puff,D.locs_puff,h(3)] = filterAndDetectSpikes(...
        D.d_puff_full,D.fs_puff,P.pksThreshold_puff,P.spikeDetMode,P.filtTrace,puffHighpassCutoff,'puff',spkpause);


    %% Detect TTL onsets for each sensory and opto event
    % These timestamps are the anchors used to express every spike time
    % relative to stimulus onset, so any TTL mismatch is paused for review.
    D.LED_TTL.locs=[];
    idx = diff(D.d_LED_TTL_full);
    [~, D.LED_TTL.locs] = find(idx>2);
    if size(D.LED_TTL.locs,2)~=(P.numStim_LED*2)
        disp('error TTL detection LED')
        figure; hold on; title('LED'); plot(D.d_LED_TTL_full), plot(D.LED_TTL.locs,0.05,'r*');hold off
        pause;
    end

    D.LED_opto_TTL.locs=[];
    idx = diff(D.d_LED_opto_TTL_full);
    [~, D.LED_opto_TTL.locs] = find(idx>2);
    [~, LEDOptoOffsetCandidates] = find(idx<-2);
    D.LED_opto_TTL.offsets = pairTtlOffsets(D.LED_opto_TTL.locs,LEDOptoOffsetCandidates);
    if size(D.LED_opto_TTL.locs,2)~=P.numStim_LED
        disp('error TTL detection LED opto')
        figure; hold on; title('LED opto'); plot(D.d_LED_opto_TTL_full), plot(D.LED_opto_TTL.locs,0.05,'r*');hold off
        pause;
    end

    D.sound_TTL.locs=[];
    for jj=1:P.numStim_sound*2
        idx = diff(D.d_sound_TTL_full((jj-1)*D.fs_sound*(D.recLength_sound/2)+1:(jj)*(D.fs_sound*D.recLength_sound/2)));
        [~, D.sound_TTL.locs(jj)] = find(idx>0.05,1,'first');
        D.sound_TTL.locs(jj)=D.sound_TTL.locs(jj)+((jj-1)*D.fs_sound*(D.recLength_sound/2)+1);

        %         idx = diff(D.d_sound_TTL_full((jj-1)*D.fs_sound*(D.recLength_sound/2)+1:(jj)*D.fs_sound*D.recLength_sound));
        %         [~, D.sound_TTL.locs(jj)] = find(idx>0.05,1,'first');
        %         D.sound_TTL.locs(jj,2)=D.sound_TTL.locs(jj)+((jj-1)*D.fs_sound*D.recLength_sound+1)+(D.fs_sound*D.recLength_sound);
    end

    if size(D.sound_TTL.locs,2)~=P.numStim_sound*2
        disp('error TTL detection sound')
        figure; hold on; title('sound'); plot(D.d_sound_TTL_full), plot(D.sound_TTL.locs,0.05,'r*');hold off
        pause;
    end

    D.sound_opto_TTL.locs=[];
    idx = diff(D.d_sound_opto_TTL_full);
    [~, D.sound_opto_TTL.locs] = find(idx>2);
    [~, soundOptoOffsetCandidates] = find(idx<-2);
    D.sound_opto_TTL.offsets = pairTtlOffsets(D.sound_opto_TTL.locs,soundOptoOffsetCandidates);
    if size(D.sound_opto_TTL.locs,2)~=P.numStim_sound
        disp('error TTL detection sound opto')
        figure; hold on; title('sound opto'); plot(D.d_sound_opto_TTL_full), plot(D.sound_opto_TTL.locs,0.05,'r*');hold off
        pause;
    end

    D.puff_TTL.locs=[];
    idx = diff(D.d_puff_TTL_full);
    [~, D.puff_TTL.locs] = find(idx>2);
    if size(D.puff_TTL.locs,2)~=P.numStim_puff*2
        disp('error TTL detection puff')
        figure; hold on; title('puff'); plot(D.d_puff_TTL_full), plot(D.puff_TTL.locs,0.05,'r*');hold off
        pause;
    end

    D.puff_opto_TTL.locs=[];
    idx = diff(D.d_puff_opto_TTL_full);
    [~, D.puff_opto_TTL.locs] = find(idx>2);
    [~, puffOptoOffsetCandidates] = find(idx<-2);
    D.puff_opto_TTL.offsets = pairTtlOffsets(D.puff_opto_TTL.locs,puffOptoOffsetCandidates);
    if size(D.puff_opto_TTL.locs,2)~=P.numStim_puff
        disp('error TTL detection puff opto')
        figure; hold on; title('puff opto'); plot(D.d_puff_opto_TTL_full), plot(D.puff_opto_TTL.locs,0.05,'r*');hold off
        pause;
    end


    %% Correct if the number of stimuli is less (manual input)
    if P.has_LED && isempty(P.numStim_LED_manual)==0
        D.LED_TTL.locs=D.LED_TTL.locs(1:(P.numStim_LED_manual*2));
        P.numStim_LED = P.numStim_LED_manual;
    end

    if P.has_puff && isempty(P.numStim_puff_manual)==0
        D.puff_TTL.locs=D.puff_TTL.locs(1:(P.numStim_puff_manual*2));
        P.numStim_puff = P.numStim_puff_manual;
    end

    if P.has_sound && isempty(P.numStim_sound_manual)==0
        D.sound_TTL.locs=D.sound_TTL.locs(1:(P.numStim_sound_manual*2));
        P.numStim_sound = P.numStim_sound_manual;
    end

    %% Gather trial spike times based on TTL timestamps
    % Each cell in D.trialdata_* contains spike times in seconds from the
    % stimulus onset for one no-opto or opto trial.
    D.trialID = repmat(P.stimOrder,1,P.numReps);
    D.trial_timestamps = -0.75+D.Ts_LED:D.Ts_LED:1.25; %750ms baseline - stimulus - 1.25s after
    D.trialdata_LED={};
    D.trialdata_LED_opto={};
    D.trialdata_sound={};
    D.trialdata_sound_opto={};
    D.trialdata_puff={};
    D.trialdata_puff_opto={};

    % Calculate the trial_timestamps in seconds around stimulus start
    idx_noopto=linspace(1,99,50);
    idx_opto=linspace(2,100,50);
    for ii = 1:P.numStim_LED
        D.trialdata_LED{ii} = (D.locs_LED(D.LED_TTL.locs(idx_noopto(ii))-(0.75*D.fs_LED)<=D.locs_LED & D.locs_LED<D.LED_TTL.locs(idx_noopto(ii))+(1.25*D.fs_LED))-D.LED_TTL.locs(idx_noopto(ii)))*D.Ts_LED;
        D.trialdata_LED{ii} = D.trialdata_LED{ii}';
    end
    for ii = 1:P.numStim_LED
        D.trialdata_LED_opto{ii} = (D.locs_LED(D.LED_TTL.locs(idx_opto(ii))-(0.75*D.fs_LED)<=D.locs_LED & D.locs_LED<D.LED_TTL.locs(idx_opto(ii))+(1.25*D.fs_LED))-D.LED_TTL.locs(idx_opto(ii)))*D.Ts_LED;
        D.trialdata_LED_opto{ii} = D.trialdata_LED_opto{ii}';
    end
    for ii = 1:P.numStim_sound
        D.trialdata_sound{ii} = (D.locs_sound(D.sound_TTL.locs(idx_noopto(ii))-(0.75*D.fs_sound)<=D.locs_sound & D.locs_sound<D.sound_TTL.locs(idx_noopto(ii))+(1.25*D.fs_sound))-D.sound_TTL.locs(idx_noopto(ii)))*D.Ts_sound;
        D.trialdata_sound{ii} = D.trialdata_sound{ii}';
    end
    for ii = 1:P.numStim_sound
        D.trialdata_sound_opto{ii} = (D.locs_sound(D.sound_TTL.locs(idx_opto(ii))-(0.75*D.fs_sound)<=D.locs_sound & D.locs_sound<D.sound_TTL.locs(idx_opto(ii))+(1.25*D.fs_sound))-D.sound_TTL.locs(idx_opto(ii)))*D.Ts_sound;
        D.trialdata_sound_opto{ii} = D.trialdata_sound_opto{ii}';
    end
    for ii = 1:P.numStim_puff
        D.trialdata_puff{ii} = (D.locs_puff(D.puff_TTL.locs(idx_noopto(ii))-(0.75*D.fs_puff)<=D.locs_puff & D.locs_puff<D.puff_TTL.locs(idx_noopto(ii))+(1.25*D.fs_puff))-D.puff_TTL.locs(idx_noopto(ii)))*D.Ts_puff;
        D.trialdata_puff{ii} = D.trialdata_puff{ii}';
    end
    for ii = 1:P.numStim_puff
        D.trialdata_puff_opto{ii} = (D.locs_puff(D.puff_TTL.locs(idx_opto(ii))-(0.75*D.fs_puff)<=D.locs_puff & D.locs_puff<D.puff_TTL.locs(idx_opto(ii))+(1.25*D.fs_puff))-D.puff_TTL.locs(idx_opto(ii)))*D.Ts_puff;
        D.trialdata_puff_opto{ii} = D.trialdata_puff_opto{ii}';
    end

    % Exclude the spikes 1ms around the stim start and end, representing the
    % stimulus artifact of the LED (20ms LED stimulus)
    idx = [];
    for ii = 1:P.numStim_LED
        idx = D.trialdata_LED{ii};
        idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
        idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
        D.trialdata_LED{ii}=idx;
    end

    idx = [];
    for ii = 1:P.numStim_LED
        idx = D.trialdata_LED_opto{ii};
        idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
        idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
        D.trialdata_LED_opto{ii}=idx;
    end

    % Exclude the spikes 1ms around the stim start and end, representing the
    % stimulus artifact of the puff (20ms puff stimulus)
    % idx = [];
    % for ii = 1:P.numStim_puff
    %     idx = D.trialdata_puff{ii};
    %     idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    %     idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    %     D.trialdata_puff{ii}=idx;
    % end

    %% Calculate the timing of the opto relative to the stimuli

    D.LED_opto_TTL.locs_times = nan(1,2);
    D.sound_opto_TTL.locs_times = nan(1,2);
    D.puff_opto_TTL.locs_times = nan(1,2);

    for ii=1:P.numStim_LED
        D.LED_opto_TTL.locs_times(ii,1) = (D.LED_opto_TTL.locs(ii)-D.LED_TTL.locs(ii*2))/D.fs_LED;
        D.LED_opto_TTL.locs_times(ii,2) = getRelativeOptoOffset(D.LED_opto_TTL.offsets,ii,D.LED_TTL.locs(ii*2),D.fs_LED,D.LED_opto_TTL.locs_times(ii,1),P.LED_optoduration);
    end

    for ii=1:P.numStim_sound
        D.sound_opto_TTL.locs_times(ii,1) = (D.sound_opto_TTL.locs(ii)-D.sound_TTL.locs(ii*2))/D.fs_sound;
        D.sound_opto_TTL.locs_times(ii,2) = getRelativeOptoOffset(D.sound_opto_TTL.offsets,ii,D.sound_TTL.locs(ii*2),D.fs_sound,D.sound_opto_TTL.locs_times(ii,1),P.sound_optoduration);
    end

    for ii=1:P.numStim_puff
        D.puff_opto_TTL.locs_times(ii,1) = (D.puff_opto_TTL.locs(ii)-D.puff_TTL.locs(ii*2))/D.fs_puff;
        D.puff_opto_TTL.locs_times(ii,2) = getRelativeOptoOffset(D.puff_opto_TTL.offsets,ii,D.puff_TTL.locs(ii*2),D.fs_puff,D.puff_opto_TTL.locs_times(ii,1),P.puff_optoduration);
    end



    %% Construct raster plots and PSTHs
    % Raster dots show spikes per trial; KDE traces summarize firing rate.
    % Green vertical lines mark sensory stimulus start/end; blue lines mark
    % optogenetic stimulation start/end when present.
    count_LED = 0; count_sound = 0; count_puff = 0;

    h(4)=figure; hold on;
    for ii=1:P.numStim_LED
        count_LED=count_LED+1;
        subplot(2,3,1);
        plot(D.trialdata_LED{count_LED},repmat(count_LED,numel(D.trialdata_LED{count_LED}),1),'k.');hold on;
    end
    for ii=1:P.numStim_sound
        count_sound=count_sound+1;
        subplot(2,3,2);
        plot(D.trialdata_sound{count_sound},repmat(count_sound,numel(D.trialdata_sound{count_sound}),1),'k.');hold on;
    end
    for ii=1:P.numStim_puff
        count_puff=count_puff+1;
        subplot(2,3,3);
        plot(D.trialdata_puff{count_puff},repmat(count_puff,numel(D.trialdata_puff{count_puff}),1),'k.');hold on;
    end
    count_LED = 0; count_sound = 0; count_puff = 0;
    for ii=1:P.numStim_LED
        count_LED=count_LED+1;
        subplot(2,3,4);
        plot(D.trialdata_LED_opto{count_LED},repmat(count_LED,numel(D.trialdata_LED_opto{count_LED}),1),'b.');hold on;
    end
    for ii=1:P.numStim_sound
        count_sound=count_sound+1;
        subplot(2,3,5);
        plot(D.trialdata_sound_opto{count_sound},repmat(count_sound,numel(D.trialdata_sound_opto{count_sound}),1),'b.');hold on;
    end
    for ii=1:P.numStim_puff
        count_puff=count_puff+1;
        subplot(2,3,6);
        plot(D.trialdata_puff_opto{count_puff},repmat(count_puff,numel(D.trialdata_puff_opto{count_puff}),1),'b.');hold on;
    end

    % Adjust the Yaxis of PSTH to fit #trials

    subplot(2,3,1);
    ylim([0 P.numStim_LED+1]);set(gca,'FontSize',8)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',8)
    xlabel('Time (s)')
    subplot(2,3,2);
    ylim([0 P.numStim_sound+1]);set(gca,'FontSize',8)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',8)
    xlabel('Time (s)')
    subplot(2,3,3);
    ylim([0 P.numStim_puff+1]);set(gca,'FontSize',8)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',8)
    xlabel('Time (s)')

    subplot(2,3,4);
    ylim([0 P.numStim_LED+1]);set(gca,'FontSize',8)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',8)
    xlabel('Time (s)')
    subplot(2,3,5);
    ylim([0 P.numStim_sound+1]);set(gca,'FontSize',8)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',8)
    xlabel('Time (s)')
    subplot(2,3,6);
    ylim([0 P.numStim_puff+1]);set(gca,'FontSize',8)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',8)
    xlabel('Time (s)')


    %% Calculate KDE
    [D.LED_kde,D.LED_kde_X]= getKdeOrNaN(D.trialdata_LED,[-0.7499 1.25],P.has_LED);
    [D.sound_kde,D.sound_kde_X]= getKdeOrNaN(D.trialdata_sound,[-0.7499 1.25],P.has_sound);
    [D.puff_kde,D.puff_kde_X]= getKdeOrNaN(D.trialdata_puff,[-0.7499 1.25],P.has_puff);
    [D.LED_opto_kde,D.LED_opto_kde_X]= getKdeOrNaN(D.trialdata_LED_opto,[-0.7499 1.25],P.has_LED);
    [D.sound_opto_kde,D.sound_opto_kde_X]= getKdeOrNaN(D.trialdata_sound_opto,[-0.7499 1.25],P.has_sound);
    [D.puff_opto_kde,D.puff_opto_kde_X]= getKdeOrNaN(D.trialdata_puff_opto,[-0.7499 1.25],P.has_puff);

    %% Plot/adjust subplots
    % LED
    P.axes(1) = subplot(2,3,1);
    title('LED','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([P.LEDStimWindow(2) P.LEDStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.LED_kde_X,D.LED_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %sound
    P.axes(2) = subplot(2,3,2);
    title('Sound','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([P.soundStimWindow(2) P.soundStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.sound_kde_X,D.sound_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %puff
    P.axes(3) = subplot(2,3,3);
    title('Whisker','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([P.puffStimWindow(2) P.puffStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.puff_kde_X,D.puff_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    % LED+opto
    P.axes(4) = subplot(2,3,4);
    title('LED+opto','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([P.LEDStimWindow(2) P.LEDStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([nanmean(D.LED_opto_TTL.locs_times(:,1)) nanmean(D.LED_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.LED_opto_TTL.locs_times(:,2)) nanmean(D.LED_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    yyaxis right
    plot(D.LED_opto_kde_X,D.LED_opto_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %sound+opto
    P.axes(5) = subplot(2,3,5);
    title('Sound+opto','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([P.soundStimWindow(2) P.soundStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([nanmean(D.sound_opto_TTL.locs_times(:,1)) nanmean(D.sound_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.sound_opto_TTL.locs_times(:,2)) nanmean(D.sound_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    yyaxis right
    plot(D.sound_opto_kde_X,D.sound_opto_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %puff
    P.axes(6) = subplot(2,3,6);
    title('Whisker+opto','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([P.puffStimWindow(2) P.puffStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([nanmean(D.puff_opto_TTL.locs_times(:,1)) nanmean(D.puff_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.puff_opto_TTL.locs_times(:,2)) nanmean(D.puff_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    yyaxis right
    plot(D.puff_opto_kde_X,D.puff_opto_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    linkaxes(P.axes,'y')
    linkaxes(P.axes,'x')
    % xlim([-0.5 1])

    %% plot individual graphs
    count_LED = 0; count_sound = 0; count_puff = 0;
    h(5)=figure; hold on;
    for ii=1:P.numStim_LED
        count_LED=count_LED+1;
        plot(D.trialdata_LED{count_LED},repmat(count_LED,numel(D.trialdata_LED{count_LED}),1),'k.','MarkerSize',1);hold on;
    end
    ylim([0 P.numStim_LED+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([P.LEDStimWindow(2) P.LEDStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    yyaxis right
    plot(D.LED_kde_X,D.LED_kde,'k','LineWidth',0.5);
    ylabel('Spike rate (Hz)')

    h(6) = figure; hold on;
    for ii=1:P.numStim_sound
        count_sound=count_sound+1;
        plot(D.trialdata_sound{count_sound},repmat(count_sound,numel(D.trialdata_sound{count_sound}),1),'k.','MarkerSize',1);hold on;
    end
    ylim([0 P.numStim_sound+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([P.soundStimWindow(2) P.soundStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    yyaxis right
    plot(D.sound_kde_X,D.sound_kde,'k','LineWidth',0.5);
    ylabel('Spike rate (Hz)')

    h(7) = figure; hold on;
    for ii=1:P.numStim_puff
        count_puff=count_puff+1;
        plot(D.trialdata_puff{count_puff},repmat(count_puff,numel(D.trialdata_puff{count_puff}),1),'k.','MarkerSize',1);hold on;
    end
    ylim([0 P.numStim_puff+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([P.puffStimWindow(2) P.puffStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    yyaxis right
    plot(D.puff_kde_X,D.puff_kde,'k','LineWidth',0.5);
    ylabel('Spike rate (Hz)')

    count_LED = 0; count_sound = 0; count_puff = 0;
    h(8)=figure; hold on;
    for ii=1:P.numStim_LED
        count_LED=count_LED+1;
        plot(D.trialdata_LED_opto{count_LED},repmat(count_LED,numel(D.trialdata_LED_opto{count_LED}),1),'b.','MarkerSize',1);hold on;
    end
    ylim([0 P.numStim_LED+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([P.LEDStimWindow(2) P.LEDStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([nanmean(D.LED_opto_TTL.locs_times(:,1)) nanmean(D.LED_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.LED_opto_TTL.locs_times(:,2)) nanmean(D.LED_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    yyaxis right
    plot(D.LED_opto_kde_X,D.LED_opto_kde,'b','LineWidth',0.5);
    ylabel('Spike rate (Hz)')

    h(9) = figure; hold on;
    for ii=1:P.numStim_sound
        count_sound=count_sound+1;
        plot(D.trialdata_sound_opto{count_sound},repmat(count_sound,numel(D.trialdata_sound_opto{count_sound}),1),'b.','MarkerSize',1);hold on;
    end
    ylim([0 P.numStim_sound+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([P.soundStimWindow(2) P.soundStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([nanmean(D.sound_opto_TTL.locs_times(:,1)) nanmean(D.sound_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.sound_opto_TTL.locs_times(:,2)) nanmean(D.sound_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);

    yyaxis right
    plot(D.sound_opto_kde_X,D.sound_opto_kde,'b','LineWidth',0.5);
    ylabel('Spike rate (Hz)')

    h(10) = figure; hold on;
    for ii=1:P.numStim_puff
        count_puff=count_puff+1;
        plot(D.trialdata_puff_opto{count_puff},repmat(count_puff,numel(D.trialdata_puff_opto{count_puff}),1),'b.','MarkerSize',1);hold on;
    end
    ylim([0 P.numStim_puff+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([P.puffStimWindow(2) P.puffStimWindow(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
    line([nanmean(D.puff_opto_TTL.locs_times(:,1)) nanmean(D.puff_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.puff_opto_TTL.locs_times(:,2)) nanmean(D.puff_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    yyaxis right
    plot(D.puff_opto_kde_X,D.puff_opto_kde,'b','LineWidth',0.5);
    ylabel('Spike rate (Hz)')

    %% Calculate the baseline spike frequency for normalization
    R.kde_baselinefreq_LED = mean(D.LED_kde(D.LED_kde_X>-0.25&D.LED_kde_X<0));
    R.kde_baselinefreq_sound = mean(D.sound_kde(D.sound_kde_X>-0.6&D.sound_kde_X<-0.35));
    R.kde_baselinefreq_puff = mean(D.puff_kde(D.puff_kde_X>-0.25&D.puff_kde_X<0));
    R.kde_baselinefreq_LED_opto = mean(D.LED_opto_kde(D.LED_opto_kde_X>-0.25&D.LED_opto_kde_X<0));
    R.kde_baselinefreq_sound_opto = mean(D.sound_opto_kde(D.sound_opto_kde_X>-0.6&D.sound_opto_kde_X<-0.35));
    R.kde_baselinefreq_sound_opto_50msbeforestim = mean(D.sound_opto_kde(D.sound_opto_kde_X>-0.05&D.sound_opto_kde_X<0));
    R.kde_baselinefreq_puff_opto = mean(D.puff_opto_kde(D.puff_opto_kde_X>-0.25&D.puff_opto_kde_X<0));

    %% Calculate response characteristics

    % Peak amplitude and area use modality-specific response windows.
    R.peakamp_max_LED = maxInWindow(D.LED_kde,D.LED_kde_X,P.LEDWindow);
    R.peakamp_max_sound = maxInWindow(D.sound_kde,D.sound_kde_X,P.soundWindow);
    R.peakamp_max_puff = maxInWindow(D.puff_kde,D.puff_kde_X,P.puffWindow);

    R.peakamp_min_LED = minInWindow(D.LED_kde,D.LED_kde_X,P.LEDWindow);
    R.peakamp_min_sound = minInWindow(D.sound_kde,D.sound_kde_X,P.soundWindow);
    R.peakamp_min_puff = minInWindow(D.puff_kde,D.puff_kde_X,P.puffWindow);

    R.peakamp_max_LED_opto = maxInWindow(D.LED_opto_kde,D.LED_opto_kde_X,P.LEDWindow);
    R.peakamp_max_sound_opto = maxInWindow(D.sound_opto_kde,D.sound_opto_kde_X,P.soundWindow);
    R.peakamp_max_puff_opto = maxInWindow(D.puff_opto_kde,D.puff_opto_kde_X,P.puffWindow);

    R.peakamp_min_LED_opto = minInWindow(D.LED_opto_kde,D.LED_opto_kde_X,P.LEDWindow);
    R.peakamp_min_sound_opto = minInWindow(D.sound_opto_kde,D.sound_opto_kde_X,P.soundWindow);
    R.peakamp_min_puff_opto = minInWindow(D.puff_opto_kde,D.puff_opto_kde_X,P.puffWindow);

    % Amplitude corrected for baseline frequency.
    R.amp_max_LED = R.peakamp_max_LED-R.kde_baselinefreq_LED;
    R.amp_max_sound = R.peakamp_max_sound-R.kde_baselinefreq_sound;
    R.amp_max_puff = R.peakamp_max_puff-R.kde_baselinefreq_puff;

    R.amp_min_LED = R.peakamp_min_LED-R.kde_baselinefreq_LED;
    R.amp_min_sound = R.peakamp_min_sound-R.kde_baselinefreq_sound;
    R.amp_min_puff = R.peakamp_min_puff-R.kde_baselinefreq_puff;

    R.amp_max_LED_opto = R.peakamp_max_LED_opto-R.kde_baselinefreq_LED_opto;
    R.amp_max_sound_opto = R.peakamp_max_sound_opto-R.kde_baselinefreq_sound_opto;
    R.amp_max_sound_opto_50msbaseline = maxInWindow(D.sound_kde,D.sound_kde_X,P.soundWindow)-R.kde_baselinefreq_sound_opto_50msbeforestim;
    R.amp_max_puff_opto = R.peakamp_max_puff_opto-R.kde_baselinefreq_puff_opto;

    R.amp_min_LED_opto = R.peakamp_min_LED_opto-R.kde_baselinefreq_LED_opto;
    R.amp_min_sound_opto = R.peakamp_min_sound_opto-R.kde_baselinefreq_sound_opto;
    R.amp_min_sound_opto_50msbaseline = minInWindow(D.sound_kde,D.sound_kde_X,P.soundWindow)-R.kde_baselinefreq_sound_opto_50msbeforestim;
    R.amp_min_puff_opto = R.peakamp_min_puff_opto-R.kde_baselinefreq_puff_opto;

    %First-spike latency for responses - find spike times higher than 0
    idx=[];
    for ii = 1:P.numStim_LED
        try
            idx(ii)=D.trialdata_LED{ii}(find(D.trialdata_LED{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<P.LEDWindow(2));% Remove spiketimes beyond the response window
    R.latency_LED = median(idx);

    idx=[];
    for ii = 1:P.numStim_sound
        try
            idx(ii)=D.trialdata_sound{ii}(find(D.trialdata_sound{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<P.soundWindow(2));% Remove spiketimes beyond the response window
    R.latency_sound = median(idx);

    idx=[];
    for ii = 1:P.numStim_puff
        try
            idx(ii)=D.trialdata_puff{ii}(find(D.trialdata_puff{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<P.puffWindow(2));% Remove spiketimes beyond the response window
    R.latency_puff = median(idx);

    idx=[];
    for ii = 1:P.numStim_LED
        try
            idx(ii)=D.trialdata_LED_opto{ii}(find(D.trialdata_LED_opto{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<P.LEDWindow(2));% Remove spiketimes beyond the response window
    R.latency_LED_opto = median(idx);

    idx=[];
    for ii = 1:P.numStim_sound
        try
            idx(ii)=D.trialdata_sound_opto{ii}(find(D.trialdata_sound_opto{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<P.soundWindow(2));% Remove spiketimes beyond the response window
    R.latency_sound_opto = median(idx);

    idx=[];
    for ii = 1:P.numStim_puff
        try
            idx(ii)=D.trialdata_puff_opto{ii}(find(D.trialdata_puff_opto{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<P.puffWindow(2));% Remove spiketimes beyond the response window
    R.latency_puff_opto = median(idx);

    % Calculate the area
    R.area_LED=sumInWindow(D.LED_kde-R.kde_baselinefreq_LED,D.LED_kde_X,P.LEDWindow);
    R.area_sound=sumInWindow(D.sound_kde-R.kde_baselinefreq_sound,D.sound_kde_X,P.soundWindow);
    R.area_puff=sumInWindow(D.puff_kde-R.kde_baselinefreq_puff,D.puff_kde_X,P.puffWindow);
    R.area_LED_opto=sumInWindow(D.LED_opto_kde-R.kde_baselinefreq_LED_opto,D.LED_opto_kde_X,P.LEDWindow);
    R.area_sound_opto=sumInWindow(D.sound_opto_kde-R.kde_baselinefreq_sound_opto,D.sound_opto_kde_X,P.soundWindow);
    R.area_puff_opto=sumInWindow(D.puff_opto_kde-R.kde_baselinefreq_puff_opto,D.puff_opto_kde_X,P.puffWindow);

    %% Spontaneous parameters
    R.spont.data_LED=[];
    R.spont.duration_LED=0;
    R.spont.ISI_list_LED=[];

    R.spont.data_sound=[];
    R.spont.duration_sound=0;
    R.spont.ISI_list_sound=[];

    R.spont.data_puff=[];
    R.spont.duration_puff=0;
    R.spont.ISI_list_puff=[];

    %LED
    for ii = 1:P.numStim_LED
        R.spont.data_LED=[R.spont.data_LED reshape(D.trialdata_LED{ii}(D.trialdata_LED{ii}<0),1,[])];
        R.spont.duration_LED=R.spont.duration_LED+0.75;
        R.spont.ISI_list_LED = [R.spont.ISI_list_LED reshape(diff(D.trialdata_LED{ii}(D.trialdata_LED{ii}<0)),1,[])];
    end

    % Calculate the stats
    R.spont.FF_LED = size(R.spont.data_LED,2)/R.spont.duration_LED;
    R.spont.ISI_LED(1,1) = nanmean(R.spont.ISI_list_LED); % mean of ISIs
    R.spont.ISI_LED(1,2) = nanstd(R.spont.ISI_list_LED);% SD of ISIs
    R.spont.CV_LED = (R.spont.ISI_LED(1,1)/R.spont.ISI_LED(1,2));

    %sound
    for ii = 1:P.numStim_sound
        R.spont.data_sound=[R.spont.data_sound reshape(D.trialdata_sound{ii}(D.trialdata_sound{ii}<0),1,[])];
        R.spont.duration_sound=R.spont.duration_sound+0.75;
        R.spont.ISI_list_sound = [R.spont.ISI_list_sound reshape(diff(D.trialdata_sound{ii}(D.trialdata_sound{ii}<0)),1,[])];
    end

    % Calculate the stats
    R.spont.FF_sound = size(R.spont.data_sound,2)/R.spont.duration_sound;
    R.spont.ISI_sound(1,1) = nanmean(R.spont.ISI_list_sound); % mean of ISIs
    R.spont.ISI_sound(1,2) = nanstd(R.spont.ISI_list_sound);% SD of ISIs
    R.spont.CV_sound = (R.spont.ISI_sound(1,1)/R.spont.ISI_sound(1,2));

    %puff
    for ii = 1:P.numStim_puff
        R.spont.data_puff=[R.spont.data_puff reshape(D.trialdata_puff{ii}(D.trialdata_puff{ii}<0),1,[])];
        R.spont.duration_puff=R.spont.duration_puff+0.75;
        R.spont.ISI_list_puff = [R.spont.ISI_list_puff reshape(diff(D.trialdata_puff{ii}(D.trialdata_puff{ii}<0)),1,[])];
    end

    % Calculate the stats
    R.spont.FF_puff = size(R.spont.data_puff,2)/R.spont.duration_puff;
    R.spont.ISI_puff(1,1) = nanmean(R.spont.ISI_list_puff); % mean of ISIs
    R.spont.ISI_puff(1,2) = nanstd(R.spont.ISI_list_puff);% SD of ISIs
    R.spont.CV_puff = (R.spont.ISI_puff(1,1)/R.spont.ISI_puff(1,2));

    % Average the spont measures
    R.spont.FF = nanmean([R.spont.FF_LED, R.spont.FF_sound, R.spont.FF_puff]);
    R.spont.ISI = nanmean([R.spont.ISI_LED(1), R.spont.ISI_sound(1), R.spont.ISI_puff(1)]);
    R.spont.CV = nanmean([R.spont.CV_LED, R.spont.CV_sound, R.spont.CV_puff]);

    %% Perform ROC to detect significant responses
    % Empty modalities keep empty count arrays and are reported as NaN in
    % Excel. The helper below keeps the old shuffle statistic but avoids
    % creating six temporary ROC figures.
    R.ROC=[];
    R.ROC.baseline_LED=[]; R.ROC.stim_LED=[];
    R.ROC.baseline_sound=[]; R.ROC.stim_sound=[];
    R.ROC.baseline_puff=[]; R.ROC.stim_puff=[];
    R.ROC.baseline_LED_opto=[]; R.ROC.stim_LED_opto=[];
    R.ROC.baseline_sound_opto=[]; R.ROC.stim_sound_opto=[];
    R.ROC.baseline_puff_opto=[]; R.ROC.stim_puff_opto=[];

    for ii=1:P.numStim_LED
        R.ROC.baseline_LED(ii) = countSpikesInWindow(D.trialdata_LED{ii},P.ROC_LEDBaselineWindow);
        R.ROC.stim_LED(ii) = countSpikesInWindow(D.trialdata_LED{ii},P.LEDWindow);
        R.ROC.baseline_LED_opto(ii) = countSpikesInWindow(D.trialdata_LED_opto{ii},P.ROC_LEDBaselineWindow);
        R.ROC.stim_LED_opto(ii) = countSpikesInWindow(D.trialdata_LED_opto{ii},P.LEDWindow);
    end

    for ii=1:P.numStim_sound
        R.ROC.baseline_sound(ii) = countSpikesInWindow(D.trialdata_sound{ii},P.ROC_soundBaselineWindow);
        R.ROC.stim_sound(ii) = countSpikesInWindow(D.trialdata_sound{ii},P.soundWindow);
        R.ROC.baseline_sound_opto(ii) = countSpikesInWindow(D.trialdata_sound_opto{ii},P.ROC_soundBaselineWindow);
        R.ROC.stim_sound_opto(ii) = countSpikesInWindow(D.trialdata_sound_opto{ii},P.soundWindow);
    end

    for ii=1:P.numStim_puff
        R.ROC.baseline_puff(ii) = countSpikesInWindow(D.trialdata_puff{ii},P.ROC_puffBaselineWindow);
        R.ROC.stim_puff(ii) = countSpikesInWindow(D.trialdata_puff{ii},P.puffWindow);
        R.ROC.baseline_puff_opto(ii) = countSpikesInWindow(D.trialdata_puff_opto{ii},P.ROC_puffBaselineWindow);
        R.ROC.stim_puff_opto(ii) = countSpikesInWindow(D.trialdata_puff_opto{ii},P.puffWindow);
    end

    [R.ROC.LED_facilitation,R.ROC.LED_suppression] = rocShuffleStatsOrNaN(R.ROC.baseline_LED,R.ROC.stim_LED,P.nShuffles,P.has_LED);
    [R.ROC.sound_facilitation,R.ROC.sound_suppression] = rocShuffleStatsOrNaN(R.ROC.baseline_sound,R.ROC.stim_sound,P.nShuffles,P.has_sound);
    [R.ROC.puff_facilitation,R.ROC.puff_suppression] = rocShuffleStatsOrNaN(R.ROC.baseline_puff,R.ROC.stim_puff,P.nShuffles,P.has_puff);
    [R.ROC.LED_opto_facilitation,R.ROC.LED_opto_suppression] = rocShuffleStatsOrNaN(R.ROC.baseline_LED_opto,R.ROC.stim_LED_opto,P.nShuffles,P.has_LED);
    [R.ROC.sound_opto_facilitation,R.ROC.sound_opto_suppression] = rocShuffleStatsOrNaN(R.ROC.baseline_sound_opto,R.ROC.stim_sound_opto,P.nShuffles,P.has_sound);
    [R.ROC.puff_opto_facilitation,R.ROC.puff_opto_suppression] = rocShuffleStatsOrNaN(R.ROC.baseline_puff_opto,R.ROC.stim_puff_opto,P.nShuffles,P.has_puff);


    %% Output figures and data
    cd(P.outputpath)
    R.outputVars = ([R.spont.FF, R.spont.ISI, R.spont.CV...
        R.ROC.LED_facilitation, R.ROC.LED_suppression, R.ROC.sound_facilitation, R.ROC.sound_suppression, R.ROC.puff_facilitation, R.ROC.puff_suppression...
        R.ROC.LED_opto_facilitation, R.ROC.LED_opto_suppression, R.ROC.sound_opto_facilitation, R.ROC.sound_opto_suppression, R.ROC.puff_opto_facilitation, R.ROC.puff_opto_suppression...
        R.kde_baselinefreq_LED, R.peakamp_max_LED, R.peakamp_min_LED, R.amp_max_LED, R.amp_min_LED, R.latency_LED, R.area_LED...
        R.kde_baselinefreq_LED_opto, R.peakamp_max_LED_opto, R.peakamp_min_LED_opto, R.amp_max_LED_opto, R.amp_min_LED_opto, R.latency_LED_opto, R.area_LED_opto...
        R.kde_baselinefreq_sound, R.peakamp_max_sound, R.peakamp_min_sound, R.amp_max_sound, R.amp_min_sound, R.latency_sound, R.area_sound...
        R.kde_baselinefreq_sound_opto, R.peakamp_max_sound_opto, R.peakamp_min_sound_opto, R.amp_max_sound_opto, R.amp_min_sound_opto, R.latency_sound_opto, R.area_sound_opto...
        R.kde_baselinefreq_puff, R.peakamp_max_puff, R.peakamp_min_puff, R.amp_max_puff, R.amp_min_puff, R.latency_puff, R.area_puff...
        R.kde_baselinefreq_puff_opto, R.peakamp_max_puff_opto, R.peakamp_min_puff_opto, R.amp_max_puff_opto, R.amp_min_puff_opto, R.latency_puff_opto, R.area_puff_opto...
        R.kde_baselinefreq_sound_opto_50msbeforestim, R.amp_max_sound_opto_50msbaseline, R.amp_min_sound_opto_50msbaseline]);

    OutputVars(counter,:) = ([R.spont.FF, R.spont.ISI, R.spont.CV...
        R.ROC.LED_facilitation, R.ROC.LED_suppression, R.ROC.sound_facilitation, R.ROC.sound_suppression, R.ROC.puff_facilitation, R.ROC.puff_suppression...
        R.ROC.LED_opto_facilitation, R.ROC.LED_opto_suppression, R.ROC.sound_opto_facilitation, R.ROC.sound_opto_suppression, R.ROC.puff_opto_facilitation, R.ROC.puff_opto_suppression...
        R.kde_baselinefreq_LED, R.peakamp_max_LED, R.peakamp_min_LED, R.amp_max_LED, R.amp_min_LED, R.latency_LED, R.area_LED...
        R.kde_baselinefreq_LED_opto, R.peakamp_max_LED_opto, R.peakamp_min_LED_opto, R.amp_max_LED_opto, R.amp_min_LED_opto, R.latency_LED_opto, R.area_LED_opto...
        R.kde_baselinefreq_sound, R.peakamp_max_sound, R.peakamp_min_sound, R.amp_max_sound, R.amp_min_sound, R.latency_sound, R.area_sound...
        R.kde_baselinefreq_sound_opto, R.peakamp_max_sound_opto, R.peakamp_min_sound_opto, R.amp_max_sound_opto, R.amp_min_sound_opto, R.latency_sound_opto, R.area_sound_opto...
        R.kde_baselinefreq_puff, R.peakamp_max_puff, R.peakamp_min_puff, R.amp_max_puff, R.amp_min_puff, R.latency_puff, R.area_puff...
        R.kde_baselinefreq_puff_opto, R.peakamp_max_puff_opto, R.peakamp_min_puff_opto, R.amp_max_puff_opto, R.amp_min_puff_opto, R.latency_puff_opto, R.area_puff_opto...
        R.kde_baselinefreq_sound_opto_50msbeforestim, R.amp_max_sound_opto_50msbaseline, R.amp_min_sound_opto_50msbaseline]);

    % Store only compact per-cell metadata in Excel. The status columns make
    % missing modalities explicit without cluttering the table with paths,
    % file names or thresholds.
    CellSummary(counter,:) = {counter,P.cellID,stimStatus(P.has_LED),stimStatus(P.has_sound),stimStatus(P.has_puff)};

    %save overview figure
    figure(h(4));
    %
    % set(gcf,'Position',[200 200 200 200]);
    % set(gca,'fontname','arial');
    % fontsize(gcf,8,"points");
    orient(gcf,'landscape')
    saveFigureSet(gcf,sprintf('SpikeResponses_%s',P.cellID),P,{'-fillpage','-loose'});


    % Clean up data
    D.d_LED=[];D.d_LED_TTL=[];D.d_sound=[];D.d_sound_TTL=[];D.d_puff=[];D.d_puff_TTL=[];D.d_LED_full=[]; D.d_LED_TTL_full=[]; D.d_sound_full=[]; D.d_sound_TTL_full=[]; D.d_puff_full=[]; D.d_puff_TTL_full=[];
    D.d_LED_full_filt=[];D.d_sound_full_filt=[];D.d_puff_full_filt=[];

    % Save data
    savename = sprintf('Output_%s.mat',P.cellID);
    save(savename,'D','P','R');

    %% Save individual response figures
    P.outputpath = [P.datapath '\AnalysisOutput' '\' P.cellID];
    try
        cd(P.outputpath)
    catch
        mkdir(P.outputpath);
    end
    cd(P.outputpath)

    % Spike-detection figures plot full traces and are the slowest exports.
    % Enable P.saveDetectionFigures only when you want to manually inspect
    % thresholding for a problematic cell.
    if P.saveDetectionFigures
        if P.has_LED
            figure(h(1));
            set(gca,'fontname','arial');
            saveFigureSet(gcf,sprintf('SpikeDetection_LED_%s',P.cellID),P,{'-fillpage','-loose'});
        end

        if P.has_sound
            figure(h(2));
            set(gca,'fontname','arial');
            saveFigureSet(gcf,sprintf('SpikeDetection_sound_%s',P.cellID),P,{'-fillpage','-loose'});
        end

        if P.has_puff
            figure(h(3));
            set(gca,'fontname','arial');
            saveFigureSet(gcf,sprintf('SpikeDetection_puff_%s',P.cellID),P,{'-fillpage','-loose'});
        end
    end

    if P.has_LED
        figure(h(5));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        saveFigureSet(gcf,sprintf('SpikeResponse_LED_%s',P.cellID),P,{'-loose'});

        figure(h(8));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        saveFigureSet(gcf,sprintf('SpikeResponse_LED_opto_%s',P.cellID),P,{'-loose'});
    end

    if P.has_sound
        figure(h(6));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        fontsize(gcf,8,"points");
        yyaxis left;
        yticks([1 50]);
        saveFigureSet(gcf,sprintf('SpikeResponse_sound_%s',P.cellID),P,{'-loose'});

        figure(h(9));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        fontsize(gcf,8,"points");
        yyaxis left;
        yticks([1 50]);
        saveFigureSet(gcf,sprintf('SpikeResponse_sound_opto_%s',P.cellID),P,{'-loose'});
    end

    if P.has_puff
        figure(h(7));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        saveFigureSet(gcf,sprintf('SpikeResponse_puff_%s',P.cellID),P,{'-loose'});

        figure(h(10));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        saveFigureSet(gcf,sprintf('SpikeResponse_puff_opto_%s',P.cellID),P,{'-loose'});
    end

    disp('Save completed')
end

cd('\\store\department\neuw\personal\dezeeuw\Zixiang Zhong\data')
% Save data
savename = sprintf('OutputVars_allcells.mat');
save(savename,'OutputVars','CellSummary','OutputLabels');

% Automatic Excel export: one persistent workbook, one sheet. Each run
% updates rows by Counter, so rerunning the same neuron overwrites the
% old row instead of creating another Excel file.
if exist('OutputVars','var') && ~isempty(OutputVars)
    validRows = ~cellfun(@isempty,CellSummary(:,2));
    metaNames = {'Counter','CellID','LED_status','sound_status','puff_status'};
    metaTable = cell2table(CellSummary(validRows,:),'VariableNames',metaNames);
    outputTable = array2table(OutputVars(validRows,:),'VariableNames',OutputLabels);
    newExcelRows = [metaTable outputTable];
    excelDir = '\\store\department\neuw\personal\dezeeuw\Zixiang Zhong\data\L7_Mice';
    if ~exist(excelDir,'dir')
        mkdir(excelDir);
    end
    excelPath = fullfile(excelDir,'OutputVars_allcells_optimized.xlsx');
    sheetName = 'NeuronResults';
    excelTable = mergeNeuronExcelRows(excelPath,sheetName,newExcelRows);
    try
        writetable(excelTable,excelPath,'Sheet',sheetName,'WriteMode','overwritesheet');
    catch writeErr
        warning('Could not update %s (%s). Close the Excel file and rerun this counter.',excelPath,writeErr.message);
    end
end
set(0,'DefaultFigureVisible','on');

function trialData = getAbfChannelTrials(rawData,h,requestedChannels,channelName)
% Convert one channel from abf2load output into the old trial x time format.
% abf2load returns channels in ABF-file order, not necessarily the order
% requested in the function call, so this mapping protects against channel
% order mistakes.
loadedChannels = h.recChNames(ismember(h.recChNames,requestedChannels));
channelIdx = find(strcmp(loadedChannels,channelName),1);
if isempty(channelIdx)
    error('Channel %s was not found in loaded ABF data.',channelName);
end

if iscell(rawData)
    nSweeps = numel(rawData);
    nPts = size(rawData{1},1);
    trialData = nan(nSweeps,nPts);
    for sweepIdx = 1:nSweeps
        trialData(sweepIdx,:) = rawData{sweepIdx}(:,channelIdx)';
    end
elseif ndims(rawData)==3
    trialData = squeeze(rawData(:,channelIdx,:))';
else
    trialData = rawData(:,channelIdx)';
end
end

function saveFigureSet(figHandle,baseName,P,pdfOptions)
% Centralized figure export. Defaults are editable MATLAB .fig plus SVG
% vector output; PDF/JPG are optional switches.
figure(figHandle);
if P.saveFigFiles
    saveas(gcf,[baseName '.fig'],'fig');
end
if isfield(P,'saveSvgFiles') && P.saveSvgFiles
    try
        exportgraphics(gcf,[baseName '.svg'],'ContentType','vector');
    catch
        print(gcf,[baseName '.svg'],'-dsvg');
    end
end
if P.savePdfFiles
    print('-dpdf','-vector',pdfOptions{:},[baseName '.pdf']);
end
if P.saveJpgFiles
    saveas(gcf,[baseName '.jpg'],'jpg');
end
end

function tf = isStimRecorded(fileName,threshold,missingThreshold)
% Treat high-threshold placeholder entries as missing stimulus recordings.
tf = ~isempty(fileName) && ~isempty(threshold) && ~isnan(threshold) && threshold < missingThreshold;
end

function offsets = pairTtlOffsets(onsets,offsetCandidates)
% Pair each opto TTL onset with the next falling edge in the ABF trace.
offsets = nan(size(onsets));
remainingOffsets = offsetCandidates(:)';
for ii = 1:numel(onsets)
    nextOffsetIdx = find(remainingOffsets>onsets(ii),1,'first');
    if ~isempty(nextOffsetIdx)
        offsets(ii) = remainingOffsets(nextOffsetIdx);
        remainingOffsets(1:nextOffsetIdx) = [];
    end
end
end

function relativeOffset = getRelativeOptoOffset(offsets,trialIdx,stimLoc,fs,relativeOnset,fallbackDuration)
% Prefer the true ABF opto TTL falling edge; use manual duration only if the
% offset edge is absent or malformed.
onsetLoc = stimLoc + relativeOnset*fs;
if numel(offsets)>=trialIdx && isfinite(offsets(trialIdx)) && offsets(trialIdx)>onsetLoc
    relativeOffset = (offsets(trialIdx)-stimLoc)/fs;
else
    relativeOffset = relativeOnset+fallbackDuration;
end
end

function [D,P] = markStimulusMissing(D,P,stimName)
% Populate the fields expected downstream without opening a placeholder ABF.
D.(['d_' stimName]) = [];
D.(['d_' stimName '_TTL']) = [];
D.(['d_' stimName '_opto_TTL']) = [];
D.(['si_' stimName]) = NaN;
D.(['h_' stimName]) = [];
D.(['fs_' stimName]) = NaN;
D.(['recLength_' stimName]) = 0;
D.(['Ts_' stimName]) = NaN;
D.(['trial_timestamps_' stimName]) = [];
P.(['numStim_' stimName]) = 0;
end

function D = fillMissingSampling(D,P)
% Use the first available sampling rate as a harmless reference for empty
% modalities, because some shared plotting code still expects Ts_LED etc.
fsValues = [];
if P.has_LED && isfinite(D.fs_LED)
    fsValues(end+1) = D.fs_LED;
end
if P.has_sound && isfinite(D.fs_sound)
    fsValues(end+1) = D.fs_sound;
end
if P.has_puff && isfinite(D.fs_puff)
    fsValues(end+1) = D.fs_puff;
end
if isempty(fsValues)
    refFs = 20000;
else
    refFs = fsValues(1);
end
D.fsRef = refFs;
D.TsRef = 1/refFs;
if ~P.has_LED
    D.fs_LED = refFs;
    D.Ts_LED = D.TsRef;
end
if ~P.has_sound
    D.fs_sound = refFs;
    D.Ts_sound = D.TsRef;
end
if ~P.has_puff
    D.fs_puff = refFs;
    D.Ts_puff = D.TsRef;
end
end

function fullTrace = flattenTrialMatrix(trialMatrix)
% Convert trial x time data to one continuous row vector for peak finding.
if isempty(trialMatrix)
    fullTrace = [];
else
    fullTrace = reshape(trialMatrix',1,[]);
end
end

function [filteredTrace,pks,locs,figHandle] = filterAndDetectSpikes(rawTrace,fs,threshold,spikeDetMode,filtTrace,highpassCutoff,titleText,spkpause)
% Filter one continuous trace and run the cell-specific spike detector.
figHandle = figure;
pks = [];
locs = [];
if isempty(rawTrace)
    filteredTrace = [];
    title([titleText ' missing'])
    return
end

if filtTrace==1
    filteredTrace = highpass(rawTrace-median(rawTrace),highpassCutoff,fs);
elseif filtTrace==0
    filteredTrace = rawTrace-median(rawTrace);
else
    filteredTrace = rawTrace;
end

idx = filteredTrace;
if spikeDetMode==1
    idx_pks = idx;
    idx_pks(idx_pks<threshold)=NaN;
    [pks, locs] = findpeaks(idx_pks,'MinPeakDistance',10);
    if numel(pks)>0
        title(titleText)
        hold on; plot(idx), plot(idx_pks,'g'); plot(locs,pks,'r*'); hold off
    end
elseif spikeDetMode==2
    idx_pks = idx*-1;
    idx_pks(idx_pks<threshold)=NaN;
    [pks, locs] = findpeaks(idx_pks);
    if numel(pks)>0
        title(titleText)
        hold on; plot(idx), plot(idx_pks*-1,'g'); plot(locs,pks*-1,'r*'); hold off
    end
end
if spkpause==1 && numel(pks)>0
    disp('Paused for Spk check'); pause;
end
end

function [kde,kdeX] = getKdeOrNaN(trialdata,window,isPresent)
% Missing stimuli keep the expected KDE fields but mark all metrics as NaN.
if isPresent && ~isempty(trialdata)
    [kde,kdeX]= gauss_kde(trialdata,window);
else
    kdeX = linspace(window(1),window(2),200);
    kde = nan(size(kdeX));
end
end

function [facilitationP,suppressionP] = rocShuffleStatsOrNaN(baselineCounts,stimCounts,nShuffles,isPresent)
% Return the old shuffle-based ROC p values, or NaN for missing modalities.
if ~isPresent || isempty(baselineCounts) || isempty(stimCounts)
    facilitationP = NaN;
    suppressionP = NaN;
    return
end

[~,~,realAUROC] = calcAUROC(baselineCounts,stimCounts);
allAUROCShuffle = nan(1,nShuffles);
for s = 1:nShuffles
    tempshuffle = Shuffle([baselineCounts,stimCounts]);
    baselineShuffle = tempshuffle(1:2:end);
    stimShuffle = tempshuffle(2:2:end);
    [~,~,allAUROCShuffle(s)] = calcAUROC(baselineShuffle,stimShuffle);
end
facilitationP = (sum(allAUROCShuffle>=realAUROC)+1)/(nShuffles+1);
suppressionP = (sum(allAUROCShuffle<=realAUROC)+1)/(nShuffles+1);
end

function baselineWindow = matchedBaselineWindow(responseWindow)
% Match baseline duration to the response window used for ROC counts.
baselineWindow = [-diff(responseWindow) 0];
end

function statusText = stimStatus(isPresent)
% Human-readable status for Excel.
if isPresent
    statusText = 'Recorded';
else
    statusText = 'Missing';
end
end

function combinedTable = mergeNeuronExcelRows(excelPath,sheetName,newRows)
% Read the persistent Excel sheet, then append or replace rows by Counter.
combinedTable = newRows([], :);
if isfile(excelPath)
    try
        existingTable = readtable(excelPath,'Sheet',sheetName);
    catch
        try
            existingTable = readtable(excelPath);
        catch
            existingTable = table();
        end
    end

    expectedNames = newRows.Properties.VariableNames;
    if ~isempty(existingTable) && ismember('Counter',existingTable.Properties.VariableNames) ...
            && all(ismember(expectedNames,existingTable.Properties.VariableNames))
        combinedTable = existingTable(:,expectedNames);
    elseif ~isempty(existingTable)
        warning('Existing Excel table has a different format; rebuilding it from the current run.');
    end
end

for rowIdx = 1:height(newRows)
    thisCounter = newRows.Counter(rowIdx);
    if isempty(combinedTable)
        combinedTable = newRows(rowIdx,:);
        continue
    end
    existingIdx = find(combinedTable.Counter==thisCounter,1);
    if isempty(existingIdx)
        combinedTable = [combinedTable; newRows(rowIdx,:)];
    else
        combinedTable(existingIdx,:) = newRows(rowIdx,:);
    end
end

if ~isempty(combinedTable)
    combinedTable = sortrows(combinedTable,'Counter');
end
end

function labels = getOutputLabelsOptimized()
labels = {'spont_FF','spont_ISI','spont_CV',...
    'ROC_LED_facilitation','ROC_LED_suppression','ROC_sound_facilitation','ROC_sound_suppression','ROC_puff_facilitation','ROC_puff_suppression',...
    'ROC_LED_opto_facilitation','ROC_LED_opto_suppression','ROC_sound_opto_facilitation','ROC_sound_opto_suppression','ROC_puff_opto_facilitation','ROC_puff_opto_suppression',...
    'kde_baselinefreq_LED','peakamp_max_LED','peakamp_min_LED','amp_max_LED','amp_min_LED','latency_LED','area_LED',...
    'kde_baselinefreq_LED_opto','peakamp_max_LED_opto','peakamp_min_LED_opto','amp_max_LED_opto','amp_min_LED_opto','latency_LED_opto','area_LED_opto',...
    'kde_baselinefreq_sound','peakamp_max_sound','peakamp_min_sound','amp_max_sound','amp_min_sound','latency_sound','area_sound',...
    'kde_baselinefreq_sound_opto','peakamp_max_sound_opto','peakamp_min_sound_opto','amp_max_sound_opto','amp_min_sound_opto','latency_sound_opto','area_sound_opto',...
    'kde_baselinefreq_puff','peakamp_max_puff','peakamp_min_puff','amp_max_puff','amp_min_puff','latency_puff','area_puff',...
    'kde_baselinefreq_puff_opto','peakamp_max_puff_opto','peakamp_min_puff_opto','amp_max_puff_opto','amp_min_puff_opto','latency_puff_opto','area_puff_opto',...
    'kde_baselinefreq_sound_opto_50msbeforestim','amp_max_sound_opto_50msbaseline','amp_min_sound_opto_50msbaseline'};
end

function n = countSpikesInWindow(spikeTimes,window)
n = sum(window(1)<spikeTimes & spikeTimes<=window(2));
end

function y = maxInWindow(values,x,window)
idx = x>window(1) & x<window(2);
y = max(values(idx));
end

function y = minInWindow(values,x,window)
idx = x>window(1) & x<window(2);
y = min(values(idx));
end

function y = sumInWindow(values,x,window)
idx = x>window(1) & x<window(2);
y = sum(values(idx));
end
