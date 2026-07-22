%% Analysis of whole-body movements

% (c) R. Broersen, Erasmus MC, 2023

clear all; close all;

for zz=6 % Define which movie to analyze
    close all;
    clearvars -except zz
    if zz==1
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_973_D2.avi'];
        P.startFrame = 2;
        P.mouseID = '973_D2';
        P.peakheight=0.5*10^4;

    elseif zz==2
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_974_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '974_D2';
        P.peakheight=0.7*10^4;

    elseif zz==3
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_975_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '975_D2';
        P.peakheight=1.5*10^4;

    elseif zz==4
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_976_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '976_D2';
        P.peakheight=0.5*10^4;

    elseif zz==5
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_977_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '977_D2';
        P.peakheight=1*10^4;

    elseif zz==6
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_978_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '978_D2';
        P.peakheight=0.6*10^4;

    elseif zz==7
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1007_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1007_D2';
        P.peakheight=2500;

    elseif zz==8
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1008_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1008_D2';
        P.peakheight=0.6*10^4;

    elseif zz==9
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1009_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1009_D2';
        P.peakheight=2500;

    elseif zz==10
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1010_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1010_D2';
        P.peakheight=0.6*10^4;

    elseif zz==11
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1011_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1011_D2';
        P.peakheight=3000;

    elseif zz==12
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1012_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1012_D2';
        P.peakheight=0.6*10^4;

    elseif zz==13
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1013_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1013_D2';
        P.peakheight=0.6*10^4;

    elseif zz==14
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1014_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1014_D2';
        P.peakheight=0.6*10^4;

    elseif zz==15
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1015_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1015_D2';
        P.peakheight=0.6*10^4;
    end

    % Play the movie
    %     implay(P.filepath);

    %% Load the datafile
    cd('')
    %     load([P.mouseID '_wholebody_data_withinROI_corrected.mat'])
    load([P.mouseID '_data.mat'])

    if zz==1
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_973_D2.avi'];
    elseif zz==2
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_974_D2.avi'];
    elseif zz==3
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_975_D2.avi'];
    elseif zz==4
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_976_D2.avi'];
    elseif zz==5
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_977_D2.avi'];
    elseif zz==6
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_978_D2.avi'];
    end

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
    % %     figure; hold on; plot(R.rawCS);



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


    %% Cut the movement trace into epochs

    if size(P.trial_timestamps,1)==150
        R.trial_mov_US=[];
        R.trial_mov_0 = [];
        R.trial_mov_25 = [];
        R.trial_mov_50 = [];
        R.trial_mov_75 = [];
        R.trial_mov_100 = [];

        counter =0;
        for ii = 1:6:size(P.trial_timestamps,1)
            counter = counter+1;
            %         try
            R.trial_mov_US(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.5*P.framerate)):P.trial_timestamps(ii)+round(1.5*P.framerate));
            R.trial_mov_US(counter,:)= R.trial_mov_US(counter,:)-nanmean(R.trial_mov_US(counter,1:round(0.5*P.framerate)));
            %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            %         catch
            %             R.trial_mov_0(counter,:)=NaN;
            %         end
            % pause;
        end

        counter =0;
        for ii = 2:6:size(P.trial_timestamps,1)
            counter = counter+1;
            %         try
            R.trial_mov_0(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.5*P.framerate)):P.trial_timestamps(ii)+round(1.5*P.framerate));
            R.trial_mov_0(counter,:)= R.trial_mov_0(counter,:)-nanmean(R.trial_mov_0(counter,1:round(0.5*P.framerate)));
            %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            %         catch
            %             R.trial_mov_0(counter,:)=NaN;
            %         end
            % pause;
        end

        counter =0;
        for ii = 3:6:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_25(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.525*P.framerate)):P.trial_timestamps(ii)+round(1.475*P.framerate));
                R.trial_mov_25(counter,:)= R.trial_mov_25(counter,:)-nanmean(R.trial_mov_25(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_25(counter,:)=NaN;
            end
            % pause;
        end

        counter =0;
        for ii = 4:6:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_50(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.55*P.framerate)):P.trial_timestamps(ii)+round(1.45*P.framerate));
                R.trial_mov_50(counter,:)= R.trial_mov_50(counter,:)-nanmean(R.trial_mov_50(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_50(counter,:)=NaN;
            end
            % pause;
        end
        counter =0;
        for ii = 5:6:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_75(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.575*P.framerate)):P.trial_timestamps(ii)+round(1.425*P.framerate));
                R.trial_mov_75(counter,:)= R.trial_mov_75(counter,:)-nanmean(R.trial_mov_75(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_75(counter,:)=NaN;
            end
            % pause;
        end
        counter =0;
        for ii = 6:6:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_100(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.6*P.framerate)):P.trial_timestamps(ii)+round(1.4*P.framerate));
                R.trial_mov_100(counter,:)= R.trial_mov_100(counter,:)-nanmean(R.trial_mov_100(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_100(counter,:)=NaN;
            end
            % pause;
        end
    elseif size(P.trial_timestamps,1)==125

        R.trial_mov_0 = [];
        R.trial_mov_25 = [];
        R.trial_mov_50 = [];
        R.trial_mov_75 = [];
        R.trial_mov_100 = [];
        counter =0;
        for ii = 1:5:size(P.trial_timestamps,1)
            counter = counter+1;
            %         try
            R.trial_mov_0(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.5*P.framerate)):P.trial_timestamps(ii)+round(1.5*P.framerate));
            R.trial_mov_0(counter,:)= R.trial_mov_0(counter,:)-nanmean(R.trial_mov_0(counter,1:round(0.5*P.framerate)));
            %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            %         catch
            %             R.trial_mov_0(counter,:)=NaN;
            %         end
            % pause;
        end

        counter =0;
        for ii = 2:5:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_25(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.525*P.framerate)):P.trial_timestamps(ii)+round(1.475*P.framerate));
                R.trial_mov_25(counter,:)= R.trial_mov_25(counter,:)-nanmean(R.trial_mov_25(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_25(counter,:)=NaN;
            end
            % pause;
        end

        counter =0;
        for ii = 3:5:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_50(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.55*P.framerate)):P.trial_timestamps(ii)+round(1.45*P.framerate));
                R.trial_mov_50(counter,:)= R.trial_mov_50(counter,:)-nanmean(R.trial_mov_50(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_50(counter,:)=NaN;
            end
            % pause;
        end
        counter =0;
        for ii = 4:5:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_75(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.575*P.framerate)):P.trial_timestamps(ii)+round(1.425*P.framerate));
                R.trial_mov_75(counter,:)= R.trial_mov_75(counter,:)-nanmean(R.trial_mov_75(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_75(counter,:)=NaN;
            end
            % pause;
        end
        counter =0;
        for ii = 5:5:size(P.trial_timestamps,1)
            counter = counter+1;
            try
                R.trial_mov_100(counter,:)= R.normMov_filt((P.trial_timestamps(ii)-round(0.6*P.framerate)):P.trial_timestamps(ii)+round(1.4*P.framerate));
                R.trial_mov_100(counter,:)= R.trial_mov_100(counter,:)-nanmean(R.trial_mov_100(counter,1:round(0.5*P.framerate)));
                %             R.trial_mov(ii,:)= R.trial_mov(ii,:)-nanmean(R.trial_mov(ii,1:(0.5*P.framerate)));
            catch
                R.trial_mov_100(counter,:)=NaN;
            end
            % pause;
        end
    end

    %% Remove the trials where the baseline is unstable (values >3*SD during the baseline), or if the baseline is more than 5% of the maximum movement (select trials where mice are sitting still)

    R.trial_mov_SD = [];
    for ii = 1:size(R.trial_mov_0,1)
        try R.trial_mov_SD = [R.trial_mov_SD; nanstd(R.trial_mov_US(ii,1:round(0.5*P.framerate)))]; end
        R.trial_mov_SD = [R.trial_mov_SD; nanstd(R.trial_mov_0(ii,1:round(0.5*P.framerate)))];
        R.trial_mov_SD = [R.trial_mov_SD; nanstd(R.trial_mov_25(ii,1:round(0.5*P.framerate)))];
        R.trial_mov_SD = [R.trial_mov_SD; nanstd(R.trial_mov_50(ii,1:round(0.5*P.framerate)))];
        R.trial_mov_SD = [R.trial_mov_SD; nanstd(R.trial_mov_75(ii,1:round(0.5*P.framerate)))];
        R.trial_mov_SD = [R.trial_mov_SD; nanstd(R.trial_mov_100(ii,1:round(0.5*P.framerate)))];
    end
    R.trial_mov_SD_avg = nanmean(R.trial_mov_SD);

    try
        figure; hold on;
        for ii = 1:size(R.trial_mov_US,1)

            if sum(R.trial_mov_US(ii,(1:round(0.5*P.framerate)))>(nanmean(R.trial_mov_US(ii,(1:round(0.5*P.framerate))))+(R.trial_mov_SD_avg*3)))>0 || sum(R.trial_mov_US(ii,(1:round(0.5*P.framerate)))<(nanmean(R.trial_mov_US(ii,(1:round(0.5*P.framerate))))-(R.trial_mov_SD_avg*3)))>0 ||  sum(R.trial_mov_US(ii,(1:round(0.5*P.framerate)))>5)>0
                %                     if sum(R.trial_mov_US(ii,(1:round(0.5*P.framerate)))>(R.trial_mov_SD_0(ii)*P.SD_treshold))>0
                R.trial_mov_US(ii,:)=NaN;
            end
            plot(R.trial_mov_US(ii,:))
        end
        plot(nanmean(R.trial_mov_US),'k','LineWidth',2);
        %     ylim([-0.02 0.2])
        %     plot(nanmedian(R.trial_mov),'g','LineWidth',2);
        line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
        %     line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
        %     line([round(0.55*P.framerate) round(0.55*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
        title('USonly')
        ylabel('Movement index (%maximum)'); xlabel('Time (s)');
        % Save figure
        figname = sprintf('%s_MovementTrials_USonly.fig',P.mouseID)
        saveas(gcf,figname,'fig');
        figname = sprintf('%s_MovementTrials_USonly.pdf',P.mouseID)
        print('-dpdf','-vector','-loose',figname)
        figname = sprintf('%s_MovementTrials_USonly.jpg',P.mouseID)
        saveas(gcf,figname,'jpg')
    end

    figure; hold on;
    for ii = 1:size(R.trial_mov_0,1)

        if sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))>(nanmean(R.trial_mov_0(ii,(1:round(0.5*P.framerate))))+(R.trial_mov_SD_avg*3)))>0 || sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))<(nanmean(R.trial_mov_0(ii,(1:round(0.5*P.framerate))))-(R.trial_mov_SD_avg*3)))>0 ||  sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))>5)>0
            %                     if sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))>(R.trial_mov_SD_0(ii)*P.SD_treshold))>0
            R.trial_mov_0(ii,:)=NaN;
        end
        plot(R.trial_mov_0(ii,:))
    end
    plot(nanmean(R.trial_mov_0),'k','LineWidth',2);
    %     ylim([-0.02 0.2])
    %     plot(nanmedian(R.trial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    line([round(0.55*P.framerate) round(0.55*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('US-opto 0ms delay')
    ylabel('Movement index (arb. units)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementTrials_0msDelay.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementTrials_0msDelay.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementTrials_0msDelay.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    figure; hold on;
    for ii = 1:size(R.trial_mov_25,1)
        %         R.trial_mov_SD_0(ii) = nanstd(R.trial_mov_0(ii,1:round(0.5*P.framerate)));
        if sum(R.trial_mov_25(ii,(1:round(0.5*P.framerate)))>(nanmean(R.trial_mov_25(ii,(1:round(0.5*P.framerate))))+(R.trial_mov_SD_avg*3)))>0 || sum(R.trial_mov_25(ii,(1:round(0.5*P.framerate)))<(nanmean(R.trial_mov_25(ii,(1:round(0.5*P.framerate))))-(R.trial_mov_SD_avg*3)))>0 ||  sum(R.trial_mov_25(ii,(1:round(0.5*P.framerate)))>5)>0
            %                     if sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))>(R.trial_mov_SD_0(ii)*P.SD_treshold))>0
            R.trial_mov_25(ii,:)=NaN;
        end
        plot(R.trial_mov_25(ii,:))
    end
    plot(nanmean(R.trial_mov_25),'k','LineWidth',2);
    %     ylim([-0.02 0.2])
    %     plot(nanmedian(R.trial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.525*P.framerate) round(0.525*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    line([round(0.575*P.framerate) round(0.575*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('US-opto 25ms delay')
    ylabel('Movement index (arb. units)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementTrials_25msDelay.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementTrials_25msDelay.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementTrials_25msDelay.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    figure; hold on;
    for ii = 1:size(R.trial_mov_50,1)
        %         R.trial_mov_SD_0(ii) = nanstd(R.trial_mov_0(ii,1:round(0.5*P.framerate)));
        if sum(R.trial_mov_50(ii,(1:round(0.5*P.framerate)))>(nanmean(R.trial_mov_50(ii,(1:round(0.5*P.framerate))))+(R.trial_mov_SD_avg*3)))>0 || sum(R.trial_mov_50(ii,(1:round(0.5*P.framerate)))<(nanmean(R.trial_mov_50(ii,(1:round(0.5*P.framerate))))-(R.trial_mov_SD_avg*3)))>0 ||  sum(R.trial_mov_50(ii,(1:round(0.5*P.framerate)))>5)>0
            %                     if sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))>(R.trial_mov_SD_0(ii)*P.SD_treshold))>0
            R.trial_mov_50(ii,:)=NaN;
        end
        plot(R.trial_mov_50(ii,:))
    end
    plot(nanmean(R.trial_mov_50),'k','LineWidth',2);
    %     ylim([-0.02 0.2])
    %     plot(nanmedian(R.trial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.55*P.framerate) round(0.55*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    line([round(0.6*P.framerate) round(0.6*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('US-opto 50ms delay')
    ylabel('Movement index (arb. units)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementTrials_50msDelay.fig',P.mouseID)
    saveas(gcf,figname,'fig')
    figname = sprintf('%s_MovementTrials_50msDelay.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementTrials_50msDelay.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    figure; hold on;
    for ii = 1:size(R.trial_mov_75,1)
        %         R.trial_mov_SD_0(ii) = nanstd(R.trial_mov_0(ii,1:round(0.5*P.framerate)));
        if sum(R.trial_mov_75(ii,(1:round(0.5*P.framerate)))>(nanmean(R.trial_mov_75(ii,(1:round(0.5*P.framerate))))+(R.trial_mov_SD_avg*3)))>0 || sum(R.trial_mov_75(ii,(1:round(0.5*P.framerate)))<(nanmean(R.trial_mov_75(ii,(1:round(0.5*P.framerate))))-(R.trial_mov_SD_avg*3)))>0 ||  sum(R.trial_mov_75(ii,(1:round(0.5*P.framerate)))>5)>0
            %                     if sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))>(R.trial_mov_SD_0(ii)*P.SD_treshold))>0
            R.trial_mov_75(ii,:)=NaN;
        end
        plot(R.trial_mov_75(ii,:))
    end
    plot(nanmean(R.trial_mov_75),'k','LineWidth',2);
    %     ylim([-0.02 0.2])
    %     plot(nanmedian(R.trial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.575*P.framerate) round(0.575*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    line([round(0.625*P.framerate) round(0.625*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('US-opto 75ms delay')
    ylabel('Movement index (arb. units)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementTrials_75msDelay.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementTrials_75msDelay.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementTrials_75msDelay.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    figure; hold on;
    for ii = 1:size(R.trial_mov_100,1)
        %         R.trial_mov_SD_0(ii) = nanstd(R.trial_mov_0(ii,1:round(0.5*P.framerate)));
        if sum(R.trial_mov_100(ii,(1:round(0.5*P.framerate)))>(nanmean(R.trial_mov_SD)*3))>0
            %                     if sum(R.trial_mov_0(ii,(1:round(0.5*P.framerate)))>(R.trial_mov_SD_0(ii)*P.SD_treshold))>0
            R.trial_mov_100(ii,:)=NaN;
        end
        plot(R.trial_mov_100(ii,:))
    end
    plot(nanmean(R.trial_mov_100),'k','LineWidth',2);
    %     ylim([-0.02 0.2])
    %     plot(nanmedian(R.trial_mov),'g','LineWidth',2);
    line([round(0.5*P.framerate) round(0.5*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([round(0.6*P.framerate) round(0.6*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    line([round(0.7*P.framerate) round(0.7*P.framerate)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('US-opto 100ms delay')
    ylabel('Movement index (arb. units)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementTrials_100msDelay.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementTrials_100msDelay.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementTrials_100msDelay.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')
    %% Calculate the averages
    try
        S.trial_US_avg = nanmean(R.trial_mov_US);
        S.trial_US_sd = nanstd(R.trial_mov_US);
        S.trial_US_sem = nanstd(R.trial_mov_US)/sqrt(size(R.trial_mov_US,1));
    end
    S.trial_0_avg = nanmean(R.trial_mov_0);
    S.trial_0_sd = nanstd(R.trial_mov_0);
    S.trial_0_sem = nanstd(R.trial_mov_0)/sqrt(size(R.trial_mov_0,1));

    S.trial_25_avg = nanmean(R.trial_mov_25);
    S.trial_25_sd = nanstd(R.trial_mov_25);
    S.trial_25_sem = nanstd(R.trial_mov_25)/sqrt(size(R.trial_mov_25,1));

    S.trial_50_avg = nanmean(R.trial_mov_50);
    S.trial_50_sd = nanstd(R.trial_mov_50);
    S.trial_50_sem = nanstd(R.trial_mov_50)/sqrt(size(R.trial_mov_50,1));

    S.trial_75_avg = nanmean(R.trial_mov_75);
    S.trial_75_sd = nanstd(R.trial_mov_75);
    S.trial_75_sem = nanstd(R.trial_mov_75)/sqrt(size(R.trial_mov_75,1));

    S.trial_100_avg = nanmean(R.trial_mov_100);
    S.trial_100_sd = nanstd(R.trial_mov_100);
    S.trial_100_sem = nanstd(R.trial_mov_100)/sqrt(size(R.trial_mov_100,1));


    x_values = linspace((1/P.framerate),2,120)-0.5;

    figure; try  plot(x_values,S.trial_US_avg(1:120),'k','Linewidth',1.5); hold on; end
    plot(x_values,S.trial_0_avg(1:120),'m','Linewidth',1.5); hold on;
    plot(x_values,S.trial_25_avg(1:120),'b','Linewidth',1.5)
    plot(x_values,S.trial_50_avg(1:120),'r','Linewidth',1.5)
    plot(x_values,S.trial_75_avg(1:120),'g','Linewidth',1.5)
    plot(x_values,S.trial_100_avg(1:120),'y','Linewidth',1.5)
    if zz>6
        legend({'US' '0ms delay' '25ms delay' '50ms delay' '75ms delay' '100ms delay' 'start stimulus'})
    elseif zz<7
        legend({'0ms delay' '25ms delay' '50ms delay' '75ms delay' '100ms delay' 'start stimulus'})
    end

    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    ylabel('Movement index (arb. units)'); xlabel('Time (s)');
    % Save figure
    figname = sprintf('%s_MovementAVG.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_MovementAVG.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_MovementAVG.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% US
    try
        S.trial_US_amp_firstpeak =NaN(1,size(R.trial_mov_US,1));
        S.trial_US_AUC_firstpeak =NaN(1,size(R.trial_mov_US,1));
        for ii=1:size(R.trial_mov_US,1)
            if isnan(R.trial_mov_US(ii,1))==0
                S.trial_US_amp_firstpeak(ii) = nanmax(R.trial_mov_US(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
                S.trial_US_AUC_firstpeak(ii) = nansum(R.trial_mov_US(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
            end
        end
        S.trial_US_amp_secondpeak =[];
        S.trial_US_AUC_secondpeak =[];
        for ii=1:size(R.trial_mov_US,1)
            if isnan(R.trial_mov_US(ii,1))==0
                S.trial_US_amp_secondpeak(ii) = nanmax(R.trial_mov_US(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
                S.trial_US_AUC_secondpeak(ii) = nansum(R.trial_mov_US(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
            end
        end
        S.trial_US_amp =[];
        S.trial_US_AUC =[];
        for ii=1:size(R.trial_mov_US,1)
            if isnan(R.trial_mov_US(ii,1))==0
                S.trial_US_amp(ii) = nanmax(R.trial_mov_US(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
                S.trial_US_AUC(ii) = nansum(R.trial_mov_US(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
            end
        end
    end

    %% Mov0
    S.trial_0_amp_firstpeak =NaN(1,size(R.trial_mov_0,1));
    S.trial_0_AUC_firstpeak =NaN(1,size(R.trial_mov_0,1));
    for ii=1:size(R.trial_mov_0,1)
        if isnan(R.trial_mov_0(ii,1))==0
            S.trial_0_amp_firstpeak(ii) = nanmax(R.trial_mov_0(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
            S.trial_0_AUC_firstpeak(ii) = nansum(R.trial_mov_0(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
        end
    end
    S.trial_0_amp_secondpeak =[];
    S.trial_0_AUC_secondpeak =[];
    for ii=1:size(R.trial_mov_0,1)
        if isnan(R.trial_mov_0(ii,1))==0
            S.trial_0_amp_secondpeak(ii) = nanmax(R.trial_mov_0(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
            S.trial_0_AUC_secondpeak(ii) = nansum(R.trial_mov_0(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
        end
    end
    S.trial_0_amp =[];
    S.trial_0_AUC =[];
    for ii=1:size(R.trial_mov_0,1)
        if isnan(R.trial_mov_0(ii,1))==0
            S.trial_0_amp(ii) = nanmax(R.trial_mov_0(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
            S.trial_0_AUC(ii) = nansum(R.trial_mov_0(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
        end
    end

    %% Mov25
    S.trial_25_amp_firstpeak =NaN(1,size(R.trial_mov_25,1));
    S.trial_25_AUC_firstpeak =NaN(1,size(R.trial_mov_25,1));
    for ii=1:size(R.trial_mov_25,1)
        if isnan(R.trial_mov_25(ii,1))==0
            S.trial_25_amp_firstpeak(ii) = nanmax(R.trial_mov_25(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
            S.trial_25_AUC_firstpeak(ii) = nansum(R.trial_mov_25(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
        end
    end
    S.trial_25_amp_secondpeak =[];
    S.trial_25_AUC_secondpeak =[];
    for ii=1:size(R.trial_mov_25,1)
        if isnan(R.trial_mov_25(ii,1))==0
            S.trial_25_amp_secondpeak(ii) = nanmax(R.trial_mov_25(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
            S.trial_25_AUC_secondpeak(ii) = nansum(R.trial_mov_25(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
        end
    end
    S.trial_25_amp =[];
    S.trial_25_AUC =[];
    for ii=1:size(R.trial_mov_25,1)
        if isnan(R.trial_mov_25(ii,1))==0
            S.trial_25_amp(ii) = nanmax(R.trial_mov_25(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
            S.trial_25_AUC(ii) = nansum(R.trial_mov_25(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
        end
    end

    %% Mov50
    S.trial_50_amp_firstpeak =NaN(1,size(R.trial_mov_50,1));
    S.trial_50_AUC_firstpeak =NaN(1,size(R.trial_mov_50,1));
    for ii=1:size(R.trial_mov_50,1)
        if isnan(R.trial_mov_50(ii,1))==0
            S.trial_50_amp_firstpeak(ii) = nanmax(R.trial_mov_50(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
            S.trial_50_AUC_firstpeak(ii) = nansum(R.trial_mov_50(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
        end
    end
    S.trial_50_amp_secondpeak =[];
    S.trial_50_AUC_secondpeak =[];
    for ii=1:size(R.trial_mov_50,1)
        if isnan(R.trial_mov_50(ii,1))==0
            S.trial_50_amp_secondpeak(ii) = nanmax(R.trial_mov_50(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
            S.trial_50_AUC_secondpeak(ii) = nansum(R.trial_mov_50(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
        end
    end
    S.trial_50_amp =[];
    S.trial_50_AUC =[];
    for ii=1:size(R.trial_mov_50,1)
        if isnan(R.trial_mov_50(ii,1))==0
            S.trial_50_amp(ii) = nanmax(R.trial_mov_50(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
            S.trial_50_AUC(ii) = nansum(R.trial_mov_50(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
        end
    end

    %% Mov75
    S.trial_75_amp_firstpeak =NaN(1,size(R.trial_mov_75,1));
    S.trial_75_AUC_firstpeak =NaN(1,size(R.trial_mov_75,1));
    for ii=1:size(R.trial_mov_75,1)
        if isnan(R.trial_mov_75(ii,1))==0
            S.trial_75_amp_firstpeak(ii) = nanmax(R.trial_mov_75(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
            S.trial_75_AUC_firstpeak(ii) = nansum(R.trial_mov_75(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
        end
    end
    S.trial_75_amp_secondpeak =[];
    S.trial_75_AUC_secondpeak =[];
    for ii=1:size(R.trial_mov_75,1)
        if isnan(R.trial_mov_75(ii,1))==0
            S.trial_75_amp_secondpeak(ii) = nanmax(R.trial_mov_75(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
            S.trial_75_AUC_secondpeak(ii) = nansum(R.trial_mov_75(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
        end
    end
    S.trial_75_amp =[];
    S.trial_75_AUC =[];
    for ii=1:size(R.trial_mov_75,1)
        if isnan(R.trial_mov_75(ii,1))==0
            S.trial_75_amp(ii) = nanmax(R.trial_mov_75(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
            S.trial_75_AUC(ii) = nansum(R.trial_mov_75(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
        end
    end

    %% Mov100
    S.trial_100_amp_firstpeak =NaN(1,size(R.trial_mov_100,1));
    S.trial_100_AUC_firstpeak =NaN(1,size(R.trial_mov_100,1));
    for ii=1:size(R.trial_mov_100,1)
        if isnan(R.trial_mov_100(ii,1))==0
            S.trial_100_amp_firstpeak(ii) = nanmax(R.trial_mov_100(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
            S.trial_100_AUC_firstpeak(ii) = nansum(R.trial_mov_100(ii,round(0.5*P.framerate):round(0.65*P.framerate)));
        end
    end
    S.trial_100_amp_secondpeak =[];
    S.trial_100_AUC_secondpeak =[];
    for ii=1:size(R.trial_mov_100,1)
        if isnan(R.trial_mov_100(ii,1))==0
            S.trial_100_amp_secondpeak(ii) = nanmax(R.trial_mov_100(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
            S.trial_100_AUC_secondpeak(ii) = nansum(R.trial_mov_100(ii,round(0.65*P.framerate):round(0.8*P.framerate)));
        end
    end
    S.trial_100_amp =[];
    S.trial_100_AUC =[];
    for ii=1:size(R.trial_mov_100,1)
        if isnan(R.trial_mov_100(ii,1))==0
            S.trial_100_amp(ii) = nanmax(R.trial_mov_100(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
            S.trial_100_AUC(ii) = nansum(R.trial_mov_100(ii,round(0.5*P.framerate):round(0.8*P.framerate)));
        end
    end

    try
        S.trial_US_amp_firstpeak_avg = nanmean(S.trial_US_amp_firstpeak);
        S.trial_US_amp_secondpeak_avg = nanmean(S.trial_US_amp_secondpeak);
        S.trial_US_AUC_firstpeak_avg = nanmean(S.trial_US_AUC_firstpeak);
        S.trial_US_AUC_secondpeak_avg = nanmean(S.trial_US_AUC_secondpeak);
        S.trial_US_amp_avg = nanmean(S.trial_US_amp);
        S.trial_US_AUC_avg = nanmean(S.trial_US_AUC);
    end

    S.trial_0_amp_firstpeak_avg = nanmean(S.trial_0_amp_firstpeak);
    S.trial_0_amp_secondpeak_avg = nanmean(S.trial_0_amp_secondpeak);
    S.trial_0_AUC_firstpeak_avg = nanmean(S.trial_0_AUC_firstpeak);
    S.trial_0_AUC_secondpeak_avg = nanmean(S.trial_0_AUC_secondpeak);
    S.trial_0_amp_avg = nanmean(S.trial_0_amp);
    S.trial_0_AUC_avg = nanmean(S.trial_0_AUC);

    S.trial_25_amp_firstpeak_avg = nanmean(S.trial_25_amp_firstpeak);
    S.trial_25_amp_secondpeak_avg = nanmean(S.trial_25_amp_secondpeak);
    S.trial_25_AUC_firstpeak_avg = nanmean(S.trial_25_AUC_firstpeak);
    S.trial_25_AUC_secondpeak_avg = nanmean(S.trial_25_AUC_secondpeak);
    S.trial_25_amp_avg = nanmean(S.trial_25_amp);
    S.trial_25_AUC_avg = nanmean(S.trial_25_AUC);

    S.trial_50_amp_firstpeak_avg = nanmean(S.trial_50_amp_firstpeak);
    S.trial_50_amp_secondpeak_avg = nanmean(S.trial_50_amp_secondpeak);
    S.trial_50_AUC_firstpeak_avg = nanmean(S.trial_50_AUC_firstpeak);
    S.trial_50_AUC_secondpeak_avg = nanmean(S.trial_50_AUC_secondpeak);
    S.trial_50_amp_avg = nanmean(S.trial_50_amp);
    S.trial_50_AUC_avg = nanmean(S.trial_50_AUC);

    S.trial_75_amp_firstpeak_avg = nanmean(S.trial_75_amp_firstpeak);
    S.trial_75_amp_secondpeak_avg = nanmean(S.trial_75_amp_secondpeak);
    S.trial_75_AUC_firstpeak_avg = nanmean(S.trial_75_AUC_firstpeak);
    S.trial_75_AUC_secondpeak_avg = nanmean(S.trial_75_AUC_secondpeak);
    S.trial_75_amp_avg = nanmean(S.trial_75_amp);
    S.trial_75_AUC_avg = nanmean(S.trial_75_AUC);

    S.trial_100_amp_firstpeak_avg = nanmean(S.trial_100_amp_firstpeak);
    S.trial_100_amp_secondpeak_avg = nanmean(S.trial_100_amp_secondpeak);
    S.trial_100_AUC_firstpeak_avg = nanmean(S.trial_100_AUC_firstpeak);
    S.trial_100_AUC_secondpeak_avg = nanmean(S.trial_100_AUC_secondpeak);
    S.trial_100_amp_avg = nanmean(S.trial_100_amp);
    S.trial_100_AUC_avg = nanmean(S.trial_100_AUC);

    if zz>6
        S.excel = [S.trial_US_amp_firstpeak_avg S.trial_0_amp_firstpeak_avg S.trial_25_amp_firstpeak_avg S.trial_50_amp_firstpeak_avg S.trial_75_amp_firstpeak_avg S.trial_100_amp_firstpeak_avg...
            S.trial_US_amp_secondpeak_avg S.trial_0_amp_secondpeak_avg S.trial_25_amp_secondpeak_avg S.trial_50_amp_secondpeak_avg S.trial_75_amp_secondpeak_avg S.trial_100_amp_secondpeak_avg...
            S.trial_US_AUC_firstpeak_avg S.trial_0_AUC_firstpeak_avg S.trial_25_AUC_firstpeak_avg S.trial_50_AUC_firstpeak_avg S.trial_75_AUC_firstpeak_avg S.trial_100_AUC_firstpeak_avg...
            S.trial_US_AUC_secondpeak_avg S.trial_0_AUC_secondpeak_avg S.trial_25_AUC_secondpeak_avg S.trial_50_AUC_secondpeak_avg S.trial_75_AUC_secondpeak_avg S.trial_100_AUC_secondpeak_avg...
            S.trial_US_amp_avg S.trial_0_amp_avg S.trial_25_amp_avg S.trial_50_amp_avg S.trial_75_amp_avg S.trial_100_amp_avg...
            S.trial_US_AUC_avg S.trial_0_AUC_avg S.trial_25_AUC_avg S.trial_50_AUC_avg S.trial_75_AUC_avg S.trial_100_AUC_avg];
    elseif zz<6
        S.excel = [S.trial_0_amp_firstpeak_avg S.trial_25_amp_firstpeak_avg S.trial_50_amp_firstpeak_avg S.trial_75_amp_firstpeak_avg S.trial_100_amp_firstpeak_avg...
            S.trial_0_amp_secondpeak_avg S.trial_25_amp_secondpeak_avg S.trial_50_amp_secondpeak_avg S.trial_75_amp_secondpeak_avg S.trial_100_amp_secondpeak_avg...
            S.trial_0_AUC_firstpeak_avg S.trial_25_AUC_firstpeak_avg S.trial_50_AUC_firstpeak_avg S.trial_75_AUC_firstpeak_avg S.trial_100_AUC_firstpeak_avg...
            S.trial_0_AUC_secondpeak_avg S.trial_25_AUC_secondpeak_avg S.trial_50_AUC_secondpeak_avg S.trial_75_AUC_secondpeak_avg S.trial_100_AUC_secondpeak_avg...
            S.trial_0_amp_avg S.trial_25_amp_avg S.trial_50_amp_avg S.trial_75_amp_avg S.trial_100_amp_avg...
            S.trial_0_AUC_avg S.trial_25_AUC_avg S.trial_50_AUC_avg S.trial_75_AUC_avg S.trial_100_AUC_avg];
    end


    %% Save the data
    cd('')
    P.savename = sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID);
    save(P.savename,'P','S','R',"-v7.3");

    % save(P.savename,'R',"-v7.3");

end



