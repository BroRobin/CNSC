%% Detect the stimulus and load the raw data

% (c) R. Broersen, Erasmus MC, 2023

clear all;

for zz=12 % Define which movie to analyze
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

    %% Load the movie per 10,000 frames
    P.vidObj = VideoReader(P.filepath);
    P.nFrames=P.vidObj.NumberOfFrames;
    P.framerate = P.vidObj.FrameRate;
    P.M=P.vidObj.Height; % no of rows
    P.N=P.vidObj.Width; % no of columns
    P.nLoadFrames = [10000];
    P.nLoadRounds = ceil(P.nFrames/P.nLoadFrames);
    idx_sum = [];
    idx_CS_sum = [];

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
                if exist(sprintf('%s_ROI.mat',P.mouseID))
                    load(sprintf('%s_ROI.mat',P.mouseID))
                else
                    figure; imagesc(im)
                    CS_coords = imfreehand(); % Draw a ROI around the optic fiber cable
                    pause;
                    maskImg = CS_coords.createMask;
                    cd('')
                    save(sprintf('%s_ROI.mat',P.mouseID),"maskImg");
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
        %                 for k=1:(size(video,3)-1)
        %                     idx = imabsdiff(video(:,:,k),video(:,:,k+1));
        %                     idx_sum = [idx_sum; NaN; nansum(nansum(idx))];
        %                 end
    end
    idx_sum = idx_sum(1:length(idx_CS_sum));
    %     idx_sum(idx_sum==nanmax(idx_sum)) = nanmedian(idx_sum); % Remove the highest datapoint

    R.rawMovement = idx_sum;
    R.rawCS = idx_CS_sum;

    figure; hold on; plot(R.rawMovement);
    figure; hold on; plot(R.rawCS);


    %% Filter the opto trace
    idx_CS_sum_norm_filt = gfilt(idx_CS_sum,P.vidObj.FrameRate,0.0075);
    figure; hold on; plot(idx_CS_sum,'k'); plot(idx_CS_sum_norm_filt,'r');

    cd('')

    % Save figure
    figname = sprintf('%s_OptoStim.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_OptoStim.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_OptoStim.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Convert timings to timestamps

    idx_CS_sum_diff = diff(idx_CS_sum_norm_filt);
    %     [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.2*10^4));

    if zz==1
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
        %         P.trial_timestamps = P.trial_timestamps([10:29 31:40 43:47 52 55:57 60:66 77 78 80 82]);
    elseif zz==2
                [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(2*10^4));
                P.trial_timestamps = P.trial_timestamps([1:50]);
    elseif zz==3
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:50]);
    elseif zz==4
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(1.6*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:50]);
    elseif zz==5
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    elseif zz==6
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    elseif zz==7
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(2*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    elseif zz==8
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    elseif zz==9
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    elseif zz==10
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(2*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    elseif zz==11
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff*-1,'MinPeakHeight',(1*10^4));
        P.trial_timestamps=P.trial_timestamps-6;
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    elseif zz==12
        [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',(0.4*10^4));
        %         P.trial_timestamps = P.trial_timestamps([1:5 11:23 25 26 28 32:61 65]);
    end

            figure; plot(idx_CS_sum_diff,'b'); hold on;plot(P.trial_timestamps,idx_CS_sum_diff(P.trial_timestamps),'ro')
    if size(P.trial_timestamps,1)~=50
        disp('error in detecting timestamps opto');
        pause;
    end

    %% Save the data
    cd('')
    P.savename = sprintf('%s_wholebody_data.mat',P.mouseID);
    save(P.savename,'P','R',"-v7.3");
end
