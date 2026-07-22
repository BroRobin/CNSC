%% Analysis of whole-body movements
% This script is used to analyze camera recordings from mice conditioned or
% pseudo-conditioned to quantify whole-body movements. Specifically, it
% analyses videos acquired at day 1 and day 10 of (pseudo-)conditioning.

% (c) R. Broersen, Erasmus MC, 2023

clear all; close all

for zz=11 % Define which movie to analyze
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
        P.peakheight=3500;

    elseif zz==12
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1012_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1012_D2';
        P.peakheight=3000;

    elseif zz==13
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1013_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1013_D2';
        P.peakheight=4000;

    elseif zz==14
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1014_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1014_D2';
        P.peakheight=1*10^4;

    elseif zz==15
        P.filepath = ['Y:\Data\CN-SC_eyemov\Wholebody\videos\' 'wholebody_1015_D2.avi'];
        P.startFrame = 1;
        P.mouseID = '1015_D2';
        P.peakheight=2000;
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

    % Save figure
    figname = sprintf('%s_OptoStim.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_OptoStim.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_OptoStim.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Convert timings to timestamps

    idx_CS_sum_diff = diff(idx_CS_sum_norm_filt);
    [pks P.trial_timestamps] = findpeaks(idx_CS_sum_diff,'MinPeakHeight',P.peakheight);


    if zz==1
        %         P.trial_timestamps(pks>(1.5*10^4))=[];
        P.trial_timestamps = P.trial_timestamps([1:65 75:end]);
    elseif zz==2
        P.trial_timestamps = P.trial_timestamps([1:75 78:end]);
    elseif zz==3
        P.trial_timestamps(pks>(3*10^4))=[];
        P.trial_timestamps = P.trial_timestamps([1:33 35:43 45 47:50 52:53 55:61 63:69 71:74 76:87 89:95 97:105 107:109 111:118 120:133 135:139]);
    elseif zz==4
        %          P.trial_timestamps = P.trial_timestamps([1:20 22:61 63:117 168 169 170 ]);
    elseif zz==5
        P.trial_timestamps(pks>(3*10^4))=[];
        P.trial_timestamps = P.trial_timestamps([1:15 17:73 75:end]);
    elseif zz==6
        P.trial_timestamps(pks>(1.5*10^4))=[];
        P.trial_timestamps = P.trial_timestamps([5:27 29:46 52:86 89:91 95 100 101 104:106 113:122]);
    elseif zz==11
        P.trial_timestamps = P.trial_timestamps([1:65 67:93 98:end]);
    elseif zz==12
        P.trial_timestamps = P.trial_timestamps([1:66 68:93 98:end]);
    elseif zz==13
        P.trial_timestamps = P.trial_timestamps([1:17 19 22:end]);
    end

    if zz<7
        if size(P.trial_timestamps,1)~=125
            disp('error in detecting timestamps opto');
            figure; plot(idx_CS_sum_diff,'b'); hold on;plot(P.trial_timestamps,idx_CS_sum_diff(P.trial_timestamps),'ro')
            pause;
        end
    elseif zz>6
        if size(P.trial_timestamps,1)~=150
            disp('error in detecting timestamps opto');
            figure; plot(idx_CS_sum_diff,'b'); hold on;plot(P.trial_timestamps,idx_CS_sum_diff(P.trial_timestamps),'ro')
            pause;
        end
    end
    %% Save the data
    cd('')
    P.savename = sprintf('%s_data.mat',P.mouseID);
    save(P.savename,'P','R',"-v7.3");
end
