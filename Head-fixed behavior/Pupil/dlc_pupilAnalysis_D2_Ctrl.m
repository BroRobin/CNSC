%% Analyze CSV files to extract pupil movements and pupil size
clear all; close all

for zz=6
    clearvars -except zz
    close all;
    if zz==1
        cd('')
        P.mouseID = '1009_D2';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==2
        cd('')
        P.mouseID = '1010_D2';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==3
        cd('')
        P.mouseID = '1011_D2';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==4
        cd('')
        P.mouseID = '1013_D2';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter

    elseif zz==5
        cd('')
        P.mouseID = '1014_D2';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter

    elseif zz==6
        cd('')
        P.mouseID = '1015_D2';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    end

    %% Load and process the data
    P.movieList = dir('*.avi');
    P.movieList = string({P.movieList .name});
    P.movieID = repmat([1 2 3 4 5 6],1,25);
    P.fileList = dir('*.csv');
    P.fileList = string({P.fileList .name});

    S.pupmov_US=NaN(150,750);
    S.pupmov_US_opto0=NaN(150,750);
    S.pupmov_US_opto25=NaN(150,750);
    S.pupmov_US_opto50=NaN(150,750);
    S.pupmov_US_opto75=NaN(150,750);
    S.pupmov_US_opto100=NaN(150,750);

    S.pupdist_US=NaN(150,750);
    S.pupdist_US_opto0=NaN(150,750);
    S.pupdist_US_opto25=NaN(150,750);
    S.pupdist_US_opto50=NaN(150,750);
    S.pupdist_US_opto75=NaN(150,750);
    S.pupdist_US_opto100=NaN(150,750);

    S.pupdist_baseline_US=NaN(150,750);
    S.pupdist_baseline_US_opto0=NaN(150,750);
    S.pupdist_baseline_US_opto25=NaN(150,750);
    S.pupdist_baseline_US_opto50=NaN(150,750);
    S.pupdist_baseline_US_opto75=NaN(150,750);
    S.pupdist_baseline_US_opto100=NaN(150,750);



    R.pupmov_location_steps_X_avg_US=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_Y_avg_US=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_X_avg_opto0=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_Y_avg_opto0=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_X_avg_opto25=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_Y_avg_opto25=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_X_avg_opto50=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_Y_avg_opto50=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_X_avg_opto75=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_Y_avg_opto75=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_X_avg_opto100=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_Y_avg_opto100=NaN(size(P.fileList,2),11);
    % Compare the CSV files with the movie files. If present, logically
    % index. Then create the labellist.
    P.nameIdx=[];

    for nn=1:size(P.fileList,2)
        for bb=1:size(P.movieList,2)
            if isequal(P.fileList{nn}(1:27),P.movieList{bb}(1:27))==1
                P.nameIdx(nn,bb)=1;
            elseif isequal(P.fileList{nn}(1:27),P.movieList{bb}(1:27))==0
                P.nameIdx(nn,bb)=0;
            end
        end
    end
    P.nameIdx=sum(P.nameIdx);
    P.fileID = P.movieID(logical(P.nameIdx)); %create the list of movieIDs

    for xx=1:size(P.fileList,2) % loop throught the csv files
        if zz==1 && xx==11
            continue;
        elseif zz==6 && xx==139
                continue;
        end
        %             for xx=1:25 % loop throught the csv files
        sprintf('Processing file %.f of %.f',xx,size(P.fileList,2))
        P.filename = P.fileList(xx);
        data = readtable(P.filename);
        % figure; plot(data{:,3})
        P.fs = 320; %sampling frequency

        %         if zz==3 && xx==33 % Clip outlier trials
        %             data{204:219,:}=NaN;
        %         elseif zz==4 && xx==26
        %             data{551:569,:}=NaN;
        %         elseif zz==5 && xx==3
        %             continue;
        %         end

        %% Calculate the average distance between eyelid left and right over the whole trial in pixels
        R.eyelid_dist=[];

        for ii=1:size(data{:,1},1)
            R.eyelid_dist(ii)=sqrt((data{ii,5} - data{ii,2}).^2 + (data{ii,6} - data{ii,3}).^2);
        end

        %         figure; plot(R.eyelid_dist)

        R.eyelid_dist_mdn = median(R.eyelid_dist); % median euclidian distance eyelid left and right in pixels

        %% Calculate the pupil distance between opposing pupil pairs


        R.pupdist_up_down=[];
        R.pupdist_leftup_rightdown=[];
        R.pupdist_left_right=[];
        R.pupdist_leftdown_rightup=[];
        R.pupdist_mdn = [];

        for ii=1:size(data{:,1},1)
            R.pupdist_up_down(ii)=sqrt((data{ii,11} - data{ii,23}).^2 + (data{ii,12} - data{ii,24}).^2);
            R.pupdist_leftup_rightdown(ii)=sqrt((data{ii,14} - data{ii,26}).^2 + (data{ii,15} - data{ii,27}).^2);
            R.pupdist_left_right(ii)=sqrt((data{ii,17} - data{ii,29}).^2 + (data{ii,18} - data{ii,30}).^2);
            R.pupdist_leftdown_rightup(ii)=sqrt((data{ii,20} - data{ii,32}).^2 + (data{ii,21} - data{ii,33}).^2);
            R.pupdist_mdn(ii) = median([R.pupdist_up_down(ii),R.pupdist_leftup_rightdown(ii),R.pupdist_left_right(ii),R.pupdist_leftdown_rightup(ii)]);
        end

        %Filter out significant baseline variations or blinks
        idx_SD = nanstd(R.pupdist_up_down(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_up_down(1:round(0.5*P.fs)));
        if sum(R.pupdist_up_down(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupdist_up_down trial, baseline variation')
            R.pupdist_up_down(1:size(R.pupdist_up_down,2))=NaN;
        end

        idx_SD = nanstd(R.pupdist_leftup_rightdown(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_leftup_rightdown(1:round(0.5*P.fs)));
        if sum(R.pupdist_leftup_rightdown(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupdist_leftup_rightdown trial, baseline variation')
            R.pupdist_leftup_rightdown(1:size(R.pupdist_leftup_rightdown,2))=NaN;
        end

        idx_SD = nanstd(R.pupdist_left_right(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_left_right(1:round(0.5*P.fs)));
        if sum(R.pupdist_left_right(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupdist_left_right trial, baseline variation')
            R.pupdist_left_right(1:size(R.pupdist_left_right,2))=NaN;
        end

        idx_SD = nanstd(R.pupdist_leftdown_rightup(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_leftdown_rightup(1:round(0.5*P.fs)));
        if sum(R.pupdist_leftdown_rightup(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupdist_leftdown_rightup trial, baseline variation')
            R.pupdist_leftdown_rightup(1:size(R.pupdist_leftdown_rightup,2))=NaN;
        end

        %Filter out significant signal variations or blinks after the
        %stimulus
        idx_SD = nanstd(R.pupdist_up_down(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_up_down(1:round(0.5*P.fs)));
        if sum(R.pupdist_up_down(round(0.5*P.fs):round(1.2*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupdist_up_down trial, signal variation (blink)')
            R.pupdist_up_down(1:size(R.pupdist_up_down,2))=NaN;
        end

        idx_SD = nanstd(R.pupdist_leftup_rightdown(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_leftup_rightdown(1:round(0.5*P.fs)));
        if sum(R.pupdist_leftup_rightdown(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupdist_leftup_rightdown trial, signal variation (blink)')
            R.pupdist_leftup_rightdown(1:size(R.pupdist_leftup_rightdown,2))=NaN;
        end

        idx_SD = nanstd(R.pupdist_left_right(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_left_right(1:round(0.5*P.fs)));
        if sum(R.pupdist_left_right(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupdist_left_right trial, signal variation (blink)')
            R.pupdist_left_right(1:size(R.pupdist_left_right,2))=NaN;
        end

        idx_SD = nanstd(R.pupdist_leftdown_rightup(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupdist_leftdown_rightup(1:round(0.5*P.fs)));
        if sum(R.pupdist_leftdown_rightup(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupdist_leftdown_rightup trial, signal variation (blink)')
            R.pupdist_leftdown_rightup(1:size(R.pupdist_leftdown_rightup,2))=NaN;
        end



        %         figure; hold on; plot(R.pupdist_up_down);plot(R.pupdist_leftup_rightdown);plot(R.pupdist_left_right);plot(R.pupdist_leftdown_rightup);
        %         plot(R.pupdist_mdn,'k','LineWidth',2)

        % Filter the eyelid traces and convert to %eye width
        P.stdsmooth=sqrt(2*log(2))./(P.filtFreq_pupdist.*2.*pi)';
        P.xaxis=-0.5:(1/P.fs):2;
        R.pupdist_up_down_filt=((gfilt(R.pupdist_up_down',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100);
        R.pupdist_leftup_rightdown_filt=((gfilt(R.pupdist_leftup_rightdown',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100);
        R.pupdist_left_right_filt=((gfilt(R.pupdist_left_right',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100);
        R.pupdist_leftdown_rightup_filt=((gfilt(R.pupdist_leftdown_rightup',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100);

        R.pupdist_mdn_filt=nanmedian([R.pupdist_up_down_filt;R.pupdist_leftup_rightdown_filt;R.pupdist_left_right_filt;R.pupdist_leftdown_rightup_filt]);


        %         figure; hold on; plot(P.xaxis(1:size(R.pupdist_up_down_filt,2)),R.pupdist_up_down_filt);
        %         plot(P.xaxis(1:size(R.pupdist_leftup_rightdown_filt,2)),R.pupdist_leftup_rightdown_filt);
        %         plot(P.xaxis(1:size(R.pupdist_left_right_filt,2)),R.pupdist_leftdown_rightup_filt);
        %         plot(P.xaxis(1:size(R.pupdist_leftdown_rightup_filt,2)),R.pupdist_leftdown_rightup_filt);
        %
        %         plot(P.xaxis(1:size(R.pupdist_up_down_filt,2)),R.pupdist_mdn_filt,'k','LineWidth',2)
        %         line([round(0) round(0)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

        %% Calculate the pupilmovement
        R.pupmov_up=[];
        R.pupmov_down=[];
        R.pupmov_center=[];
        R.pupmov_leftup=[];
        R.pupmov_rightdown=[];
        R.pupmov_left=[];
        R.pupmov_right=[];
        R.pupmov_rightup=[];
        R.pupmov_leftdown=[];
        R.pupmov_mdn = [];

        for ii=1:size(data{:,1},1)-1
            R.pupmov_up(ii)=sqrt((data{ii+1,11} - data{ii,11}).^2 + (data{ii+1,12} - data{ii,12}).^2);
            R.pupmov_down(ii)=sqrt((data{ii+1,23} - data{ii,23}).^2 + (data{ii+1,24} - data{ii,24}).^2);
            R.pupmov_center(ii)=sqrt((data{ii+1,8} - data{ii,8}).^2 + (data{ii+1,9} - data{ii,9}).^2);
            R.pupmov_leftup(ii)=sqrt((data{ii+1,14} - data{ii,14}).^2 + (data{ii+1,15} - data{ii,15}).^2);
            R.pupmov_rightdown(ii)=sqrt((data{ii+1,26} - data{ii,26}).^2 + (data{ii+1,27} - data{ii,27}).^2);
            R.pupmov_left(ii)=sqrt((data{ii+1,17} - data{ii,17}).^2 + (data{ii+1,18} - data{ii,18}).^2);
            R.pupmov_right(ii)=sqrt((data{ii+1,29} - data{ii,29}).^2 + (data{ii+1,30} - data{ii,30}).^2);
            R.pupmov_rightup(ii)=sqrt((data{ii+1,32} - data{ii,32}).^2 + (data{ii+1,33} - data{ii,33}).^2);
            R.pupmov_leftdown(ii)=sqrt((data{ii+1,20} - data{ii,20}).^2 + (data{ii+1,21} - data{ii,21}).^2);
            R.pupmov_mdn(ii) = median([R.pupmov_up(ii),R.pupmov_down(ii), R.pupmov_center(ii), R.pupmov_leftup(ii), R.pupmov_rightdown(ii), R.pupmov_left(ii),R.pupmov_right(ii),R.pupmov_rightup(ii),R.pupmov_leftdown(ii)]);
        end

        %         figure; hold on; plot(R.pupmov_up); plot(R.pupmov_down);plot(R.pupmov_center);plot(R.pupmov_leftup);plot(R.pupmov_rightdown);plot(R.pupmov_left);plot(R.pupmov_right);plot(R.pupmov_rightup);plot(R.pupmov_leftdown);
        %         plot(R.pupmov_mdn,'k','LineWidth',2)
        %         line([round(0.5*320) round(0.5*320)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');

        %Filter out significant baseline variations or blinks
        idx_SD = nanstd(R.pupmov_up(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_up(1:round(0.5*P.fs)));
        if sum(R.pupmov_up(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_up trial, baseline variation')
            R.pupmov_up(1:size(R.pupmov_up,2))=NaN;
        end

        idx_SD = nanstd(R.pupmov_down(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_down(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_down trial, baseline variation')
            R.pupmov_down(1:size(R.pupmov_down,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_center(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_center(1:round(0.5*P.fs)));
        if sum(R.pupmov_center(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_center trial, baseline variation')
            R.pupmov_center(1:size(R.pupmov_center,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_leftup(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_leftup(1:round(0.5*P.fs)));
        if sum(R.pupmov_leftup(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_leftup trial, baseline variation')
            R.pupmov_leftup(1:size(R.pupmov_leftup,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_rightdown(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_rightdown(1:round(0.5*P.fs)));
        if sum(R.pupmov_rightdown(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_rightdown trial, baseline variation')
            R.pupmov_rightdown(1:size(R.pupmov_rightdown,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_left(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_left(1:round(0.5*P.fs)));
        if sum(R.pupmov_left(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_left trial, baseline variation')
            R.pupmov_left(1:size(R.pupmov_left,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_right(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_right(1:round(0.5*P.fs)));
        if sum(R.pupmov_right(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_right trial, baseline variation')
            R.pupmov_right(1:size(R.pupmov_right,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_rightup(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_rightup(1:round(0.5*P.fs)));
        if sum(R.pupmov_rightup(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_rightup trial, baseline variation')
            R.pupmov_rightup(1:size(R.pupmov_rightup,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_leftdown(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_leftdown(1:round(0.5*P.fs)));
        if sum(R.pupmov_leftdown(1:round(0.5*P.fs))>(idx_mean+(idx_SD*5)))>0
            sprintf('Excluding pupmov_leftdown trial, baseline variation')
            R.pupmov_leftdown(1:size(R.pupmov_leftdown,2))=NaN;
        end

        %Filter out significant signal variations or blinks after the
        %stimulus
        idx_SD = nanstd(R.pupmov_up(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_up(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_up trial, signal variation (blink)')
            R.pupmov_up(1:size(R.pupmov_up,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_down(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_down(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_down trial, signal variation (blink)')
            R.pupmov_down(1:size(R.pupmov_down,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_center(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_center(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_center trial, signal variation (blink)')
            R.pupmov_center(1:size(R.pupmov_center,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_leftup(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_leftup(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_leftup trial, signal variation (blink)')
            R.pupmov_leftup(1:size(R.pupmov_leftup,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_rightdown(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_rightdown(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_rightdown trial, signal variation (blink)')
            R.pupmov_rightdown(1:size(R.pupmov_rightdown,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_left(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_left(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_left trial, signal variation (blink)')
            R.pupmov_left(1:size(R.pupmov_left,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_right(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_right(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_right trial, signal variation (blink)')
            R.pupmov_right(1:size(R.pupmov_right,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_rightup(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_rightup(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_rightup trial, signal variation (blink)')
            R.pupmov_rightup(1:size(R.pupmov_rightup,2))=NaN;
        end
        idx_SD = nanstd(R.pupmov_leftdown(1:round(0.5*P.fs)));
        idx_mean=nanmean(R.pupmov_leftdown(1:round(0.5*P.fs)));
        if sum(R.pupmov_down(round(0.5*P.fs):round(1.5*P.fs))>(idx_mean+30))>0
            sprintf('Excluding pupmov_leftdown trial, signal variation (blink)')
            R.pupmov_leftdown(1:size(R.pupmov_leftdown,2))=NaN;
        end

        % Filter and normalize the pupil traces and express as % of eye width per second
        P.stdsmooth=sqrt(2*log(2))./(P.filtFreq_pupmov.*2.*pi)';
        P.xaxis=-0.5:(1/P.fs):2;
        R.pupmov_up_filt=((gfilt(R.pupmov_up',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;
        R.pupmov_down_filt=((gfilt(R.pupmov_down',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs; % Filter and convert as proportion of the distance between eye corners
        R.pupmov_center_filt=((gfilt(R.pupmov_center',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;
        R.pupmov_leftup_filt=((gfilt(R.pupmov_leftup',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;
        R.pupmov_rightdown_filt=((gfilt(R.pupmov_rightdown',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;
        R.pupmov_left_filt=((gfilt(R.pupmov_left',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;
        R.pupmov_right_filt=((gfilt(R.pupmov_right',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;
        R.pupmov_rightup_filt=((gfilt(R.pupmov_rightup',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;
        R.pupmov_leftdown_filt=((gfilt(R.pupmov_leftdown',P.fs,P.stdsmooth)'/R.eyelid_dist_mdn)*100)*P.fs;

        % Normalize to the baseline

        R.pupmov_up_filt=R.pupmov_up_filt-nanmean(R.pupmov_up_filt(1:round(P.fs)));
        R.pupmov_down_filt=R.pupmov_down_filt-nanmean(R.pupmov_down_filt(1:round(P.fs)));
        R.pupmov_center_filt=R.pupmov_center_filt-nanmean(R.pupmov_center_filt(1:round(P.fs)));
        R.pupmov_leftup_filt=R.pupmov_leftup_filt-nanmean(R.pupmov_leftup_filt(1:round(P.fs)));
        R.pupmov_rightdown_filt=R.pupmov_rightdown_filt-nanmean(R.pupmov_rightdown_filt(1:round(P.fs)));
        R.pupmov_left_filt=R.pupmov_left_filt-nanmean(R.pupmov_left_filt(1:round(P.fs)));
        R.pupmov_right_filt=R.pupmov_right_filt-nanmean(R.pupmov_right_filt(1:round(P.fs)));
        R.pupmov_rightup_filt=R.pupmov_rightup_filt-nanmean(R.pupmov_rightup_filt(1:round(P.fs)));
        R.pupmov_leftdown_filt=R.pupmov_leftdown_filt-nanmean(R.pupmov_leftdown_filt(1:round(P.fs)));


        for ii=1:size(R.pupmov_up_filt,2)
            R.pupmov_mdn_filt(ii)=median([R.pupmov_up_filt(ii),R.pupmov_down_filt(ii),R.pupmov_center_filt(ii),R.pupmov_leftup_filt(ii),R.pupmov_rightdown_filt(ii),R.pupmov_left_filt(ii),...
                R.pupmov_right_filt(ii),R.pupmov_rightup_filt(ii),R.pupmov_leftdown_filt(ii)]);
        end




        %% Write the important variables

        R.pupmov_up_steps_US=[];
        R.pupmov_down_steps_US=[];
        R.pupmov_center_steps_US=[];
        R.pupmov_leftup_steps_US=[];
        R.pupmov_rightdown_steps_US=[];
        R.pupmov_left_steps_US=[];
        R.pupmov_right_steps_US=[];
        R.pupmov_rightup_steps_US=[];
        R.pupmov_leftdown_steps_US=[];
        R.pupmov_mdn_steps_US = [];
        R.pupmov_location_steps_X_US=[];
        R.pupmov_location_steps_Y_US=[];

        R.pupmov_up_steps_opto0=[];
        R.pupmov_down_steps_opto0=[];
        R.pupmov_center_steps_opto0=[];
        R.pupmov_leftup_steps_opto0=[];
        R.pupmov_rightdown_steps_opto0=[];
        R.pupmov_left_steps_opto0=[];
        R.pupmov_right_steps_opto0=[];
        R.pupmov_rightup_steps_opto0=[];
        R.pupmov_leftdown_steps_opto0=[];
        R.pupmov_mdn_steps_opto0 = [];
        R.pupmov_location_steps_X_opto0=[];
        R.pupmov_location_steps_Y_opto0=[];

        R.pupmov_up_steps_opto25=[];
        R.pupmov_down_steps_opto25=[];
        R.pupmov_center_steps_opto25=[];
        R.pupmov_leftup_steps_opto25=[];
        R.pupmov_rightdown_steps_opto25=[];
        R.pupmov_left_steps_opto25=[];
        R.pupmov_right_steps_opto25=[];
        R.pupmov_rightup_steps_opto25=[];
        R.pupmov_leftdown_steps_opto25=[];
        R.pupmov_mdn_steps_opto25 = [];
        R.pupmov_location_steps_X_opto25=[];
        R.pupmov_location_steps_Y_opto25=[];

        R.pupmov_up_steps_opto50=[];
        R.pupmov_down_steps_opto50=[];
        R.pupmov_center_steps_opto50=[];
        R.pupmov_leftup_steps_opto50=[];
        R.pupmov_rightdown_steps_opto50=[];
        R.pupmov_left_steps_opto50=[];
        R.pupmov_right_steps_opto50=[];
        R.pupmov_rightup_steps_opto50=[];
        R.pupmov_leftdown_steps_opto50=[];
        R.pupmov_mdn_steps_opto50 = [];
        R.pupmov_location_steps_X_opto50=[];
        R.pupmov_location_steps_Y_opto50=[];

        R.pupmov_up_steps_opto75=[];
        R.pupmov_down_steps_opto75=[];
        R.pupmov_center_steps_opto75=[];
        R.pupmov_leftup_steps_opto75=[];
        R.pupmov_rightdown_steps_opto75=[];
        R.pupmov_left_steps_opto75=[];
        R.pupmov_right_steps_opto75=[];
        R.pupmov_rightup_steps_opto75=[];
        R.pupmov_leftdown_steps_opto75=[];
        R.pupmov_mdn_steps_opto75 = [];
        R.pupmov_location_steps_X_opto75=[];
        R.pupmov_location_steps_Y_opto75=[];

        R.pupmov_up_steps_opto100=[];
        R.pupmov_down_steps_opto100=[];
        R.pupmov_center_steps_opto100=[];
        R.pupmov_leftup_steps_opto100=[];
        R.pupmov_rightdown_steps_opto100=[];
        R.pupmov_left_steps_opto100=[];
        R.pupmov_right_steps_opto100=[];
        R.pupmov_rightup_steps_opto100=[];
        R.pupmov_leftdown_steps_opto100=[];
        R.pupmov_mdn_steps_opto100 = [];
        R.pupmov_location_steps_X_opto100=[];
        R.pupmov_location_steps_Y_opto100=[];


        if P.fileID(xx)==1
            S.pupmov_US(xx,1:length(R.pupmov_mdn_filt))=R.pupmov_mdn_filt;
            S.pupdist_US(xx,1:length(R.pupdist_mdn_filt))=R.pupdist_mdn_filt;
            S.pupdist_baseline_US(xx)=nanmean(S.pupdist_US(xx,1:round(0.5)*P.fs));

            for ii= 1:11 % 11 time points centered around start stim (250 ms each side, 50 ms spacing)
                P.frame = [(0.2*P.fs)+((ii*0.05)*P.fs) (0.2*P.fs)+(((ii+1)*0.05)*P.fs)];
                R.pupmov_location_steps_X_US(1,ii)=data{P.frame(1),11};
                R.pupmov_location_steps_X_US(2,ii)=data{P.frame(1),23} ;
                R.pupmov_location_steps_X_US(3,ii)=data{P.frame(1),8};
                R.pupmov_location_steps_X_US(4,ii)=data{P.frame(1),14};
                R.pupmov_location_steps_X_US(5,ii)=data{P.frame(1),26};
                R.pupmov_location_steps_X_US(6,ii)=data{P.frame(1),17} ;
                R.pupmov_location_steps_X_US(7,ii)=data{P.frame(1),29};
                R.pupmov_location_steps_X_US(8,ii)=data{P.frame(1),32};
                R.pupmov_location_steps_X_US(9,ii)=data{P.frame(1),20};

                R.pupmov_location_steps_Y_US(1,ii)=data{P.frame(1),12};
                R.pupmov_location_steps_Y_US(2,ii)=data{P.frame(1),24} ;
                R.pupmov_location_steps_Y_US(3,ii)=data{P.frame(1),9};
                R.pupmov_location_steps_Y_US(4,ii)=data{P.frame(1),15};
                R.pupmov_location_steps_Y_US(5,ii)=data{P.frame(1),27};
                R.pupmov_location_steps_Y_US(6,ii)=data{P.frame(1),18} ;
                R.pupmov_location_steps_Y_US(7,ii)=data{P.frame(1),30};
                R.pupmov_location_steps_Y_US(8,ii)=data{P.frame(1),33};
                R.pupmov_location_steps_Y_US(9,ii)=data{P.frame(1),21};
            end
            R.pupmov_location_steps_X_US_avg(xx,:) = nanmean(R.pupmov_location_steps_X_US,1); % Average to get the central position of the eye as an average of all positions
            R.pupmov_location_steps_Y_US_avg(xx,:) = nanmean(R.pupmov_location_steps_Y_US,1);

        elseif P.fileID(xx)==2
            S.pupmov_US_opto0(xx,1:length(R.pupmov_mdn_filt))=R.pupmov_mdn_filt;
            S.pupdist_US_opto0(xx,1:length(R.pupdist_mdn_filt))=R.pupdist_mdn_filt;
            S.pupdist_baseline_US_opto0(xx)=nanmean(S.pupdist_US_opto0(xx,1:round(0.5)*P.fs));

            for ii= 1:11 % 11 time points centered around start stim (250 ms each side, 50 ms spacing)
                P.frame = [(0.2*P.fs)+((ii*0.05)*P.fs) (0.2*P.fs)+(((ii+1)*0.05)*P.fs)];
                R.pupmov_location_steps_X_opto0(1,ii)=data{P.frame(1),11};
                R.pupmov_location_steps_X_opto0(2,ii)=data{P.frame(1),23} ;
                R.pupmov_location_steps_X_opto0(3,ii)=data{P.frame(1),8};
                R.pupmov_location_steps_X_opto0(4,ii)=data{P.frame(1),14};
                R.pupmov_location_steps_X_opto0(5,ii)=data{P.frame(1),26};
                R.pupmov_location_steps_X_opto0(6,ii)=data{P.frame(1),17} ;
                R.pupmov_location_steps_X_opto0(7,ii)=data{P.frame(1),29};
                R.pupmov_location_steps_X_opto0(8,ii)=data{P.frame(1),32};
                R.pupmov_location_steps_X_opto0(9,ii)=data{P.frame(1),20};

                R.pupmov_location_steps_Y_opto0(1,ii)=data{P.frame(1),12};
                R.pupmov_location_steps_Y_opto0(2,ii)=data{P.frame(1),24} ;
                R.pupmov_location_steps_Y_opto0(3,ii)=data{P.frame(1),9};
                R.pupmov_location_steps_Y_opto0(4,ii)=data{P.frame(1),15};
                R.pupmov_location_steps_Y_opto0(5,ii)=data{P.frame(1),27};
                R.pupmov_location_steps_Y_opto0(6,ii)=data{P.frame(1),18} ;
                R.pupmov_location_steps_Y_opto0(7,ii)=data{P.frame(1),30};
                R.pupmov_location_steps_Y_opto0(8,ii)=data{P.frame(1),33};
                R.pupmov_location_steps_Y_opto0(9,ii)=data{P.frame(1),21};
            end
            R.pupmov_location_steps_X_opto0_avg(xx,:) = nanmean(R.pupmov_location_steps_X_opto0,1); % Average to get the central position of the eye as an average of all positions
            R.pupmov_location_steps_Y_opto0_avg(xx,:) = nanmean(R.pupmov_location_steps_Y_opto0,1);

        elseif P.fileID(xx)==3
            S.pupmov_US_opto25(xx,1:length(R.pupmov_mdn_filt))=R.pupmov_mdn_filt;
            S.pupdist_US_opto25(xx,1:length(R.pupdist_mdn_filt))=R.pupdist_mdn_filt;
            S.pupdist_baseline_US_opto25(xx)=nanmean(S.pupdist_US_opto25(xx,1:round(0.5)*P.fs));

            for ii= 1:11 % 11 time points centered around start stim (250 ms each side, 50 ms spacing)
                P.frame = [(0.2*P.fs)+((ii*0.05)*P.fs) (0.2*P.fs)+(((ii+1)*0.05)*P.fs)];
                R.pupmov_location_steps_X_opto25(1,ii)=data{P.frame(1),11};
                R.pupmov_location_steps_X_opto25(2,ii)=data{P.frame(1),23} ;
                R.pupmov_location_steps_X_opto25(3,ii)=data{P.frame(1),8};
                R.pupmov_location_steps_X_opto25(4,ii)=data{P.frame(1),14};
                R.pupmov_location_steps_X_opto25(5,ii)=data{P.frame(1),26};
                R.pupmov_location_steps_X_opto25(6,ii)=data{P.frame(1),17} ;
                R.pupmov_location_steps_X_opto25(7,ii)=data{P.frame(1),29};
                R.pupmov_location_steps_X_opto25(8,ii)=data{P.frame(1),32};
                R.pupmov_location_steps_X_opto25(9,ii)=data{P.frame(1),20};

                R.pupmov_location_steps_Y_opto25(1,ii)=data{P.frame(1),12};
                R.pupmov_location_steps_Y_opto25(2,ii)=data{P.frame(1),24} ;
                R.pupmov_location_steps_Y_opto25(3,ii)=data{P.frame(1),9};
                R.pupmov_location_steps_Y_opto25(4,ii)=data{P.frame(1),15};
                R.pupmov_location_steps_Y_opto25(5,ii)=data{P.frame(1),27};
                R.pupmov_location_steps_Y_opto25(6,ii)=data{P.frame(1),18} ;
                R.pupmov_location_steps_Y_opto25(7,ii)=data{P.frame(1),30};
                R.pupmov_location_steps_Y_opto25(8,ii)=data{P.frame(1),33};
                R.pupmov_location_steps_Y_opto25(9,ii)=data{P.frame(1),21};
            end
            R.pupmov_location_steps_X_opto25_avg(xx,:) = nanmean(R.pupmov_location_steps_X_opto25,1); % Average to get the central position of the eye as an average of all positions
            R.pupmov_location_steps_Y_opto25_avg(xx,:) = nanmean(R.pupmov_location_steps_Y_opto25,1);

        elseif P.fileID(xx)==4
            S.pupmov_US_opto50(xx,1:length(R.pupmov_mdn_filt))=R.pupmov_mdn_filt;
            S.pupdist_US_opto50(xx,1:length(R.pupdist_mdn_filt))=R.pupdist_mdn_filt;
            S.pupdist_baseline_US_opto50(xx)=nanmean(S.pupdist_US_opto50(xx,1:round(0.5)*P.fs));

            for ii= 1:11 % 11 time points centered around start stim (250 ms each side, 50 ms spacing)
                P.frame = [(0.2*P.fs)+((ii*0.05)*P.fs) (0.2*P.fs)+(((ii+1)*0.05)*P.fs)];
                R.pupmov_location_steps_X_opto50(1,ii)=data{P.frame(1),11};
                R.pupmov_location_steps_X_opto50(2,ii)=data{P.frame(1),23} ;
                R.pupmov_location_steps_X_opto50(3,ii)=data{P.frame(1),8};
                R.pupmov_location_steps_X_opto50(4,ii)=data{P.frame(1),14};
                R.pupmov_location_steps_X_opto50(5,ii)=data{P.frame(1),26};
                R.pupmov_location_steps_X_opto50(6,ii)=data{P.frame(1),17} ;
                R.pupmov_location_steps_X_opto50(7,ii)=data{P.frame(1),29};
                R.pupmov_location_steps_X_opto50(8,ii)=data{P.frame(1),32};
                R.pupmov_location_steps_X_opto50(9,ii)=data{P.frame(1),20};

                R.pupmov_location_steps_Y_opto50(1,ii)=data{P.frame(1),12};
                R.pupmov_location_steps_Y_opto50(2,ii)=data{P.frame(1),24} ;
                R.pupmov_location_steps_Y_opto50(3,ii)=data{P.frame(1),9};
                R.pupmov_location_steps_Y_opto50(4,ii)=data{P.frame(1),15};
                R.pupmov_location_steps_Y_opto50(5,ii)=data{P.frame(1),27};
                R.pupmov_location_steps_Y_opto50(6,ii)=data{P.frame(1),18} ;
                R.pupmov_location_steps_Y_opto50(7,ii)=data{P.frame(1),30};
                R.pupmov_location_steps_Y_opto50(8,ii)=data{P.frame(1),33};
                R.pupmov_location_steps_Y_opto50(9,ii)=data{P.frame(1),21};
            end
            R.pupmov_location_steps_X_opto50_avg(xx,:) = nanmean(R.pupmov_location_steps_X_opto50,1); % Average to get the central position of the eye as an average of all positions
            R.pupmov_location_steps_Y_opto50_avg(xx,:) = nanmean(R.pupmov_location_steps_Y_opto50,1);

        elseif P.fileID(xx)==5
            S.pupmov_US_opto75(xx,1:length(R.pupmov_mdn_filt))=R.pupmov_mdn_filt;
            S.pupdist_US_opto75(xx,1:length(R.pupdist_mdn_filt))=R.pupdist_mdn_filt;
            S.pupdist_baseline_US_opto75(xx)=nanmean(S.pupdist_US_opto75(xx,1:round(0.5)*P.fs));

            for ii= 1:11 % 11 time points centered around start stim (250 ms each side, 50 ms spacing)
                P.frame = [(0.2*P.fs)+((ii*0.05)*P.fs) (0.2*P.fs)+(((ii+1)*0.05)*P.fs)];
                R.pupmov_location_steps_X_opto75(1,ii)=data{P.frame(1),11};
                R.pupmov_location_steps_X_opto75(2,ii)=data{P.frame(1),23} ;
                R.pupmov_location_steps_X_opto75(3,ii)=data{P.frame(1),8};
                R.pupmov_location_steps_X_opto75(4,ii)=data{P.frame(1),14};
                R.pupmov_location_steps_X_opto75(5,ii)=data{P.frame(1),26};
                R.pupmov_location_steps_X_opto75(6,ii)=data{P.frame(1),17} ;
                R.pupmov_location_steps_X_opto75(7,ii)=data{P.frame(1),29};
                R.pupmov_location_steps_X_opto75(8,ii)=data{P.frame(1),32};
                R.pupmov_location_steps_X_opto75(9,ii)=data{P.frame(1),20};

                R.pupmov_location_steps_Y_opto75(1,ii)=data{P.frame(1),12};
                R.pupmov_location_steps_Y_opto75(2,ii)=data{P.frame(1),24} ;
                R.pupmov_location_steps_Y_opto75(3,ii)=data{P.frame(1),9};
                R.pupmov_location_steps_Y_opto75(4,ii)=data{P.frame(1),15};
                R.pupmov_location_steps_Y_opto75(5,ii)=data{P.frame(1),27};
                R.pupmov_location_steps_Y_opto75(6,ii)=data{P.frame(1),18} ;
                R.pupmov_location_steps_Y_opto75(7,ii)=data{P.frame(1),30};
                R.pupmov_location_steps_Y_opto75(8,ii)=data{P.frame(1),33};
                R.pupmov_location_steps_Y_opto75(9,ii)=data{P.frame(1),21};
            end
            R.pupmov_location_steps_X_opto75_avg(xx,:) = nanmean(R.pupmov_location_steps_X_opto75,1); % Average to get the central position of the eye as an average of all positions
            R.pupmov_location_steps_Y_opto75_avg(xx,:) = nanmean(R.pupmov_location_steps_Y_opto75,1);

        elseif P.fileID(xx)==6
            S.pupmov_US_opto100(xx,1:length(R.pupmov_mdn_filt))=R.pupmov_mdn_filt;
            S.pupdist_US_opto100(xx,1:length(R.pupdist_mdn_filt))=R.pupdist_mdn_filt;
            S.pupdist_baseline_US_opto100(xx)=nanmean(S.pupdist_US_opto100(xx,1:round(0.5)*P.fs));

            for ii= 1:11 % 11 time points centered around start stim (250 ms each side, 50 ms spacing)
                P.frame = [(0.2*P.fs)+((ii*0.05)*P.fs) (0.2*P.fs)+(((ii+1)*0.05)*P.fs)];
                R.pupmov_location_steps_X_opto100(1,ii)=data{P.frame(1),11};
                R.pupmov_location_steps_X_opto100(2,ii)=data{P.frame(1),23} ;
                R.pupmov_location_steps_X_opto100(3,ii)=data{P.frame(1),8};
                R.pupmov_location_steps_X_opto100(4,ii)=data{P.frame(1),14};
                R.pupmov_location_steps_X_opto100(5,ii)=data{P.frame(1),26};
                R.pupmov_location_steps_X_opto100(6,ii)=data{P.frame(1),17} ;
                R.pupmov_location_steps_X_opto100(7,ii)=data{P.frame(1),29};
                R.pupmov_location_steps_X_opto100(8,ii)=data{P.frame(1),32};
                R.pupmov_location_steps_X_opto100(9,ii)=data{P.frame(1),20};

                R.pupmov_location_steps_Y_opto100(1,ii)=data{P.frame(1),12};
                R.pupmov_location_steps_Y_opto100(2,ii)=data{P.frame(1),24} ;
                R.pupmov_location_steps_Y_opto100(3,ii)=data{P.frame(1),9};
                R.pupmov_location_steps_Y_opto100(4,ii)=data{P.frame(1),15};
                R.pupmov_location_steps_Y_opto100(5,ii)=data{P.frame(1),27};
                R.pupmov_location_steps_Y_opto100(6,ii)=data{P.frame(1),18} ;
                R.pupmov_location_steps_Y_opto100(7,ii)=data{P.frame(1),30};
                R.pupmov_location_steps_Y_opto100(8,ii)=data{P.frame(1),33};
                R.pupmov_location_steps_Y_opto100(9,ii)=data{P.frame(1),21};
            end
            R.pupmov_location_steps_X_opto100_avg(xx,:) = nanmean(R.pupmov_location_steps_X_opto100,1); % Average to get the central position of the eye as an average of all positions
            R.pupmov_location_steps_Y_opto100_avg(xx,:) = nanmean(R.pupmov_location_steps_Y_opto100,1);

        end

    end

    %% Remove the trials where there is no pupil movement
    for yy=1:size(S.pupmov_US,1)
        S.pupmov_baselineSD(yy,1)=nanstd(S.pupmov_US(yy,1:round(0.5*P.fs)));
        S.pupmov_baselineAVG(yy,1)=nanmean(S.pupmov_US(yy,1:round(0.5*P.fs)));

        S.pupmov_baselineSD(yy,2)=nanstd(S.pupmov_US_opto0(yy,1:round(0.5*P.fs)));
        S.pupmov_baselineAVG(yy,2)=nanmean(S.pupmov_US_opto0(yy,1:round(0.5*P.fs)));

        S.pupmov_baselineSD(yy,3)=nanstd(S.pupmov_US_opto25(yy,1:round(0.5*P.fs)));
        S.pupmov_baselineAVG(yy,3)=nanmean(S.pupmov_US_opto25(yy,1:round(0.5*P.fs)));

        S.pupmov_baselineSD(yy,4)=nanstd(S.pupmov_US_opto50(yy,1:round(0.5*P.fs)));
        S.pupmov_baselineAVG(yy,4)=nanmean(S.pupmov_US_opto50(yy,1:round(0.5*P.fs)));

        S.pupmov_baselineSD(yy,5)=nanstd(S.pupmov_US_opto75(yy,1:round(0.5*P.fs)));
        S.pupmov_baselineAVG(yy,5)=nanmean(S.pupmov_US_opto75(yy,1:round(0.5*P.fs)));

        S.pupmov_baselineSD(yy,6)=nanstd(S.pupmov_US_opto100(yy,1:round(0.5*P.fs)));
        S.pupmov_baselineAVG(yy,6)=nanmean(S.pupmov_US_opto100(yy,1:round(0.5*P.fs)));
    end
    S.pupmov_baselineSD_avg=nanmean(nanmean(S.pupmov_baselineSD));
    S.pupmov_baselineAVG_avg=nanmean(nanmean(S.pupmov_baselineAVG));

    for yy=1:size(S.pupmov_US,1)
        idx_avg=nanmean(S.pupmov_US(yy,round(0.5*P.fs):round(0.75*P.fs)));
        if sum(S.pupmov_US(yy,round(0.5*P.fs):round(0.75*P.fs))>(idx_avg+(3*S.pupmov_baselineSD_avg)))==0
            S.pupmov_US(yy,:)=NaN;
            % disp('excluded US trial - no pupilmov')
        end
    end

    for yy=1:size(S.pupmov_US_opto0,1)
        idx_avg=nanmean(S.pupmov_US_opto0(yy,round(0.5*P.fs):round(0.75*P.fs)));
        if sum(S.pupmov_US_opto0(yy,round(0.5*P.fs):round(0.75*P.fs))>(idx_avg+(3*S.pupmov_baselineSD_avg)))==0
            S.pupmov_US_opto0(yy,:)=NaN;
            % disp('excluded US_opto0 trial - no pupilmov')
        end    
        if zz==8 && yy==26
        S.pupmov_US_opto0(yy,:)=NaN;
        end
    end
    

    for yy=1:size(S.pupmov_US_opto25,1)
        idx_avg=nanmean(S.pupmov_US_opto25(yy,round(0.5*P.fs):round(0.75*P.fs)));
        if sum(S.pupmov_US_opto25(yy,round(0.5*P.fs):round(0.75*P.fs))>(idx_avg+(3*S.pupmov_baselineSD_avg)))==0
            S.pupmov_US_opto25(yy,:)=NaN;
            % disp('excluded US_opto25 trial - no pupilmov')
        end
    end

    for yy=1:size(S.pupmov_US_opto50,1)
        idx_avg=nanmean(S.pupmov_US_opto50(yy,round(0.5*P.fs):round(0.75*P.fs)));
        if sum(S.pupmov_US_opto50(yy,round(0.5*P.fs):round(0.75*P.fs))>(idx_avg+(3*S.pupmov_baselineSD_avg)))==0
            S.pupmov_US_opto50(yy,:)=NaN;
            % disp('excluded US_opto50 trial - no pupilmov')
        end
    end

    for yy=1:size(S.pupmov_US_opto75,1)
        idx_avg=nanmean(S.pupmov_US_opto75(yy,round(0.5*P.fs):round(0.75*P.fs)));
        if sum(S.pupmov_US_opto75(yy,round(0.5*P.fs):round(0.75*P.fs))>(idx_avg+(3*S.pupmov_baselineSD_avg)))==0
            S.pupmov_US_opto75(yy,:)=NaN;
            % disp('excluded US_opto75 trial - no pupilmov')
        end
    end

    for yy=1:size(S.pupmov_US_opto100,1)
        idx_avg=nanmean(S.pupmov_US_opto100(yy,round(0.5*P.fs):round(0.75*P.fs)));
        if sum(S.pupmov_US_opto100(yy,round(0.5*P.fs):round(0.75*P.fs))>(idx_avg+(3*S.pupmov_baselineSD_avg)))==0
            S.pupmov_US_opto100(yy,:)=NaN;
            % disp('excluded US_opto100 trial - no pupilmov')
        end
    end


%             figure; hold on; 
%         for cv=1:150
%                cv
%                plot(S.pupmov_US_opto0(cv,:),'k','LineWidth',2)
%                 pause;
%         end

    %% Calculate stats
    xx= size(S.pupmov_US,1);
    S.pupmov_US_avg = nanmean(S.pupmov_US);
    S.pupdist_US_avg = nanmean(S.pupdist_US);

    S.pupmov_US_opto0_avg = nanmean(S.pupmov_US_opto0);
    S.pupdist_US_opto0_avg = nanmean(S.pupdist_US_opto0);

    S.pupmov_US_opto25_avg = nanmean(S.pupmov_US_opto25);
    S.pupdist_US_opto25_avg = nanmean(S.pupdist_US_opto25);

    S.pupmov_US_opto50_avg = nanmean(S.pupmov_US_opto50);
    S.pupdist_US_opto50_avg = nanmean(S.pupdist_US_opto50);

    S.pupmov_US_opto75_avg = nanmean(S.pupmov_US_opto75);
    S.pupdist_US_opto75_avg = nanmean(S.pupdist_US_opto75);

    S.pupmov_US_opto100_avg = nanmean(S.pupmov_US_opto100);
    S.pupdist_US_opto100_avg = nanmean(S.pupdist_US_opto100);

    % for ii = 1:xx
    %     S.pupdist_baselined(ii,:)=S.pupdist(ii,:)-S.pupdist_baseline(ii);
    %
    %     S.pupmov_amp_baseline(ii,1) = nanmax(S.pupmov(ii,1:(0.5*P.fs)));
    %     S.pupmov_amp(ii,1) = nanmax(S.pupmov(ii,(0.5*P.fs):(1*P.fs)));
    %
    %     if isnan(S.pupmov(ii,(0.5*P.fs)))==0
    %         S.pupmov_area_baseline(ii,1) = nansum(S.pupmov(ii,1:(0.5*P.fs)));
    %         S.pupmov_area(ii,1) = nansum(S.pupmov(ii,(0.5*P.fs):(1*P.fs)));
    %     elseif isnan(S.pupmov(ii,(0.5*P.fs)))==1
    %         S.pupmov_area(ii,1)=NaN;
    %         S.pupmov_area_baseline(ii,1) = NaN;
    %     end
    %
    %     S.pupdist_amp_baseline(ii,1) = nanmax(S.pupdist_baselined(ii,1:(0.5*P.fs)));
    %     S.pupdist_amp(ii,1) = nanmax(S.pupdist_baselined(ii,(0.5*P.fs):(1*P.fs)));
    %     if isnan(S.pupdist(ii,(0.5*P.fs)))==0
    %         S.pupdist_area_baseline(ii,1) = nansum(S.pupdist_baselined(ii,1:(0.5*P.fs)));
    %         S.pupdist_area(ii,1) = nansum(S.pupdist_baselined(ii,(0.5*P.fs):(1*P.fs)));
    %     elseif isnan(S.pupdist(ii,(0.5*P.fs)))==1
    %         S.pupdist_area_baseline(ii,1) = NaN;
    %         S.pupdist_area(ii,1) = NaN;
    %     end
    %
    %         S.pupdist_avg_baseline(ii,1) = nanmean(S.pupdist(ii,1:(0.5*P.fs)));
    % end
    % S.pupdist_baselined_avg = nanmean(S.pupdist_baselined);
    %
    % % Correlate baseline pupil size with the amplitude of the pupilmovement
    %
    % figure; hold on; plot(S.pupdist_baseline,S.pupmov_amp,'bo');
    % xlabel('Baseline pupil diameter (%eye width)')
    % ylabel('Pupil movement after opto (%eye width)')
    %
    % % Correlate baseline pupil size with the area of the pupilmovement
    % figure; hold on; plot(S.pupdist_baseline,S.pupmov_area,'bo');
    % xlabel('Baseline pupil diameter (%eye width)')
    % ylabel('Pupil movement after opto (area)')

    %% Create the figures
    %US only
    figure;
    h(1)=subplot(2,3,1);hold on;
    for ii=1:size(S.pupmov_US,1)
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupmov_US_avg,2)),S.pupmov_US(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupmov_US_avg,2)),S.pupmov_US_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    % line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    title('Pup movs US')
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % % Save figure
    %     figname = sprintf('%s_pupilmovements_indTrials_US.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupilmovements_indTrials_US.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto0
    h(2)=subplot(2,3,2);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupmov_US_opto0_avg,2)),S.pupmov_US_opto0(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupmov_US_opto0_avg,2)),S.pupmov_US_opto0_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pup movs US_opto0')
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % % Save figure
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto0.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto0.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto25
    h(3)=subplot(2,3,3);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupmov_US_opto25_avg,2)),S.pupmov_US_opto25(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupmov_US_opto25_avg,2)),S.pupmov_US_opto25_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.025 0.025],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pup movs US_opto25')
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % % Save figure
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto25.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto25.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto50
    h(4)=subplot(2,3,4);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupmov_US_opto50_avg,2)),S.pupmov_US_opto50(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupmov_US_opto50_avg,2)),S.pupmov_US_opto50_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pup movs US_opto50')
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % % Save figure
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto50.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto50.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto75
    h(5)=subplot(2,3,5);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupmov_US_opto75_avg,2)),S.pupmov_US_opto75(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupmov_US_opto75_avg,2)),S.pupmov_US_opto75_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.075 0.075],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pup movs US_opto75')
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % % Save figure
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto75.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto75.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto100
    h(6)=subplot(2,3,6);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupmov_US_opto100_avg,2)),S.pupmov_US_opto100(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupmov_US_opto100_avg,2)),S.pupmov_US_opto100_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pup movs US_opto100')
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % % Save figure
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto100.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupilmovements_indTrials_US_opto100.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    linkaxes(h,'xy')
    xlim([-0.25 0.5])
    ylim('auto')

    % Save figure
    figname = sprintf('%s_pupilmovements_indTrials_US_Ctrl_optoALL.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupilmovements_indTrials_US_Ctrl_optoALL.pdf',P.mouseID)
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose','-fillpage',figname)
    figname = sprintf('%s_pupilmovements_indTrials_US_Ctrl_optoALL.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Saccades trajectories (200ms after US)

    figure;
    k(1)=subplot(2,3,1);hold on;
    for ii=1:size(R.pupmov_location_steps_X_US_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_US_centered(ii,:)=R.pupmov_location_steps_X_US_avg(ii,:)-R.pupmov_location_steps_X_US_avg(ii,6);
        R.pupmov_location_steps_Y_avg_US_centered(ii,:)=R.pupmov_location_steps_Y_US_avg(ii,:)-R.pupmov_location_steps_Y_US_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_US_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_US_centered(ii,[6 10]),'-o')
    end
    title(['Saccades 0-200ms - US'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_US_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_US_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_US_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_US_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(2)=subplot(2,3,2);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto0_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto0_centered(ii,:)=R.pupmov_location_steps_X_opto0_avg(ii,:)-R.pupmov_location_steps_X_opto0_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto0_centered(ii,:)=R.pupmov_location_steps_Y_opto0_avg(ii,:)-R.pupmov_location_steps_Y_opto0_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto0_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto0_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto0'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto0_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto0_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto0_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto0_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(3)=subplot(2,3,3);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto25_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto25_centered(ii,:)=R.pupmov_location_steps_X_opto25_avg(ii,:)-R.pupmov_location_steps_X_opto25_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto25_centered(ii,:)=R.pupmov_location_steps_Y_opto25_avg(ii,:)-R.pupmov_location_steps_Y_opto25_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto25_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto25_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto25'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto25_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto25_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto25_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto25_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(4)=subplot(2,3,4);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto50_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto50_centered(ii,:)=R.pupmov_location_steps_X_opto50_avg(ii,:)-R.pupmov_location_steps_X_opto50_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto50_centered(ii,:)=R.pupmov_location_steps_Y_opto50_avg(ii,:)-R.pupmov_location_steps_Y_opto50_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto50_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto50_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto50'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto50_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto50_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto50_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto50_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(5)=subplot(2,3,5);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto75_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto75_centered(ii,:)=R.pupmov_location_steps_X_opto75_avg(ii,:)-R.pupmov_location_steps_X_opto75_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto75_centered(ii,:)=R.pupmov_location_steps_Y_opto75_avg(ii,:)-R.pupmov_location_steps_Y_opto75_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto75_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto75_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto75'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto75_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto75_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto75_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto75_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(6)=subplot(2,3,6);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto100_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto100_centered(ii,:)=R.pupmov_location_steps_X_opto100_avg(ii,:)-R.pupmov_location_steps_X_opto100_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto100_centered(ii,:)=R.pupmov_location_steps_Y_opto100_avg(ii,:)-R.pupmov_location_steps_Y_opto100_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto100_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto100_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto100'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto100_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto100_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto100_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto100_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    linkaxes(k,'xy')

    % Save figure
    figname = sprintf('%s_pupilmovements_trajectories_Ctrl.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupilmovements_trajectories_Ctrl.pdf',P.mouseID)
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose','-fillpage',figname)
    figname = sprintf('%s_pupilmovements_trajectories_Ctrl.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Polar plot

    % Divide the saccades into quadrants
    figure; hold on;
    R.pupmov_quad_up_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_leftup_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_left_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_leftdown_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_down_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_rightdown_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_right_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_rightup_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.saccadeLength_US =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_US_centered,1)
        idx = [R.pupmov_location_steps_X_avg_US_centered(ii,10) R.pupmov_location_steps_Y_avg_US_centered(ii,10)];
        R.saccadeLength_US(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_US = nanmean(R.saccadeLength_US);
    R.saccadeLength_SD_US = nanstd(R.saccadeLength_US);
    for ii=1:size(R.pupmov_location_steps_X_avg_US_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_US_centered(ii,10) R.pupmov_location_steps_Y_avg_US_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_US(ii)=R.saccadeLength_US(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_US(ii)=R.saccadeLength_US(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_US(ii)=R.saccadeLength_US(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_US(ii)=R.saccadeLength_US(ii);
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_US(ii)=R.saccadeLength_US(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_US(ii)=R.saccadeLength_US(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_US(ii)=R.saccadeLength_US(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_US(ii)=R.saccadeLength_US(ii);
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(1)=subplot(2,3,1);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts_US = [nansum(R.pupmov_quad_rightdown_US) nansum(R.pupmov_quad_down_US)...
        nansum(R.pupmov_quad_leftdown_US) nansum(R.pupmov_quad_left_US)...
        nansum(R.pupmov_quad_leftup_US) nansum(R.pupmov_quad_up_US)...
        nansum(R.pupmov_quad_rightup_US) nansum(R.pupmov_quad_right_US) ];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_US);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _US');

    % -------------------------------
    R.pupmov_quad_up_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_leftup_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_left_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_leftdown_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_down_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_rightdown_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_right_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_rightup_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.saccadeLength_opto0 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto0_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto0_centered(ii,10) R.pupmov_location_steps_Y_avg_opto0_centered(ii,10)];
        R.saccadeLength_opto0(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto0 = nanmean(R.saccadeLength_opto0);
    R.saccadeLength_SD_opto0 = nanstd(R.saccadeLength_opto0);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto0_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto0_centered(ii,10) R.pupmov_location_steps_Y_avg_opto0_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto0(ii)=R.saccadeLength_opto0(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto0(ii)=R.saccadeLength_opto0(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto0(ii)=R.saccadeLength_opto0(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto0(ii)=R.saccadeLength_opto0(ii);
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto0(ii)=R.saccadeLength_opto0(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto0(ii)=R.saccadeLength_opto0(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto0(ii)=R.saccadeLength_opto0(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto0(ii)=R.saccadeLength_opto0(ii);
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(2)=subplot(2,3,2);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts_opto0 = [nansum(R.pupmov_quad_rightdown_opto0) nansum(R.pupmov_quad_down_opto0)...
        nansum(R.pupmov_quad_leftdown_opto0) nansum(R.pupmov_quad_left_opto0)...
        nansum(R.pupmov_quad_leftup_opto0) nansum(R.pupmov_quad_up_opto0)...
        nansum(R.pupmov_quad_rightup_opto0) nansum(R.pupmov_quad_right_opto0) ];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto0);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto0');

    % -------------------------------
    R.pupmov_quad_up_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_leftup_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_left_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_leftdown_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_down_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_rightdown_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_right_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_rightup_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.saccadeLength_opto25 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto25_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto25_centered(ii,10) R.pupmov_location_steps_Y_avg_opto25_centered(ii,10)];
        R.saccadeLength_opto25(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto25 = nanmean(R.saccadeLength_opto25);
    R.saccadeLength_SD_opto25 = nanstd(R.saccadeLength_opto25);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto25_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto25_centered(ii,10) R.pupmov_location_steps_Y_avg_opto25_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto25(ii)=R.saccadeLength_opto25(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto25(ii)=R.saccadeLength_opto25(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto25(ii)=R.saccadeLength_opto25(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto25(ii)=R.saccadeLength_opto25(ii);
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto25(ii)=R.saccadeLength_opto25(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto25(ii)=R.saccadeLength_opto25(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto25(ii)=R.saccadeLength_opto25(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto25(ii)=R.saccadeLength_opto25(ii);
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(3)=subplot(2,3,3);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts_opto25 = [nansum(R.pupmov_quad_rightdown_opto25) nansum(R.pupmov_quad_down_opto25)...
        nansum(R.pupmov_quad_leftdown_opto25) nansum(R.pupmov_quad_left_opto25)...
        nansum(R.pupmov_quad_leftup_opto25) nansum(R.pupmov_quad_up_opto25)...
        nansum(R.pupmov_quad_rightup_opto25) nansum(R.pupmov_quad_right_opto25) ];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto25);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto25');

    % -------------------------------
    R.pupmov_quad_up_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_leftup_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_left_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_leftdown_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_down_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_rightdown_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_right_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_rightup_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.saccadeLength_opto50 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto50_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto50_centered(ii,10) R.pupmov_location_steps_Y_avg_opto50_centered(ii,10)];
        R.saccadeLength_opto50(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto50 = nanmean(R.saccadeLength_opto50);
    R.saccadeLength_SD_opto50 = nanstd(R.saccadeLength_opto50);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto50_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto50_centered(ii,10) R.pupmov_location_steps_Y_avg_opto50_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto50(ii)=R.saccadeLength_opto50(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto50(ii)=R.saccadeLength_opto50(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto50(ii)=R.saccadeLength_opto50(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto50(ii)=R.saccadeLength_opto50(ii);
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto50(ii)=R.saccadeLength_opto50(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto50(ii)=R.saccadeLength_opto50(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto50(ii)=R.saccadeLength_opto50(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto50(ii)=R.saccadeLength_opto50(ii);
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(4)=subplot(2,3,4);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts_opto50 = [nansum(R.pupmov_quad_rightdown_opto50) nansum(R.pupmov_quad_down_opto50)...
        nansum(R.pupmov_quad_leftdown_opto50) nansum(R.pupmov_quad_left_opto50)...
        nansum(R.pupmov_quad_leftup_opto50) nansum(R.pupmov_quad_up_opto50)...
        nansum(R.pupmov_quad_rightup_opto50) nansum(R.pupmov_quad_right_opto50) ];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto50);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto50');

    % -------------------------------
    R.pupmov_quad_up_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_leftup_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_left_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_leftdown_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_down_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_rightdown_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_right_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_rightup_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.saccadeLength_opto75 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto75_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto75_centered(ii,10) R.pupmov_location_steps_Y_avg_opto75_centered(ii,10)];
        R.saccadeLength_opto75(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto75 = nanmean(R.saccadeLength_opto75);
    R.saccadeLength_SD_opto75 = nanstd(R.saccadeLength_opto75);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto75_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto75_centered(ii,10) R.pupmov_location_steps_Y_avg_opto75_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto75(ii)=R.saccadeLength_opto75(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto75(ii)=R.saccadeLength_opto75(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto75(ii)=R.saccadeLength_opto75(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto75(ii)=R.saccadeLength_opto75(ii);
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto75(ii)=R.saccadeLength_opto75(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto75(ii)=R.saccadeLength_opto75(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto75(ii)=R.saccadeLength_opto75(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto75(ii)=R.saccadeLength_opto75(ii);
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(5)=subplot(2,3,5);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts_opto75 = [nansum(R.pupmov_quad_rightdown_opto75) nansum(R.pupmov_quad_down_opto75)...
        nansum(R.pupmov_quad_leftdown_opto75) nansum(R.pupmov_quad_left_opto75)...
        nansum(R.pupmov_quad_leftup_opto75) nansum(R.pupmov_quad_up_opto75)...
        nansum(R.pupmov_quad_rightup_opto75) nansum(R.pupmov_quad_right_opto75) ];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto75);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto75');

    % -------------------------------
    R.pupmov_quad_up_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_leftup_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_left_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_leftdown_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_down_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_rightdown_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_right_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_rightup_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.saccadeLength_opto100 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto100_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto100_centered(ii,10) R.pupmov_location_steps_Y_avg_opto100_centered(ii,10)];
        R.saccadeLength_opto100(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto100 = nanmean(R.saccadeLength_opto100);
    R.saccadeLength_SD_opto100 = nanstd(R.saccadeLength_opto100);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto100_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto100_centered(ii,10) R.pupmov_location_steps_Y_avg_opto100_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto100(ii)=R.saccadeLength_opto100(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto100(ii)=R.saccadeLength_opto100(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto100(ii)=R.saccadeLength_opto100(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto100(ii)=R.saccadeLength_opto100(ii);
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto100(ii)=R.saccadeLength_opto100(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto100(ii)=R.saccadeLength_opto100(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto100(ii)=R.saccadeLength_opto100(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto100(ii)=R.saccadeLength_opto100(ii);
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(6)=subplot(2,3,6);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts_opto100 = [nansum(R.pupmov_quad_rightdown_opto100) nansum(R.pupmov_quad_down_opto100)...
        nansum(R.pupmov_quad_leftdown_opto100) nansum(R.pupmov_quad_left_opto100)...
        nansum(R.pupmov_quad_leftup_opto100) nansum(R.pupmov_quad_up_opto100)...
        nansum(R.pupmov_quad_rightup_opto100) nansum(R.pupmov_quad_right_opto100) ];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto100);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto100');

    %         linkaxes(l,'x')

    % Save figure
    figname = sprintf('%s_saccadeDirectionPolarplots_Ctrl.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_saccadeDirectionPolarplots_Ctrl.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_saccadeDirectionPolarplots_Ctrl.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Plot the cumulative sum of the graphs

    figure; hold on;
    j(1)=subplot(2,3,1);
    R.pupmov_cumsum_baseline_US=[];
    R.pupmov_cumsum_opto_US=[];
    for ii=1:size(P.fileList,2)
        idx = S.pupmov_US(ii,:)-nanmean(S.pupmov_US(ii,1:round(0.5*P.fs)));
        S.pupmov_cumsum_baseline_US(ii,:) = cumsum(idx(round(0.25*P.fs):round(0.5*P.fs)));
        plot(S.pupmov_cumsum_baseline_US(ii,:),'k')
        S.pupmov_cumsum_opto_US(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
        plot(S.pupmov_cumsum_opto_US(ii,:),'b')
    end

    S.pupmov_cumsum_baseline_avg_US = nanmean(S.pupmov_cumsum_baseline_US);
    S.pupmov_cumsum_opto_avg_US = nanmean(S.pupmov_cumsum_opto_US);
    S.pupmov_cumsum_baseline_SD_US = nanstd(S.pupmov_cumsum_baseline_US);
    S.pupmov_cumsum_opto_SD_US = nanstd(S.pupmov_cumsum_opto_US);
    S.pupmov_cumsum_baseline_SEM_US = nanstd(S.pupmov_cumsum_baseline_US)/sqrt(size(S.pupmov_cumsum_baseline_US,1));
    S.pupmov_cumsum_opto_SEM_US = nanstd(S.pupmov_cumsum_opto_US)/sqrt(size(S.pupmov_cumsum_opto_US,1));

    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_baseline_avg_US,S.pupmov_cumsum_baseline_SEM_US,'k'); hold on;
    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_US,S.pupmov_cumsum_opto_SEM_US,'b');
    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)');
    %     legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    title('Cumulative sum _US')

    % --------------------------------
    j(2)=subplot(2,3,2);
    R.pupmov_cumsum_baseline_opto0=[];
    R.pupmov_cumsum_opto_opto0=[];
    for ii=1:size(P.fileList,2)
        idx = S.pupmov_US_opto0(ii,:)-nanmean(S.pupmov_US_opto0(ii,1:round(0.5*P.fs)));
        S.pupmov_cumsum_baseline_opto0(ii,:) = cumsum(idx(round(0.25*P.fs):round(0.5*P.fs)));
        plot(S.pupmov_cumsum_baseline_opto0(ii,:),'k')
        S.pupmov_cumsum_opto_opto0(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
        plot(S.pupmov_cumsum_opto_opto0(ii,:),'b')
    end

    S.pupmov_cumsum_baseline_avg_opto0 = nanmean(S.pupmov_cumsum_baseline_opto0);
    S.pupmov_cumsum_opto_avg_opto0 = nanmean(S.pupmov_cumsum_opto_opto0);
    S.pupmov_cumsum_baseline_SD_opto0 = nanstd(S.pupmov_cumsum_baseline_opto0);
    S.pupmov_cumsum_opto_SD_opto0 = nanstd(S.pupmov_cumsum_opto_opto0);
    S.pupmov_cumsum_baseline_SEM_opto0 = nanstd(S.pupmov_cumsum_baseline_opto0)/sqrt(size(S.pupmov_cumsum_baseline_opto0,1));
    S.pupmov_cumsum_opto_SEM_opto0 = nanstd(S.pupmov_cumsum_opto_opto0)/sqrt(size(S.pupmov_cumsum_opto_opto0,1));

    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_baseline_avg_opto0,S.pupmov_cumsum_baseline_SEM_opto0,'k'); hold on;
    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto0,S.pupmov_cumsum_opto_SEM_opto0,'b');
    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)');
    %     legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    title('Cumulative sum _opto0')

    % --------------------------------
    j(3)=subplot(2,3,3);
    R.pupmov_cumsum_baseline_opto25=[];
    R.pupmov_cumsum_opto_opto25=[];
    for ii=1:size(P.fileList,2)
        idx = S.pupmov_US_opto25(ii,:)-nanmean(S.pupmov_US_opto25(ii,1:round(0.5*P.fs)));
        S.pupmov_cumsum_baseline_opto25(ii,:) = cumsum(idx(round(0.25*P.fs):round(0.5*P.fs)));
        plot(S.pupmov_cumsum_baseline_opto25(ii,:),'k')
        S.pupmov_cumsum_opto_opto25(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
        plot(S.pupmov_cumsum_opto_opto25(ii,:),'b')
    end

    S.pupmov_cumsum_baseline_avg_opto25 = nanmean(S.pupmov_cumsum_baseline_opto25);
    S.pupmov_cumsum_opto_avg_opto25 = nanmean(S.pupmov_cumsum_opto_opto25);
    S.pupmov_cumsum_baseline_SD_opto25 = nanstd(S.pupmov_cumsum_baseline_opto25);
    S.pupmov_cumsum_opto_SD_opto25 = nanstd(S.pupmov_cumsum_opto_opto25);
    S.pupmov_cumsum_baseline_SEM_opto25 = nanstd(S.pupmov_cumsum_baseline_opto25)/sqrt(size(S.pupmov_cumsum_baseline_opto25,1));
    S.pupmov_cumsum_opto_SEM_opto25 = nanstd(S.pupmov_cumsum_opto_opto25)/sqrt(size(S.pupmov_cumsum_opto_opto25,1));

    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_baseline_avg_opto25,S.pupmov_cumsum_baseline_SEM_opto25,'k'); hold on;
    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto25,S.pupmov_cumsum_opto_SEM_opto25,'b');
    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)');
    %     legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    title('Cumulative sum _opto25')

    % --------------------------------
    j(4)=subplot(2,3,4);
    R.pupmov_cumsum_baseline_opto50=[];
    R.pupmov_cumsum_opto_opto50=[];
    for ii=1:size(P.fileList,2)
        idx = S.pupmov_US_opto50(ii,:)-nanmean(S.pupmov_US_opto50(ii,1:round(0.5*P.fs)));
        S.pupmov_cumsum_baseline_opto50(ii,:) = cumsum(idx(round(0.25*P.fs):round(0.5*P.fs)));
        plot(S.pupmov_cumsum_baseline_opto50(ii,:),'k')
        S.pupmov_cumsum_opto_opto50(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
        plot(S.pupmov_cumsum_opto_opto50(ii,:),'b')
    end

    S.pupmov_cumsum_baseline_avg_opto50 = nanmean(S.pupmov_cumsum_baseline_opto50);
    S.pupmov_cumsum_opto_avg_opto50 = nanmean(S.pupmov_cumsum_opto_opto50);
    S.pupmov_cumsum_baseline_SD_opto50 = nanstd(S.pupmov_cumsum_baseline_opto50);
    S.pupmov_cumsum_opto_SD_opto50 = nanstd(S.pupmov_cumsum_opto_opto50);
    S.pupmov_cumsum_baseline_SEM_opto50 = nanstd(S.pupmov_cumsum_baseline_opto50)/sqrt(size(S.pupmov_cumsum_baseline_opto50,1));
    S.pupmov_cumsum_opto_SEM_opto50 = nanstd(S.pupmov_cumsum_opto_opto50)/sqrt(size(S.pupmov_cumsum_opto_opto50,1));

    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_baseline_avg_opto50,S.pupmov_cumsum_baseline_SEM_opto50,'k'); hold on;
    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto50,S.pupmov_cumsum_opto_SEM_opto50,'b');
    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)');
    %     legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    title('Cumulative sum _opto50')

    % --------------------------------
    j(5)=subplot(2,3,5);
    R.pupmov_cumsum_baseline_opto75=[];
    R.pupmov_cumsum_opto_opto75=[];
    for ii=1:size(P.fileList,2)
        idx = S.pupmov_US_opto75(ii,:)-nanmean(S.pupmov_US_opto75(ii,1:round(0.5*P.fs)));
        S.pupmov_cumsum_baseline_opto75(ii,:) = cumsum(idx(round(0.25*P.fs):round(0.5*P.fs)));
        plot(S.pupmov_cumsum_baseline_opto75(ii,:),'k')
        S.pupmov_cumsum_opto_opto75(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
        plot(S.pupmov_cumsum_opto_opto75(ii,:),'b')
    end

    S.pupmov_cumsum_baseline_avg_opto75 = nanmean(S.pupmov_cumsum_baseline_opto75);
    S.pupmov_cumsum_opto_avg_opto75 = nanmean(S.pupmov_cumsum_opto_opto75);
    S.pupmov_cumsum_baseline_SD_opto75 = nanstd(S.pupmov_cumsum_baseline_opto75);
    S.pupmov_cumsum_opto_SD_opto75 = nanstd(S.pupmov_cumsum_opto_opto75);
    S.pupmov_cumsum_baseline_SEM_opto75 = nanstd(S.pupmov_cumsum_baseline_opto75)/sqrt(size(S.pupmov_cumsum_baseline_opto75,1));
    S.pupmov_cumsum_opto_SEM_opto75 = nanstd(S.pupmov_cumsum_opto_opto75)/sqrt(size(S.pupmov_cumsum_opto_opto75,1));

    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_baseline_avg_opto75,S.pupmov_cumsum_baseline_SEM_opto75,'k'); hold on;
    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto75,S.pupmov_cumsum_opto_SEM_opto75,'b');
    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)');
    %     legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    title('Cumulative sum _opto75')


    % --------------------------------
    j(6)=subplot(2,3,6);
    R.pupmov_cumsum_baseline_opto100=[];
    R.pupmov_cumsum_opto_opto100=[];
    for ii=1:size(P.fileList,2)
        idx = S.pupmov_US_opto100(ii,:)-nanmean(S.pupmov_US_opto100(ii,1:round(0.5*P.fs)));
        S.pupmov_cumsum_baseline_opto100(ii,:) = cumsum(idx(round(0.25*P.fs):round(0.5*P.fs)));
        plot(S.pupmov_cumsum_baseline_opto100(ii,:),'k')
        S.pupmov_cumsum_opto_opto100(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
        plot(S.pupmov_cumsum_opto_opto100(ii,:),'b')
    end

    S.pupmov_cumsum_baseline_avg_opto100 = nanmean(S.pupmov_cumsum_baseline_opto100);
    S.pupmov_cumsum_opto_avg_opto100 = nanmean(S.pupmov_cumsum_opto_opto100);
    S.pupmov_cumsum_baseline_SD_opto100 = nanstd(S.pupmov_cumsum_baseline_opto100);
    S.pupmov_cumsum_opto_SD_opto100 = nanstd(S.pupmov_cumsum_opto_opto100);
    S.pupmov_cumsum_baseline_SEM_opto100 = nanstd(S.pupmov_cumsum_baseline_opto100)/sqrt(size(S.pupmov_cumsum_baseline_opto100,1));
    S.pupmov_cumsum_opto_SEM_opto100 = nanstd(S.pupmov_cumsum_opto_opto100)/sqrt(size(S.pupmov_cumsum_opto_opto100,1));

    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_baseline_avg_opto100,S.pupmov_cumsum_baseline_SEM_opto100,'k'); hold on;
    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto100,S.pupmov_cumsum_opto_SEM_opto100,'b');
    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)');
    %     legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    title('Cumulative sum _opto100')

    % Save figure
    figname = sprintf('%s_cumsum_baselineVsOpto_Ctrl.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_cumsum_baselineVsOpto_Ctrl.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_cumsum_baselineVsOpto_Ctrl.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Plot all the cumulative plots after stimulus together

    figure; hold on;
    plot([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_US,'LineWidth',1.5);
    plot([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto0,'LineWidth',1.5);
    plot([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto25,'LineWidth',1.5);
    plot([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto50,'LineWidth',1.5);
    plot([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto75,'LineWidth',1.5);
    plot([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg_opto100,'LineWidth',1.5);

    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)');
    %     legend({'Baseline' 'Opto'})
    %     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    title('Pupil movement cumulative distribution')
    %     linkaxes(h,'xy')
    xlim([0 0.25])
    %     ylim([0 0.75])
    lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100')
    lgd.Location = 'northwest'
    % Save figure
    figname = sprintf('%s_pupilmovements_cumsum_Ctrl.fig',P.mouseID);
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupilmovements_cumsum_Ctrl.pdf',P.mouseID);
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_pupilmovements_cumsum_Ctrl.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Pupil diameter figures

    %US only
    figure;
    q(1)=subplot(2,3,1);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupdist_US_avg,2)),S.pupdist_US(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupdist_US_avg,2)),S.pupdist_US_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    % line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    title('Pupil diameter US')

    % % Save figure
    %     figname = sprintf('%s_pupildiameters_indTrials_US.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupildiameters_indTrials_US.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto0
    q(2)=subplot(2,3,2);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupdist_US_opto0_avg,2)),S.pupdist_US_opto0(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupdist_US_opto0_avg,2)),S.pupdist_US_opto0_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pupil diameter US_opto0')

    % % Save figure
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto0.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto0.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto25
    q(3)=subplot(2,3,3);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupdist_US_opto25_avg,2)),S.pupdist_US_opto25(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupdist_US_opto25_avg,2)),S.pupdist_US_opto25_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.025 0.025],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pupil diameter US_opto25')

    % % Save figure
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto25.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto25.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto50
    q(4)=subplot(2,3,4);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupdist_US_opto50_avg,2)),S.pupdist_US_opto50(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupdist_US_opto50_avg,2)),S.pupdist_US_opto50_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pupil diameter US_opto50')

    % % Save figure
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto50.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto50.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto75
    q(5)=subplot(2,3,5);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupdist_US_opto75_avg,2)),S.pupdist_US_opto75(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupdist_US_opto75_avg,2)),S.pupdist_US_opto75_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.075 0.075],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pupil diameter US_opto75')

    % % Save figure
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto75.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto75.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    %% US+opto100
    q(6)=subplot(2,3,6);hold on;
    for ii=1:xx
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupdist_US_opto100_avg,2)),S.pupdist_US_opto100(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupdist_US_opto100_avg,2)),S.pupdist_US_opto100_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
    title('Pupil diameter US_opto100')

    % % Save figure
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto100.fig',P.mouseID)
    %     saveas(gcf,figname,'fig');
    %     figname = sprintf('%s_pupildiameters_indTrials_US_opto100.pdf',P.mouseID)
    %     print('-dpdf','-vector','-loose',figname)

    linkaxes(q,'xy')
    xlim([-0.25 0.5])
    %     ylim([0 0.75])

    % Save figure
    figname = sprintf('%s_pupildiameters_indTrials_US_Ctrl_optoALL.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupildiameters_indTrials_US_Ctrl_optoALL.pdf',P.mouseID)
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose','-fillpage',figname)
    figname = sprintf('%s_pupildiameters_indTrials_US_Ctrl_optoALL.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Average pupil movements

    figure; hold on;
    plot(P.xaxis(1:size(S.pupmov_US_avg,2)),S.pupmov_US_avg,'LineWidth',1.5);
    plot(P.xaxis(1:size(S.pupmov_US_opto0_avg,2)),S.pupmov_US_opto0_avg,'LineWidth',1.5);
    plot(P.xaxis(1:size(S.pupmov_US_opto25_avg,2)),S.pupmov_US_opto25_avg,'LineWidth',1.5);
    plot(P.xaxis(1:size(S.pupmov_US_opto50_avg,2)),S.pupmov_US_opto50_avg,'LineWidth',1.5);
    plot(P.xaxis(1:size(S.pupmov_US_opto75_avg,2)),S.pupmov_US_opto75_avg,'LineWidth',1.5);
    plot(P.xaxis(1:size(S.pupmov_US_opto100_avg,2)),S.pupmov_US_opto100_avg,'LineWidth',1.5);

    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    xlim([-0.25 0.5])
    lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');

    % Save figure
    figname = sprintf('%s_pupilmovements_AVG.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupilmovements_AVG.pdf',P.mouseID)
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_pupilmovements_AVG.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')


    %% Save the data
    P.savename = sprintf('%s_pupil_data_Ctrl.mat',P.mouseID);
    save(P.savename,'data','P','S','R',"-v7.3");
end


