%% SC_multisensory_extrac
% Analyse spike responses to LED flashes of different intensities. Files
% need to be preprocessed in clampex. Individual files of 10 stimuli
% concatenated to files of 30 stimuli of the same stimulus intensity

close all;
clear all;
OutputVars=[];
for counter = 13 % Indicate which cell to analyse for example: (for counter = 1:3) or (for counter = 3)
    close all;
    clearvars -except OutputVars counter

    if counter ==1
        %% 210307_1
        P.datapath = 'path\\20250207';
        P.fileName_LED1 = '25207009&15&21&27'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25207010&16&22&28';
        P.fileName_LED3 = '25207011&17&23&29';
        P.fileName_LED4 = '25207012&18&24&30';
        P.fileName_LED5 = '25207013&19&25&31';
        P.fileName_LED6 = '25207014&20&26&32';
        P.cellID = '250207_1';
        P.pksThreshold_LED1 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 3.8; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 3.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 40; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==2
        %% Excluded, recording quality not good
        P.datapath = 'path\\20250207';
        P.fileName_LED1 = '25207048&54&60&66'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25207049&55&61&67';
        P.fileName_LED3 = '25207050&56&62&68';
        P.fileName_LED4 = '25207051&57&63&69';
        P.fileName_LED5 = '25207052&58&64&70';
        P.fileName_LED6 = '25207053&59&65&71';
        P.cellID = '250207_2';
        P.pksThreshold_LED1 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 3.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==3
        %% 210307_2
        P.datapath = 'path\\20250307';
        P.fileName_LED1 = '25307001&7&13'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25307002&8&14';
        P.fileName_LED3 = '25307003&9&15';
        P.fileName_LED4 = '25307004&10&16';
        P.fileName_LED5 = '25307005&11&17';
        P.fileName_LED6 = '25307006&12&18';
        P.cellID = '250307_1';
        P.pksThreshold_LED1 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==4
        %% 210307_2
        P.datapath = 'path\\20250307';
        P.fileName_LED1 = '25307023&29&35'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25307024&30&36';
        P.fileName_LED3 = '25307025&31&37';
        P.fileName_LED4 = '25307026&32&38';
        P.fileName_LED5 = '25307027&33&39';
        P.fileName_LED6 = '25307028&34&40';
        P.cellID = '250307_2';
        P.pksThreshold_LED1 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==5
        %% 210307_2
        P.datapath = 'path\\20250319';
        P.fileName_LED1 = '25319001&07&13'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25319002&08&14';
        P.fileName_LED3 = '25319003&09&15';
        P.fileName_LED4 = '25319004&10&16';
        P.fileName_LED5 = '25319005&11&17';
        P.fileName_LED6 = '25319006&12&18';
        P.cellID = '250319_1';
        P.pksThreshold_LED1 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 3.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==6
        %% 210307_2
        P.datapath = 'path\\20250319';
        P.fileName_LED1 = '25319024&30&36'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25319025&31&37';
        P.fileName_LED3 = '25319026&32&38';
        P.fileName_LED4 = '25319027&33&39';
        P.fileName_LED5 = '25319028&34&40';
        P.fileName_LED6 = '25319029&35&41';
        P.cellID = '250319_2';
        P.pksThreshold_LED1 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==7
        %% 210307_2
        P.datapath = 'path\\20250319';
        P.fileName_LED1 = '25319048&54'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25319049&55';
        P.fileName_LED3 = '25319050&56';
        P.fileName_LED4 = '25319051&57';
        P.fileName_LED5 = '25319052';
        P.fileName_LED6 = '25319053';
        P.cellID = '250319_3';
        P.pksThreshold_LED1 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 10; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==8
        %% 210307_2
        P.datapath = 'path\\20250319';
        P.fileName_LED1 = '25319061&67&73'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25319062&68&74';
        P.fileName_LED3 = '25319063&69&75';
        P.fileName_LED4 = '25319064&70&76';
        P.fileName_LED5 = '25319065&71&77';
        P.fileName_LED6 = '25319066&72&78';
        P.cellID = '250319_4';
        P.pksThreshold_LED1 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 1; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==9
        %% 210307_2
        P.datapath = 'path\\20250424';
        P.fileName_LED1 = '25424003&9&15'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25424004&10&16';
        P.fileName_LED3 = '25424005&11&17';
        P.fileName_LED4 = '25424006&12&18';
        P.fileName_LED5 = '25424007&13&19';
        P.fileName_LED6 = '25424008&14&20';
        P.cellID = '250424_1';
        P.pksThreshold_LED1 = 25; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 3.5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==10
        %% 210307_2
        P.datapath = 'path\\20250424';
        P.fileName_LED1 = '25424024&30&36'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25424025&31&37';
        P.fileName_LED3 = '25424026&32&38';
        P.fileName_LED4 = '25424027&33&39';
        P.fileName_LED5 = '25424028&34&40';
        P.fileName_LED6 = '25424029&35&41';
        P.cellID = '250424_2';
        P.pksThreshold_LED1 = 4; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 5.5; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==11
        %% 210307_2
        P.datapath = 'path\\20250424';
        P.fileName_LED1 = '25424048&54&60'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25424049&55&61';
        P.fileName_LED3 = '25424050&56';
        P.fileName_LED4 = '25424051&57';
        P.fileName_LED5 = '25424052&58';
        P.fileName_LED6 = '25424053&59';
        P.cellID = '250424_3';
        P.pksThreshold_LED1 = 3.5; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 3; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 3; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 20; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==12
        %% 210307_2
        P.datapath = 'path\\20250425';
        P.fileName_LED1 = '25425001&07&13'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25425002&08&14';
        P.fileName_LED3 = '25425003&09&15';
        P.fileName_LED4 = '25425004&10&16';
        P.fileName_LED5 = '25425005&11&17';
        P.fileName_LED6 = '25425006&12&18';
        P.cellID = '250425_1';
        P.pksThreshold_LED1 = 6; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 5.8; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 5.8; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 5; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 5; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==13
        %% 210307_2
        P.datapath = 'path\\20250425';
        P.fileName_LED1 = '25425024&30&36'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25425025&31&37';
        P.fileName_LED3 = '25425026&32&38';
        P.fileName_LED4 = '25425027&33&39';
        P.fileName_LED5 = '25425028&34&40';
        P.fileName_LED6 = '25425029&35&41';
        P.cellID = '250425_2';
        P.pksThreshold_LED1 = 8; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 7; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 8; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 6; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 6; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 6; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    elseif counter ==14
        %% 210307_2
        P.datapath = 'path\\20250425';
        P.fileName_LED1 = '25425052&58&64'; % Filenames of the LED with increasing intensities
        P.fileName_LED2 = '25425053&59&65';
        P.fileName_LED3 = '25425054&60&66';
        P.fileName_LED4 = '25425055&61&67';
        P.fileName_LED5 = '25425056&62&68';
        P.fileName_LED6 = '25425057&63&69';
        P.cellID = '250425_3';
        P.pksThreshold_LED1 = 2; % Spike detection threshold in mV
        P.pksThreshold_LED2 = 1; % Spike detection threshold in mV
        P.pksThreshold_LED3 = 1.8; % Spike detection threshold in mV
        P.pksThreshold_LED4 = 1.8; % Spike detection threshold in mV
        P.pksThreshold_LED5 = 2; % Spike detection threshold in mV
        P.pksThreshold_LED6 = 2; % Spike detection threshold in mV
        P.side = 1; % 1=left hemisphere, 2=right hemisphere
        P.numReps = 30; % number of trials per file
        P.wavelength = 470; %!! Not important
        P.spikeDetMode=1; %1=upward going waveform, 2=downward going waveform
        P.yyaxis_lim = 30; % yyaxis limit for the PSTH plots - no need to change
        P.peakamp_XwindowLim = 0.5; % Define the outer limit used for calculating the amplitude of reponse; - no need to change
        P.filtTrace = 1; % Filter the spike trace?
        spkpause=0; % 1 for pausing for checking spikes

    end


    %% Parameters definition - no need to change
    P.stimOrder = [1]; %1=same stimulus
    P.medianFiltWindow = 0.01; % 2.5 ms window median filter
    P.filtCutLow = 100; %low cut frequency in Hz
    % P.filtCutLow = 5; %low cut frequency in Hz
    P.filtOrder = 1; %Order of the filter
    P.cutoff  =   500;  % gaussian filter cutoff
    %P.cutoff  =   3000;  % gaussian filter cutoff
    P.TTLThreshold = 0.025;
    cd(P.datapath)
    P.outputpath = [P.datapath '\AnalysisOutput_LEDintensities' ];
    try
        cd(P.outputpath)
    catch
        mkdir(P.outputpath);
    end
    cd(P.datapath)

    % Import the LED1 data
    [D.d_LED1,D.si_LED1,D.h_LED1]=abf2load([P.datapath '\' num2str(P.fileName_LED1) '.abf'],'channels',{'IN 0'});
    D.d_LED1 = squeeze(D.d_LED1)';
    D.fs_LED1 = 10^6/D.si_LED1; % Calculate the sampling frequency in Hz
    D.recLength_LED1 = length(D.d_LED1)/D.fs_LED1; % Recording length in s
    D.Ts_LED1 = 1/D.fs_LED1; % Sampling point duration in s
    D.trial_timestamps_LED1 = [D.Ts_LED1:D.Ts_LED1:D.recLength_LED1]; % Time vector trial

    % Import the TTL pulse (left LED)
    [D.d_LED1_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED1) '.abf'],'channels',{'LED_L'});
    D.d_LED1_TTL = squeeze(D.d_LED1_TTL)';
    P.numStim_LED1 = size(D.d_LED1_TTL,1);

    % Import the LED2 data
    [D.d_LED2,D.si_LED2,D.h_LED2]=abf2load([P.datapath '\' num2str(P.fileName_LED2) '.abf'],'channels',{'IN 0'});
    D.d_LED2 = squeeze(D.d_LED2)';
    D.fs_LED2 = 10^6/D.si_LED2; % Calculate the sampling frequency in Hz
    D.recLength_LED2 = length(D.d_LED2)/D.fs_LED2; % Recording length in s
    D.Ts_LED2 = 1/D.fs_LED2; % Sampling point duration in s
    D.trial_timestamps_LED2 = [D.Ts_LED2:D.Ts_LED2:D.recLength_LED2]; % Time vector trial

    % Import the TTL pulse (left LED)
    [D.d_LED2_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED2) '.abf'],'channels',{'LED_L'});
    D.d_LED2_TTL = squeeze(D.d_LED2_TTL)';
    P.numStim_LED2 = size(D.d_LED2_TTL,1);

    % Import the LED3 data
    [D.d_LED3,D.si_LED3,D.h_LED3]=abf2load([P.datapath '\' num2str(P.fileName_LED3) '.abf'],'channels',{'IN 0'});
    D.d_LED3 = squeeze(D.d_LED3)';
    D.fs_LED3 = 10^6/D.si_LED3; % Calculate the sampling frequency in Hz
    D.recLength_LED3 = length(D.d_LED3)/D.fs_LED3; % Recording length in s
    D.Ts_LED3 = 1/D.fs_LED3; % Sampling point duration in s
    D.trial_timestamps_LED3 = [D.Ts_LED3:D.Ts_LED3:D.recLength_LED3]; % Time vector trial

    % Import the TTL pulse (left LED)
    [D.d_LED3_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED3) '.abf'],'channels',{'LED_L'});
    D.d_LED3_TTL = squeeze(D.d_LED3_TTL)';
    P.numStim_LED3 = size(D.d_LED3_TTL,1);

    % Import the LED4 data
    [D.d_LED4,D.si_LED4,D.h_LED4]=abf2load([P.datapath '\' num2str(P.fileName_LED4) '.abf'],'channels',{'IN 0'});
    D.d_LED4 = squeeze(D.d_LED4)';
    D.fs_LED4 = 10^6/D.si_LED4; % Calculate the sampling frequency in Hz
    D.recLength_LED4 = length(D.d_LED4)/D.fs_LED4; % Recording length in s
    D.Ts_LED4 = 1/D.fs_LED4; % Sampling point duration in s
    D.trial_timestamps_LED4 = [D.Ts_LED4:D.Ts_LED4:D.recLength_LED4]; % Time vector trial

    % Import the TTL pulse (left LED)
    [D.d_LED4_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED4) '.abf'],'channels',{'LED_L'});
    D.d_LED4_TTL = squeeze(D.d_LED4_TTL)';
    P.numStim_LED4 = size(D.d_LED4_TTL,1);

    % Import the LED5 data
    [D.d_LED5,D.si_LED5,D.h_LED5]=abf2load([P.datapath '\' num2str(P.fileName_LED5) '.abf'],'channels',{'IN 0'});
    D.d_LED5 = squeeze(D.d_LED5)';
    D.fs_LED5 = 10^6/D.si_LED5; % Calculate the sampling frequency in Hz
    D.recLength_LED5 = length(D.d_LED5)/D.fs_LED5; % Recording length in s
    D.Ts_LED5 = 1/D.fs_LED5; % Sampling point duration in s
    D.trial_timestamps_LED5 = [D.Ts_LED5:D.Ts_LED5:D.recLength_LED5]; % Time vector trial

    % Import the TTL pulse (left LED)
    [D.d_LED5_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED5) '.abf'],'channels',{'LED_L'});
    D.d_LED5_TTL = squeeze(D.d_LED5_TTL)';
    P.numStim_LED5 = size(D.d_LED5_TTL,1);

    % Import the LED6 data
    [D.d_LED6,D.si_LED6,D.h_LED6]=abf2load([P.datapath '\' num2str(P.fileName_LED6) '.abf'],'channels',{'IN 0'});
    D.d_LED6 = squeeze(D.d_LED6)';
    D.fs_LED6 = 10^6/D.si_LED6; % Calculate the sampling frequency in Hz
    D.recLength_LED6 = length(D.d_LED6)/D.fs_LED6; % Recording length in s
    D.Ts_LED6 = 1/D.fs_LED6; % Sampling point duration in s
    D.trial_timestamps_LED6 = [D.Ts_LED6:D.Ts_LED6:D.recLength_LED6]; % Time vector trial

    % Import the TTL pulse (left LED)
    [D.d_LED6_TTL]=abf2load([P.datapath '\' num2str(P.fileName_LED6) '.abf'],'channels',{'LED_L'});
    D.d_LED6_TTL = squeeze(D.d_LED6_TTL)';
    P.numStim_LED6 = size(D.d_LED6_TTL,1);



end

%% merge all trials for analysis
D.d_LED1_full = reshape(D.d_LED1',[1,P.numStim_LED1*D.fs_LED1*D.recLength_LED1]);
D.d_LED1_TTL_full = reshape(D.d_LED1_TTL',[1,P.numStim_LED1*D.fs_LED1*D.recLength_LED1]);

D.d_LED2_full = reshape(D.d_LED2',[1,P.numStim_LED2*D.fs_LED2*D.recLength_LED2]);
D.d_LED2_TTL_full = reshape(D.d_LED2_TTL',[1,P.numStim_LED2*D.fs_LED2*D.recLength_LED2]);

D.d_LED3_full = reshape(D.d_LED3',[1,P.numStim_LED3*D.fs_LED3*D.recLength_LED3]);
D.d_LED3_TTL_full = reshape(D.d_LED3_TTL',[1,P.numStim_LED3*D.fs_LED3*D.recLength_LED3]);

D.d_LED4_full = reshape(D.d_LED4',[1,P.numStim_LED4*D.fs_LED4*D.recLength_LED4]);
D.d_LED4_TTL_full = reshape(D.d_LED4_TTL',[1,P.numStim_LED4*D.fs_LED4*D.recLength_LED4]);

D.d_LED5_full = reshape(D.d_LED5',[1,P.numStim_LED5*D.fs_LED5*D.recLength_LED5]);
D.d_LED5_TTL_full = reshape(D.d_LED5_TTL',[1,P.numStim_LED5*D.fs_LED5*D.recLength_LED5]);

D.d_LED6_full = reshape(D.d_LED6',[1,P.numStim_LED6*D.fs_LED6*D.recLength_LED6]);
D.d_LED6_TTL_full = reshape(D.d_LED6_TTL',[1,P.numStim_LED6*D.fs_LED6*D.recLength_LED6]);


%% Perform  filter on trace (LED1)
if P.filtTrace==1
    stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
    %     D.d_LED_full_filt = gfilt(D.d_LED_full',D.fs_LED,stdsmooth)'-median(D.d_LED_full);
    D.d_LED1_full_filt = highpass(D.d_LED1_full-median(D.d_LED1_full),50,D.fs_LED1);
elseif P.filtTrace==0
    D.d_LED1_full_filt = D.d_LED1_full-median(D.d_LED1_full);
end

if P.filtTrace==1
    stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
    %     D.d_LED_full_filt = gfilt(D.d_LED_full',D.fs_LED,stdsmooth)'-median(D.d_LED_full);
    D.d_LED2_full_filt = highpass(D.d_LED2_full-median(D.d_LED2_full),50,D.fs_LED2);
elseif P.filtTrace==0
    D.d_LED2_full_filt = D.d_LED2_full-median(D.d_LED2_full);
end

if P.filtTrace==1
    stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
    %     D.d_LED_full_filt = gfilt(D.d_LED_full',D.fs_LED,stdsmooth)'-median(D.d_LED_full);
    D.d_LED3_full_filt = highpass(D.d_LED3_full-median(D.d_LED3_full),50,D.fs_LED3);
elseif P.filtTrace==0
    D.d_LED3_full_filt = D.d_LED3_full-median(D.d_LED3_full);
end

if P.filtTrace==1
    stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
    %     D.d_LED_full_filt = gfilt(D.d_LED_full',D.fs_LED,stdsmooth)'-median(D.d_LED_full);
    D.d_LED4_full_filt = highpass(D.d_LED4_full-median(D.d_LED4_full),50,D.fs_LED4);
elseif P.filtTrace==0
    D.d_LED4_full_filt = D.d_LED4_full-median(D.d_LED4_full);
end

if P.filtTrace==1
    stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
    %     D.d_LED_full_filt = gfilt(D.d_LED_full',D.fs_LED,stdsmooth)'-median(D.d_LED_full);
    D.d_LED5_full_filt = highpass(D.d_LED5_full-median(D.d_LED5_full),50,D.fs_LED5);
elseif P.filtTrace==0
    D.d_LED5_full_filt = D.d_LED5_full-median(D.d_LED5_full);
end

if P.filtTrace==1
    stdsmooth=sqrt(2*log(2))./(P.cutoff.*2.*pi);
    %     D.d_LED_full_filt = gfilt(D.d_LED_full',D.fs_LED,stdsmooth)'-median(D.d_LED_full);
    D.d_LED6_full_filt = highpass(D.d_LED6_full-median(D.d_LED6_full),50,D.fs_LED6);
elseif P.filtTrace==0
    D.d_LED6_full_filt = D.d_LED6_full-median(D.d_LED6_full);
end


%% Detect and plot the peaks (LED)
idx = [];
idx_pks = [];
D.pks = {}; D.locs = {};
h(1)=figure;
idx = D.d_LED1_full_filt;
if P.spikeDetMode==1
    idx_pks = idx;
    idx_pks(idx_pks<P.pksThreshold_LED1)=NaN;
    [D.pks_LED1, D.locs_LED1] = findpeaks(idx_pks);
    if numel(D.pks_LED1)>0
        title('LED1')
        hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_LED1,D.pks_LED1,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
elseif P.spikeDetMode==2
    idx_pks=idx*-1;
    idx_pks(idx_pks<P.pksThreshold_LED1)=NaN;
    [D.pks_LED1, D.locs_LED1] = findpeaks(idx_pks);
    if numel(D.pks_LED1)>0
        title('LED1')
        hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_LED1,D.pks_LED1*-1,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
end

idx = [];
idx_pks = [];
D.pks = {}; D.locs = {};
h(1)=figure;
idx = D.d_LED2_full_filt;
if P.spikeDetMode==1
    idx_pks = idx;
    idx_pks(idx_pks<P.pksThreshold_LED2)=NaN;
    [D.pks_LED2, D.locs_LED2] = findpeaks(idx_pks);
    if numel(D.pks_LED2)>0
        title('LED2')
        hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_LED2,D.pks_LED2,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
elseif P.spikeDetMode==2
    idx_pks=idx*-1;
    idx_pks(idx_pks<P.pksThreshold_LED2)=NaN;
    [D.pks_LED2, D.locs_LED2] = findpeaks(idx_pks);
    if numel(D.pks_LED2)>0
        title('LED2')
        hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_LED2,D.pks_LED2*-1,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
end

idx = [];
idx_pks = [];
D.pks = {}; D.locs = {};
h(1)=figure;
idx = D.d_LED3_full_filt;
if P.spikeDetMode==1
    idx_pks = idx;
    idx_pks(idx_pks<P.pksThreshold_LED3)=NaN;
    [D.pks_LED3, D.locs_LED3] = findpeaks(idx_pks);
    if numel(D.pks_LED3)>0
        title('LED3')
        hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_LED3,D.pks_LED3,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
elseif P.spikeDetMode==2
    idx_pks=idx*-1;
    idx_pks(idx_pks<P.pksThreshold_LED3)=NaN;
    [D.pks_LED3, D.locs_LED3] = findpeaks(idx_pks);
    if numel(D.pks_LED3)>0
        title('LED3')
        hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_LED3,D.pks_LED3*-1,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
end

idx = [];
idx_pks = [];
D.pks = {}; D.locs = {};
h(1)=figure;
idx = D.d_LED4_full_filt;
if P.spikeDetMode==1
    idx_pks = idx;
    idx_pks(idx_pks<P.pksThreshold_LED4)=NaN;
    [D.pks_LED4, D.locs_LED4] = findpeaks(idx_pks);
    if numel(D.pks_LED4)>0
        title('LED4')
        hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_LED4,D.pks_LED4,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
elseif P.spikeDetMode==2
    idx_pks=idx*-1;
    idx_pks(idx_pks<P.pksThreshold_LED4)=NaN;
    [D.pks_LED4, D.locs_LED4] = findpeaks(idx_pks);
    if numel(D.pks_LED4)>0
        title('LED4')
        hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_LED4,D.pks_LED4*-1,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
end

idx = [];
idx_pks = [];
D.pks = {}; D.locs = {};
h(1)=figure;
idx = D.d_LED5_full_filt;
if P.spikeDetMode==1
    idx_pks = idx;
    idx_pks(idx_pks<P.pksThreshold_LED5)=NaN;
    [D.pks_LED5, D.locs_LED5] = findpeaks(idx_pks);
    if numel(D.pks_LED5)>0
        title('LED5')
        hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_LED5,D.pks_LED5,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
elseif P.spikeDetMode==2
    idx_pks=idx*-1;
    idx_pks(idx_pks<P.pksThreshold_LED5)=NaN;
    [D.pks_LED5, D.locs_LED5] = findpeaks(idx_pks);
    if numel(D.pks_LED5)>0
        title('LED5')
        hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_LED5,D.pks_LED5*-1,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
end

idx = [];
idx_pks = [];
D.pks = {}; D.locs = {};
h(1)=figure;
idx = D.d_LED6_full_filt;
if P.spikeDetMode==1
    idx_pks = idx;
    idx_pks(idx_pks<P.pksThreshold_LED6)=NaN;
    [D.pks_LED6, D.locs_LED6] = findpeaks(idx_pks);
    if numel(D.pks_LED6)>0
        title('LED6')
        hold on; plot(idx), plot(idx_pks,'g'); plot(D.locs_LED6,D.pks_LED6,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
elseif P.spikeDetMode==2
    idx_pks=idx*-1;
    idx_pks(idx_pks<P.pksThreshold_LED6)=NaN;
    [D.pks_LED6, D.locs_LED6] = findpeaks(idx_pks);
    if numel(D.pks_LED6)>0
        title('LED6')
        hold on; plot(idx), plot(idx_pks*-1,'g'); plot(D.locs_LED6,D.pks_LED6*-1,'r*');hold off
        if spkpause==1
            disp('Paused for Spk check'); pause;
        end
    end
end


%% Process TTL trial data all stimuli
D.LED1_TTL.locs=[];
idx = diff(D.d_LED1_TTL_full);
[~, D.LED1_TTL.locs] = find(idx>1);
if size(D.LED1_TTL.locs,2)~=P.numStim_LED1
    disp('error TTL detection LED1')
    figure; hold on; title('LED1'); plot(D.d_LED1_TTL_full), plot(D.LED1_TTL.locs,0.05,'r*');hold off
    pause;
end
D.LED2_TTL.locs=[];
idx = diff(D.d_LED2_TTL_full);
[~, D.LED2_TTL.locs] = find(idx>1);
if size(D.LED2_TTL.locs,2)~=P.numStim_LED2
    disp('error TTL detection LED2')
    figure; hold on; title('LED2'); plot(D.d_LED2_TTL_full), plot(D.LED2_TTL.locs,0.05,'r*');hold off
    pause;
end
D.LED3_TTL.locs=[];
idx = diff(D.d_LED3_TTL_full);
[~, D.LED3_TTL.locs] = find(idx>1);
if size(D.LED3_TTL.locs,2)~=P.numStim_LED3
    disp('error TTL detection LED3')
    figure; hold on; title('LED3'); plot(D.d_LED3_TTL_full), plot(D.LED3_TTL.locs,0.05,'r*');hold off
    pause;
end
D.LED4_TTL.locs=[];
idx = diff(D.d_LED4_TTL_full);
[~, D.LED4_TTL.locs] = find(idx>1);
if size(D.LED4_TTL.locs,2)~=P.numStim_LED4
    disp('error TTL detection LED4')
    figure; hold on; title('LED4'); plot(D.d_LED4_TTL_full), plot(D.LED4_TTL.locs,0.05,'r*');hold off
    pause;
end
D.LED5_TTL.locs=[];
idx = diff(D.d_LED5_TTL_full);
[~, D.LED5_TTL.locs] = find(idx>1);
if size(D.LED5_TTL.locs,2)~=P.numStim_LED5
    disp('error TTL detection LED5')
    figure; hold on; title('LED5'); plot(D.d_LED5_TTL_full), plot(D.LED5_TTL.locs,0.05,'r*');hold off
    pause;
end
D.LED6_TTL.locs=[];
idx = diff(D.d_LED6_TTL_full);
[~, D.LED6_TTL.locs] = find(idx>1);
if size(D.LED6_TTL.locs,2)~=P.numStim_LED6
    disp('error TTL detection LED6')
    figure; hold on; title('LED6'); plot(D.d_LED6_TTL_full), plot(D.LED6_TTL.locs,0.05,'r*');hold off
    pause;
end


%% Gather the trialdata based on TTL timestamps

D.trialID = repmat(P.stimOrder,1,P.numReps);
D.trial_timestamps = -0.75+D.Ts_LED1:D.Ts_LED1:1.25; %750ms baseline - stimulus - 1.25s after
D.trialdata_LED1={};

% Calculate the trial_timestamps in seconds around stimulus start
for ii = 1:P.numStim_LED1
    D.trialdata_LED1{ii} = (D.locs_LED1(D.LED1_TTL.locs(ii)-(0.75*D.fs_LED1)<=D.locs_LED1 & D.locs_LED1<D.LED1_TTL.locs(ii)+(1.25*D.fs_LED1))-D.LED1_TTL.locs(ii))*D.Ts_LED1;
    D.trialdata_LED1{ii} = D.trialdata_LED1{ii}';
end

D.trialID = repmat(P.stimOrder,1,P.numReps);
D.trial_timestamps = -0.75+D.Ts_LED2:D.Ts_LED2:1.25; %750ms baseline - stimulus - 1.25s after
D.trialdata_LED2={};

% Calculate the trial_timestamps in seconds around stimulus start
for ii = 1:P.numStim_LED2
    D.trialdata_LED2{ii} = (D.locs_LED2(D.LED2_TTL.locs(ii)-(0.75*D.fs_LED2)<=D.locs_LED2 & D.locs_LED2<D.LED2_TTL.locs(ii)+(1.25*D.fs_LED2))-D.LED2_TTL.locs(ii))*D.Ts_LED2;
    D.trialdata_LED2{ii} = D.trialdata_LED2{ii}';
end

D.trialID = repmat(P.stimOrder,1,P.numReps);
D.trial_timestamps = -0.75+D.Ts_LED3:D.Ts_LED3:1.25; %750ms baseline - stimulus - 1.25s after
D.trialdata_LED3={};

% Calculate the trial_timestamps in seconds around stimulus start
for ii = 1:P.numStim_LED3
    D.trialdata_LED3{ii} = (D.locs_LED3(D.LED3_TTL.locs(ii)-(0.75*D.fs_LED3)<=D.locs_LED3 & D.locs_LED3<D.LED3_TTL.locs(ii)+(1.25*D.fs_LED3))-D.LED3_TTL.locs(ii))*D.Ts_LED3;
    D.trialdata_LED3{ii} = D.trialdata_LED3{ii}';
end

D.trialID = repmat(P.stimOrder,1,P.numReps);
D.trial_timestamps = -0.75+D.Ts_LED4:D.Ts_LED4:1.25; %750ms baseline - stimulus - 1.25s after
D.trialdata_LED4={};

% Calculate the trial_timestamps in seconds around stimulus start
for ii = 1:P.numStim_LED4
    D.trialdata_LED4{ii} = (D.locs_LED4(D.LED4_TTL.locs(ii)-(0.75*D.fs_LED4)<=D.locs_LED4 & D.locs_LED4<D.LED4_TTL.locs(ii)+(1.25*D.fs_LED4))-D.LED4_TTL.locs(ii))*D.Ts_LED4;
    D.trialdata_LED4{ii} = D.trialdata_LED4{ii}';
end

D.trialID = repmat(P.stimOrder,1,P.numReps);
D.trial_timestamps = -0.75+D.Ts_LED5:D.Ts_LED5:1.25; %750ms baseline - stimulus - 1.25s after
D.trialdata_LED5={};

% Calculate the trial_timestamps in seconds around stimulus start
for ii = 1:P.numStim_LED5
    D.trialdata_LED5{ii} = (D.locs_LED5(D.LED5_TTL.locs(ii)-(0.75*D.fs_LED5)<=D.locs_LED5 & D.locs_LED5<D.LED5_TTL.locs(ii)+(1.25*D.fs_LED5))-D.LED5_TTL.locs(ii))*D.Ts_LED5;
    D.trialdata_LED5{ii} = D.trialdata_LED5{ii}';
end

D.trialID = repmat(P.stimOrder,1,P.numReps);
D.trial_timestamps = -0.75+D.Ts_LED6:D.Ts_LED6:1.25; %750ms baseline - stimulus - 1.25s after
D.trialdata_LED6={};

% Calculate the trial_timestamps in seconds around stimulus start
for ii = 1:P.numStim_LED6
    D.trialdata_LED6{ii} = (D.locs_LED6(D.LED6_TTL.locs(ii)-(0.75*D.fs_LED6)<=D.locs_LED6 & D.locs_LED6<D.LED6_TTL.locs(ii)+(1.25*D.fs_LED6))-D.LED6_TTL.locs(ii))*D.Ts_LED6;
    D.trialdata_LED6{ii} = D.trialdata_LED6{ii}';
end


% Exclude the spikes 1ms around the stim start and end, representing the
% stimulus artifact of the LED (20ms LED stimulus)
idx = [];
for ii = 1:P.numStim_LED1
    idx = D.trialdata_LED1{ii};
    idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    D.trialdata_LED1{ii}=idx;
end

idx = [];
for ii = 1:P.numStim_LED2
    idx = D.trialdata_LED2{ii};
    idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    D.trialdata_LED2{ii}=idx;
end

idx = [];
for ii = 1:P.numStim_LED3
    idx = D.trialdata_LED3{ii};
    idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    D.trialdata_LED3{ii}=idx;
end

idx = [];
for ii = 1:P.numStim_LED4
    idx = D.trialdata_LED4{ii};
    idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    D.trialdata_LED4{ii}=idx;
end

idx = [];
for ii = 1:P.numStim_LED5
    idx = D.trialdata_LED5{ii};
    idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    D.trialdata_LED5{ii}=idx;
end

idx = [];
for ii = 1:P.numStim_LED6
    idx = D.trialdata_LED6{ii};
    idx(idx>-0.0005 & idx<0.0005) = []; % exclude stimulus start
    idx(idx>0.0195 & idx<0.0205) = []; % exclude stimulus start (
    D.trialdata_LED6{ii}=idx;
end



%% Construct PSTHs
count_LED1 = 0;
h(4)=figure; hold on;
for ii=1:P.numStim_LED1
    count_LED1=count_LED1+1;
    subplot(2,3,1);
    plot(D.trialdata_LED1{count_LED1},repmat(count_LED1,numel(D.trialdata_LED1{count_LED1}),1),'k.');hold on;
end

count_LED2 = 0;
% h(4)=figure; hold on;
for ii=1:P.numStim_LED2
    count_LED2=count_LED2+1;
    subplot(2,3,2);
    plot(D.trialdata_LED2{count_LED2},repmat(count_LED2,numel(D.trialdata_LED2{count_LED2}),1),'k.');hold on;
end

count_LED3 = 0;
% h(4)=figure; hold on;
for ii=1:P.numStim_LED3
    count_LED3=count_LED3+1;
    subplot(2,3,3);
    plot(D.trialdata_LED3{count_LED3},repmat(count_LED3,numel(D.trialdata_LED3{count_LED3}),1),'k.');hold on;
end

count_LED4 = 0;
% h(4)=figure; hold on;
for ii=1:P.numStim_LED4
    count_LED4=count_LED4+1;
    subplot(2,3,4);
    plot(D.trialdata_LED4{count_LED4},repmat(count_LED4,numel(D.trialdata_LED4{count_LED4}),1),'k.');hold on;
end

count_LED5 = 0;
% h(4)=figure; hold on;
for ii=1:P.numStim_LED5
    count_LED5=count_LED5+1;
    subplot(2,3,5);
    plot(D.trialdata_LED5{count_LED5},repmat(count_LED5,numel(D.trialdata_LED5{count_LED5}),1),'k.');hold on;
end

count_LED6 = 0;
% h(4)=figure; hold on;
for ii=1:P.numStim_LED6
    count_LED6=count_LED6+1;
    subplot(2,3,6);
    plot(D.trialdata_LED6{count_LED6},repmat(count_LED6,numel(D.trialdata_LED6{count_LED6}),1),'k.');hold on;
end


% Adjust the Yaxis of PSTH to fit #trials

subplot(2,3,1);
ylim([0 P.numStim_LED1+1]);set(gca,'FontSize',14)
ylabel('Trials')
xlim([-0.5 1]);set(gca,'FontSize',14)
xlabel('Time (s)')

subplot(2,3,2);
ylim([0 P.numStim_LED2+1]);set(gca,'FontSize',14)
ylabel('Trials')
xlim([-0.5 1]);set(gca,'FontSize',14)
xlabel('Time (s)')

subplot(2,3,3);
ylim([0 P.numStim_LED3+1]);set(gca,'FontSize',14)
ylabel('Trials')
xlim([-0.5 1]);set(gca,'FontSize',14)
xlabel('Time (s)')

subplot(2,3,4);
ylim([0 P.numStim_LED4+1]);set(gca,'FontSize',14)
ylabel('Trials')
xlim([-0.5 1]);set(gca,'FontSize',14)
xlabel('Time (s)')

subplot(2,3,5);
ylim([0 P.numStim_LED5+1]);set(gca,'FontSize',14)
ylabel('Trials')
xlim([-0.5 1]);set(gca,'FontSize',14)
xlabel('Time (s)')

subplot(2,3,6);
ylim([0 P.numStim_LED6+1]);set(gca,'FontSize',14)
ylabel('Trials')
xlim([-0.5 1]);set(gca,'FontSize',14)
xlabel('Time (s)')


%% Calculate KDE
[D.LED1_kde,D.LED1_kde_X]= gauss_kde(D.trialdata_LED1,[-0.7499 1.25]);
[D.LED2_kde,D.LED2_kde_X]= gauss_kde(D.trialdata_LED2,[-0.7499 1.25]);
[D.LED3_kde,D.LED3_kde_X]= gauss_kde(D.trialdata_LED3,[-0.7499 1.25]);
[D.LED4_kde,D.LED4_kde_X]= gauss_kde(D.trialdata_LED4,[-0.7499 1.25]);
[D.LED5_kde,D.LED5_kde_X]= gauss_kde(D.trialdata_LED5,[-0.7499 1.25]);
[D.LED6_kde,D.LED6_kde_X]= gauss_kde(D.trialdata_LED6,[-0.7499 1.25]);

%% Plot/adjust subplots
% LED
P.axes(1) = subplot(2,3,1);
title('LED1','FontSize',14);
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
yyaxis right
plot(D.LED1_kde_X,D.LED1_kde,'b','LineWidth',1.5);
ylabel('Spike rate (Hz)')

P.axes(2) = subplot(2,3,2);
title('LED2','FontSize',14);
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
yyaxis right
plot(D.LED2_kde_X,D.LED2_kde,'b','LineWidth',1.5);
ylabel('Spike rate (Hz)')

P.axes(3) = subplot(2,3,3);
title('LED3','FontSize',14);
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
yyaxis right
plot(D.LED3_kde_X,D.LED3_kde,'b','LineWidth',1.5);
ylabel('Spike rate (Hz)')

P.axes(4) = subplot(2,3,4);
title('LED4','FontSize',14);
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
yyaxis right
plot(D.LED4_kde_X,D.LED4_kde,'b','LineWidth',1.5);
ylabel('Spike rate (Hz)')

P.axes(5) = subplot(2,3,5);
title('LED5','FontSize',14);
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
yyaxis right
plot(D.LED5_kde_X,D.LED5_kde,'b','LineWidth',1.5);
ylabel('Spike rate (Hz)')

P.axes(6) = subplot(2,3,6);
title('LED6','FontSize',14);
line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',1);
yyaxis right
plot(D.LED6_kde_X,D.LED6_kde,'b','LineWidth',1.5);
ylabel('Spike rate (Hz)')

linkaxes(P.axes,'y')
linkaxes(P.axes,'x')
% xlim([-0.5 1])

% %% plot individual graphs
% count_LED = 0; count_sound = 0; count_puff = 0;
% h(5)=figure; hold on;
% for ii=1:P.numStim_LED
%     count_LED=count_LED+1;
%     plot(D.trialdata_LED{count_LED},repmat(count_LED,numel(D.trialdata_LED{count_LED}),1),'k.','MarkerSize',1);hold on;
% end
% ylim([0 P.numStim_LED+1]);set(gca,'FontSize',14)
% ylabel('Trials')
% xlim([-0.5 1]);set(gca,'FontSize',14)
% xlabel('Time (s)')
% line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
% line([0.02 0.02],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'g','LineWidth',0.5);
% yyaxis right
% plot(D.LED_kde_X,D.LED_kde,'b','LineWidth',0.5);
% ylabel('Spike rate (Hz)')



%% Calculate the baseline spike frequency for normalization
R.kde_baselinefreq_LED1 = mean(D.LED1_kde(D.LED1_kde_X>-0.25&D.LED1_kde_X<0));
R.kde_baselinefreq_LED2 = mean(D.LED2_kde(D.LED2_kde_X>-0.25&D.LED2_kde_X<0));
R.kde_baselinefreq_LED3 = mean(D.LED3_kde(D.LED3_kde_X>-0.25&D.LED3_kde_X<0));
R.kde_baselinefreq_LED4 = mean(D.LED4_kde(D.LED4_kde_X>-0.25&D.LED4_kde_X<0));
R.kde_baselinefreq_LED5 = mean(D.LED5_kde(D.LED5_kde_X>-0.25&D.LED5_kde_X<0));
R.kde_baselinefreq_LED6 = mean(D.LED6_kde(D.LED6_kde_X>-0.25&D.LED6_kde_X<0));

%% Calculate response characteristics

% LED1
%Peakamp stats ON responses during the stimulus (start till 0.5s)
R.peakamp_max_LED1 = max(D.LED1_kde(D.LED1_kde_X>0.02&D.LED1_kde_X<0.5));
R.peakamp_min_LED1 = min(D.LED1_kde(D.LED1_kde_X>0.02&D.LED1_kde_X<0.5));

% Amplitude (corrected for baseline freq
R.amp_max_LED1 = max(D.LED1_kde(D.LED1_kde_X>0.02&D.LED1_kde_X<0.5))-R.kde_baselinefreq_LED1;
R.amp_min_LED1 = min(D.LED1_kde(D.LED1_kde_X>0.02&D.LED1_kde_X<0.5))-R.kde_baselinefreq_LED1;

%First-spike latency for responses - find spike times higher than 0
idx=[];
for ii = 1:P.numStim_LED1
    try
        idx(ii)=D.trialdata_LED1{ii}(find(D.trialdata_LED1{ii}>0,1));
    catch
        idx(ii)=NaN;
    end
end
idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
R.latency_LED1 = median(idx);

% Calculate the area
R.area_LED1=sum(D.LED1_kde(D.LED1_kde_X>0.02&D.LED1_kde_X<0.5)-R.kde_baselinefreq_LED1);

% LED2
%Peakamp stats ON responses during the stimulus (start till 0.5s)
R.peakamp_max_LED2 = max(D.LED2_kde(D.LED2_kde_X>0.02&D.LED2_kde_X<0.5));
R.peakamp_min_LED2 = min(D.LED2_kde(D.LED2_kde_X>0.02&D.LED2_kde_X<0.5));

% Amplitude (corrected for baseline freq
R.amp_max_LED2 = max(D.LED2_kde(D.LED2_kde_X>0.02&D.LED2_kde_X<0.5))-R.kde_baselinefreq_LED2;
R.amp_min_LED2 = min(D.LED2_kde(D.LED2_kde_X>0.02&D.LED2_kde_X<0.5))-R.kde_baselinefreq_LED2;

%First-spike latency for responses - find spike times higher than 0
idx=[];
for ii = 1:P.numStim_LED2
    try
        idx(ii)=D.trialdata_LED2{ii}(find(D.trialdata_LED2{ii}>0,1));
    catch
        idx(ii)=NaN;
    end
end
idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
R.latency_LED2 = median(idx);

% Calculate the area
R.area_LED2=sum(D.LED2_kde(D.LED2_kde_X>0.02&D.LED2_kde_X<0.5)-R.kde_baselinefreq_LED2);

% LED3
%Peakamp stats ON responses during the stimulus (start till 0.5s)
R.peakamp_max_LED3 = max(D.LED3_kde(D.LED3_kde_X>0.02&D.LED3_kde_X<0.5));
R.peakamp_min_LED3 = min(D.LED3_kde(D.LED3_kde_X>0.02&D.LED3_kde_X<0.5));

% Amplitude (corrected for baseline freq
R.amp_max_LED3 = max(D.LED3_kde(D.LED3_kde_X>0.02&D.LED3_kde_X<0.5))-R.kde_baselinefreq_LED3;
R.amp_min_LED3 = min(D.LED3_kde(D.LED3_kde_X>0.02&D.LED3_kde_X<0.5))-R.kde_baselinefreq_LED3;

%First-spike latency for responses - find spike times higher than 0
idx=[];
for ii = 1:P.numStim_LED3
    try
        idx(ii)=D.trialdata_LED3{ii}(find(D.trialdata_LED3{ii}>0,1));
    catch
        idx(ii)=NaN;
    end
end
idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
R.latency_LED3 = median(idx);

% Calculate the area
R.area_LED3=sum(D.LED3_kde(D.LED3_kde_X>0.02&D.LED3_kde_X<0.5)-R.kde_baselinefreq_LED3);

% LED4
%Peakamp stats ON responses during the stimulus (start till 0.5s)
R.peakamp_max_LED4 = max(D.LED4_kde(D.LED4_kde_X>0.02&D.LED4_kde_X<0.5));
R.peakamp_min_LED4 = min(D.LED4_kde(D.LED4_kde_X>0.02&D.LED4_kde_X<0.5));

% Amplitude (corrected for baseline freq
R.amp_max_LED4 = max(D.LED4_kde(D.LED4_kde_X>0.02&D.LED4_kde_X<0.5))-R.kde_baselinefreq_LED4;
R.amp_min_LED4 = min(D.LED4_kde(D.LED4_kde_X>0.02&D.LED4_kde_X<0.5))-R.kde_baselinefreq_LED4;

%First-spike latency for responses - find spike times higher than 0
idx=[];
for ii = 1:P.numStim_LED4
    try
        idx(ii)=D.trialdata_LED4{ii}(find(D.trialdata_LED4{ii}>0,1));
    catch
        idx(ii)=NaN;
    end
end
idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
R.latency_LED4 = median(idx);

% Calculate the area
R.area_LED4=sum(D.LED4_kde(D.LED4_kde_X>0.02&D.LED4_kde_X<0.5)-R.kde_baselinefreq_LED4);

% LED5
%Peakamp stats ON responses during the stimulus (start till 0.5s)
R.peakamp_max_LED5 = max(D.LED5_kde(D.LED5_kde_X>0.02&D.LED5_kde_X<0.5));
R.peakamp_min_LED5 = min(D.LED5_kde(D.LED5_kde_X>0.02&D.LED5_kde_X<0.5));

% Amplitude (corrected for baseline freq
R.amp_max_LED5 = max(D.LED5_kde(D.LED5_kde_X>0.02&D.LED5_kde_X<0.5))-R.kde_baselinefreq_LED5;
R.amp_min_LED5 = min(D.LED5_kde(D.LED5_kde_X>0.02&D.LED5_kde_X<0.5))-R.kde_baselinefreq_LED5;

%First-spike latency for responses - find spike times higher than 0
idx=[];
for ii = 1:P.numStim_LED5
    try
        idx(ii)=D.trialdata_LED5{ii}(find(D.trialdata_LED5{ii}>0,1));
    catch
        idx(ii)=NaN;
    end
end
idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
R.latency_LED5 = median(idx);

% Calculate the area
R.area_LED5=sum(D.LED5_kde(D.LED5_kde_X>0.02&D.LED5_kde_X<0.5)-R.kde_baselinefreq_LED5);

% LED6
%Peakamp stats ON responses during the stimulus (start till 0.5s)
R.peakamp_max_LED6 = max(D.LED6_kde(D.LED6_kde_X>0.02&D.LED6_kde_X<0.5));
R.peakamp_min_LED6 = min(D.LED6_kde(D.LED6_kde_X>0.02&D.LED6_kde_X<0.5));

% Amplitude (corrected for baseline freq
R.amp_max_LED6 = max(D.LED6_kde(D.LED6_kde_X>0.02&D.LED6_kde_X<0.5))-R.kde_baselinefreq_LED6;
R.amp_min_LED6 = min(D.LED6_kde(D.LED6_kde_X>0.02&D.LED6_kde_X<0.5))-R.kde_baselinefreq_LED6;

%First-spike latency for responses - find spike times higher than 0
idx=[];
for ii = 1:P.numStim_LED6
    try
        idx(ii)=D.trialdata_LED6{ii}(find(D.trialdata_LED6{ii}>0,1));
    catch
        idx(ii)=NaN;
    end
end
idx = idx(idx<0.5);% Remove the spiketimes more than 0.5 sec
R.latency_LED6 = median(idx);

% Calculate the area
R.area_LED6=sum(D.LED6_kde(D.LED6_kde_X>0.02&D.LED6_kde_X<0.5)-R.kde_baselinefreq_LED6);

%% Spontaneous parameters
%LED1
R.spont.data_LED1=[];
R.spont.duration_LED1=0;
R.spont.ISI_list_LED1=[];

for ii = 1:P.numStim_LED1
    R.spont.data_LED1=[R.spont.data_LED1 reshape(D.trialdata_LED1{ii}(D.trialdata_LED1{ii}<0),1,[])];
    R.spont.duration_LED1=R.spont.duration_LED1+0.75;
    R.spont.ISI_list_LED1 = [R.spont.ISI_list_LED1 reshape(diff(D.trialdata_LED1{ii}(D.trialdata_LED1{ii}<0)),1,[])];
end

% Calculate the stats
R.spont.FF_LED1 = size(R.spont.data_LED1,2)/R.spont.duration_LED1;
R.spont.ISI_LED1(1,1) = nanmean(R.spont.ISI_list_LED1); % mean of ISIs
R.spont.ISI_LED1(1,2) = nanstd(R.spont.ISI_list_LED1);% SD of ISIs
R.spont.CV_LED1 = (R.spont.ISI_LED1(1,1)/R.spont.ISI_LED1(1,2));

%LED2
R.spont.data_LED2=[];
R.spont.duration_LED2=0;
R.spont.ISI_list_LED2=[];

for ii = 1:P.numStim_LED2
    R.spont.data_LED2=[R.spont.data_LED2 reshape(D.trialdata_LED2{ii}(D.trialdata_LED2{ii}<0),1,[])];
    R.spont.duration_LED2=R.spont.duration_LED2+0.75;
    R.spont.ISI_list_LED2 = [R.spont.ISI_list_LED2 reshape(diff(D.trialdata_LED2{ii}(D.trialdata_LED2{ii}<0)),1,[])];
end

% Calculate the stats
R.spont.FF_LED2 = size(R.spont.data_LED2,2)/R.spont.duration_LED2;
R.spont.ISI_LED2(1,1) = nanmean(R.spont.ISI_list_LED2); % mean of ISIs
R.spont.ISI_LED2(1,2) = nanstd(R.spont.ISI_list_LED2);% SD of ISIs
R.spont.CV_LED2 = (R.spont.ISI_LED2(1,1)/R.spont.ISI_LED2(1,2));

%LED3
R.spont.data_LED3=[];
R.spont.duration_LED3=0;
R.spont.ISI_list_LED3=[];

for ii = 1:P.numStim_LED3
    R.spont.data_LED3=[R.spont.data_LED3 reshape(D.trialdata_LED3{ii}(D.trialdata_LED3{ii}<0),1,[])];
    R.spont.duration_LED3=R.spont.duration_LED3+0.75;
    R.spont.ISI_list_LED3 = [R.spont.ISI_list_LED3 reshape(diff(D.trialdata_LED3{ii}(D.trialdata_LED3{ii}<0)),1,[])];
end

% Calculate the stats
R.spont.FF_LED3 = size(R.spont.data_LED3,2)/R.spont.duration_LED3;
R.spont.ISI_LED3(1,1) = nanmean(R.spont.ISI_list_LED3); % mean of ISIs
R.spont.ISI_LED3(1,2) = nanstd(R.spont.ISI_list_LED3);% SD of ISIs
R.spont.CV_LED3 = (R.spont.ISI_LED3(1,1)/R.spont.ISI_LED3(1,2));

%LED4
R.spont.data_LED4=[];
R.spont.duration_LED4=0;
R.spont.ISI_list_LED4=[];

for ii = 1:P.numStim_LED4
    R.spont.data_LED4=[R.spont.data_LED4 reshape(D.trialdata_LED4{ii}(D.trialdata_LED4{ii}<0),1,[])];
    R.spont.duration_LED4=R.spont.duration_LED4+0.75;
    R.spont.ISI_list_LED4 = [R.spont.ISI_list_LED4 reshape(diff(D.trialdata_LED4{ii}(D.trialdata_LED4{ii}<0)),1,[])];
end

% Calculate the stats
R.spont.FF_LED4 = size(R.spont.data_LED4,2)/R.spont.duration_LED4;
R.spont.ISI_LED4(1,1) = nanmean(R.spont.ISI_list_LED4); % mean of ISIs
R.spont.ISI_LED4(1,2) = nanstd(R.spont.ISI_list_LED4);% SD of ISIs
R.spont.CV_LED4 = (R.spont.ISI_LED4(1,1)/R.spont.ISI_LED4(1,2));

%LED5
R.spont.data_LED5=[];
R.spont.duration_LED5=0;
R.spont.ISI_list_LED5=[];

for ii = 1:P.numStim_LED5
    R.spont.data_LED5=[R.spont.data_LED5 reshape(D.trialdata_LED5{ii}(D.trialdata_LED5{ii}<0),1,[])];
    R.spont.duration_LED5=R.spont.duration_LED5+0.75;
    R.spont.ISI_list_LED5 = [R.spont.ISI_list_LED5 reshape(diff(D.trialdata_LED5{ii}(D.trialdata_LED5{ii}<0)),1,[])];
end

% Calculate the stats
R.spont.FF_LED5 = size(R.spont.data_LED5,2)/R.spont.duration_LED5;
R.spont.ISI_LED5(1,1) = nanmean(R.spont.ISI_list_LED5); % mean of ISIs
R.spont.ISI_LED5(1,2) = nanstd(R.spont.ISI_list_LED5);% SD of ISIs
R.spont.CV_LED5 = (R.spont.ISI_LED5(1,1)/R.spont.ISI_LED5(1,2));

%LED6
R.spont.data_LED6=[];
R.spont.duration_LED6=0;
R.spont.ISI_list_LED6=[];

for ii = 1:P.numStim_LED6
    R.spont.data_LED6=[R.spont.data_LED6 reshape(D.trialdata_LED6{ii}(D.trialdata_LED6{ii}<0),1,[])];
    R.spont.duration_LED6=R.spont.duration_LED6+0.75;
    R.spont.ISI_list_LED6 = [R.spont.ISI_list_LED6 reshape(diff(D.trialdata_LED6{ii}(D.trialdata_LED6{ii}<0)),1,[])];
end

% Calculate the stats
R.spont.FF_LED6 = size(R.spont.data_LED6,2)/R.spont.duration_LED6;
R.spont.ISI_LED6(1,1) = nanmean(R.spont.ISI_list_LED6); % mean of ISIs
R.spont.ISI_LED6(1,2) = nanstd(R.spont.ISI_list_LED6);% SD of ISIs
R.spont.CV_LED6 = (R.spont.ISI_LED6(1,1)/R.spont.ISI_LED6(1,2));

% Average the spont measures
R.spont.FF = mean([R.spont.FF_LED1,R.spont.FF_LED2,R.spont.FF_LED3,R.spont.FF_LED4,R.spont.FF_LED5,R.spont.FF_LED6]);
R.spont.ISI = mean([R.spont.ISI_LED1(1),R.spont.ISI_LED2(1),R.spont.ISI_LED3(1),R.spont.ISI_LED4(1),R.spont.ISI_LED5(1),R.spont.ISI_LED6(1)]);
R.spont.CV = mean([R.spont.CV_LED1,R.spont.CV_LED2,R.spont.CV_LED3,R.spont.CV_LED4,R.spont.CV_LED5,R.spont.CV_LED6]);

%% Perform ROC to detect significant responses
R.ROC=[];
for ii=1:P.numStim_LED
    R.ROC.baseline_LED(ii) = sum(-0.5<D.trialdata_LED{ii}&D.trialdata_LED{ii}<=0);
    R.ROC.stim_LED(ii) = sum(0<D.trialdata_LED{ii}&D.trialdata_LED{ii}<=0.5);% response during stim within the interested window
end
%
%
% % LED
% [lightFA,lightHit,lightAUROC] = calcAUROC(R.ROC.baseline_LED, R.ROC.stim_LED);
%
% figure
% plot(lightFA,lightHit,'bo-')
% hold on
% plot([0,1],[0,1],'k--')
% set(gca,'xtick',[0 1],'ytick',[0 1],'box','off','tickdir','out')
% % title (sprintf('ROC for light vs baseline AUROC = %i',lightAUROC))
% xlabel('False Alarm')
% ylabel('Hit Rate')
% axis('square')
%
% %  I will shuffle the trials
% nShuffles = 1000;
% lightAUROCShuffle = zeros(1,nShuffles);
%
% for s = 1:nShuffles
%     tempshuffle = Shuffle([R.ROC.baseline_LED, R.ROC.stim_LED]);
%     SAcountsShuffle{s} = tempshuffle (1:2:end);
%     lightCountsShuffle{s} = tempshuffle (2:2:end);
%
%     clear lightFAShuffle lightHitShuffle lightAUROCShuffle
%     [lightFAShuffle,lightHitShuffle,lightAUROCShuffle] = calcAUROC(SAcountsShuffle{s},lightCountsShuffle{s});
%     allLightAUROCShuffle(s)  =   lightAUROCShuffle;
% end
% % Test the significance
% diffRealShuffle = allLightAUROCShuffle - lightAUROC; % Get difference between observed and shuffled ROC
% R.ROC.LED_facilitation = sum(diffRealShuffle>0)/nShuffles; % Find fraction of shuffled greater than observed
% R.ROC.LED_suppression = sum(diffRealShuffle<0)/nShuffles; % Find fraction of shuffled greater than observed
% close(gcf);


%% Output figures and data
cd(P.outputpath)
R.outputVars = ([R.spont.FF, R.spont.ISI, R.spont.CV...
    R.kde_baselinefreq_LED1, R.peakamp_max_LED1, R.peakamp_min_LED1, R.amp_max_LED1, R.amp_min_LED1, R.latency_LED1, R.area_LED1...
    R.kde_baselinefreq_LED2, R.peakamp_max_LED2, R.peakamp_min_LED2, R.amp_max_LED2, R.amp_min_LED2, R.latency_LED2, R.area_LED2...
    R.kde_baselinefreq_LED3, R.peakamp_max_LED3, R.peakamp_min_LED3, R.amp_max_LED3, R.amp_min_LED3, R.latency_LED3, R.area_LED3...
    R.kde_baselinefreq_LED4, R.peakamp_max_LED4, R.peakamp_min_LED4, R.amp_max_LED4, R.amp_min_LED4, R.latency_LED4, R.area_LED4...
    R.kde_baselinefreq_LED5, R.peakamp_max_LED5, R.peakamp_min_LED5, R.amp_max_LED5, R.amp_min_LED5, R.latency_LED5, R.area_LED5...
    R.kde_baselinefreq_LED6, R.peakamp_max_LED6, R.peakamp_min_LED6, R.amp_max_LED6, R.amp_min_LED6, R.latency_LED6, R.area_LED6...
    ]);

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
D.d_LED1=[];D.d_LED1_TTL=[];D.d_LED1_full=[]; D.d_LED1_TTL_full=[];D.d_LED1_full_filt=[];
D.d_LED2=[];D.d_LED2_TTL=[];D.d_LED2_full=[]; D.d_LED2_TTL_full=[];D.d_LED2_full_filt=[];
D.d_LED3=[];D.d_LED3_TTL=[];D.d_LED3_full=[]; D.d_LED3_TTL_full=[];D.d_LED3_full_filt=[];
D.d_LED4=[];D.d_LED4_TTL=[];D.d_LED4_full=[]; D.d_LED4_TTL_full=[];D.d_LED4_full_filt=[];
D.d_LED5=[];D.d_LED5_TTL=[];D.d_LED5_full=[]; D.d_LED5_TTL_full=[];D.d_LED5_full_filt=[];
D.d_LED6=[];D.d_LED6_TTL=[];D.d_LED6_full=[]; D.d_LED6_TTL_full=[];D.d_LED6_full_filt=[];

% Save data
savename = sprintf('Output_%s.mat',P.cellID);
save(savename,'D','P','R');

disp('Save completed')

