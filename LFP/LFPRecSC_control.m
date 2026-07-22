%% LFP recordings SC
% by R. Broersen; 07-10-2025
close all; clear all;
%% track 1
P.trackName = '251215_track1';
P.datapath = '';
P.fileNums = {'00', '01' '02' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20' '21' '22' '23'};
P.fileExclude = [];
P.fileNamePrefix = '25d150';

%% track 2
P.trackName = '251215_track2';
P.datapath = '';
P.fileNums = {'25' '26' '27' '28' '29' '30' '31' '32' '33' '34' '35' '36' '37' '38' '39' '40' '41' '42' '43' '44' '45' '46' '47' '48'};
P.fileExclude = [];
P.fileNamePrefix = '25d150';

%% track 3
P.trackName = '251215_track3';
P.datapath = '';
P.fileNums = {'49' '50' '51' '52' '53' '54' '55' '56' '57' '58' '59' '60' '61' '62' '63' '64' '65' '66' '67' '68' '69' '70' '71' '72'};
P.fileExclude = [];
P.fileNamePrefix = '25d150';

%% Define parameters
% P.medianFiltWindow = 0.0025; % 2.5 ms window median filter
P.low_cutoff = 0.1;     % Hz - high-pass cutoff (remove DC drift)
P.high_cutoff = 300;    % Hz - low-pass cutoff (limit to LFP band)
P.notch_freq = 55;      % Hz - mains frequency (set to [] to skip)
P.notch_Q = 30;         % Quality factor (higher = narrower notch)
P.metaData.fs_target = 2000; % Sampling freq after downsampling in Hz
P.metaData.fs = 50000; % Sampling frequency before downsampling in Hz
P.decim_factor = round(P.metaData.fs / P.metaData.fs_target);
P.lp_cutoff = P.metaData.fs_target/2*0.9;

%% Create the filters
[b_lp, a_lp] = butter(4, P.lp_cutoff/(P.metaData.fs/2), 'low'); % Anti-alias lowpass (before downsampling)
[b_bp, a_bp] = butter(4, [0.1 300]/(P.metaData.fs_target/2), 'bandpass'); % 0.1-300Hz bandpass filter
[b_notch, a_notch] = iirnotch((P.notch_freq/(P.metaData.fs_target/2)), (P.notch_freq/(P.metaData.fs_target/2))/P.notch_Q);

%% Loop through the whole track
cd(P.datapath)
for ii = 1:size(P.fileNums,2)

    %% Exclude trials not to be analyzed
    if ismember(ii,P.fileExclude)
        continue
    end
    P.fileName = [P.fileNamePrefix P.fileNums{ii}];
    %% Load the data
    [D.stimData,D.timestamps,D.metaData]=abf2load([P.fileName '.abf']); % actually import the data
    P.numStim = size(D.stimData,3);
    %     P.metaData.fs = D.metaData.dataPtsPerChan/D.metaData.fADCSampleInterval;

    %% Create vector of all data, filter
    D.fullDataVector=[];
    D.TTL_opto=[];
    %     figure; hold on;
    for jj=1:P.numStim
        D.fullDataVector = [D.fullDataVector; D.stimData(:,1,jj)'];
        D.TTL_opto = [D.TTL_opto; D.stimData(:,3,jj)'];
        %        plot(D.fullDataVector(jj,:));
    end

    D.fullDataVector_ds = [];
    D.TTL_opto_ds = [];
    index=[];
    %     figure; hold on;
    for jj=1:P.numStim
        index =D.fullDataVector(jj,:);
        index = filtfilt(b_lp, a_lp, index); % anti-aliasing filter
        D.fullDataVector_ds(jj,:) = downsample(index, P.decim_factor); % Downsampling
        %         plot(D.fullDataVector_ds(jj,:));
        index =D.TTL_opto(jj,:);
        %                 index = filtfilt(b_lp, a_lp, index); % anti-aliasing filter
        D.TTL_opto_ds(jj,:) = downsample(index, P.decim_factor); % Downsampling
    end

    %     figure; plot(D.fullDataVector_ds(jj,:))


    %% Filter the signal
    %     D.fullDataVector_filt=[];
    index=[];
    for jj=1:P.numStim
        fprintf('Filtering trace %.f of file %.f... \n',jj,ii)
        index = D.fullDataVector_ds(jj,:);
        index = filtfilt(b_bp, a_bp, index); % Bandpass filter
        %         D.fullDataVector_filt(jj,:) = filtfilt(b_bp, a_bp, index); % Bandpass filter
        D.fullDataVector_filt(jj,:) = filtfilt(b_notch, a_notch, index);
        %         D.fullDataVector_filt(jj,:) = moving(D.fullDataVector(jj,:),(P.metaData.fs*P.medianFiltWindow),'median');
    end

    %         D.fullDataVector_filt(jj,:) = moving(D.fullDataVector(jj,:),(P.metaData.fs*P.medianFiltWindow),'median');

    %     figure; hold on; plot(downsample(D.fullDataVector(1,:),P.decim_factor),'k'); plot(D.fullDataVector_filt(1,:),'b'); % plot to inspect filtering result
    %         figure; hold on; subplot(2,1,1); plot(D.fullDataVector_filt(1,:),'k');
    %         subplot(2,1,2); plot(D.TTL_opto(1,:),'b')
    %         pause;

    %% Detect the timestamps of the opto
    D.opto_timestamps=[];
    for jj=1:P.numStim
        idx = diff(D.TTL_opto_ds(jj,:));
        [~, D.opto_timestamps(jj)] = find(idx>2);
    end

    if size(D.opto_timestamps,2)~=P.numStim
        disp('error TTL detection')
        pause;
    end

    %% Normalize the trials to the baseline
    D.fullDataVector_trials=[];
    for jj=1:P.numStim
        D.fullDataVector_trials(jj,:) =  D.fullDataVector_filt(jj,(D.opto_timestamps(jj)-(0.5*P.metaData.fs_target)):(D.opto_timestamps(jj)+(1.5*P.metaData.fs_target))-1)-nanmean(D.fullDataVector_filt(jj,(D.opto_timestamps(jj)-(0.5*P.metaData.fs_target)):D.opto_timestamps(jj)));
    end

    %% Calculate averages, SD, SEM
    R.fullDataVector_trials_avg(ii,:) = nanmean(D.fullDataVector_trials,1);
    R.fullDataVector_trials_SD(ii,:) = nanstd(D.fullDataVector_trials,1);
    R.fullDataVector_trials_SEM(ii,:) = nanstd(D.fullDataVector_trials,1)/sqrt(P.numStim);
    xaxis = linspace(-0.5,1.5,(2*P.metaData.fs_target));
    %     figure; shadedErrorBar(xaxis,R.fullDataVector_trials_avg(ii,:),R.fullDataVector_trials_SEM(ii,:));
    %     pause;
end

%% Calculate groupaverages

S.fullDataVector_trials_avg = nanmean(R.fullDataVector_trials_avg,1);
S.fullDataVector_trials_SD = nanstd(R.fullDataVector_trials_avg,1);
S.fullDataVector_trials_SEM = nanstd(R.fullDataVector_trials_avg,1)/sqrt(size(R.fullDataVector_trials_avg,1));

%% Plot the groupaverage
xaxis = linspace(-0.5,1.5,(2*P.metaData.fs_target));
figure; hold on; shadedErrorBar(xaxis,S.fullDataVector_trials_avg,S.fullDataVector_trials_SEM);
xlim([-0.25 0.5])
% Make new tick marks.
xl = xlim(); % Get existing range.
% Make 5 tick marks.  (Existing # of tick marks may not = 5)
xTickLocations = linspace(xl(1), xl(2), 4)
set(gca,'XTick', xTickLocations);
% Make new labels for the new tick marks
xTickString = {'-0.25','0','0.25','0.5'};
set(gca,'XTickLabel', xTickString);
xlabel('Time to stimulus (s)')

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
ylabel('LFP (mV)')

% Save figure
figname = sprintf('%s_groupAVG.fig',P.trackName);
saveas(gcf,figname,'fig');
figname = sprintf('%s_groupAVG.pdf',P.trackName);
print('-dpdf','-vector','-loose',figname)

%% plot the traces under each other

figure; hold on;
for kk = 1:size(R.fullDataVector_trials_avg,1)
    plotIdxR(kk,:) = R.fullDataVector_trials_avg(kk,:)-(0.05*kk);
    plot(xaxis,plotIdxR(kk,:),'k');
end
xlim([-0.25 0.5])
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
% Make new tick marks.
xl = xlim(); % Get existing range.
% Make 5 tick marks.  (Existing # of tick marks may not = 5)
xTickLocations = linspace(xl(1), xl(2), 4)
set(gca,'XTick', xTickLocations);
% Make new labels for the new tick marks
xTickString = {'-0.25','0','0.25','0.5'};
set(gca,'XTickLabel', xTickString);
xlabel('Time to stimulus (s)')
ylabel('Depth in the SC (mm)')

% Save figure
figname = sprintf('%s_tracesVsDepth.fig',P.trackName);
saveas(gcf,figname,'fig');
figname = sprintf('%s_tracesVsDepth.pdf',P.trackName);
print('-dpdf','-vector','-loose',figname)

%% Calculate the LFP amplitudes

for ii=1:size(R.fullDataVector_trials_avg,1)
    idx = [min(R.fullDataVector_trials_avg(ii,1000:1500)) max(R.fullDataVector_trials_avg(ii,1000:1500))];
    if (idx(1)*-1)>idx(2)
        R.amp(ii,1)=min(R.fullDataVector_trials_avg(ii,1000:1500));
    elseif (idx(1)*-1)<idx(2)
        R.amp(ii,1)=max(R.fullDataVector_trials_avg(ii,1000:1500));
    end
end
% for ii=1:size(R.fullDataVector_trials_avg,1)
% %     idx = [min(R.fullDataVector_trials_avg(ii,1000:1500)) max(R.fullDataVector_trials_avg(ii,1000:1500))];
% %     if (idx(1)*-1)>idx(2)
% %     R.amp(ii,1)=min(R.fullDataVector_trials_avg(ii,1000:1500));
% %     elseif (idx(1)*-1)<idx(2)
%         R.amp(ii,1)=max(R.fullDataVector_trials_avg(ii,1000:1500));
% %     end
% end

%% Save the analysed data per track
P.saveName = sprintf('%s_data.mat',P.trackName);
save(P.saveName,'D','P','R','S',"-v7.3");

%% Save the track data for CSD analysis
P.saveName = sprintf('%s_trackData.mat',P.trackName);
data=R.fullDataVector_trials_avg(:,(0.25*P.metaData.fs_target):(1*P.metaData.fs_target));
save(P.saveName,'data');

CSDplotter;
pause;
% Cubic Spline iCSD method, Gaussian Filter std. dev. 0.2 mm; cortical
% parameters: 0.3 0.3 0.2. Electrode positions: 0.2:0.1:2.5
% Paste as new figure;

% Make new tick marks.
xl = xlim(); % Get existing range.
% Make 5 tick marks.  (Existing # of tick marks may not = 5)
xTickLocations = linspace(xl(1), xl(2), 4)
set(gca,'XTick', xTickLocations);
% Make new labels for the new tick marks
xTickString = {'-0.25','0','0.25','0.5'};
set(gca,'XTickLabel', xTickString);
xlabel('Time to stimulus (s)')

% Make new tick marks.
yl = ylim() % Get existing range.
% Make 5 tick marks.  (Existing # of tick marks may not = 5)
yTickLocations = linspace(yl(1), yl(2), 7)
set(gca,'YTick', yTickLocations);
% Make new labels for the new tick marks
yTickString = {'0.2','0.6','1.0','1.4','1.8','2.2','2.6'};
set(gca,'YTickLabel', yTickString);
ylabel('Depth in the SC (mm)')

(xl(2)-xl(1))/0.75;
line([((xl(2)-xl(1))/0.75)*0.25 ((xl(2)-xl(1))/0.75)*0.25],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([((xl(2)-xl(1))/0.75)*0.3 ((xl(2)-xl(1))/0.75)*0.3],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

% Save figure
figname = sprintf('%s_CSD.fig',P.trackName);
saveas(gcf,figname,'fig');
figname = sprintf('%s_CSD.pdf',P.trackName);
print('-dpdf','-vector','-loose',figname)