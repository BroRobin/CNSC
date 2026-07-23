%% SC_multisensory_extrac
% Analyse spike responses to LED flashes, sound stimuli and whisker air
% puffs
% by R. Broersen; 01-08-2024

close all;
clear all;
OutputVars=[];
for counter = 1:43 % Indicate which cell to analyse for example: (for counter = 1:3) or (for counter = 3)
    close all;
    clearvars -except OutputVars counter OutputKDE_LED OutputKDE_sound OutputKDE_puff
    if counter ==1
        %% 210309_1
        P.datapath = 'path\\20250205';
        P.fileName_LED = 25205001;
        P.fileName_sound = 25205003;
        P.fileName_puff = 25205002; % whisker
        P.cellID = '250205_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 2; % Spike detection threshold in mV
        P.pksThreshold_puff = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==2
        %% 210309_2
        P.datapath = 'path\\20250205';
        P.fileName_LED = 25205004;
        P.fileName_sound = 25205007;
        P.fileName_puff = 25205006; % whisker
        P.cellID = '250205_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 8; % cell dead, not correct
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==3
        %% 210309_3
        P.datapath = 'path\\20250205';
        P.fileName_LED = 25205010;
        P.fileName_sound = 25205012;
        P.fileName_puff = 25205011; % whisker
        P.cellID = '250205_3';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==4
        %% 210309_4
        P.datapath = 'path\\20250205';
        P.fileName_LED = 25205014;
        P.fileName_sound = 25205016;%no data
        P.fileName_puff = 25205015; % whisker
        P.cellID = '250205_4';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 4; % Spike detection threshold in mV
        P.pksThreshold_puff = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==5
        %% 210309_4
        P.datapath = 'path\\20250205';
        P.fileName_LED = 25205017;
        P.fileName_sound = 25205019;
        P.fileName_puff = 25205018; % whisker
        P.cellID = '250205_5';
        P.pksThreshold_LED = 1.3; % Spike detection threshold in mV
        P.pksThreshold_sound = 4; % Spike detection threshold in mV
        P.pksThreshold_puff = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==6
        %% 210309_4
        P.datapath = 'path\\20250205';
        P.fileName_LED = 25205023;
        P.fileName_sound = 25205025;
        P.fileName_puff = 25205024; % whisker
        P.cellID = '250205_6';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 5; % Spike detection threshold in mV
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==7
        %% 210309_1
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207000;
        P.fileName_sound = 25207002;
        P.fileName_puff = 25207001; % whisker
        P.cellID = '250207_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==8
        %% 210309_2
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207003;
        P.fileName_sound = 25207034;
        P.fileName_puff = 25207004; % whisker
        P.cellID = '250207_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % cell dead, not correct
        P.pksThreshold_puff = 3.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==9
        %% 210309_3
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207036;
        P.fileName_sound = 25207038;
        P.fileName_puff = 25207037; % whisker
        P.cellID = '250207_3';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % Spike detection threshold in mV
        P.pksThreshold_puff = 4; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==10
        %% 210309_4
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207039;
        P.fileName_sound = 25207041;
        P.fileName_puff = 25207040; % whisker
        P.cellID = '250207_4';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 4; % Spike detection threshold in mV
        P.pksThreshold_puff = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==11
        %% 210309_4
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207042;
        P.fileName_sound = 25207041;%no data
        P.fileName_puff = 25207043; % whisker
        P.cellID = '250207_5';
        P.pksThreshold_LED = 1.3; % Spike detection threshold in mV
        P.pksThreshold_sound = 15; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==12
        %% 210309_4
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207044;
        P.fileName_sound = 25207041;%no data
        P.fileName_puff = 25207043; %no data
        P.cellID = '250207_6';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 15; % Spike detection threshold in mV
        P.pksThreshold_puff = 10; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==13
        %% 210309_4
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207045;
        P.fileName_sound = 25207047;
        P.fileName_puff = 25207046; % whisker
        P.cellID = '250207_7';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==14
        %% 210309_4
        P.datapath = 'path\\20250207';
        P.fileName_LED = 25207072;
        P.fileName_sound = 25207041;%no data
        P.fileName_puff = 25207073; % whisker
        P.cellID = '250207_8';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 15; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==15
        %% 210309_1
        P.datapath = 'path\\20250307';
        P.fileName_LED = 25307000;
        P.fileName_sound = 25307020;
        P.fileName_puff = 25307019; % whisker
        P.cellID = '250307_1';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==16
        %% 210309_2
        P.datapath = 'path\\20250307';
        P.fileName_LED = 25307022;
        P.fileName_sound = 25307041;
        P.fileName_puff = 25307021; % whisker
        P.cellID = '250307_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % cell dead, not correct
        P.pksThreshold_puff = 3.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==17
        %% 210309_3
        P.datapath = 'path\\20250307';
        P.fileName_LED = 25307043;
        P.fileName_sound = 25307044;
        P.fileName_puff = 25307042; % whisker
        P.cellID = '250307_3';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==18
        %% 210309_1
        P.datapath = 'path\\20250319';
        P.fileName_LED = 25319000;
        P.fileName_sound = 25319020;
        P.fileName_puff = 25319019; % whisker
        P.cellID = '250319_1';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==19
        %% 210309_2
        P.datapath = 'path\\20250319';
        P.fileName_LED = 25319023;
        P.fileName_sound = 25319042;
        P.fileName_puff = 25319022; % whisker
        P.cellID = '250319_2';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 8; % cell dead, not correct
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==20
        %% 210309_3
        P.datapath = 'path\\20250319';
        P.fileName_LED = 25319043;
        P.fileName_sound = 25319045;
        P.fileName_puff = 25319044; % whisker
        P.cellID = '250319_3';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==21
        %% 210309_4
        P.datapath = 'path\\20250319';
        P.fileName_LED = 25319047;
        P.fileName_sound = 25319060;%no data
        P.fileName_puff = 25319046; % whisker
        P.cellID = '250319_4';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==22
        %% 210309_4
        P.datapath = 'path\\20250319';
        P.fileName_LED = 25319059;
        P.fileName_sound = 25319060;
        P.fileName_puff = 25319058; % whisker
        P.cellID = '250319_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==23
        %% 210309_4
        P.datapath = 'path\\20250319';
        P.fileName_LED = 25319081;
        P.fileName_sound = 25319079;
        P.fileName_puff = 25319080; % whisker
        P.cellID = '250319_6';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==24
        %% 210309_4
        P.datapath = 'path\\20250319';
        P.fileName_LED = 25319087;
        P.fileName_sound = 25319085;
        P.fileName_puff = 25319086; % whisker
        P.cellID = '250319_7';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 4; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==25
        %% 210309_1
        P.datapath = 'path\\20250424';
        P.fileName_LED = 25424000;
        P.fileName_sound = 25424022;%no data
        P.fileName_puff = 25424001; % whisker
        P.cellID = '250424_1';
        P.pksThreshold_LED = 3.3; % Spike detection threshold in mV
        P.pksThreshold_sound = 20; % Spike detection threshold in mV
        P.pksThreshold_puff = 3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        % P.numStim_LED=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        % P.numStim_puff=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        % P.numStim_sound=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==26
        %% 210309_2
        P.datapath = 'path\\20250424';
        P.fileName_LED = 25424002;
        P.fileName_sound = 25424022;
        P.fileName_puff = 25424021; % whisker
        P.cellID = '250424_2';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % cell dead, not correct
        P.pksThreshold_puff = 3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        % P.numStim_LED=[]; % Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        % P.numStim_puff=[];% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        % P.numStim_sound=14;% Fill in # trials in case cell dies before the end of the recording. If all trials have spikes, leave empty.
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==27
        %% 210309_3
        P.datapath = 'path\\20250424';
        P.fileName_LED = 25424023;
        P.fileName_sound = 25424043;
        P.fileName_puff = 25424042; % whisker
        P.cellID = '250424_3';
        P.pksThreshold_LED = 4; % Spike detection threshold in mV
        P.pksThreshold_sound = 7; % Spike detection threshold in mV
        P.pksThreshold_puff = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==28
        %% 210309_4
        P.datapath = 'path\\20250424';
        P.fileName_LED = 25424044;
        P.fileName_sound = 25424046;
        P.fileName_puff = 25424045; % whisker
        P.cellID = '250424_4';
        P.pksThreshold_LED = 2.3; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1.2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==29
        %% 210309_4
        P.datapath = 'path\\20250424';
        P.fileName_LED = 25424047;
        P.fileName_sound = 25424063;
        P.fileName_puff = 25424062; % whisker
        P.cellID = '250424_5';
        P.pksThreshold_LED = 3.7; % Spike detection threshold in mV
        P.pksThreshold_sound = 2.5; % Spike detection threshold in mV
        P.pksThreshold_puff = 2.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==30
        %% 210309_4
        P.datapath = 'path\\20250424';
        P.fileName_LED = 25424047;%no data
        P.fileName_sound = 25424064;
        P.fileName_puff = 25424062; %no data
        P.cellID = '250424_6';
        P.pksThreshold_LED = 20; % Spike detection threshold in mV
        P.pksThreshold_sound = 10; % Spike detection threshold in mV
        P.pksThreshold_puff = 20; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==31
        %% 210309_1
        P.datapath = 'path\\20250425';
        P.fileName_LED = 25425000;
        P.fileName_sound = 25425020;
        P.fileName_puff = 25425019; % whisker
        P.cellID = '250425_1';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==32
        %% 210309_2
        P.datapath = 'path\\20250425';
        P.fileName_LED = 25425021;
        P.fileName_sound = 25425020;%no data
        P.fileName_puff = 25425019; %no data
        P.cellID = '250425_2';
        P.pksThreshold_LED = 0.5; % Spike detection threshold in mV
        P.pksThreshold_sound = 30; % cell dead, not correct
        P.pksThreshold_puff = 35; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==33
        %% 210309_3
        P.datapath = 'path\\20250425';
        P.fileName_LED = 25425023;
        P.fileName_sound = 25425022;
        P.fileName_puff = 25425042; % whisker
        P.cellID = '250425_3';
        P.pksThreshold_LED = 7; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % Spike detection threshold in mV
        P.pksThreshold_puff = 1.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==34
        %% 210309_4
        P.datapath = 'path\\20250425';
        P.fileName_LED = 25425044;
        P.fileName_sound = 25425022;%no data
        P.fileName_puff = 25425043; % whisker
        P.cellID = '250425_4';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 40; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==35
        %% 210309_4
        P.datapath = 'path\\20250425';
        P.fileName_LED = 25425046;
        P.fileName_sound = 25425045;
        P.fileName_puff = 25425047; % whisker
        P.cellID = '250425_5';
        P.pksThreshold_LED = 1.3; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==36
        %% 210309_4
        P.datapath = 'path\\20250425';
        P.fileName_LED = 25425048;
        P.fileName_sound = 25425050;
        P.fileName_puff = 25425049;
        P.cellID = '250425_6';
        P.pksThreshold_LED = 3; % Spike detection threshold in mV
        P.pksThreshold_sound = 3; % Spike detection threshold in mV
        P.pksThreshold_puff = 3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==37
        %% 210309_4
        P.datapath = 'path\\20250425';
        P.fileName_LED = 25425051;
        P.fileName_sound = 25425070;
        P.fileName_puff = 25425071; % whisker
        P.cellID = '250425_7';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % Spike detection threshold in mV
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==38
        %% 210309_1
        P.datapath = 'path\\20250924';
        P.fileName_LED = 25924000;
        P.fileName_sound = 25924002;
        P.fileName_puff = 25924003; % whisker
        P.cellID = '250924_1';
        P.pksThreshold_LED = 2; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % Spike detection threshold in mV
        P.pksThreshold_puff = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==39
        %% 210309_2
        P.datapath = 'path\\20250924';
        P.fileName_LED = 25924004;
        P.fileName_sound = 25924006;
        P.fileName_puff = 25924007; % whisker
        P.cellID = '250924_2';
        P.pksThreshold_LED = 1.8; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % cell dead, not correct
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==40
        %% 210309_2
        P.datapath = 'path\\20250924';
        P.fileName_LED = 25924008;
        P.fileName_sound = 25924010;
        P.fileName_puff = 25924011; % whisker
        P.cellID = '250924_3';
        P.pksThreshold_LED = 5; % Spike detection threshold in mV
        P.pksThreshold_sound = 8; % cell dead, not correct
        P.pksThreshold_puff = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==41
        %% 210309_2
        P.datapath = 'path\\20250924';
        P.fileName_LED = 25924012;
        P.fileName_sound = 25924013;
        P.fileName_puff = 25924014; % whisker
        P.cellID = '250924_4';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % cell dead, not correct
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==42
        %% 210309_2
        P.datapath = 'path\\20250924';
        P.fileName_LED = 25924012;% no data
        P.fileName_sound = 25924015;
        P.fileName_puff = 25924016; % whisker
        P.cellID = '250924_5';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 1; % cell dead, not correct
        P.pksThreshold_puff = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==43
        %% 210309_2
        P.datapath = 'path\\20250924';
        P.fileName_LED = 25924022;
        P.fileName_sound = 25924024;
        P.fileName_puff = 25924023; % whisker
        P.cellID = '250924_6';
        P.pksThreshold_LED = 1; % Spike detection threshold in mV
        P.pksThreshold_sound = 6; % cell dead, not correct
        P.pksThreshold_puff = 9.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 50;
        P.wavelength = 470;
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 50; % yyaxis limit for the PSTH plots
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse;
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    end


    %% Parameters definition - no need to change
    P.savefig=0;
    P.stimOrder = [1]; %1=same stimulus
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
    P.numStim_LED = size(D.d_LED_TTL,1);

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
    P.numStim_sound = size(D.d_sound_TTL,1);

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
    P.numStim_puff = size(D.d_puff_TTL,1);

    %% merge all trials for analysis
    D.d_LED_full = reshape(D.d_LED',[1,P.numStim_LED*D.fs_LED*D.recLength_LED]);
    D.d_LED_TTL_full = reshape(D.d_LED_TTL',[1,P.numStim_LED*D.fs_LED*D.recLength_LED]);

    D.d_sound_full = reshape(D.d_sound',[1,P.numStim_sound*D.fs_sound*D.recLength_sound]);
    D.d_sound_TTL_full = reshape(D.d_sound_TTL',[1,P.numStim_sound*D.fs_sound*D.recLength_sound]);

    D.d_puff_full = reshape(D.d_puff',[1,P.numStim_puff*D.fs_puff*D.recLength_puff]);
    D.d_puff_TTL_full = reshape(D.d_puff_TTL',[1,P.numStim_puff*D.fs_puff*D.recLength_puff]);

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
        D.d_puff_full_filt = highpass(D.d_puff_full-median(D.d_puff_full),50,D.fs_LED);
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
    if size(D.LED_TTL.locs,2)~=P.numStim_LED
        disp('error TTL detection LED')
        figure; hold on; title('LED'); plot(D.d_LED_TTL_full), plot(D.LED_TTL.locs,0.05,'r*');hold off
        pause;
    end

    D.sound_TTL.locs=[];
    for jj=1:P.numStim_sound
        idx = diff(D.d_sound_TTL_full((jj-1)*D.fs_sound*D.recLength_sound+1:(jj)*D.fs_sound*D.recLength_sound));
        [~, D.sound_TTL.locs(jj)] = find(idx>0.05,1,'first');
        D.sound_TTL.locs(jj)=D.sound_TTL.locs(jj)+((jj-1)*D.fs_sound*D.recLength_sound+1);
    end

    if size(D.sound_TTL.locs,2)~=P.numStim_sound
        disp('error TTL detection sound')
        figure; hold on; title('sound'); plot(D.d_sound_TTL_full), plot(D.sound_TTL.locs,0.05,'r*');hold off
        pause;
    end

    D.puff_TTL.locs=[];
    idx = diff(D.d_puff_TTL_full);
    [~, D.puff_TTL.locs] = find(idx>2);
    if size(D.puff_TTL.locs,2)~=P.numStim_puff
        disp('error TTL detection puff')
        figure; hold on; title('puff'); plot(D.d_puff_TTL_full), plot(D.puff_TTL.locs,0.05,'r*');hold off
        pause;
    end


    %% Gather the trialdata based on TTL timestamps

    D.trialID = repmat(P.stimOrder,1,P.numReps);
    D.trial_timestamps = -0.75+D.Ts_LED:D.Ts_LED:1.25; %750ms baseline - stimulus - 1.25s after
    D.trialdata_LED={};
    D.trialdata_sound={};
    D.trialdata_puff={};


    % Calculate the trial_timestamps in seconds around stimulus start
    for ii = 1:P.numStim_LED
        D.trialdata_LED{ii} = (D.locs_LED(D.LED_TTL.locs(ii)-(0.75*D.fs_LED)<=D.locs_LED & D.locs_LED<D.LED_TTL.locs(ii)+(1.25*D.fs_LED))-D.LED_TTL.locs(ii))*D.Ts_LED;
        D.trialdata_LED{ii} = D.trialdata_LED{ii}';
    end
    for ii = 1:P.numStim_sound
        D.trialdata_sound{ii} = (D.locs_sound(D.sound_TTL.locs(ii)-(0.75*D.fs_sound)<=D.locs_sound & D.locs_sound<D.sound_TTL.locs(ii)+(1.25*D.fs_sound))-D.sound_TTL.locs(ii))*D.Ts_sound;
        D.trialdata_sound{ii} = D.trialdata_sound{ii}';
    end
    for ii = 1:P.numStim_puff
        D.trialdata_puff{ii} = (D.locs_puff(D.puff_TTL.locs(ii)-(0.75*D.fs_puff)<=D.locs_puff & D.locs_puff<D.puff_TTL.locs(ii)+(1.25*D.fs_puff))-D.puff_TTL.locs(ii))*D.Ts_puff;
        D.trialdata_puff{ii} = D.trialdata_puff{ii}';
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

    % Exclude the spikes 1ms around the stim start and end, representing the
    % stimulus artifact of the puff (20ms puff stimulus)
    % idx = [];
    % for ii = 1:P.numStim_puff
    %     idx = D.trialdata_puff{ii};
    %     idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    %     idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    %     D.trialdata_puff{ii}=idx;
    % end


    %% Construct PSTHs
    count_LED = 0; count_sound = 0; count_puff = 0;

    h(4)=figure; hold on;
    for ii=1:P.numStim_LED
        count_LED=count_LED+1;
        subplot(1,3,1);
        plot(D.trialdata_LED{count_LED},repmat(count_LED,numel(D.trialdata_LED{count_LED}),1),'k.');hold on;
    end
    for ii=1:P.numStim_sound
        count_sound=count_sound+1;
        subplot(1,3,2);
        plot(D.trialdata_sound{count_sound},repmat(count_sound,numel(D.trialdata_sound{count_sound}),1),'k.');hold on;
    end
    for ii=1:P.numStim_puff
        count_puff=count_puff+1;
        subplot(1,3,3);
        plot(D.trialdata_puff{count_puff},repmat(count_puff,numel(D.trialdata_puff{count_puff}),1),'k.');hold on;
    end

    % Adjust the Yaxis of PSTH to fit #trials

    subplot(1,3,1);
    ylim([0 P.numStim_LED+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    subplot(1,3,2);
    ylim([0 P.numStim_sound+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')
    subplot(1,3,3);
    ylim([0 P.numStim_puff+1]);set(gca,'FontSize',14)
    ylabel('Trials')
    xlim([-0.5 1]);set(gca,'FontSize',14)
    xlabel('Time (s)')


    %% Calculate KDE
    [D.LED_kde,D.LED_kde_X]= gauss_kde(D.trialdata_LED,[-0.7499 1.25]);
    [D.sound_kde,D.sound_kde_X]= gauss_kde(D.trialdata_sound,[-0.7499 1.25]);
    [D.puff_kde,D.puff_kde_X]= gauss_kde(D.trialdata_puff,[-0.7499 1.25]);

    %% Plot/adjust subplots
    % LED
    P.axes(1) = subplot(1,3,1);
    title('LED','FontSize',14);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.LED_kde_X,D.LED_kde,'b','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %sound
    P.axes(2) = subplot(1,3,2);
    title('Sound','FontSize',14);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.06 0.06],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.sound_kde_X,D.sound_kde,'b','LineWidth',1.5);
    ylabel('Spike rate (Hz)')

    %puff
    P.axes(3) = subplot(1,3,3);
    title('Whisker','FontSize',14);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    line([0.2 0.2],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
    yyaxis right
    plot(D.puff_kde_X,D.puff_kde,'b','LineWidth',1.5);
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
    plot(D.LED_kde_X,D.LED_kde,'b','LineWidth',0.5);
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
    plot(D.sound_kde_X,D.sound_kde,'b','LineWidth',0.5);
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
    plot(D.puff_kde_X,D.puff_kde,'b','LineWidth',0.5);
    ylabel('Spike rate (Hz)')

    %% Calculate the baseline spike frequency for normalization
    R.kde_baselinefreq_LED = mean(D.LED_kde(D.LED_kde_X>-0.25&D.LED_kde_X<0));
    R.kde_baselinefreq_sound = mean(D.sound_kde(D.sound_kde_X>-0.6&D.sound_kde_X<-0.35));
    R.kde_baselinefreq_puff = mean(D.puff_kde(D.puff_kde_X>-0.25&D.puff_kde_X<0));

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

    % Amplitude (corrected for baseline freq
    R.amp_max_LED = max(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5))-R.kde_baselinefreq_LED;
    R.amp_max_sound = max(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22))-R.kde_baselinefreq_sound;
    R.amp_max_sound_500ms = max(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5))-R.kde_baselinefreq_sound;
    R.amp_max_puff = max(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5))-R.kde_baselinefreq_puff;

    R.amp_min_LED = min(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5))-R.kde_baselinefreq_LED;
    R.amp_min_sound = min(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22))-R.kde_baselinefreq_sound;
    R.amp_min_sound_500ms = min(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5))-R.kde_baselinefreq_sound;
    R.amp_min_puff = min(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5))-R.kde_baselinefreq_puff;

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

    % Calculate the area
    R.area_LED=sum(D.LED_kde(D.LED_kde_X>0.02&D.LED_kde_X<0.5)-R.kde_baselinefreq_LED);
    R.area_sound=sum(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.22)-R.kde_baselinefreq_sound);
    R.area_sound_500ms=sum(D.sound_kde(D.sound_kde_X>0.02&D.sound_kde_X<0.5)-R.kde_baselinefreq_sound);
    R.area_puff=sum(D.puff_kde(D.puff_kde_X>0.02&D.puff_kde_X<0.5)-R.kde_baselinefreq_puff);

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


    %% Output figures and data
    cd(P.outputpath)
    R.outputVars = ([R.spont.FF, R.spont.ISI, R.spont.CV...
        R.ROC.LED_facilitation, R.ROC.LED_suppression, R.ROC.sound_facilitation, R.ROC.sound_suppression, R.ROC.puff_facilitation, R.ROC.puff_suppression...
        R.kde_baselinefreq_LED, R.peakamp_max_LED, R.peakamp_min_LED, R.amp_max_LED, R.amp_min_LED, R.latency_LED, R.area_LED...
        R.kde_baselinefreq_sound, R.peakamp_max_sound, R.peakamp_min_sound, R.amp_max_sound, R.amp_min_sound, R.latency_sound, R.area_sound...
        R.kde_baselinefreq_puff, R.peakamp_max_puff, R.peakamp_min_puff, R.amp_max_puff, R.amp_min_puff, R.latency_puff, R.area_puff...
        R.peakamp_max_sound_500ms, R.peakamp_min_sound_500ms, R.amp_max_sound_500ms, R.amp_min_sound_500ms, R.area_sound_500ms]);

    OutputVars(counter,:) = ([R.spont.FF, R.spont.ISI, R.spont.CV...
        R.ROC.LED_facilitation, R.ROC.LED_suppression, R.ROC.sound_facilitation, R.ROC.sound_suppression, R.ROC.puff_facilitation, R.ROC.puff_suppression...
        R.kde_baselinefreq_LED, R.peakamp_max_LED, R.peakamp_min_LED, R.amp_max_LED, R.amp_min_LED, R.latency_LED, R.area_LED...
        R.kde_baselinefreq_sound, R.peakamp_max_sound, R.peakamp_min_sound, R.amp_max_sound, R.amp_min_sound, R.latency_sound, R.area_sound...
        R.kde_baselinefreq_puff, R.peakamp_max_puff, R.peakamp_min_puff, R.amp_max_puff, R.amp_min_puff, R.latency_puff, R.area_puff...
        R.peakamp_max_sound_500ms, R.peakamp_min_sound_500ms, R.amp_max_sound_500ms, R.amp_min_sound_500ms, R.area_sound_500ms]);

    %% Collect the KDE for the whole dataset
    OutputKDE_LED(counter,:) = D.LED_kde;
    OutputKDE_sound(counter,:) = D.sound_kde;
    OutputKDE_puff(counter,:) = D.puff_kde;

    %save overview figure
    figure(h(4));
    %
    % set(gcf,'Position',[200 200 200 200]);
    % set(gca,'fontname','arial');
    % fontsize(gcf,8,"points");

    figname = sprintf('SpikeResponses_%s.fig',P.cellID);
    saveas(gcf,figname,'fig');
    figname = sprintf('SpikeResponses_%s.pdf',P.cellID);
    print('-dpdf','-vector','-bestfit','-loose',figname);

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

        figure(h(2));
        set(gca,'fontname','arial');
        % fontsize(gcf,8,"points");
        % figname = sprintf('SpikeDetection_sound_%s.fig',P.cellID);
        % saveas(gcf,figname,'fig');
        figname = sprintf('SpikeDetection_sound_%s.pdf',P.cellID);
        print('-dpdf','-vector','-fillpage','-loose',figname);

        figure(h(3));
        set(gca,'fontname','arial');
        % fontsize(gcf,8,"points");
        % figname = sprintf('SpikeDetection_puff_%s.fig',P.cellID);
        % saveas(gcf,figname,'fig');
        figname = sprintf('SpikeDetection_puff_%s.pdf',P.cellID);
        print('-dpdf','-vector','-fillpage','-loose',figname);

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

        disp('Save completed')
    end
end


cd('')
% Save data
savename = sprintf('OutputVars_allcells_WT.mat');
save(savename,'OutputVars','OutputKDE_LED','OutputKDE_sound','OutputKDE_puff');

