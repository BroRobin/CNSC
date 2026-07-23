%% SC_opto_response
% Analyse spike responses to opto flashes, sound stimuli and whisker air
% puffs
% by R. Broersen; 01-08-2024

close all;
clear all;
OutputVars=[];
for counter = 32:39 % Indicate which cell to analyse for example: (for counter = 1:3) or (for counter = 3)
    close all;
    clearvars -except OutputVars counter

    if counter ==1
        %% 210309_1
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16000';
        P.cellID = '251216_1';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==2
        %% 210309_2
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16001';
        P.cellID = '251216_2';
        P.pksThreshold_opto = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==3
        %% 210309_3
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16002';
        P.cellID = '251216_3';
        P.pksThreshold_opto = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==4
        %% 210309_4
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16003';
        P.cellID = '251216_4';
        P.pksThreshold_opto = 1.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==5
        %% 210309_5
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16005';
        P.cellID = '251216_5';
        P.pksThreshold_opto = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==6
        %% 210309_1
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16006';
        P.cellID = '251216_6';
        P.pksThreshold_opto = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==7
        %% 210309_1
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16007';
        P.cellID = '251216_7';
        P.pksThreshold_opto = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==8
        %% 210309_1
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16008';
        P.cellID = '251216_8';
        P.pksThreshold_opto = 0.3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==9
        %% 210309_1
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16010';
        P.cellID = '251216_9';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==10
        %% 210309_1
        P.datapath = 'path\\20251216';
        P.fileName_opto = '25d16012';
        P.cellID = '251216_10';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==11
        %% 210309_5
        P.datapath = 'path\\20251217';
        P.fileName_opto = '25d17000';
        P.cellID = '251217_1';
        P.pksThreshold_opto = 0.2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==12
        %% 210309_1
        P.datapath = 'path\\20251217';
        P.fileName_opto = '25d17002';
        P.cellID = '251217_2';
        P.pksThreshold_opto = 0.3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==13
        %% 210309_1
        P.datapath = 'path\\20251217';
        P.fileName_opto = '25d17003';
        P.cellID = '251217_3';
        P.pksThreshold_opto = 0.12; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==14
        %% 210309_1
        P.datapath = 'path\\20251217';
        P.fileName_opto = '25d17004';
        P.cellID = '251217_4';
        P.pksThreshold_opto = 0.28; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==15
        %% 210309_1
        P.datapath = 'path\\20251217';
        P.fileName_opto = '25d17010';
        P.cellID = '251217_5';
        P.pksThreshold_opto = 0.2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==16
        %% 210309_1
        P.datapath = 'path\\20251217';
        P.fileName_opto = '25d17014';
        P.cellID = '251217_6';
        P.pksThreshold_opto = 0.2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==17
        %% 210309_1
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18000';
        P.cellID = '251218_1';
        P.pksThreshold_opto = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==18
        %% 210309_2
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18003';
        P.cellID = '251218_2';
        P.pksThreshold_opto = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==19
        %% 210309_3
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18004';
        P.cellID = '251218_3';
        P.pksThreshold_opto = 0.3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==20
        %% 210309_4
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18005';
        P.cellID = '251218_4';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==21
        %% 210309_5
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18012';
        P.cellID = '251218_5';
        P.pksThreshold_opto = 0.25; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=2; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==22
        %% 210309_1
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18017';
        P.cellID = '251218_6';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==23
        %% 210309_1
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18022';
        P.cellID = '251218_7';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==24
        %% 210309_1
        P.datapath = 'path\\20251218';
        P.fileName_opto = '25d18024';
        P.cellID = '251218_8';
        P.pksThreshold_opto = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==25
        %% 210309_1
        P.datapath = 'path\\20260127';
        P.fileName_opto = '26127001';
        P.cellID = '260127_1';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==26
        %% 210309_2
        P.datapath = 'path\\20260127';
        P.fileName_opto = '26127006';
        P.cellID = '260127_3';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==27
        %% 210309_3
        P.datapath = 'path\\20260127';
        P.fileName_opto = '26127010';
        P.cellID = '260127_4';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==28
        %% 210309_4
        P.datapath = 'path\\20260127';
        P.fileName_opto = '26127014';
        P.cellID = '260127_5';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==29
        %% 210309_5
        P.datapath = 'path\\20260127';
        P.fileName_opto = '26127018';
        P.cellID = '260127_6';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==30
        %% 210309_1
        P.datapath = 'path\\20260127';
        P.fileName_opto = '26127022';
        P.cellID = '260127_7';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==31
        %% 210309_1
        P.datapath = 'path\\20260127';
        P.fileName_opto = '26127026';
        P.cellID = '260127_8';
        P.pksThreshold_opto = 0.7; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==32
        %% 210309_1
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128001';
        P.cellID = '260128_1';
        P.pksThreshold_opto = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==33
        %% 210309_1
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128008';
        P.cellID = '260128_3';
        P.pksThreshold_opto = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==34
        %% 210309_2
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128011';
        P.cellID = '260128_4';
        P.pksThreshold_opto = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==35
        %% 210309_3
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128015';
        P.cellID = '260128_5';
        P.pksThreshold_opto = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==36
        %% 210309_4
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128018';
        P.cellID = '260128_6';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==37
        %% 210309_5
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128020';
        P.cellID = '260128_7';
        P.pksThreshold_opto = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==38
        %% 210309_1
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128025';
        P.cellID = '260128_8';
        P.pksThreshold_opto = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==39
        %% 210309_1
        P.datapath = 'path\\20260128';
        P.fileName_opto = '26128029';
        P.cellID = '260128_9';
        P.pksThreshold_opto = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.numStim_opto_manual=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        P.opto_optoduration = 0.5; % duration of the opto stim in s
        spkpause=0; % 1 for pausing for checking spikes

    end

    %% Parameters definition - no need to change
    P.stimOrder = [2]; %1=no opto, 2=opto
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

    % Import the opto data
    [D.d_opto,D.si_opto,D.h_opto]=abf2load([P.datapath '\' num2str(P.fileName_opto) '.abf'],'channels',{'IN 0'});
    D.d_opto = squeeze(D.d_opto)';
    D.fs_opto = 10^6/D.si_opto; % Calculate the sampling frequency in Hz
    D.recLength_opto = length(D.d_opto)/D.fs_opto; % Recording length in s
    D.Ts_opto = 1/D.fs_opto; % Sampling point duration in s
    D.trial_timestamps_opto = [D.Ts_opto:D.Ts_opto:D.recLength_opto]; % Time vector trial

    % Import the TTL pulse (left opto)
    [D.d_opto_TTL]=abf2load([P.datapath '\' num2str(P.fileName_opto) '.abf'],'channels',{'Opto'});
    D.d_opto_TTL = squeeze(D.d_opto_TTL)';

    P.numStim_opto = size(D.d_opto_TTL,1);

    %% merge all trials for analysis
    D.d_opto_full = reshape(D.d_opto',[1,P.numStim_opto*D.fs_opto*D.recLength_opto]);
    D.d_opto_TTL_full = reshape(D.d_opto_TTL',[1,P.numStim_opto*D.fs_opto*D.recLength_opto]);

    %% Perform  filter on trace (opto)
    if P.filtTrace==1
        stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
        %     D.d_opto_full_filt = gfilt(D.d_opto_full',D.fs_opto,stdsmooth)'-median(D.d_opto_full);
        D.d_opto_full_filt = highpass(D.d_opto_full-median(D.d_opto_full),50,D.fs_opto);
    elseif P.filtTrace==0
        D.d_opto_full_filt = D.d_opto_full-median(D.d_opto_full);
    end

    %% Detect and plot the peaks (opto)
    idx = [];
    idx_pks = [];
    D.pks = {}; D.locs = {};
    h(1)=figure;
    idx = D.d_opto_full_filt;
    if P.spikeDetMode==1
        idx_pks = idx;
        idx_pks(idx_pks<P.pksThreshold_opto)=NaN;
        [D.pks_opto, D.locs_opto] = findpeaks(idx_pks);
        if numel(D.pks_opto)>0
            title('opto')
            hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_opto,D.pks_opto,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    elseif P.spikeDetMode==2
        idx_pks=idx*-1;
        idx_pks(idx_pks<P.pksThreshold_opto)=NaN;
        [D.pks_opto, D.locs_opto] = findpeaks(idx_pks);
        if numel(D.pks_opto)>0
            title('opto')
            hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_opto,D.pks_opto*-1,'r*');hold off
            if spkpause==1
                disp('Paused for Spk check'); pause;
            end
        end
    end


    %% Process TTL trial data all stimuli
    D.opto_TTL.locs=[];
    idx = diff(D.d_opto_TTL_full);
    [~, D.opto_TTL.locs] = find(idx>2);
    if size(D.opto_TTL.locs,2)~=P.numStim_opto
        disp('error TTL detection opto')
        figure; hold on; title('opto'); plot(D.d_opto_TTL_full), plot(D.opto_TTL.locs,0.05,'r*');hold off
        pause;
    end

    %% Correct if the number of stimuli is less (manual input)
    if isempty(P.numStim_opto_manual)==0
        D.opto_TTL.locs=D.opto_TTL.locs(1:P.numStim_opto_manual);
        P.numStim_opto = P.numStim_opto_manual;
    end

    %% Gather the trialdata based on TTL timestamps
    D.trialID = repmat(P.stimOrder,1,P.numReps);
    D.trial_timestamps = -0.75+D.Ts_opto:D.Ts_opto:1.25; %750ms baseline - stimulus - 1.25s after
    D.trialdata_opto={};

    %% Calculate the trial_timestamps in seconds around stimulus start
    for ii = 1:P.numStim_opto
        D.trialdata_opto{ii} = (D.locs_opto(D.opto_TTL.locs(ii)-(0.75*D.fs_opto)<=D.locs_opto & D.locs_opto<D.opto_TTL.locs(ii)+(1.25*D.fs_opto))-D.opto_TTL.locs(ii))*D.Ts_opto;
        D.trialdata_opto{ii} = D.trialdata_opto{ii}';
    end

    %% Calculate the average spike frequency during the opto stimulus
    R.avg_spikerate_opto=[];
    R.avg_duration_opto=0;
    %opto
    for ii = 1:P.numStim_opto
        R.avg_spikerate_opto=[R.avg_spikerate_opto reshape(D.trialdata_opto{ii}((D.trialdata_opto{ii}>=0)&(D.trialdata_opto{ii}<0.5)),1,[])];
        R.avg_duration_opto=R.avg_duration_opto+0.5;
    end

    % Calculate the stats
    R.avg_spikerate_opto_FF=size(R.avg_spikerate_opto,2)/R.avg_duration_opto;

    %% Construct PSTHs
    count_opto = 0;

    h(4)=figure; hold on;
    for ii=1:P.numStim_opto
        count_opto=count_opto+1;
        plot(D.trialdata_opto{count_opto},repmat(count_opto,numel(D.trialdata_opto{count_opto}),1),'k.');hold on;
    end

    ylim([0 P.numStim_opto+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')

    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
    line([0.5 0.5],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);


    %% Calculate KDE
    [D.opto_kde,D.opto_kde_X]= gauss_kde(D.trialdata_opto,[-0.7499 1.25]);

    %% Plot/adjust subplots
    title('opto','FontSize',8);
    %     line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    %     line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    P.axes(1) = plot(D.opto_kde_X,D.opto_kde,'r','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %% Calculate the baseline spike frequency for normalization
    R.kde_baselinefreq_opto = mean(D.opto_kde(D.opto_kde_X>-0.25&D.opto_kde_X<0));

    %% Calculate response characteristics

    %Peakamp stats ON responses during the stimulus (start till 0.5s)
    R.peakamp_max_opto = max(D.opto_kde(D.opto_kde_X>0.02&D.opto_kde_X<0.5));
    R.peakamp_min_opto = min(D.opto_kde(D.opto_kde_X>0.02&D.opto_kde_X<0.5));

    % Amplitude (corrected for baseline freq
    R.amp_max_opto = max(D.opto_kde(D.opto_kde_X>0.02&D.opto_kde_X<0.5))-R.kde_baselinefreq_opto;
    R.amp_min_opto = min(D.opto_kde(D.opto_kde_X>0.02&D.opto_kde_X<0.5))-R.kde_baselinefreq_opto;

    %First-spike latency for responses - find spike times higher than 0
    idx=[];
    for ii = 1:P.numStim_opto
        try
            idx(ii)=D.trialdata_opto{ii}(find(D.trialdata_opto{ii}>0,1));
        catch
            idx(ii)=NaN;
        end
    end
    idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
    R.latency_opto = median(idx);

    % Calculate the area
    R.area_opto=sum(D.opto_kde(D.opto_kde_X>0.02&D.opto_kde_X<0.5)-R.kde_baselinefreq_opto);


    %% Spontaneous parameters
    R.spont.data_opto=[];
    R.spont.duration_opto=0;
    R.spont.ISI_list_opto=[];

    %opto
    for ii = 1:P.numStim_opto
        R.spont.data_opto=[R.spont.data_opto reshape(D.trialdata_opto{ii}(D.trialdata_opto{ii}<0),1,[])];
        R.spont.duration_opto=R.spont.duration_opto+0.75;
        R.spont.ISI_list_opto = [R.spont.ISI_list_opto reshape(diff(D.trialdata_opto{ii}(D.trialdata_opto{ii}<0)),1,[])];
    end

    % Calculate the stats
    R.spont.FF_opto = size(R.spont.data_opto,2)/R.spont.duration_opto;
    R.spont.ISI_opto(1,1) = nanmean(R.spont.ISI_list_opto); % mean of ISIs
    R.spont.ISI_opto(1,2) = nanstd(R.spont.ISI_list_opto);% SD of ISIs
    R.spont.CV_opto = (R.spont.ISI_opto(1,1)/R.spont.ISI_opto(1,2));

    %% Perform ROC to detect significant responses
    R.ROC=[];
    for ii=1:P.numStim_opto
        R.ROC.baseline_opto(ii) = sum(-0.5<D.trialdata_opto{ii}&D.trialdata_opto{ii}<=0);
        R.ROC.stim_opto(ii) = sum(0<D.trialdata_opto{ii}&D.trialdata_opto{ii}<=0.5);% response during stim within the interested window
    end

    % opto
    [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_opto, R.ROC.stim_opto);

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
        tempshuffle = Shuffle([R.ROC.baseline_opto, R.ROC.stim_opto]);
        SAcountsShuffle{s} = tempshuffle (1:2:end);
        lightCountsShuffle{s} = tempshuffle (2:2:end);

        clear lightFAShuffle lightHitShuffle lightAUROCShuffle
        [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
        allLightAUROCShuffle(s)  =   lightAUROCShuffle;
    end
    % Test the significance
    diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffopto ROC
    R.ROC.opto_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffopto greater than observed
    R.ROC.opto_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffopto greater than observed
    close(gcf);


    %% Output figures and data
    cd(P.outputpath)
    OutputVars(counter,:) = ([R.spont.FF_opto, R.spont.ISI_opto, R.spont.CV_opto...
        R.ROC.opto_facilitation, R.ROC.opto_suppression,R.kde_baselinefreq_opto, R.peakamp_max_opto, R.peakamp_min_opto, R.amp_max_opto, R.amp_min_opto, R.latency_opto, R.area_opto, R.avg_spikerate_opto_FF]);

    %save overview figure
    figure(h(4));
    %
    % set(gcf,'Position',[200 200 200 200]);
    % set(gca,'fontname','arial');
    % fontsize(gcf,8,"points");

    figname = sprintf('SpikeResponses_optoOnly_%s.fig',P.cellID);
    saveas(gcf,figname,'fig');
    figname = sprintf('SpikeResponses_optoOnly_%s.pdf',P.cellID);
    print('-dpdf','-vector','-loose',figname);
    figname = sprintf('SpikeResponses_optoOnly_%s.jpg',P.cellID);
    saveas(gcf,figname,'jpg')

    % Save data
    savename = sprintf('Output_optoOnly_%s.mat',P.cellID);
    save(savename,'D','P','R','OutputVars');
    disp('Save completed')

    %% Save individual response figures
    P.outputpath = [P.datapath '\AnalysisOutput' '\' P.cellID];
    try
        cd(P.outputpath)
    catch
        mkdir(P.outputpath);
    end
    cd(P.outputpath)

    figure(h(1));
    set(gca,'fontname','arial');
    % fontsize(gcf,8,"points");
    % figname = sprintf('SpikeDetection_opto_%s.fig',P.cellID);
    % saveas(gcf,figname,'fig');
    figname = sprintf('SpikeDetection_optoOnly_%s.pdf',P.cellID);
    print('-dpdf','-vector','-fillpage','-loose',figname);
    figname = sprintf('SpikeDetection_optoOnly_%s.jpg',P.cellID);
    saveas(gcf,figname,'jpg')


end
