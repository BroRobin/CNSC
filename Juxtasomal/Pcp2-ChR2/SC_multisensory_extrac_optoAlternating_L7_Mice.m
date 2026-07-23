% SC_multisensory_extrac
% Analyse spike responses to LED flashes, sound stimuli and whisker air
% puffs
% by R. Broersen; 01-08-2024

close all;
clear all;
OutputVars=[];
for counter = 1:74 % Indicate which cell to analyse for example: (for counter = 1:3) or (for counter = 3)
    close all;
    clearvars -except OutputVars counter OutputKDE_LED OutputKDE_LED_opto OutputKDE_sound OutputKDE_sound_opto OutputKDE_puff OutputKDE_puff_opto

    if counter ==1
        %% 210309_1
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251017';
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
        P.datapath = 'path\\20251021';
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
        P.datapath = 'path\\20251021';
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
        P.datapath = 'path\\20251022';
        P.fileName_LED = '25o22000';
        P.fileName_sound = '25o22004';
        P.fileName_puff = '25o22003'; % whisker
        P.cellID = '251022_1';
        P.pksThreshold_LED = 80; % Spike detection threshold in mV
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
        P.datapath = 'path\\20251022';
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
        P.datapath = 'path\\20251022';
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
        P.datapath = 'path\\20251022';
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
        P.datapath = 'path\\20251022';
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
        P.datapath = 'path\\20251104';
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
        P.datapath = 'path\\20251104';
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
        P.datapath = 'path\\20251104';
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
        P.datapath = 'path\\20251104';
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
        P.datapath = 'path\\20251104';
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
        P.datapath = 'path\\20251104';
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
        P.datapath = 'path\\20251105';
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
        P.datapath = 'path\\20251105';
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
        P.datapath = 'path\\20251105';
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
        P.datapath = 'path\\20251105';
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
        P.datapath = 'path\\20251105';
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
        P.datapath = 'path\\20251106';
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
        P.datapath = 'path\\20251106';
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
        P.datapath = 'path\\20251106';
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
        P.datapath = 'path\\20251106';
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
        P.datapath = 'path\\20251106';
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
        P.datapath = 'path\\20251106';
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
        P.datapath = 'path\\20251106';
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
        P.datapath = 'path\\20251107';
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
        P.datapath = 'path\\20251107';
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
        P.datapath = 'path\\20251107';
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
        P.datapath = 'path\\20251107';
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
        P.datapath = 'path\\20251107';
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
        P.datapath = 'path\\20251107';
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
        P.datapath = 'path\\20251111';
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
        P.datapath = 'path\\20251111';
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
        P.datapath = 'path\\20251111';
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
        P.datapath = 'path\\20251111';
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
        P.datapath = 'path\\20251111';
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
        P.datapath = 'path\\20251111';
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
        P.datapath = 'path\\20251111';
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
        P.datapath = 'path\\20251119';
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
        P.datapath = 'path\\20251119';
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
        P.datapath = 'path\\20251119';
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
        P.datapath = 'path\\20251119';
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
        P.datapath = 'path\\20251119';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260205';
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
        P.datapath = 'path\\20260206';
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
        P.datapath = 'path\\20260206';
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
        P.datapath = 'path\\20260206';
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
        P.datapath = 'path\\20260206';
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
        P.datapath = 'path\\20260206';
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
        P.datapath = 'path\\20260206';
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
        P.datapath = 'path\\20260206';
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
        P.datapath = 'path\\20260212';
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
        P.datapath = 'path\\20260212';
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
        P.datapath = 'path\\20260212';
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
        P.datapath = 'path\\20260212';
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
        P.datapath = 'path\\20260212';
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
        P.datapath = 'path\\20260212';
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
        P.datapath = 'path\\20260212';
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

    %% Parameters definition - no need to change
    P.savefig=0;
    P.stimOrder = [1 2]; %1=no opto, 2=opto
    P.medianFiltWindow = 0.01; % 2.5 ms window median filter
    P.filtCutLow = 100; %low cut frequency in Hz
    % P.filtCutLow = 5; %low cut frequency in Hz
    P.filtOrder = 1; %Order of the filter
    P.cutoff  =   500;  % gaussian filter cutoff
    %P.cutoff  =   3000;  % gaussian filter cutoff
    P.TTLThreshold = 0.025;
    cd(P.datapath)
    P.outputpath = [P.datapath '\AnalysisOutput' ];
    try
        cd(P.outputpath)
    catch
        mkdir(P.outputpath);
    end
    cd(P.datapath)

    % Import the LED data
    [D.d_LED,D.si_LED,D.h_LED]=abf2load([P.datapath '\' num2str(P.fileName_LED) '.abf'],'channels',{'IN 0'});
    D.d_LED = squeeze(D.d_LED)';
    D.fs_LED = 10^6/D.si_LED; % Calculate the sampling frequency in Hz
    D.recLength_LED = length(D.d_LED)/D.fs_LED; % Recording length in s
    D.Ts_LED = 1/D.fs_LED; % Sampling point duration in s
    D.trial_timestamps_LED = [D.Ts_LED:D.Ts_LED:D.recLength_LED]; % Time vector trial

    % Import the TTL pulse (left LED)
    [D.d_LED_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED) '.abf'],'channels',{'LED_L'});
    D.d_LED_TTL = squeeze(D.d_LED_TTL)';

    % Import the opto TTL pulse
    [D.d_LED_opto_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED) '.abf'],'channels',{'Opto'});
    D.d_LED_opto_TTL = squeeze(D.d_LED_opto_TTL)';

    % if isempty(P.numStim_LED)==1
    P.numStim_LED = size(D.d_LED_TTL,1);
    % end

    %% Import the sound data
    [D.d_sound,D.si_sound,D.h_sound]=abf2load([P.datapath '\' num2str(P.fileName_sound) '.abf'],'channels',{'IN 0'});
    D.d_sound = squeeze(D.d_sound)';
    D.fs_sound = 10^6/D.si_sound; % Calculate the sampling frequency in Hz
    D.recLength_sound = length(D.d_sound)/D.fs_sound; % Recording length in s
    D.Ts_sound = 1/D.fs_sound; % Sampling point duration in s
    D.trial_timestamps_sound = [D.Ts_sound:D.Ts_sound:D.recLength_sound]; % Time vector trial

    % Import the TTL pulse
    [D.d_sound_TTL]=abf2load([P.datapath '\' num2str(P.fileName_sound) '.abf'],'channels',{'Sound'});
    D.d_sound_TTL = squeeze(D.d_sound_TTL)';

    % Import the opto TTL pulse
    [D.d_sound_opto_TTL]=abf2load([P.datapath '\' num2str(P.fileName_sound) '.abf'],'channels',{'Opto'});
    D.d_sound_opto_TTL = squeeze(D.d_sound_opto_TTL)';

    % if isempty(P.numStim_sound)==1
    P.numStim_sound = size(D.d_sound_TTL,1);
    % %end



    %% Import the whisker data
    [D.d_puff,D.si_puff,D.h_puff]=abf2load([P.datapath '\' num2str(P.fileName_puff) '.abf'],'channels',{'IN 0'});
    D.d_puff = squeeze(D.d_puff)';
    D.fs_puff = 10^6/D.si_puff; % Calculate the sampling frequency in Hz
    D.recLength_puff = length(D.d_puff)/D.fs_puff; % Recording length in s
    D.Ts_puff = 1/D.fs_puff; % Sampling point duration in s
    D.trial_timestamps_puff = [D.Ts_puff:D.Ts_puff:D.recLength_puff]; % Time vector trial

    % Import the TTL pulse
    [D.d_puff_TTL]=abf2load([P.datapath '\' num2str(P.fileName_puff) '.abf'],'channels',{'Puff'});
    D.d_puff_TTL = squeeze(D.d_puff_TTL)';

    % Import the opto TTL pulse
    [D.d_puff_opto_TTL]=abf2load([P.datapath '\' num2str(P.fileName_puff) '.abf'],'channels',{'Opto'});
    D.d_puff_opto_TTL = squeeze(D.d_puff_opto_TTL)';

    % if isempty(P.numStim_puff)==1
    P.numStim_puff = size(D.d_puff_TTL,1);
    % end



    %% merge all trials for analysis
    D.d_LED_full = reshape(D.d_LED',[1,P.numStim_LED*D.fs_LED*D.recLength_LED]);
    D.d_LED_TTL_full = reshape(D.d_LED_TTL',[1,P.numStim_LED*D.fs_LED*D.recLength_LED]);
    D.d_LED_opto_TTL_full = reshape(D.d_LED_opto_TTL',[1,P.numStim_LED*D.fs_LED*D.recLength_LED]);

    D.d_sound_full = reshape(D.d_sound',[1,P.numStim_sound*D.fs_sound*D.recLength_sound]);
    D.d_sound_TTL_full = reshape(D.d_sound_TTL',[1,P.numStim_sound*D.fs_sound*D.recLength_sound]);
    D.d_sound_opto_TTL_full = reshape(D.d_sound_opto_TTL',[1,P.numStim_sound*D.fs_sound*D.recLength_sound]);

    D.d_puff_full = reshape(D.d_puff',[1,P.numStim_puff*D.fs_puff*D.recLength_puff]);
    D.d_puff_TTL_full = reshape(D.d_puff_TTL',[1,P.numStim_puff*D.fs_puff*D.recLength_puff]);
    D.d_puff_opto_TTL_full = reshape(D.d_puff_opto_TTL',[1,P.numStim_puff*D.fs_puff*D.recLength_puff]);
    %% Perform  filter on trace (LED)
    if P.filtTrace==1
        stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
        %     D.d_LED_full_filt = gfilt(D.d_LED_full',D.fs_LED,stdsmooth)'-median(D.d_LED_full);
        D.d_LED_full_filt = highpass(D.d_LED_full-median(D.d_LED_full),50,D.fs_LED);
    elseif P.filtTrace==0
        D.d_LED_full_filt = D.d_LED_full-median(D.d_LED_full);
    end
    % figure; hold on; plot([D.Ts_LED:D.Ts_LED:P.numStim_LED*D.recLength_LED],D.d_LED_full_filt,'r');
    %  plot([D.Ts_LED:D.Ts_LED:P.numStim_LED*D.recLength_LED],D.d_LED_full,'k');

    %% Detect and plot the peaks (LED)
    idx = [];
    idx_pks = [];
    D.pks = {}; D.locs = {};
    h(1)=figure;
    idx = D.d_LED_full_filt;
    if P.spikeDetMode==1
        idx_pks = idx;
        idx_pks(idx_pks<P.pksThreshold_LED)=NaN;
        [D.pks_LED, D.locs_LED] = findpeaks(idx_pks,'MinPeakDistance',10);
        if numel(D.pks_LED)>0
            title('LED')
            hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_LED,D.pks_LED,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    elseif P.spikeDetMode==2
        idx_pks=idx*-1;
        idx_pks(idx_pks<P.pksThreshold_LED)=NaN;
        [D.pks_LED, D.locs_LED] = findpeaks(idx_pks);
        if numel(D.pks_LED)>0
            title('LED')
            hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_LED,D.pks_LED*-1,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    end

    %% Perform  filter on trace (sound)
    if P.filtTrace==1
        stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
        D.d_sound_full_filt = highpass(D.d_sound_full-median(D.d_sound_full),50,D.fs_LED);
    elseif P.filtTrace==0
        D.d_sound_full_filt = D.d_sound_full-median(D.d_sound_full);
    end
    % hold on;  plot([D.Ts_sound:D.Ts_sound:P.numStim_sound*D.recLength_sound],D.d_sound_full_filt,'r');
    %  plot([D.Ts_sound:D.Ts_sound:P.numStim_sound*D.recLength_sound],D.d_sound_full,'k');

    %% Detect and plot the peaks (sound)
    idx = [];
    idx_pks = [];
    D.pks = {}; D.locs = {};
    h(2)=figure;
    idx = D.d_sound_full_filt;
    if P.spikeDetMode==1
        idx_pks = idx;
        idx_pks(idx_pks<P.pksThreshold_sound)=NaN;
        [D.pks_sound, D.locs_sound] = findpeaks(idx_pks,'MinPeakDistance',10);
        if numel(D.pks_sound)>0
            title('sound')
            hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_sound,D.pks_sound,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    elseif P.spikeDetMode==2
        idx_pks=idx*-1;
        idx_pks(idx_pks<P.pksThreshold_sound)=NaN;
        [D.pks_sound, D.locs_sound] = findpeaks(idx_pks);
        if numel(D.pks_sound)>0
            title('sound')
            hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_sound,D.pks_sound*-1,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    end

    %% Perform  filter on trace (puff)
    if P.filtTrace==1
        stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
        if counter==4
            D.d_puff_full_filt = highpass(D.d_puff_full-median(D.d_puff_full),200,D.fs_LED);
        else
            D.d_puff_full_filt = highpass(D.d_puff_full-median(D.d_puff_full),50,D.fs_LED);
        end
    elseif P.filtTrace==0
        D.d_puff_full_filt = D.d_puff_full-median(D.d_puff_full);
    end
    % hold on;  plot([D.Ts_puff:D.Ts_puff:P.numStim_puff*D.recLength_puff],D.d_puff_full_filt,'r');
    %  plot([D.Ts_puff:D.Ts_puff:P.numStim_puff*D.recLength_puff],D.d_puff_full,'k');

    %% Detect and plot the peaks (puff)
    idx = [];
    idx_pks = [];
    D.pks = {}; D.locs = {};
    h(3)=figure;
    idx = D.d_puff_full_filt;
    if P.spikeDetMode==1
        idx_pks = idx;
        idx_pks(idx_pks<P.pksThreshold_puff)=NaN;
        [D.pks_puff, D.locs_puff] = findpeaks(idx_pks,'MinPeakDistance',10);
        if numel(D.pks_puff)>0
            title('puff')
            hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_puff,D.pks_puff,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    elseif P.spikeDetMode==2
        idx_pks=idx*-1;
        idx_pks(idx_pks<P.pksThreshold_puff)=NaN;
        [D.pks_puff, D.locs_puff] = findpeaks(idx_pks);
        if numel(D.pks_puff)>0
            title('puff')
            hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_puff,D.pks_puff*-1,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    end


    %% Process TTL trial data all stimuli
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
    if size(D.puff_opto_TTL.locs,2)~=P.numStim_puff
        disp('error TTL detection puff opto')
        figure; hold on; title('puff opto'); plot(D.d_puff_opto_TTL_full), plot(D.puff_opto_TTL.locs,0.05,'r*');hold off
        pause;
    end


    %% Correct if the number of stimuli is less (manual input)
    if isempty(P.numStim_LED_manual)==0
        D.LED_TTL.locs=D.LED_TTL.locs(1:(P.numStim_LED_manual*2));
        P.numStim_LED = P.numStim_LED_manual;
    end

    if isempty(P.numStim_puff_manual)==0
        D.puff_TTL.locs=D.puff_TTL.locs(1:(P.numStim_puff_manual*2));
        P.numStim_puff = P.numStim_puff_manual;
    end

    if isempty(P.numStim_sound_manual)==0
        D.sound_TTL.locs=D.sound_TTL.locs(1:(P.numStim_sound_manual*2));
        P.numStim_sound = P.numStim_sound_manual;
    end

    %% Gather the trialdata based on TTL timestamps
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

    for ii=1:P.numStim_LED
        D.LED_opto_TTL.locs_times(ii,1) = (D.LED_opto_TTL.locs(ii)-D.LED_TTL.locs(ii*2))/D.fs_LED;
        D.LED_opto_TTL.locs_times(ii,2) = D.LED_opto_TTL.locs_times(ii,1)+P.LED_optoduration;
    end

    for ii=1:P.numStim_sound
        D.sound_opto_TTL.locs_times(ii,1) = (D.sound_opto_TTL.locs(ii)-D.sound_TTL.locs(ii*2))/D.fs_sound;
        D.sound_opto_TTL.locs_times(ii,2) = D.sound_opto_TTL.locs_times(ii,1)+P.sound_optoduration;
    end

    for ii=1:P.numStim_puff
        D.puff_opto_TTL.locs_times(ii,1) = (D.puff_opto_TTL.locs(ii)-D.puff_TTL.locs(ii*2))/D.fs_puff;
        D.puff_opto_TTL.locs_times(ii,2) = D.puff_opto_TTL.locs_times(ii,1)+P.puff_optoduration;
    end



    %% Construct PSTHs
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
    [D.LED_kde,D.LED_kde_X]= gauss_kde(D.trialdata_LED,[-0.7499 1.25]);
    [D.sound_kde,D.sound_kde_X]= gauss_kde(D.trialdata_sound,[-0.7499 1.25]);
    [D.puff_kde,D.puff_kde_X]= gauss_kde(D.trialdata_puff,[-0.7499 1.25]);
    [D.LED_opto_kde,D.LED_opto_kde_X]= gauss_kde(D.trialdata_LED_opto,[-0.7499 1.25]);
    [D.sound_opto_kde,D.sound_opto_kde_X]= gauss_kde(D.trialdata_sound_opto,[-0.7499 1.25]);
    [D.puff_opto_kde,D.puff_opto_kde_X]= gauss_kde(D.trialdata_puff_opto,[-0.7499 1.25]);

    %% Plot/adjust subplots
    % LED
    P.axes(1) = subplot(2,3,1);
    title('LED','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.LED_kde_X,D.LED_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %sound
    P.axes(2) = subplot(2,3,2);
    title('Sound','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.06 0.06],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.sound_kde_X,D.sound_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %puff
    P.axes(3) = subplot(2,3,3);
    title('Whisker','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.2 0.2],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.puff_kde_X,D.puff_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    % LED+opto
    P.axes(4) = subplot(2,3,4);
    title('LED+opto','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([nanmean(D.LED_opto_TTL.locs_times(:,1)) nanmean(D.LED_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.LED_opto_TTL.locs_times(:,2)) nanmean(D.LED_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    yyaxis right
    plot(D.LED_opto_kde_X,D.LED_opto_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %sound+opto
    P.axes(5) = subplot(2,3,5);
    title('Sound+opto','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.06 0.06],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([nanmean(D.sound_opto_TTL.locs_times(:,1)) nanmean(D.sound_opto_TTL.locs_times(:,1))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    line([nanmean(D.sound_opto_TTL.locs_times(:,2)) nanmean(D.sound_opto_TTL.locs_times(:,2))],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',1);
    yyaxis right
    plot(D.sound_opto_kde_X,D.sound_opto_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %puff
    P.axes(6) = subplot(2,3,6);
    title('Whisker+opto','FontSize',8);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.2 0.2],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
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
    line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
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
    line([0.05 0.05],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
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
    line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
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
    line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
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
    line([0.05 0.05],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
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
    line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
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

    %Peakamp stats ON responses during the stimulus (start till 0.5s)
    R.peakamp_max_LED = max(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5));
    R.peakamp_max_sound = max(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22));
    R.peakamp_max_sound_500ms = max(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5));
    R.peakamp_max_puff = max(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5));

    R.peakamp_min_LED = min(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5));
    R.peakamp_min_sound = min(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22));
    R.peakamp_min_sound_500ms = min(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5));
    R.peakamp_min_puff = min(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5));

    R.peakamp_max_LED_opto = max(D.LED_opto_kde(D.LED_opto_kde_X>0.02&D.LED_opto_kde_X<0.5));
    R.peakamp_max_sound_opto = max(D.sound_opto_kde(D.sound_opto_kde_X>0.02&D.sound_opto_kde_X<0.22));
    R.peakamp_max_puff_opto = max(D.puff_opto_kde(D.puff_opto_kde_X>0.02&D.puff_opto_kde_X<0.5));

    R.peakamp_min_LED_opto = min(D.LED_opto_kde(D.LED_opto_kde_X>0.02&D.LED_opto_kde_X<0.5));
    R.peakamp_min_sound_opto = min(D.sound_opto_kde(D.sound_opto_kde_X>0.02&D.sound_opto_kde_X<0.22));
    R.peakamp_min_puff_opto = min(D.puff_opto_kde(D.puff_opto_kde_X>0.02&D.puff_opto_kde_X<0.5));

    % Amplitude (corrected for baseline freq
    R.amp_max_LED = max(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5))-R.kde_baselinefreq_LED;
    R.amp_max_sound = max(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22))-R.kde_baselinefreq_sound;
    R.amp_max_sound_500ms = max(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5))-R.kde_baselinefreq_sound;
    R.amp_max_puff = max(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5))-R.kde_baselinefreq_puff;

    R.amp_min_LED = min(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5))-R.kde_baselinefreq_LED;
    R.amp_min_sound = min(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22))-R.kde_baselinefreq_sound;
    R.amp_min_sound_500ms = min(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5))-R.kde_baselinefreq_sound;
    R.amp_min_puff = min(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5))-R.kde_baselinefreq_puff;

    R.amp_max_LED_opto = max(D.LED_opto_kde(D.LED_opto_kde_X>0.02&D.LED_opto_kde_X<0.5))-R.kde_baselinefreq_LED_opto;
    R.amp_max_sound_opto = max(D.sound_opto_kde(D.sound_opto_kde_X>0.02&D.sound_opto_kde_X<0.22))-R.kde_baselinefreq_sound_opto;
    R.amp_max_sound_opto_50msbaseline = max(D.sound_kde(D.sound_opto_kde_X>0.02&D.sound_opto_kde_X<0.22))-R.kde_baselinefreq_sound_opto_50msbeforestim;
    R.amp_max_puff_opto = max(D.puff_opto_kde(D.puff_opto_kde_X>0.02&D.puff_opto_kde_X<0.5))-R.kde_baselinefreq_puff_opto;

    R.amp_min_LED_opto = min(D.LED_opto_kde(D.LED_opto_kde_X>0.02&D.LED_opto_kde_X<0.5))-R.kde_baselinefreq_LED_opto;
    R.amp_min_sound_opto = min(D.sound_opto_kde(D.sound_opto_kde_X>0.02&D.sound_opto_kde_X<0.22))-R.kde_baselinefreq_sound_opto;
    R.amp_min_sound_opto_50msbaseline = min(D.sound_kde(D.sound_opto_kde_X>0.02&D.sound_opto_kde_X<0.22))-R.kde_baselinefreq_sound_opto_50msbeforestim;
    R.amp_min_puff_opto = min(D.puff_opto_kde(D.puff_opto_kde_X>0.02&D.puff_opto_kde_X<0.5))-R.kde_baselinefreq_puff_opto;

    %First-spike latency for responses - find spike times higher than 0
    idx=[];
    for ii = 1:P.numStim_LED
        try
            idx(ii)=D.trialdata_LED{ii}(find(D.trialdata_LED{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
    R.latency_LED = median(idx);

    idx=[];
    for ii = 1:P.numStim_sound
        try
            idx(ii)=D.trialdata_sound{ii}(find(D.trialdata_sound{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
    R.latency_sound = median(idx);

    idx=[];
    for ii = 1:P.numStim_puff
        try
            idx(ii)=D.trialdata_puff{ii}(find(D.trialdata_puff{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
    R.latency_puff = median(idx);

    idx=[];
    for ii = 1:P.numStim_LED
        try
            idx(ii)=D.trialdata_LED_opto{ii}(find(D.trialdata_LED_opto{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
    R.latency_LED_opto = median(idx);

    idx=[];
    for ii = 1:P.numStim_sound
        try
            idx(ii)=D.trialdata_sound_opto{ii}(find(D.trialdata_sound_opto{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
    R.latency_sound_opto = median(idx);

    idx=[];
    for ii = 1:P.numStim_puff
        try
            idx(ii)=D.trialdata_puff_opto{ii}(find(D.trialdata_puff_opto{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
    R.latency_puff_opto = median(idx);

    % Calculate the area
    R.area_LED=sum(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5)-R.kde_baselinefreq_LED);
    R.area_sound=sum(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22)-R.kde_baselinefreq_sound);
    R.area_sound_500ms=sum(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5)-R.kde_baselinefreq_sound);
    R.area_puff=sum(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5)-R.kde_baselinefreq_puff);
    R.area_LED_opto=sum(D.LED_opto_kde(D.LED_opto_kde_X>0.02&D.LED_opto_kde_X<0.5)-R.kde_baselinefreq_LED_opto);
    R.area_sound_opto=sum(D.sound_opto_kde(D.sound_opto_kde_X>0.02&D.sound_opto_kde_X<0.22)-R.kde_baselinefreq_sound_opto);
    R.area_puff_opto=sum(D.puff_opto_kde(D.puff_opto_kde_X>0.02&D.puff_opto_kde_X<0.5)-R.kde_baselinefreq_puff_opto);

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
    R.spont.FF = mean([R.spont.FF_LED, R.spont.FF_sound, R.spont.FF_puff]);
    R.spont.ISI = mean([R.spont.ISI_LED(1), R.spont.ISI_sound(1), R.spont.ISI_puff(1)]);
    R.spont.CV = mean([R.spont.CV_LED, R.spont.CV_sound, R.spont.CV_puff]);

    %% Perform ROC to detect significant responses
    R.ROC=[];
    for ii=1:P.numStim_LED
        R.ROC.baseline_LED(ii) = sum(-0.5<D.trialdata_LED{ii}&D.trialdata_LED{ii}<=0);
        R.ROC.stim_LED(ii) = sum(0<D.trialdata_LED{ii}&D.trialdata_LED{ii}<=0.5);% response during stim within the interested window
    end

    for ii=1:P.numStim_sound
        R.ROC.baseline_sound(ii) = sum(-0.5<D.trialdata_sound{ii}&D.trialdata_sound{ii}<=0);
        R.ROC.stim_sound(ii) = sum(0<D.trialdata_sound{ii}&D.trialdata_sound{ii}<=0.5);% response during stim within the interested window
    end

    for ii=1:P.numStim_puff
        R.ROC.baseline_puff(ii) = sum(-0.5<D.trialdata_puff{ii}&D.trialdata_puff{ii}<=0);
        R.ROC.stim_puff(ii) = sum(0<D.trialdata_puff{ii}&D.trialdata_puff{ii}<=0.5);% response during stim within the interested window
    end

    for ii=1:P.numStim_LED
        R.ROC.baseline_LED_opto(ii) = sum(-0.5<D.trialdata_LED_opto{ii}&D.trialdata_LED_opto{ii}<=0);
        R.ROC.stim_LED_opto(ii) = sum(0<D.trialdata_LED_opto{ii}&D.trialdata_LED_opto{ii}<=0.5);% response during stim within the interested window
    end

    for ii=1:P.numStim_sound
        R.ROC.baseline_sound_opto(ii) = sum(-0.5<D.trialdata_sound_opto{ii}&D.trialdata_sound_opto{ii}<=0);
        R.ROC.stim_sound_opto(ii) = sum(0<D.trialdata_sound_opto{ii}&D.trialdata_sound_opto{ii}<=0.5);% response during stim within the interested window
    end

    for ii=1:P.numStim_puff
        R.ROC.baseline_puff_opto(ii) = sum(-0.5<D.trialdata_puff_opto{ii}&D.trialdata_puff_opto{ii}<=0);
        R.ROC.stim_puff_opto(ii) = sum(0<D.trialdata_puff_opto{ii}&D.trialdata_puff_opto{ii}<=0.5);% response during stim within the interested window
    end

    % LED
    [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_LED, R.ROC.stim_LED);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([R.ROC.baseline_LED, R.ROC.stim_LED]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    R.ROC.LED_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    R.ROC.LED_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed
    close(gcf);


    % sound
    [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_sound, R.ROC.stim_sound);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([R.ROC.baseline_sound, R.ROC.stim_sound]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    R.ROC.sound_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    R.ROC.sound_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed
    close(gcf);

    % puff
    [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_puff, R.ROC.stim_puff);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([R.ROC.baseline_puff, R.ROC.stim_puff]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    R.ROC.puff_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    R.ROC.puff_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed
    close(gcf);

    % %% Create plots of the responses
    % % Define the response amplitudes for each stimulus
    % figure; subplot(1,3,1)
    % bar(['LED' 'Sound' 'Whisker'],[R.amp_max_LED R.amp_max_sound R.amp_max_puff])
    %
    % bar(['LED' 'Sound' 'Whisker'],[R.area_LED R.area_sound R.area_puff])

    %% LED+opto
    [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_LED_opto, R.ROC.stim_LED_opto);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([R.ROC.baseline_LED, R.ROC.stim_LED]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    R.ROC.LED_opto_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    R.ROC.LED_opto_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed
    close(gcf);


    % sound+opto
    [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_sound_opto, R.ROC.stim_sound_opto);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([R.ROC.baseline_sound, R.ROC.stim_sound]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    R.ROC.sound_opto_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    R.ROC.sound_opto_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed
    close(gcf);

    % puff+opto
    [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_puff_opto, R.ROC.stim_puff_opto);

    figure
    plot(lightFA,lightHit,'bo-')
    hold on
    plot([0,1],[0,1],'k--')
    set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
    % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
    xlabel('False Alarm')
    ylabel('Hit Rate')
    axis('square')

    %  I will shuffle the trials
    nShuffles = 1000;
    lightAUROCShuffle = zeros(1,nShuffles);

    for s = 1:nShuffles
        tempshuffle = Shuffle([R.ROC.baseline_puff, R.ROC.stim_puff]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
    R.ROC.puff_opto_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
    R.ROC.puff_opto_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed
    close(gcf);


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
        R.kde_baselinefreq_sound_opto_50msbeforestim, R.amp_max_sound_opto_50msbaseline, R.amp_min_sound_opto_50msbaseline...
        R.peakamp_max_sound_500ms, R.peakamp_min_sound_500ms, R.amp_max_sound_500ms, R.amp_min_sound_500ms, R.area_sound_500ms]);

    OutputVars(counter,:) = ([R.spont.FF, R.spont.ISI, R.spont.CV...
        R.ROC.LED_facilitation, R.ROC.LED_suppression, R.ROC.sound_facilitation, R.ROC.sound_suppression, R.ROC.puff_facilitation, R.ROC.puff_suppression...
        R.ROC.LED_opto_facilitation, R.ROC.LED_opto_suppression, R.ROC.sound_opto_facilitation, R.ROC.sound_opto_suppression, R.ROC.puff_opto_facilitation, R.ROC.puff_opto_suppression...
        R.kde_baselinefreq_LED, R.peakamp_max_LED, R.peakamp_min_LED, R.amp_max_LED, R.amp_min_LED, R.latency_LED, R.area_LED...
        R.kde_baselinefreq_LED_opto, R.peakamp_max_LED_opto, R.peakamp_min_LED_opto, R.amp_max_LED_opto, R.amp_min_LED_opto, R.latency_LED_opto, R.area_LED_opto...
        R.kde_baselinefreq_sound, R.peakamp_max_sound, R.peakamp_min_sound, R.amp_max_sound, R.amp_min_sound, R.latency_sound, R.area_sound...
        R.kde_baselinefreq_sound_opto, R.peakamp_max_sound_opto, R.peakamp_min_sound_opto, R.amp_max_sound_opto, R.amp_min_sound_opto, R.latency_sound_opto, R.area_sound_opto...
        R.kde_baselinefreq_puff, R.peakamp_max_puff, R.peakamp_min_puff, R.amp_max_puff, R.amp_min_puff, R.latency_puff, R.area_puff...
        R.kde_baselinefreq_puff_opto, R.peakamp_max_puff_opto, R.peakamp_min_puff_opto, R.amp_max_puff_opto, R.amp_min_puff_opto, R.latency_puff_opto, R.area_puff_opto...
        R.kde_baselinefreq_sound_opto_50msbeforestim, R.amp_max_sound_opto_50msbaseline, R.amp_min_sound_opto_50msbaseline...
        R.peakamp_max_sound_500ms, R.peakamp_min_sound_500ms, R.amp_max_sound_500ms, R.amp_min_sound_500ms, R.area_sound_500ms]);

    %% Collect the KDE for the whole dataset
    OutputKDE_LED(counter,:) = D.LED_kde;
    OutputKDE_sound(counter,:) = D.sound_kde;
    OutputKDE_puff(counter,:) = D.puff_kde;
    OutputKDE_LED_opto(counter,:) = D.LED_opto_kde;
    OutputKDE_sound_opto(counter,:) = D.sound_opto_kde;
    OutputKDE_puff_opto(counter,:) = D.puff_opto_kde;

    %save overview figure
    figure(h(4));
    %
    % set(gcf,'Position',[200 200 200 200]);
    % set(gca,'fontname','arial');
    % fontsize(gcf,8,"points");
    orient(gcf,'landscape')
    figname = sprintf('SpikeResponses_%s.fig',P.cellID);
    saveas(gcf,figname,'fig');
    figname = sprintf('SpikeResponses_%s.pdf',P.cellID);
    print('-dpdf','-vector','-fillpage','-loose',figname);
    figname = sprintf('SpikeResponses_%s.jpg',P.cellID);
    saveas(gcf,figname,'jpg')


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

    if     P.savefig==1
        figure(h(1));
        set(gca,'fontname','arial');
        % fontsize(gcf,8,"points");
        % figname = sprintf('SpikeDetection_LED_%s.fig',P.cellID);
        % saveas(gcf,figname,'fig');
        figname = sprintf('SpikeDetection_LED_%s.pdf',P.cellID);
        print('-dpdf','-vector','-fillpage','-loose',figname);
        figname = sprintf('SpikeDetection_LED_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(2));
        set(gca,'fontname','arial');
        % fontsize(gcf,8,"points");
        % figname = sprintf('SpikeDetection_sound_%s.fig',P.cellID);
        % saveas(gcf,figname,'fig');
        figname = sprintf('SpikeDetection_sound_%s.pdf',P.cellID);
        print('-dpdf','-vector','-fillpage','-loose',figname);
        figname = sprintf('SpikeDetection_sound_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(3));
        set(gca,'fontname','arial');
        % fontsize(gcf,8,"points");
        % figname = sprintf('SpikeDetection_puff_%s.fig',P.cellID);
        % saveas(gcf,figname,'fig');
        figname = sprintf('SpikeDetection_puff_%s.pdf',P.cellID);
        print('-dpdf','-vector','-fillpage','-loose',figname);
        figname = sprintf('SpikeDetection_puff_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(5));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        figname = sprintf('SpikeResponse_LED_%s.fig',P.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('SpikeResponse_LED_%s.pdf',P.cellID);
        print('-dpdf','-vector','-loose',figname);
        figname = sprintf('SpikeResponse_LED_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(6));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        fontsize(gcf,8,"points");
        yyaxis left;
        yticks([1 50]);
        figname = sprintf('SpikeResponse_sound_%s.fig',P.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('SpikeResponse_sound_%s.pdf',P.cellID);
        print('-dpdf','-vector','-loose',figname);
        figname = sprintf('SpikeResponse_sound_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(7));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        figname = sprintf('SpikeResponse_puff_%s.fig',P.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('SpikeResponse_puff_%s.pdf',P.cellID);
        print('-dpdf','-vector','-loose',figname);
        figname = sprintf('SpikeResponse_puff_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(8));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        figname = sprintf('SpikeResponse_LED_opto_%s.fig',P.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('SpikeResponse_LED_opto_%s.pdf',P.cellID);
        print('-dpdf','-vector','-loose',figname);
        figname = sprintf('SpikeResponse_LED_opto_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(9));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        fontsize(gcf,8,"points");
        yyaxis left;
        yticks([1 50]);
        figname = sprintf('SpikeResponse_sound_opto_%s.fig',P.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('SpikeResponse_sound_opto_%s.pdf',P.cellID);
        print('-dpdf','-vector','-loose',figname);
        figname = sprintf('SpikeResponse_sound_opto_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        figure(h(10));
        set(gcf,'Position',[200 200 150 150]);
        set(gca,'fontname','arial');
        yyaxis left;
        yticks([1 50]);
        fontsize(gcf,8,"points");
        figname = sprintf('SpikeResponse_puff_opto_%s.fig',P.cellID);
        saveas(gcf,figname,'fig');
        figname = sprintf('SpikeResponse_puff_opto_%s.pdf',P.cellID);
        print('-dpdf','-vector','-loose',figname);
        figname = sprintf('SpikeResponse_puff_opto_%s.jpg',P.cellID);
        saveas(gcf,figname,'jpg')

        disp('Save completed')
    end
end

cd('')
% Save data
savename = sprintf('OutputVars_allcells_L7.mat');
save(savename,'OutputVars','OutputKDE_LED','OutputKDE_LED_opto','OutputKDE_sound','OutputKDE_sound_opto','OutputKDE_puff','OutputKDE_puff_opto');
