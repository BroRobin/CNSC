%% Analyze CSV files to extract pupil movements and pupil size
clear all;

for zz=11
    clearvars -except zz
    close all;
    if zz==1
        cd('')
        P.mouseID = '1007_50ms_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==2
        cd('')
        P.mouseID = '1007_100ms_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==3
        cd('')
        P.mouseID = '1007_lido_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==4
        cd('')
        P.mouseID = '1007_washout_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==5
        cd('')
        P.mouseID = '1008_50ms_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==6
        cd('')
        P.mouseID = '1008_100ms_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==7
        cd('') % EXCLUDE: EYE TOO MUCH CLOSED, UNRELIABLE TRACES
        P.mouseID = '1008_lido_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==8
        cd('')
        P.mouseID = '1008_washout_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==9
        cd('')
        P.mouseID = '1012_50ms_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==10
        cd('')
        P.mouseID = '1012_100ms_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==11
        cd('')
        P.mouseID = '1012_lido_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    elseif zz==12
        cd('')
        P.mouseID = '1012_washout_D3';
        P.filtFreq_pupmov = 25; %SD of gaussian filter
        P.filtFreq_pupdist = 10; %SD of gaussian filter
    end

    %% Load and process the data
    P.fileList = dir('*.csv');
    P.fileList = string({P.fileList .name});
    S.pupmov=NaN(150,750);
    S.pupdist=NaN(150,750);
    R.pupmov_location_steps_X_avg=NaN(size(P.fileList,2),11);
    R.pupmov_location_steps_Y_avg=NaN(size(P.fileList,2),11);

    for xx=1:size(P.fileList,2) % loop throught the csv files

        %     for xx=1:10 % loop throught the csv files
        sprintf('Processing file %.f of %.f',xx,size(P.fileList,2))
        P.filename = P.fileList(xx);
        data = readtable(P.filename);
        if ismember(xx,[1 12 23 34 45]) % Exclude US only trials
            continue;
        elseif size(data,1)<480 %
            continue;
        end

        %         if zz==3 && xx==33 % Clip outlier trials
        %             data{204:219,:}=NaN;
        %         elseif zz==4 && xx==26
        %             data{551:569,:}=NaN;
        %         elseif zz==5 && xx==3
        %             continue;
        %         end
        % figure; plot(data{:,3})
        P.fs = 320; %sampling frequency

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

        %
        %                 figure; hold on; plot(P.xaxis(1:size(R.pupdist_up_down_filt,2)),R.pupdist_up_down_filt);
        %                 plot(P.xaxis(1:size(R.pupdist_leftup_rightdown_filt,2)),R.pupdist_leftup_rightdown_filt);
        %                 plot(P.xaxis(1:size(R.pupdist_left_right_filt,2)),R.pupdist_leftdown_rightup_filt);
        %                 plot(P.xaxis(1:size(R.pupdist_leftdown_rightup_filt,2)),R.pupdist_leftdown_rightup_filt);
        %
        %                 plot(P.xaxis(1:size(R.pupdist_up_down_filt,2)),R.pupdist_mdn_filt,'k','LineWidth',2)
        %                 line([round(0) round(0)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
        %                 pause;

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
        %                 figure; hold on; plot(R.pupmov_up); plot(R.pupmov_down);plot(R.pupmov_center);plot(R.pupmov_leftup);plot(R.pupmov_rightdown);plot(R.pupmov_left);plot(R.pupmov_right);plot(R.pupmov_rightup);plot(R.pupmov_leftdown);
        %                 plot(R.pupmov_mdn,'k','LineWidth',2)
        %                 line([round(0.5*320) round(0.5*320)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
        % pause;

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

        % Filter the eyelid traces and express as % of eye width per second
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

        for ii=1:size(R.pupmov_up_filt,2)
            R.pupmov_mdn_filt(ii)=median([R.pupmov_up_filt(ii),R.pupmov_down_filt(ii),R.pupmov_center_filt(ii),R.pupmov_leftup_filt(ii),R.pupmov_rightdown_filt(ii),R.pupmov_left_filt(ii),...
                R.pupmov_right_filt(ii),R.pupmov_rightup_filt(ii),R.pupmov_leftdown_filt(ii)]);
        end
        R.pupmov_mdn_filt = R.pupmov_mdn_filt-nanmean(R.pupmov_mdn_filt(round(0.25*P.fs):round(0.5*P.fs))); % normalize to the 250ms before the start stim

        % figure; hold on; plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_up_filt); plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_down_filt);plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_center_filt);plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_leftup_filt);plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_rightdown_filt);plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_left_filt);plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_right_filt);plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_rightup_filt);plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_leftdown_filt);
        %                 plot(P.xaxis(1:size(R.pupmov_up_filt,2)),R.pupmov_mdn_filt,'k','LineWidth',2)
        %                 line([round(0) round(0)],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
        %                 pause;


        %% Pupil movements start to end (-250 ms versus 250 ms after opto)

        R.pupmov_up_steps=[];
        R.pupmov_down_steps=[];
        R.pupmov_center_steps=[];
        R.pupmov_leftup_steps=[];
        R.pupmov_rightdown_steps=[];
        R.pupmov_left_steps=[];
        R.pupmov_right_steps=[];
        R.pupmov_rightup_steps=[];
        R.pupmov_leftdown_steps=[];
        R.pupmov_mdn_steps = [];

        R.pupmov_location_steps_X=[];
        R.pupmov_location_steps_Y=[];

        for ii= 1:11 % 11 time points centered around start stim (250 ms each side, 50 ms spacing)
            P.frame = [(0.2*P.fs)+((ii*0.05)*P.fs) (0.2*P.fs)+(((ii+1)*0.05)*P.fs)];

            R.pupmov_location_steps_X(1,ii)=data{P.frame(1),11};
            R.pupmov_location_steps_X(2,ii)=data{P.frame(1),23} ;
            R.pupmov_location_steps_X(3,ii)=data{P.frame(1),8};
            R.pupmov_location_steps_X(4,ii)=data{P.frame(1),14};
            R.pupmov_location_steps_X(5,ii)=data{P.frame(1),26};
            R.pupmov_location_steps_X(6,ii)=data{P.frame(1),17} ;
            R.pupmov_location_steps_X(7,ii)=data{P.frame(1),29};
            R.pupmov_location_steps_X(8,ii)=data{P.frame(1),32};
            R.pupmov_location_steps_X(9,ii)=data{P.frame(1),20};

            R.pupmov_location_steps_Y(1,ii)=data{P.frame(1),12};
            R.pupmov_location_steps_Y(2,ii)=data{P.frame(1),24} ;
            R.pupmov_location_steps_Y(3,ii)=data{P.frame(1),9};
            R.pupmov_location_steps_Y(4,ii)=data{P.frame(1),15};
            R.pupmov_location_steps_Y(5,ii)=data{P.frame(1),27};
            R.pupmov_location_steps_Y(6,ii)=data{P.frame(1),18} ;
            R.pupmov_location_steps_Y(7,ii)=data{P.frame(1),30};
            R.pupmov_location_steps_Y(8,ii)=data{P.frame(1),33};
            R.pupmov_location_steps_Y(9,ii)=data{P.frame(1),21};

            %             R.pupmov_up_steps(ii)=sqrt((data{P.frame(2),11} - data{P.frame(1),11}).^2 + (data{P.frame(2),12} - data{P.frame(1),12}).^2);
            %             R.pupmov_down_steps(ii)=sqrt((data{P.frame(2),23} - data{P.frame(1),23}).^2 + (data{P.frame(2),24} - data{P.frame(1),24}).^2);
            %             R.pupmov_center_steps(ii)=sqrt((data{P.frame(2),8} - data{P.frame(1),8}).^2 + (data{P.frame(2),9} - data{P.frame(1),9}).^2);
            %             R.pupmov_leftup_steps(ii)=sqrt((data{P.frame(2),14} - data{P.frame(1),14}).^2 + (data{P.frame(2),15} - data{P.frame(1),15}).^2);
            %             R.pupmov_rightdown_steps(ii)=sqrt((data{P.frame(2),26} - data{P.frame(1),26}).^2 + (data{P.frame(2),27} - data{P.frame(1),27}).^2);
            %             R.pupmov_left_steps(ii)=sqrt((data{P.frame(2),17} - data{P.frame(1),17}).^2 + (data{P.frame(2),18} - data{P.frame(1),18}).^2);
            %             R.pupmov_right_steps(ii)=sqrt((data{P.frame(2),29} - data{P.frame(1),29}).^2 + (data{P.frame(2),30} - data{P.frame(1),30}).^2);
            %             R.pupmov_rightup_steps(ii)=sqrt((data{P.frame(2),32} - data{P.frame(1),32}).^2 + (data{P.frame(2),33} - data{P.frame(1),33}).^2);
            %             R.pupmov_leftdown_steps(ii)=sqrt((data{P.frame(2),20} - data{P.frame(1),20}).^2 + (data{P.frame(2),21} - data{P.frame(1),21}).^2);
            %             R.pupmov_mdn_steps(ii) = median([R.pupmov_up(ii),R.pupmov_down(ii), R.pupmov_center(ii), R.pupmov_leftup(ii), R.pupmov_rightdown(ii), R.pupmov_left(ii),R.pupmov_right(ii),R.pupmov_rightup(ii),R.pupmov_leftdown(ii)]);
        end
        R.pupmov_location_steps_X_avg(xx,:) = nanmean(R.pupmov_location_steps_X,1); % Average to get the central position of the eye as an average of all positions
        R.pupmov_location_steps_Y_avg(xx,:) = nanmean(R.pupmov_location_steps_Y,1);

        %         figure;R.pupmov_location_steps_Y_avg(xx,:) plot(R.pupmov_location_steps_X_avg,R.pupmov_location_steps_Y_avg,'-o')

        %% Write the important variables
        if zz==6&&xx==55
            S.pupmov(xx,1:length(R.pupmov_mdn_filt))=NaN;
            S.pupdist(xx,1:length(R.pupdist_mdn_filt))=NaN;
            S.pupdist_baseline(xx)=NaN;
        else
            S.pupmov(xx,1:length(R.pupmov_mdn_filt))=R.pupmov_mdn_filt;
            S.pupdist(xx,1:length(R.pupdist_mdn_filt))=R.pupdist_mdn_filt;
            S.pupdist_baseline(xx)=nanmean(S.pupdist(xx,1:round(0.5)*P.fs));
        end
    end

    % % Plot the trajectories from 0ms to 250ms after stim
    % figure; hold on;
    % for ii=1:size(P.fileList,2)
    %     R.pupmov_location_steps_X_avg_centered(ii,:)=R.pupmov_location_steps_X_avg(ii,:)-R.pupmov_location_steps_X_avg(ii,6);
    %     R.pupmov_location_steps_Y_avg_centered(ii,:)=R.pupmov_location_steps_Y_avg(ii,:)-R.pupmov_location_steps_Y_avg(ii,6);
    %     plot(R.pupmov_location_steps_X_avg_centered(ii,[6 11]),R.pupmov_location_steps_Y_avg_centered(ii,[6 11]),'-o')
    % end
    % title(['0-250ms after opto stim'])

    figure;
    subplot(1,2,1);hold on;
    for ii=1:size(P.fileList,2)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_centered(ii,:)=R.pupmov_location_steps_X_avg(ii,:)-R.pupmov_location_steps_X_avg(ii,6);
        R.pupmov_location_steps_Y_avg_centered(ii,:)=R.pupmov_location_steps_Y_avg(ii,:)-R.pupmov_location_steps_Y_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_centered(ii,[6 8]),R.pupmov_location_steps_Y_avg_centered(ii,[6 8]),'-o')
    end
    title(['Saccades 0-100ms after stimulus'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_centered(:,8)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_centered(:,8))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_centered(:,8)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_centered(:,8))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on
    % figure; hold on;
    % for ii=1:size(P.fileList,2)
    %     R.pupmov_location_steps_X_avg_centered(ii,:)=R.pupmov_location_steps_X_avg(ii,:)-R.pupmov_location_steps_X_avg(ii,6);
    %     R.pupmov_location_steps_Y_avg_centered(ii,:)=R.pupmov_location_steps_Y_avg(ii,:)-R.pupmov_location_steps_Y_avg(ii,6);
    %     plot(R.pupmov_location_steps_X_avg_centered(ii,[6:11]),R.pupmov_location_steps_Y_avg_centered(ii,[6:11]),'-o')
    % end
    % title(['0-50-100-150-200-250ms after opto stim'])

    %% Divide the saccades into quadrants
    R.pupmov_quad_up=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);
    R.pupmov_quad_leftup=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);
    R.pupmov_quad_left=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);
    R.pupmov_quad_leftdown=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);
    R.pupmov_quad_down=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);
    R.pupmov_quad_rightdown=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);
    R.pupmov_quad_right=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);
    R.pupmov_quad_rightup=NaN(size(R.pupmov_location_steps_X_avg_centered,1),1);

    R.saccadeLength =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_centered,1)
        idx = [R.pupmov_location_steps_X_avg_centered(ii,8) R.pupmov_location_steps_Y_avg_centered(ii,8)];
        R.saccadeLength(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg = nanmean(R.saccadeLength);
    R.saccadeLength_SD = nanstd(R.saccadeLength);


    for ii=1:size(R.pupmov_location_steps_X_avg_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_centered(ii,8) R.pupmov_location_steps_Y_avg_centered(ii,8)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup(ii)=R.saccadeLength(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right(ii)=R.saccadeLength(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down(ii)=R.saccadeLength(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown(ii)=R.saccadeLength(ii);
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up(ii)=R.saccadeLength(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup(ii)=R.saccadeLength(ii);
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown(ii)=R.saccadeLength(ii);
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left(ii)=R.saccadeLength(ii);
                end
            end
        end
    end
    % end

    % Make the polar plot

    subplot(1,2,2);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts = [nansum(R.pupmov_quad_rightdown) nansum(R.pupmov_quad_down)...
        nansum(R.pupmov_quad_leftdown) nansum(R.pupmov_quad_left)...
        nansum(R.pupmov_quad_leftup) nansum(R.pupmov_quad_up)...
        nansum(R.pupmov_quad_rightup) nansum(R.pupmov_quad_right) ];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts);

    % Optional: add labels for each quadrant
    % hps.ThetaZeroLocation = 'top';                                  % Change Angle Origin
    % hps.ThetaDir = 'clockwise';
    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    % set(gca,'ThetaZeroLocation', 'bottom')
    % ax.ThetaTick = 0:45:315; % 8 ticks at 45° intervals
    % ax.TickLabel = {'0°', '45°', '90°', '135°', '180°', '225°', '270°', '315°'};

    title('Weighted saccade direction');

    % Save figure
    figname = sprintf('%s_saccadeDirection_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_saccadeDirection_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_saccadeDirection_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Calculate the cumulative sum of movement
    figure; hold on;
    R.pupmov_cumsum_baseline=[];
    R.pupmov_cumsum_opto=[];
    for ii=1:size(P.fileList,2)
        idx = S.pupmov(ii,:)-nanmean(S.pupmov(ii,1:round(0.5*P.fs)));
        S.pupmov_cumsum_baseline(ii,:) = cumsum(idx(round(0.25*P.fs):round(0.5*P.fs)));
        plot(S.pupmov_cumsum_baseline(ii,:),'k')
        S.pupmov_cumsum_opto(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
        plot(S.pupmov_cumsum_opto(ii,:),'b')
    end

    S.pupmov_cumsum_baseline_avg = nanmean(S.pupmov_cumsum_baseline);
    S.pupmov_cumsum_opto_avg = nanmean(S.pupmov_cumsum_opto);
    S.pupmov_cumsum_baseline_SD = nanstd(S.pupmov_cumsum_baseline);
    S.pupmov_cumsum_opto_SD = nanstd(S.pupmov_cumsum_opto);
    S.pupmov_cumsum_baseline_SEM = nanstd(S.pupmov_cumsum_baseline)/sqrt(size(S.pupmov_cumsum_baseline,1));
    S.pupmov_cumsum_opto_SEM = nanstd(S.pupmov_cumsum_opto)/sqrt(size(S.pupmov_cumsum_opto,1));

    figure; hold on; shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_baseline_avg,S.pupmov_cumsum_baseline_SEM,'k');
    shadedErrorBar([0:(1/P.fs):0.25],S.pupmov_cumsum_opto_avg,S.pupmov_cumsum_opto_SEM,'b');
    ylabel('Cumul. sum pupil movements (arb. units)'); xlabel('Time (s)'); legend({'Baseline' 'Opto'})
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    %      set(gca, 'YScale', 'log')
    % Save figure
    figname = sprintf('%s_cumsum_baselineVsOpto_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_cumsum_baselineVsOpto_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_cumsum_baselineVsOpto_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Calculate stats

    S.pupmov_avg = nanmean(S.pupmov);
    S.pupdist_avg = nanmean(S.pupdist);
    for ii = 1:size(P.fileList,2)
        S.pupdist_baselined(ii,:)=S.pupdist(ii,:)-S.pupdist_baseline(ii);

        S.pupmov_amp_baseline(ii,1) = nanmax(S.pupmov(ii,(0.25*P.fs):(0.5*P.fs)));
        S.pupmov_amp(ii,1) = nanmax(S.pupmov(ii,(0.5*P.fs):(0.75*P.fs))); % to 250ms after start stim

        if isnan(S.pupmov(ii,(0.5*P.fs)))==0
            S.pupmov_area_baseline(ii,1) = nansum(S.pupmov(ii,(0.25*P.fs):(0.5*P.fs)));
            S.pupmov_area(ii,1) = nansum(S.pupmov(ii,(0.5*P.fs):(0.75*P.fs)));
        elseif isnan(S.pupmov(ii,(0.5*P.fs)))==1
            S.pupmov_area(ii,1)=NaN;
            S.pupmov_area_baseline(ii,1) = NaN;
        end

        S.pupdist_amp_baseline(ii,1) = nanmax(S.pupdist_baselined(ii,(0.25*P.fs):(0.5*P.fs)));
        S.pupdist_amp(ii,1) = nanmax(S.pupdist_baselined(ii,(0.5*P.fs):(0.75*P.fs)));
        if isnan(S.pupdist(ii,(0.5*P.fs)))==0
            S.pupdist_area_baseline(ii,1) = nansum(S.pupdist_baselined(ii,(0.25*P.fs):(0.5*P.fs)));
            S.pupdist_area(ii,1) = nansum(S.pupdist_baselined(ii,(0.5*P.fs):(0.75*P.fs)));
        elseif isnan(S.pupdist(ii,(0.5*P.fs)))==1
            S.pupdist_area_baseline(ii,1) = NaN;
            S.pupdist_area(ii,1) = NaN;
        end

        S.pupdist_avg_baseline(ii,1) = nanmean(S.pupdist(ii,(0.25*P.fs):(0.5*P.fs)));
    end
    S.pupdist_baselined_avg = nanmean(S.pupdist_baselined);

    % Correlate baseline pupil size with the amplitude of the pupilmovement

    figure; hold on; plot(S.pupdist_baseline,S.pupmov_amp,'bo');
    xlabel('Baseline pupil diameter (%eye width)')
    ylabel('Max pupil velocity after opto (%eye width/s)')

    % Save figure
    figname = sprintf('%s_correlationPupdiameterVsmaxpupVel_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_correlationPupdiameterVsmaxpupVel_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_correlationPupdiameterVsmaxpupVel_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    % Correlate baseline pupil size with the area of the pupilmovement
    figure; hold on; plot(S.pupdist_baseline,S.pupmov_area,'bo');
    xlabel('Baseline pupil diameter (%eye width)')
    ylabel('Pupil velocity after opto (area)')

    figname = sprintf('%s_correlationPupdiameterVsareapupVel_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_correlationPupdiameterVsareapupVel_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_correlationPupdiameterVsareapupVel_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Create the figures
    figure; hold on;
    for ii=1:size(P.fileList,2)
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupmov_avg,2)),S.pupmov(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupmov_avg,2)),S.pupmov_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % Save figure
    figname = sprintf('%s_pupilmovements_indTrials_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupilmovements_indTrials_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_pupilmovements_indTrials_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    figure; hold on;
    for ii=1:size(P.fileList,2)
        %     if ii==9
        %         continue;
        %     end
        plot(P.xaxis(1:size(S.pupdist_baselined_avg,2)),S.pupdist_baselined(ii,:));
        % pause;
    end
    plot(P.xaxis(1:size(S.pupdist_baselined_avg,2)),S.pupdist_baselined_avg,'k','LineWidth',2);
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    xlabel('Time (s)'); ylabel('Pupil diameter (%eye width)')
    % Save figure
    figname = sprintf('%s_pupildiameter_indTrials_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupildiameter_indTrials_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_pupildiameter_indTrials_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    figure; hold on; shadedErrorBar(P.xaxis(1:size(S.pupmov_avg,2)),S.pupmov_avg,(nanstd(S.pupmov)/sqrt(size(P.fileList,2))));
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    xlim([-0.25 0.5])
    xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
    % Save figure
    figname = sprintf('%s_pupilmovementsAVG_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupilmovementsAVG_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_pupilmovementsAVG_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg');
    %     pause;


    figure; hold on; shadedErrorBar(P.xaxis(1:size(S.pupdist_baselined_avg,2)),S.pupdist_baselined_avg,(nanstd(S.pupdist_baselined)/sqrt(size(P.fileList,2))));
    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    xlim([-0.25 1.5]);
    xlabel('Time (s)'); ylabel('Pupil diameter (%eye width)')

    % Save figure
    figname = sprintf('%s_pupildiameterAVG_25Hzgauss.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupildiameterAVG_25Hzgauss.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_pupildiameterAVG_25Hzgauss.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Correlate pupil movements and baseline pupil diameter

    %remove NaNs;
    idx=[];
    % idx = [S.pupdist_baseline' S.pupmov_amp];
    % try
    for ii=1:size(P.fileList,2)
        if isnan(S.pupdist_baseline(ii))==0 && isnan(S.pupmov_amp(ii))==0
            idx=[idx; S.pupdist_baseline(ii) S.pupmov_amp(ii)];
        end
    end
    % end
    [S.pupdist_pupmov_max_corr_rho, S.pupdist_pupmov_max_corr_pval] = corr(idx(:,1),idx(:,2))


    %remove NaNs;
    idx=[];
    % idx = [S.pupdist_baseline' S.pupmov_area];
    for ii=1:size(P.fileList,2)
        if isnan(S.pupdist_baseline(ii))==0 && isnan(S.pupmov_area(ii))==0
            idx=[idx; S.pupdist_baseline(ii) S.pupmov_area(ii)];
        end
    end
    [S.pupdist_pupmov_area_corr_rho, S.pupdist_pupmov_area_corr_pval] = corr(idx(:,1),idx(:,2))

    %% Correlate whole body movements with pupil diameter
    % Save the data
    P.savename = sprintf('%s_pupil_data_25Hzgauss.mat',P.mouseID);
    save(P.savename,'data','P','S','R',"-v7.3");
    %     pause;
end

% figure; hold on;
% for ii=1:55
% plot(S.pupmov(ii,:))
% P.filename = P.fileList(ii)
% pause;
% end