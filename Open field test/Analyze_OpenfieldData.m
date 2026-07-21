%% Analyze_OpenfieldData
clear all;
close all;

for analyse =2 %1=1000ms pulse auto, 2=%1000ms pulse manual during locomotion
    cd() %Path to analysis files

    if analyse ==1
        sortedTrials = NaN(100,1);
        loadedTrials = NaN(100,1);
        random_trials = [1;2;3;4;6;7;9;10;11;12;13;14;16;17;18;20;21;22;23;24;26;27;28;29;30;32;33;34;35;36;37;38;39;40;41;42;44;46;48;50;51;52;53;54;55;56;57;58;59;60;61;62;63;65;66;67;68;69;70;71];

        movieFilename = {
            '20260305_157187_1000mspulse_auto.avi'
            '20260305_157189_1000mspulse_auto.avi'
            '20260305_157191_1000mspulse_auto.avi'
            '20260305_157192_1000mspulse_auto.avi'
            '20260305_157193_1000mspulse_auto.avi'
            '20260305_157194_1000mspulse_auto.avi'
            '20260305_157195_1000mspulse_auto.avi'
            '20260305_157196_1000mspulse_auto.avi'
            };



        positionFilename = {
            '20260305_157187_1000mspulse_auto_resultQuantifications.mat'
            '20260305_157189_1000mspulse_auto_resultQuantifications.mat'
            '20260305_157191_1000mspulse_auto_resultQuantifications.mat'
            '20260305_157192_1000mspulse_auto_resultQuantifications.mat'
            '20260305_157193_1000mspulse_auto_resultQuantifications.mat'
            '20260305_157194_1000mspulse_auto_resultQuantifications.mat'
            '20260305_157195_1000mspulse_auto_resultQuantifications.mat'
            '20260305_157196_1000mspulse_auto_resultQuantifications.mat'
            };

        [C,ia,ic] = unique(positionFilename);
        a_counts = accumarray(ic,1);

        startrecordingFilename = {'20260305_startrecording_157187_1000mspulse_auto.csv'
            '20260305_startrecording_157189_1000mspulse_auto.csv'
            '20260305_startrecording_157191_1000mspulse_auto.csv'
            '20260305_startrecording_157192_1000mspulse_auto.csv'
            '20260305_startrecording_157193_1000mspulse_auto.csv'
            '20260305_startrecording_157194_1000mspulse_auto.csv'
            '20260305_startrecording_157195_1000mspulse_auto.csv'
            '20260305_startrecording_157196_1000mspulse_auto.csv'
            };

        stimtimesFilename = {'20260305_stimtimes_157187_1000mspulse_auto.csv'
            '20260305_stimtimes_157189_1000mspulse_auto.csv'
            '20260305_stimtimes_157191_1000mspulse_auto.csv'
            '20260305_stimtimes_157192_1000mspulse_auto.csv'
            '20260305_stimtimes_157193_1000mspulse_auto.csv'
            '20260305_stimtimes_157194_1000mspulse_auto.csv'
            '20260305_stimtimes_157195_1000mspulse_auto.csv'
            '20260305_stimtimes_157196_1000mspulse_auto.csv'
            };

    elseif analyse ==2
        sortedTrials = NaN(100,1);
        loadedTrials = NaN(100,1);
        random_trials = [1;2;3;4;6;7;9;10;11;12;13;14;16;17;18;20;21;22;23;24;26;27;28;29;30;32;33;34;35;36;37;38;39;40;41;42;44;46;48;50;51;52;53;54;55;56;57;58;59;60;61;62;63;65;66;67;68;69;70;71];

        movieFilename = {
            '20260305_157187_1000ms20Hzpulse_manual.avi'
            '20260305_157189_1000ms20Hzpulse_manual.avi'
            '20260305_157191_1000ms20Hzpulse_manual.avi'
            '20260305_157192_1000ms20Hzpulse_manual.avi'
            '20260305_157193_1000ms20Hzpulse_manual.avi'
            '20260305_157194_1000ms20Hzpulse_manual.avi'
            '20260305_157195_1000ms20Hzpulse_manual.avi'
            '20260305_157196_1000ms20Hzpulse_manual.avi'
            };



        positionFilename = {
            '20260305_157187_1000ms20Hzpulse_manual_resultQuantifications.mat'
            '20260305_157189_1000ms20Hzpulse_manual_resultQuantifications.mat'
            '20260305_157191_1000ms20Hzpulse_manual_resultQuantifications.mat'
            '20260305_157192_1000ms20Hzpulse_manual_resultQuantifications.mat'
            '20260305_157193_1000ms20Hzpulse_manual_resultQuantifications.mat'
            '20260305_157194_1000ms20Hzpulse_manual_resultQuantifications.mat'
            '20260305_157195_1000ms20Hzpulse_manual_resultQuantifications.mat'
            '20260305_157196_1000ms20Hzpulse_manual_resultQuantifications.mat'
            };

        [C,ia,ic] = unique(positionFilename);
        a_counts = accumarray(ic,1);

        startrecordingFilename = {'20260305_startrecording_157187_1000ms20Hzpulse_manual.csv'
            '20260305_startrecording_157189_1000ms20Hzpulse_manual.csv'
            '20260305_startrecording_157191_1000ms20Hzpulse_manual.csv'
            '20260305_startrecording_157192_1000ms20Hzpulse_manual.csv'
            '20260305_startrecording_157193_1000ms20Hzpulse_manual.csv'
            '20260305_startrecording_157194_1000ms20Hzpulse_manual.csv'
            '20260305_startrecording_157195_1000ms20Hzpulse_manual.csv'
            '20260305_startrecording_157196_1000ms20Hzpulse_manual.csv'
            };

        stimtimesFilename = {'20260305_stimtimes_157187_1000ms20Hzpulse_manual.csv'
            '20260305_stimtimes_157189_1000ms20Hzpulse_manual.csv'
            '20260305_stimtimes_157191_1000ms20Hzpulse_manual.csv'
            '20260305_stimtimes_157192_1000ms20Hzpulse_manual.csv'
            '20260305_stimtimes_157193_1000ms20Hzpulse_manual.csv'
            '20260305_stimtimes_157194_1000ms20Hzpulse_manual.csv'
            '20260305_stimtimes_157195_1000ms20Hzpulse_manual.csv'
            '20260305_stimtimes_157196_1000ms20Hzpulse_manual.csv'
            };

    end


    savefig=1;
    savefile=1;

    for ii = 1:size(positionFilename,1)
        %     ii = 8
        clearvars -except ii S analyse movieFilename positionFilename startrecordingFilename stimtimesFilename savefig savefile

        cd() %Path to analysis files

        % Load the movies to determine the timepoints of stimulation

        disp(fprintf('Opening the video: %s', [cd '\' char(movieFilename(ii))]));

        P.vidObj = VideoReader([cd '\' char(movieFilename(ii))]);

        P.nFrames=P.vidObj.NumberOfFrames;
        P.framerate = P.vidObj.FrameRate;
        P.M=P.vidObj.Height; % no of rows
        P.N=P.vidObj.Width; % no of columns
        P.nLoadFrames = [10000];
        P.nLoadRounds = ceil(P.nFrames/P.nLoadFrames);
        idx_sum = [];
        idx_CS_sum = [];

        if exist(sprintf('%s_ROI.mat',char(movieFilename(ii))))
            load(sprintf('%s_ROI.mat',char(movieFilename(ii))))
        else
            %     for ii = 2:P.nLoadRounds
            for jj = 1:P.nLoadRounds
                % for ii=1
                jj
                video=zeros(P.M,P.N,P.nLoadFrames,'uint8'); % creating a video 3d matrix
                if jj==1
                    P.loadFrames = [1 jj*P.nLoadFrames];
                elseif jj>1 && jj<P.nLoadRounds
                    P.loadFrames = [jj*P.nLoadFrames-(P.nLoadFrames-1) jj*P.nLoadFrames];
                elseif jj==P.nLoadRounds
                    P.loadFrames = [jj*P.nLoadFrames-(P.nLoadFrames-1) P.nFrames];
                end
                counter=0;
                for k=P.loadFrames(1):P.loadFrames(2)
                    k
                    counter=counter+1;
                    im= read(P.vidObj,k);
                    im=im(:,:,1);           % all three layers will have same image

                    if k ==1 && jj==1
                        if exist(sprintf('%s_ROI.mat',char(movieFilename(ii))))
                            load(sprintf('%s_ROI.mat',char(movieFilename(ii))))
                        else
                            figure; imagesc(im)
                            CS_coords = imfreehand(); % Draw a ROI around the optic fiber cable
                            pause;
                            maskImg = CS_coords.createMask;
                        end
                    end

                    % Calculate the sum of the CS ROI
                    idx_CS_sum = [idx_CS_sum; sum(im(maskImg))];

                    % Mask out the ROI around the optic light
                    im(maskImg)=0;
                    video(:,:,counter)=im;
                end

                % Calculate the difference of the whole video
                idx = abs(diff(video,1,3));
                idx_sum = [idx_sum; NaN; permute(nansum(nansum(idx)),[3,1,2])];

            end
            R.rawCS = idx_CS_sum;
        end
        idx_CS_sum=R.rawCS;


        %% Filter the opto trace


        if ii==1 && analyse==1
            idx_CS_sum(idx_CS_sum<(7.5*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end
            %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);

        elseif ii==2 && analyse==1
            idx_CS_sum(idx_CS_sum<(5*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end
            %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);
        elseif ii==3 && analyse==1
            idx_CS_sum(idx_CS_sum<(8*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end
            %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);

        elseif ii==4 && analyse==1
            idx_CS_sum(idx_CS_sum<(8*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end
            %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);

        elseif ii==5 && analyse==1
            idx_CS_sum(idx_CS_sum<(3*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end

        elseif ii==6 && analyse==1
            idx_CS_sum(idx_CS_sum<(8*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end
            %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);

        elseif ii==7 && analyse==1
            idx_CS_sum(idx_CS_sum<(6.4*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end
            %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);

        elseif ii==8 && analyse==1
            idx_CS_sum(idx_CS_sum<(10.5*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:50
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(4*60)))=NaN;
            end
            %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);

        elseif ii==1 && analyse==2
            idx_CS_sum(idx_CS_sum<(10.5*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:30
                result.stimtimes_ON(kk,1) = find(idx>(0.5*10^5),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end

        elseif ii==2 && analyse==2
            idx_CS_sum(idx_CS_sum<(6*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:33
                result.stimtimes_ON(kk,1) = find(idx>(0.5*10^5),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end
            %             [pks result.stimtimes_ON] = findpeaks(idx_CS_sum_diff,'MinPeakDistance',(2*P.framerate));
            result.stimtimes_ON([23 24 29])=[];
        elseif ii==3 && analyse==2
            idx_CS_sum(idx_CS_sum<(1.25*10^5))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:30
                result.stimtimes_ON(kk,1) = find(idx>(0.5*10^5),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end
            %         result.stimtimes_ON()=[];

        elseif ii==4 && analyse==2
            idx_CS_sum(idx_CS_sum<(6*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:30
                result.stimtimes_ON(kk,1) = find(idx>(0.5*10^5),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end
            %         result.stimtimes_ON()=[];

        elseif ii==5 && analyse==2
            idx_CS_sum(idx_CS_sum<(5*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:30
                result.stimtimes_ON(kk,1) = find(idx>(2*10^4),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end
            %             [pks result.stimtimes_ON] = findpeaks(idx_CS_sum_diff,'MinPeakDistance',(4*P.framerate));
            %                     result.stimtimes_ON = result.stimtimes_ON([1:30]);
        elseif ii==6 && analyse==2
            idx_CS_sum(idx_CS_sum<(8*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:30
                result.stimtimes_ON(kk,1) = find(idx>(0.5*10^5),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end
            %                     result.stimtimes_ON = result.stimtimes_ON([1:30]);
        elseif ii==7 && analyse==2
            idx_CS_sum(idx_CS_sum<(9*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:30
                result.stimtimes_ON(kk,1) = find(idx>(0.5*10^5),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end
            %                     result.stimtimes_ON = result.stimtimes_ON([1:30]);

        elseif ii==8 && analyse==2
            idx_CS_sum(idx_CS_sum<(8*10^4))= 0;
            idx_CS_sum_diff = diff(idx_CS_sum);
            idx = idx_CS_sum_diff;
            for kk=1:30
                result.stimtimes_ON(kk,1) = find(idx>(0.5*10^5),1);
                idx(1:(result.stimtimes_ON(kk)+(2*60)))=NaN;
            end
        end

        P.trial_timestamps=result.stimtimes_ON;
        sprintf('Number of stimuli: %.f',size(result.stimtimes_ON,1))
        figure; plot(idx_CS_sum,'b'); hold on;plot(result.stimtimes_ON,idx_CS_sum(result.stimtimes_ON),'ro')
        %             pause;

        cd()
        % Save figure
        if savefig==1
            figname = sprintf('%s_OptoStim.fig',char(movieFilename(ii)))
            saveas(gcf,figname,'fig');
            figname = sprintf('%s_OptoStim.pdf',char(movieFilename(ii)))
            print('-dpdf','-vector','-loose',figname)
            figname = sprintf('%s_OptoStim.jpg',char(movieFilename(ii)))
            saveas(gcf,figname,'jpg')



        end
        if savefile==1
            save(sprintf('%s_ROI.mat',char(movieFilename(ii))),"maskImg","R","P","result");
        end
        P.trial_timestamps=result.stimtimes_ON;
        sprintf('Number of stimuli: %.f',size(result.stimtimes_ON,1))
        %         figure; plot(idx_CS_sum,'b'); hold on;plot(result.stimtimes_ON,idx_CS_sum(result.stimtimes_ON),'ro');
        %         pause;
        % Load the quantification mat file
        try
            load(char(positionFilename(ii)))
            result.stimtimes_ON=P.trial_timestamps;
        catch
            ii
            disp('Could not load:')
            char(positionFilename(ii))
            %         pause;
        end

        % filter the speed trace
        result.filt_speed_gauss = [NaN; gfilt(result.filt_speed(2:end),60,0.0187)]; % Gaussian filter


        %% Divide the trace in epochs based on start time
        result.speed_epochs=[];
        for jj=1:size(result.stimtimes_ON,1)
            result.speed_epochs(jj,:)=result.filt_speed_gauss(result.stimtimes_ON(jj)-(0.25*60):result.stimtimes_ON(jj)+(2*60))-nanmean(result.filt_speed_gauss(result.stimtimes_ON(jj)-(0.25*60):result.stimtimes_ON(jj)));

            result.speed_max_100ms(jj) = nanmax(result.speed_epochs(jj,((0.25*60):(0.35*60))));
            result.speed_area_100ms(jj) = nansum(result.speed_epochs(jj,((0.25*60):(0.35*60))));
            result.speed_average_100ms(jj) = nanmean(result.speed_epochs(jj,((0.25*60):(0.35*60))));

            result.speed_max_250ms(jj) = nanmax(result.speed_epochs(jj,((0.25*60):(0.5*60))));
            result.speed_area_250ms(jj) = nansum(result.speed_epochs(jj,((0.25*60):(0.5*60))));
            result.speed_average_250ms(jj) = nanmean(result.speed_epochs(jj,((0.25*60):(0.5*60))));

            result.speed_max_500ms(jj) = nanmax(result.speed_epochs(jj,((0.25*60):(0.75*60))));
            result.speed_area_500ms(jj) = nansum(result.speed_epochs(jj,((0.25*60):(0.75*60))));
            result.speed_average_500ms(jj) = nanmean(result.speed_epochs(jj,((0.25*60):(0.75*60))));

            result.speed_max_1s(jj) = nanmax(result.speed_epochs(jj,((0.25*60):(1.25*60))));
            result.speed_area_1s(jj) = nansum(result.speed_epochs(jj,((0.25*60):(1.25*60))));
            result.speed_average_1s(jj) = nanmean(result.speed_epochs(jj,((0.25*60):(1.25*60))));
        end
        result.speed_avg = nanmean(result.speed_epochs);
        result.speed_sem = nanstd(result.speed_epochs)/sqrt(size(result.speed_epochs,1));


        result.distance_epochs=[];
        for jj=1:size(result.stimtimes_ON,1)
            result.distance_epochs(jj,:)=result.distance(result.stimtimes_ON(jj)-(0.25*60):result.stimtimes_ON(jj)+(2*60))-result.distance(result.stimtimes_ON(jj));
        end
        result.distance_avg = nanmean(result.distance_epochs);
        result.distance_sem = nanstd(result.distance_epochs)/sqrt(size(result.distance_epochs,1));

        figure; subplot(2,1,1); hold on; shadedErrorBar(linspace(-0.25,2,size(result.speed_avg,2)),result.speed_avg, result.speed_sem);
        ylim('auto')
        line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
        line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
        line([1 1],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
        xlim([-0.25 2]);
        title(sprintf(positionFilename{ii}))
        subplot(2,1,2); hold on; shadedErrorBar(linspace(-0.25,2,size(result.distance_avg,2)),result.distance_avg, result.distance_sem);
        line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
        line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
        line([1 1],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
        xlim([-0.25 2]);
        %     pause;

        if savefig==1
            figname = sprintf('%s_trialAVG.fig',char(movieFilename(ii)))
            saveas(gcf,figname,'fig');
            figname = sprintf('%s_trialAVG.pdf',char(movieFilename(ii)))
            print('-dpdf','-vector','-loose',figname)
            figname = sprintf('%s_trialAVG.jpg',char(movieFilename(ii)))
            saveas(gcf,figname,'jpg')
            %     pause;
        end
        if savefile==1
            save(sprintf('%s_output.mat',char(movieFilename(ii))),"R","P","result");
        end

        S.speed_avg(ii,:)=result.speed_avg;
        S.distance_avg(ii,:)=result.distance_avg;

        S.speed_max_100ms(ii) = nanmedian(result.speed_max_100ms);
        S.speed_area_100ms(ii) = nanmedian(result.speed_area_100ms);
        S.speed_average_100ms(ii) = nanmedian(result.speed_average_100ms);

        S.speed_max_250ms(ii) = nanmedian(result.speed_max_250ms);
        S.speed_area_250ms(ii) = nanmedian(result.speed_area_250ms);
        S.speed_average_250ms(ii) = nanmedian(result.speed_average_250ms);

        S.speed_max_500ms(ii) = nanmedian(result.speed_max_500ms);
        S.speed_area_500ms(ii) = nanmedian(result.speed_area_500ms);
        S.speed_average_500ms(ii) = nanmedian(result.speed_average_500ms);

        S.speed_max_1s(ii) = nanmedian(result.speed_max_1s);
        S.speed_area_1s(ii) = nanmedian(result.speed_area_1s);
        S.speed_average_1s(ii) = nanmedian(result.speed_average_1s);
        close all;

    end

    % end

    %% Groupanalysis
    cd()
    S.speed_avg_opto = nanmean(S.speed_avg([3 6 7 8],:));
    S.speed_sem_opto = nanstd(S.speed_avg([3 6 7 8],:))/sqrt(4);
    S.speed_distance_avg_opto = nanmean(S.distance_avg([3 6 7 8],:));
    S.speed_distance_sem_opto = nanstd(S.distance_avg([3 6 7 8],:))/sqrt(4);

    S.speed_avg_ctr= nanmean(S.speed_avg([1 2 4 5],:));
    S.speed_sem_ctr= nanstd(S.speed_avg([1 2 4 5],:))/sqrt(4);
    S.speed_distance_avg_ctr = nanmean(S.distance_avg([1 2 4 5],:));
    S.speed_distance_sem_ctr = nanstd(S.distance_avg([1 2 4 5],:))/sqrt(4);

    figure; hold on; shadedErrorBar(linspace(-0.25,2,size(S.speed_avg_ctr,2)),S.speed_avg_ctr, S.speed_sem_ctr,'k'); shadedErrorBar(linspace(-0.25,2,size(S.speed_avg_opto,2)),S.speed_avg_opto, S.speed_sem_opto,'b');
    ylim('auto')
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
    line([1 1],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
    xlim([-0.25 1.75]);
    xticks([-0.25:0.25:1.75]);

    S.speed_max_100ms_opto = S.speed_max_100ms([3 6 7 8])';
    S.speed_area_100ms_opto = S.speed_area_100ms([3 6 7 8])';
    S.speed_average_100ms_opto = S.speed_average_100ms([3 6 7 8])';

    S.speed_max_100ms_ctr = S.speed_max_100ms([1 2 4 5])';
    S.speed_area_100ms_ctr = S.speed_area_100ms([1 2 4 5])';
    S.speed_average_100ms_ctr = S.speed_average_100ms([1 2 4 5])';

    S.speed_max_250ms_opto = S.speed_max_250ms([3 6 7 8])';
    S.speed_area_250ms_opto = S.speed_area_250ms([3 6 7 8])';
    S.speed_average_250ms_opto = S.speed_average_250ms([3 6 7 8])';

    S.speed_max_250ms_ctr = S.speed_max_250ms([1 2 4 5])';
    S.speed_area_250ms_ctr = S.speed_area_250ms([1 2 4 5])';
    S.speed_average_250ms_ctr = S.speed_average_250ms([1 2 4 5])';

    S.speed_max_500ms_opto = S.speed_max_500ms([3 6 7 8])';
    S.speed_area_500ms_opto = S.speed_area_500ms([3 6 7 8])';
    S.speed_average_500ms_opto = S.speed_average_500ms([3 6 7 8])';

    S.speed_max_500ms_ctr = S.speed_max_500ms([1 2 4 5])';
    S.speed_area_500ms_ctr = S.speed_area_500ms([1 2 4 5])';
    S.speed_average_500ms_ctr = S.speed_average_500ms([1 2 4 5])';


    S.speed_max_1s_opto = S.speed_max_1s([3 6 7 8])';
    S.speed_area_1s_opto = S.speed_area_1s([3 6 7 8])';
    S.speed_average_1s_opto = S.speed_average_1s([3 6 7 8])';

    S.speed_max_1s_ctr = S.speed_max_1s([1 2 4 5])';
    S.speed_area_1s_ctr = S.speed_area_1s([1 2 4 5])';
    S.speed_average_1s_ctr = S.speed_average_1s([1 2 4 5])';




    ylabel('Norm movement speed (cm/s)')
    xlabel('Time (s)')

    if savefig==1 && analyse==1
        figname = sprintf('%s_groupAVG_auto1s.fig',char(movieFilename(ii)))
        saveas(gcf,figname,'fig');
        figname = sprintf('%s_groupAVG_auto1s.pdf',char(movieFilename(ii)))
        print('-dpdf','-vector','-loose',figname)
        figname = sprintf('%s_groupAVG_auto1s.jpg',char(movieFilename(ii)))
        saveas(gcf,figname,'jpg')

    elseif savefig==1 && analyse==2
        figname = sprintf('%s_groupAVG_manual20Hz.fig',char(movieFilename(ii)))
        saveas(gcf,figname,'fig');
        figname = sprintf('%s_groupAVG_manual20Hz.pdf',char(movieFilename(ii)))
        print('-dpdf','-vector','-loose',figname)
        figname = sprintf('%s_groupAVG_manual20Hz.jpg',char(movieFilename(ii)))
        saveas(gcf,figname,'jpg')

    end

    figure; hold on; shadedErrorBar(linspace(-0.25,2,size(S.speed_distance_avg_ctr,2)),S.speed_distance_avg_ctr, S.speed_distance_sem_ctr,'k'); shadedErrorBar(linspace(-0.25,2,size(S.speed_distance_avg_opto,2)),S.speed_distance_avg_opto, S.speed_distance_sem_opto,'b');
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
    line([1 1],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b','LineWidth',0.5);
    xlim([-0.25 1.75]);
    xticks([-0.25:0.25:1.75]);
    ylabel('Cum sum movement speed (arb. units)')
    xlabel('Time (s)')

    if savefig==1 && analyse==1
        figname = sprintf('%s_groupCumSum_auto1s.fig',char(movieFilename(ii)))
        saveas(gcf,figname,'fig');
        figname = sprintf('%s_groupCumSum_auto1s.pdf',char(movieFilename(ii)))
        print('-dpdf','-vector','-loose',figname)
        figname = sprintf('%s_groupCumSum_auto1s.jpg',char(movieFilename(ii)))
        saveas(gcf,figname,'jpg')

    elseif savefig==1 && analyse==2
        figname = sprintf('%s_groupCumSum_manual20Hz.fig',char(movieFilename(ii)))
        saveas(gcf,figname,'fig');
        figname = sprintf('%s_groupCumSum_manual20Hz.pdf',char(movieFilename(ii)))
        print('-dpdf','-vector','-loose',figname)
        figname = sprintf('%s_groupCumSum_manual20Hz.jpg',char(movieFilename(ii)))
        saveas(gcf,figname,'jpg')

    end

    if savefile==1 && analyse==1
        save(sprintf('%s_output_groupAVG_auto1s.mat',char(movieFilename(ii))),"S");
    elseif savefile==1 && analyse==2
        save(sprintf('%s_output_groupAVG_manual20Hz.mat',char(movieFilename(ii))),"S");
    end

end