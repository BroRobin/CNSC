%% Analysis of whole-body movements

% (c) R. Broersen, Erasmus MC, 2023

clear all;

for zz=8 % Define which movie to analyze
    close all;
    clearvars -except zz
    if zz==1
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1007_D3_50ms.avi'];
        P.startFrame = 1;
        P.mouseID = '1007_D3_50ms';

    elseif zz==2
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1007_D3_100ms.avi'];
        P.startFrame = 1;
        P.mouseID = '1007_D3_100ms';

    elseif zz==3
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1007_D3_100ms_lido.avi'];
        P.startFrame = 1;
        P.mouseID = '1007_D3_100ms_lido';

    elseif zz==4
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1007_D3_100ms_washout.avi'];
        P.startFrame = 1;
        P.mouseID = '1007_D3_100ms_washout';

    elseif zz==5
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1008_D3_50ms.avi'];
        P.startFrame = 1;
        P.mouseID = '1008_D3_50ms';

    elseif zz==6
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1008_D3_100ms.avi'];
        P.startFrame = 1;
        P.mouseID = '1008_D3_100ms';

    elseif zz==7
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1008_D3_100ms_lido.avi'];
        P.startFrame = 1;
        P.mouseID = '1008_D3_100ms_lido';

    elseif zz==8
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1008_D3_100ms_washout.avi'];
        P.startFrame = 1;
        P.mouseID = '1008_D3_100ms_washout';

    elseif zz==9
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1012_D3_50ms.avi'];
        P.startFrame = 1;
        P.mouseID = '1012_D3_50ms';
    elseif zz==10
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1012_D3_100ms.avi'];
        P.startFrame = 1;
        P.mouseID = '1012_D3_100ms';
    elseif zz==11
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1012_D3_100ms_lido.avi'];
        P.startFrame = 1;
        P.mouseID = '1012_D3_100ms_lido';
    elseif zz==12
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1012_D3_100ms_washout.avi'];
        P.startFrame = 1;
        P.mouseID = '1012_D3_100ms_washout';
    end

    % Play the movie
    %     implay(P.filepath);

    %% Load the datafile
    cd('')
    %     load([P.mouseID '_wholebody_data_withinROI_corrected.mat'])
    load([P.mouseID '_wholebody_data.mat'])

    % Load the movie per 10,000 frames
    P.vidObj = VideoReader(P.filepath);
    P.nFrames=P.vidObj.NumberOfFrames;
    P.framerate = P.vidObj.FrameRate;
    P.M=P.vidObj.Height; % no of rows
    P.N=P.vidObj.Width; % no of columns
    P.nLoadFrames = [10000];
    P.nLoadRounds = ceil(P.nFrames/P.nLoadFrames);
    idx_sum = [];
    %     idx_CS_sum = [];

    %     for ii = 2:P.nLoadRounds
    for ii = 1:P.nLoadRounds
        % for ii=1
        ii
        video=zeros(P.M,P.N,P.nLoadFrames,'uint8'); % creating a video 3d matrix
        if ii==1
            P.loadFrames = [1 ii*P.nLoadFrames];
        elseif ii>1 && ii<P.nLoadRounds
            P.loadFrames = [ii*P.nLoadFrames-(P.nLoadFrames-1) ii*P.nLoadFrames];
        elseif ii==P.nLoadRounds
            P.loadFrames = [ii*P.nLoadFrames-(P.nLoadFrames-1) P.nFrames];
        end
        counter=0;
        for k=P.loadFrames(1):P.loadFrames(2)
            k
            counter=counter+1;
            im= read(P.vidObj,k);
            im=im(:,:,1);           % all three layers will have same image

            if k ==1 && ii==1
                if exist(sprintf('%s_ROI_withinROI.mat',P.mouseID))
                    load(sprintf('%s_ROI_withinROI.mat',P.mouseID))
                else
                    figure; imagesc(im)
                    CS_coords = imfreehand(); % Draw a ROI around the optic fiber cable
                    maskImg = CS_coords.createMask;
                    save(sprintf('%s_ROI_withinROI.mat',P.mouseID),"maskImg");
                    pause;

                end
            end

            % Calculate the sum of the CS ROI
            %             idx_CS_sum = [idx_CS_sum; sum(im(maskImg))];

            % Mask out the ROI around the optic light
            im(~maskImg)=0;
            video(:,:,counter)=im;
        end

        % Calculate the difference of the whole video
        idx = abs(diff(video,1,3));
        idx_sum = [idx_sum; NaN; permute(nansum(nansum(idx)),[3,1,2])];
        %                 for k=1:(size(video,3)-1)
        %                     idx = imabsdiff(video(:,:,k),video(:,:,k+1));
        %                     idx_sum = [idx_sum; NaN; nansum(nansum(idx))];
        %                 end
    end
    idx_sum = idx_sum(1:k);
    %     idx_sum(idx_sum==nanmax(idx_sum)) = nanmedian(idx_sum); % Remove the highest datapoint

    R.rawMovement = idx_sum;
    %     R.rawCS = idx_CS_sum;

    figure; hold on; plot(R.rawMovement);
    figure; hold on; plot(R.rawCS);


    % %     %% Filter the opto trace
    % %     idx_CS_sum_norm_filt = gfilt(idx_CS_sum,P.vidObj.FrameRate,0.0075);
    % %     figure; hold on; plot(idx_CS_sum,'k'); plot(idx_CS_sum_norm_filt,'r');
    % %
    % %     % Save figure
    % %     figname = sprintf('%s_OptoStim.fig',P.mouseID)
    % %     saveas(gcf,figname,'fig');
    % %     figname = sprintf('%s_OptoStim.pdf',P.mouseID)
    % %     print('-dpdf','-vector','-loose',figname)
    % %     figname = sprintf('%s_OptoStim.jpg',P.mouseID)
    % %     saveas(gcf,figname,'jpg')
    %
    %     %% Convert timings to timestamps
    %
    % %     idx_CS_sum_diff = diff(idx_CS_sum_norm_filt);
    % % %     [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.2*10^4));
    % %
    % %     if zz==1
    % %            [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.2*10^4));
    % % %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);
    % %     elseif zz==2
    % % %         P.trial_timestamps = P.trial_timestamps([1:10 14:34 37:end]);
    % %    [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.5*10^4));
    % %     elseif zz==3
    % %          [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.2*10^4));
    % %         P.trial_timestamps = P.trial_timestamps([1:50]);
    % %     elseif zz==4
    % %          [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.5*10^4));
    % %         P.trial_timestamps = P.trial_timestamps([1:50]);
    % %     elseif zz==5
    % %          [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.3*10^4));
    % % %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    % % elseif zz==6
    % %          [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(2*10^4));
    % % %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    % % elseif zz==7
    % %          [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
    % % %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    % % elseif zz==8
    % %          [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(2*10^4));
    % % %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    % % elseif zz==9
    % %          [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
    % % %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    % %     end
    % %
    % %     if size(P.trial_timestamps,1)~=50
    % %         disp('error in detecting timestamps opto');
    % %         figure; plot(idx_CS_sum_diff,'b'); hold on;plot(P.trial_timestamps,idx_CS_sum_diff(P.trial_timestamps),'ro')
    % %         pause;
    % %     end
    %


    %% Filter the movement trace and normalize the movement trace to the median and maximum
    R.normMov = R.rawMovement;
    R.normMov(isnan(R.normMov))=nanmedian(R.normMov); % Replace the NaNs with the median
    %     R.normMov_filt = gfilt(R.normMov,P.vidObj.FrameRate,0.0187); % filtering with a 10Hz lowpass
    R.normMov_filt = gfilt(R.normMov,P.framerate,0.0075); % filtering with a 25Hz lowpass
    R.normMov_filt =  R.normMov_filt-nanmedian(R.normMov_filt); % subtract the median, to normalize to no movement
    R.normMov_filt = (R.normMov_filt/nanmax(R.normMov_filt(1:size(R.normMov_filt,1))))*100; % scale from 0-100 based on max
    figure; hold on; plot(R.normMov_filt,'r');
    %     figure; hold on; plot(R.normMov_filt,'r');
    % Save figure
    figname = sprintf('%s_MovementSignal_withinROI.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementSignal_withinROI.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementSignal_withinROI.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')


    %% Cut the movement trace into epochs and normalize to the baseline: baseline =1
    R.trial_mov = [];

    for ii = 1:size(P.trial_timestamps,1)
        try
            R.trial_mov(ii,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.5*P.framerate)):P.trial_timestamps(ii)+round(1.5*P.framerate));
            R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,round(0.25*P.framerate):round(0.5*P.framerate)));
            %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
        catch
            R.trial_mov(ii,:)=NaN;
        end
        % pause;
    end

    %% Remove the trials where the baseline is unstable (values >3*SD during the baseline), or if the baseline is more than 5% of the maximum movement (select trials where mice are sitting still)
    figure; hold on;
    R.trial_mov_SD = [];
    for ii = 1:size(P.trial_timestamps,1)
        R.trial_mov_SD(ii) = nanstd(R.trial_mov(ii,1:round(0.5*P.framerate)));
    end
    R.trial_mov_SD_avg = nanmean(R.trial_mov_SD);

    for ii = 1:size(P.trial_timestamps,1)
        %                  if sum(R.trial_mov(ii,(1:round(0.5*P.framerate)))>0.1)>0 % If the baseline is higher than 10% of maximum movement.
        if sum(R.trial_mov(ii,(1:round(0.5*P.framerate)))>(nanmean(R.trial_mov(ii,(1:round(0.5*P.framerate))))+(R.trial_mov_SD_avg*3)))>0 || sum(R.trial_mov(ii,(1:round(0.5*P.framerate)))<(nanmean(R.trial_mov(ii,(1:round(0.5*P.framerate))))-(R.trial_mov_SD_avg*3)))>0 ||  sum(R.trial_mov(ii,(1:round(0.5*P.framerate)))>5)>0
            R.trial_mov(ii,:)=NaN;
        end
        plot(R.trial_mov(ii,:))
    end

    plot(nanmean(R.trial_mov),'k','LineWidth',2);
    %     plot(nanmedian(R.trial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.6*P.framerate) round(0.6*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     line([round(0.75*P.framerate) round(0.75*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     title('Paired trials')
    ylabel('Movement index (%maximum)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementTrials_withinROI.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementTrials_withinROI.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementTrials_withinROI.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')


    %% Calculate the averages

    S.trial_avg = nanmean(R.trial_mov);
    S.trial_sd = nanstd(R.trial_mov);
    S.trial_sem = nanstd(R.trial_mov)/sqrt(size(R.trial_mov,1));

    %     if zz>2
    %     x_values = linspace((1/P.framerate),2,101)-0.5;
    %     elseif zz<3
    x_values = linspace((1/P.framerate),2,121)-0.5;
    %     end
    figure; shadedErrorBar(x_values(1:length(S.trial_avg)),S.trial_avg,S.trial_sem);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

    S.trial_amp =[];
    S.trial_AUC =[];
    for ii=1:size(R.trial_mov,1)
        S.trial_amp(ii) = nanmax(R.trial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
        S.trial_AUC(ii) = nansum(R.trial_mov(ii,round(0.5*P.framerate):round(0.75*P.framerate)));
    end
    S.trial_amp_avg = nanmean(S.trial_amp);
    S.trial_AUC_avg = nanmean(S.trial_AUC);
    S.excel = [S.trial_amp_avg S.trial_AUC_avg];
    ylabel('Movement index (%maximum)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementAVG_withinROI.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementAVG_withinROI.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementAVG_withinROI.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Calculate the cumulative sum (500 ms of the baseline vs. 500 ms after the stimulus)
    figure; hold on;
    S.trial_cumsum_baseline=[];
    S.trial_cumsum_opto=[];
    for ii=1:size(R.trial_mov,1)
        S.trial_cumsum_baseline(ii,:) = cumsum(R.trial_mov(ii,1:round(0.5*P.framerate)));
        plot(S.trial_cumsum_baseline(ii,:),'k')
        S.trial_cumsum_opto(ii,:) = cumsum(R.trial_mov(ii,round(0.5*P.framerate):round(1*P.framerate)-1));
        plot(S.trial_cumsum_opto(ii,:),'b')
    end

    S.trial_cumsum_baseline_avg = nanmean(S.trial_cumsum_baseline);
    S.trial_cumsum_opto_avg = nanmean(S.trial_cumsum_opto);
    S.trial_cumsum_baseline_SD = nanstd(S.trial_cumsum_baseline);
    S.trial_cumsum_opto_SD = nanstd(S.trial_cumsum_opto);
    S.trial_cumsum_baseline_SEM = nanstd(S.trial_cumsum_baseline)/sqrt(size(S.trial_cumsum_baseline,1));
    S.trial_cumsum_opto_SEM = nanstd(S.trial_cumsum_opto)/sqrt(size(S.trial_cumsum_opto,1));

    figure; hold on;
    %     if zz>2
    shadedErrorBar([0:(1/P.framerate):(0.5-round(1/P.framerate))],S.trial_cumsum_opto_avg,S.trial_cumsum_opto_SEM,'b');
    shadedErrorBar([0:(1/P.framerate):(0.5-round(1/P.framerate))],S.trial_cumsum_baseline_avg,S.trial_cumsum_baseline_SEM,'k');
    %     elseif zz<3
    %             shadedErrorBar([0:(1/P.framerate):(0.5-(1/P.framerate))],S.trial_cumsum_opto_avg,S.trial_cumsum_opto_SEM,'b');
    %             shadedErrorBar([0:(1/P.framerate):(0.5-(1/P.framerate))],S.trial_cumsum_baseline_avg,S.trial_cumsum_baseline_SEM,'k');
    %     end
    ylabel('Cumulative sum movements (arb. units)'); xlabel('Time (s)'); legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    % Save figure
    figname = sprintf('%s_cumsum_baselineVsOpto_withinROI.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_cumsum_baselineVsOpto_withinROI.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_cumsum_baselineVsOpto_withinROI.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')



    %% Save the data
    cd('Y:\Data\CN-SC_eyemov\Wholebody\mouseoutput_D3')
    P.savename = sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID);
    save(P.savename,'P','S','R',"-v7.3");



end
