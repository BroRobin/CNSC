%% Create stimulus boxes from the speed data
clear all;
close all;

analyse =3; %1=Sweep, 3=Loom,

cd('') %Path to analysis files
if analyse ==1
    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];
    % WT - sweep - all days
    Filenames = {
        'OpenField_2021-03-19 11-56-19_sweep_16847_resultQuantifications.mat'
        'OpenField_2021-03-19 12-13-31_sweep_16765_resultQuantifications.mat'
        'OpenField_2021-03-19 12-29-22_sweep_16848_resultQuantifications.mat'
        'OpenField_2021-03-19 13-03-25_sweep_16766_resultQuantifications.mat'
        'OpenField_2021-03-19 13-20-32_sweep_16849_resultQuantifications.mat'
        'OpenField_2021-03-19 13-46-10_sweep_16888_resultQuantifications.mat'
        'OpenField_2021-03-19 14-09-13_sweep_16772_resultQuantifications.mat'
        'OpenField_2021-03-19 14-26-18_sweep_16887_resultQuantifications.mat'
        'OpenField_2021-03-19 14-42-21_sweep_16763_resultQuantifications.mat'
        'OpenField_2021-03-19 14-57-38_sweep_16764_resultQuantifications.mat'
        'OpenField_2021-03-19 15-21-43_sweep_16767_resultQuantifications.mat'};

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [6942	7315
        7104 7104 % to make the colormap work
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        ];

    startanalysisFrame =[5182
        5980
        3300
        7818
        7212
        14071
        7644
        6656
        2458
        9480
        5329
        ];

    freeze_periods=[5982	6078	6113	6227
        6754	6971	NaN	NaN
        NaN	NaN	NaN	NaN
        8584	8687	NaN	NaN
        8007	8088	NaN	NaN
        NaN	NaN	NaN	NaN
        8401	8570	NaN	NaN
        7430	7616	NaN	NaN
        3221	3348	NaN	NaN
        10251	10328	NaN	NaN
        6113	6852	NaN	NaN

        ];

    escape_periods = [NaN NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        6453 6453 % for the colormap

        ];



elseif analyse ==3


    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];
    % WT - sweep - all days
    Filenames = {
        'OpenField_2021-03-19 12-01-17_loom_16847_resultQuantifications.mat'
        'OpenField_2021-03-19 12-18-25_loom_16765_resultQuantifications.mat'
        'OpenField_2021-03-19 12-33-37_loom_16848_resultQuantifications.mat'
        'OpenField_2021-03-19 13-08-44_loom_16766_resultQuantifications.mat'
        'OpenField_2021-03-19 13-25-39_loom_16849_resultQuantifications.mat'
        'OpenField_2021-03-19 13-52-58_loom_16888_resultQuantifications.mat'
        'OpenField_2021-03-19 14-15-12_loom_16772_resultQuantifications.mat'
        'OpenField_2021-03-19 14-31-14_loom_16887_resultQuantifications.mat'
        'OpenField_2021-03-19 14-46-22_loom_16763_resultQuantifications.mat'
        'OpenField_2021-03-19 15-07-57_loom_16764_resultQuantifications.mat'
        'OpenField_2021-03-19 15-26-16_loom_16767_resultQuantifications.mat'};

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [NaN	NaN
        NaN	NaN
        10653	11450
        NaN	NaN
        NaN	NaN
        NaN	NaN
        9097	11000
        5820	6860
        NaN	NaN
        10255	11600
        NaN	NaN



        ];

    startanalysisFrame =[2009
        4238
        8492
        5227
        5372
        5731
        8292
        4578
        3674
        8911
        3419

        ];

    freeze_periods=[2802	2943	NaN	NaN
        5026	5466	NaN	NaN
        NaN	NaN	NaN	NaN
        6025	6286	NaN	NaN
        6139	6212	NaN	NaN
        6519	6706	NaN	NaN
        NaN	NaN	NaN	NaN
        5350	5524	NaN	NaN
        4465	4505	NaN	NaN
        9691	9913	NaN	NaN
        4194	4252	NaN	NaN



        ];

    escape_periods = [2769	2801
        5001	5025
        NaN	NaN
        5989	6024
        NaN	NaN
        NaN	NaN
        9054	9096
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN



        ];

end

speed = [];
% med_det = [];
figure; hold on;
% for ii = 1:size(Filenames,1)
loadlist=[];
% for kk = 1:size(random_trials,1)
%     ii=random_trials(kk);
for ii = 1:size(Filenames,1)
    clearvars -except loadedTrials sortedTrials ii kk speed loadlist Filenames random_trials refuge_periods freeze_periods escape_periods startanalysisFrame analyse sortedTrials

    try
        load(char(Filenames(ii)))


    catch
        ii
        disp('Could not load:')
        char(Filenames(ii))
        %         pause;
    end

    try

        if size(result.speed,1)>0
            result.filt_speed_gauss = zeros(3750,1);

            loadlist = [loadlist;ii];
        end
    catch
        ii
        disp('could not process')
        char(Filenames(ii))

    end


    % convert freezing #1 (latency is from 0 to 4s after start stimulus)
    if isnan(freeze_periods(ii,1))==0
        if (freeze_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (freeze_periods(ii,1)-startanalysisFrame(ii))<(14*75) && (freeze_periods(ii,2)-startanalysisFrame(ii))<3750
            result.filt_speed_gauss((freeze_periods(ii,1)-startanalysisFrame(ii)):(freeze_periods(ii,2)-startanalysisFrame(ii))) = 1;
        elseif (freeze_periods(ii,1)-startanalysisFrame(ii))<(10*75)  && (freeze_periods(ii,1)-startanalysisFrame(ii))<(14*75) && (freeze_periods(ii,2)-startanalysisFrame(ii))<3750
            result.filt_speed_gauss((10*75):(freeze_periods(ii,2)-startanalysisFrame(ii))) = 1;
        elseif (freeze_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (freeze_periods(ii,1)-startanalysisFrame(ii))<(14*75) && (freeze_periods(ii,2)-startanalysisFrame(ii))>3750
            result.filt_speed_gauss((freeze_periods(ii,1)-startanalysisFrame(ii)):3750) = 1;
        else
            ii
            disp('freeze period 1 excluded')
        end
    end

    % convert freezing #2
    if isnan(freeze_periods(ii,3))==0
        if (freeze_periods(ii,3)-startanalysisFrame(ii))>=(10*75) && (freeze_periods(ii,4)-startanalysisFrame(ii))<3750
            result.filt_speed_gauss((freeze_periods(ii,3)-startanalysisFrame(ii)):(freeze_periods(ii,4)-startanalysisFrame(ii))) = 1;
            %         elseif (freeze_periods(ii,3)-startanalysisFrame(ii))<(10*75)  && (freeze_periods(ii,4)-startanalysisFrame(ii))<3750 && (freeze_periods(ii,4)-freeze_periods(ii,3))>=(0.5*75)
            %             result.filt_speed_gauss((10*75):(freeze_periods(ii,4)-startanalysisFrame(ii))) = 1;
        elseif (freeze_periods(ii,3)-startanalysisFrame(ii))>=(10*75) && (freeze_periods(ii,4)-startanalysisFrame(ii))>3750
            result.filt_speed_gauss((freeze_periods(ii,3)-startanalysisFrame(ii)):3750) = 1;
        else
            ii
            disp('freeze period  2 excluded')
        end
    end


    % convert escape #1 (latency is from 0 to 10s after start stimulus)
    if isnan(escape_periods(ii,1))==0
        if (escape_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (escape_periods(ii,1)-startanalysisFrame(ii))<(20*75) && (escape_periods(ii,2)-startanalysisFrame(ii))<3750
            result.filt_speed_gauss((escape_periods(ii,1)-startanalysisFrame(ii)):(escape_periods(ii,2)-startanalysisFrame(ii))) = 2;
        elseif (escape_periods(ii,1)-startanalysisFrame(ii))<(10*75)  && (escape_periods(ii,1)-startanalysisFrame(ii))<(20*75) && (escape_periods(ii,2)-startanalysisFrame(ii))<3750
            result.filt_speed_gauss((10*75):(escape_periods(ii,2)-startanalysisFrame(ii))) = 2;
        elseif (escape_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (escape_periods(ii,1)-startanalysisFrame(ii))<(20*75) && (escape_periods(ii,2)-startanalysisFrame(ii))>3750
            result.filt_speed_gauss((escape_periods(ii,1)-startanalysisFrame(ii)):3750) = 2;
        else
            ii
            disp('escape period 1 excluded')
        end
    end


    % convert refuge - test whether latencies start after start stimulus
    if isnan(refuge_periods(ii,1))==0
        if (refuge_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (refuge_periods(ii,2)-startanalysisFrame(ii))<3750
            result.filt_speed_gauss((refuge_periods(ii,1)-startanalysisFrame(ii)):(refuge_periods(ii,2)-startanalysisFrame(ii))) = NaN;
        elseif (refuge_periods(ii,1)-startanalysisFrame(ii))<(10*75) && (refuge_periods(ii,2)-startanalysisFrame(ii))<3750
            result.filt_speed_gauss((10*75):(refuge_periods(ii,2)-startanalysisFrame(ii))) = NaN;
        elseif (refuge_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (refuge_periods(ii,2)-startanalysisFrame(ii))>3750
            result.filt_speed_gauss((refuge_periods(ii,1)-startanalysisFrame(ii)):3750) = NaN;
        else
            ii
            disp('refuge period outside timeframe')
        end
    end

    try
        if size(result.speed,1)>0
            speed = [speed; result.filt_speed_gauss'];
        end
    end


end

if analyse ==1 || analyse==2

    avg_speed = nanmean(speed);
    figure; plot(avg_speed,'k'); hold on;
    line([(10*75) (10*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(14*75) (14*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

elseif analyse ==3 || analyse==4

    avg_speed = nanmean(speed);
    figure; plot(avg_speed,'k'); hold on;
    line([(10*75) (10*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(10.75*75) (10.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
end


% load('PSTHcolormap.mat')

%normalise to max and min values
maxnorm_speed_all=[];


%only normalised to max value
for ii = 1:size(speed,1)

    if sum(isnan(speed(ii,:))==0)>0

        maxnorm_speed_all=[maxnorm_speed_all; speed(ii,(5*75):(15*75))];
    end
end

%% Sort the graphs to the time of peak

sortcolumns = [];
for ii = 1:size(speed,1)

    % 1
    if sum(speed(ii,(10*75):(20*75))==2)>0
        sortcolumns(ii,1) = find(speed(ii,(10*75):(20*75))==2,1,'first');
    else
        sortcolumns(ii,1) = NaN;
    end

    % 2
    if sum(speed(ii,(10*75):(20*75))==1)>0
        sortcolumns(ii,2) = sum(speed(ii,(10*75):(20*75))==1);
    else
        sortcolumns(ii,2) = 0;
    end




end
[~, sortidx] = sortrows(sortcolumns,[1 2],{'ascend' 'descend'});

for ii=1:size(maxnorm_speed_all,1)
    sort_minmaxnorm_speed_all(ii,:) = maxnorm_speed_all(sortidx(ii,1),:);
end

sort_minmaxnorm_speed_all=flipud(sort_minmaxnorm_speed_all);
sort_minmaxnorm_speed_all = sort_minmaxnorm_speed_all+1;
sort_minmaxnorm_speed_all(isnan(sort_minmaxnorm_speed_all)==1)=0;
% sortidx_both=flipud(sortidx_both);

%% plot
figure;
hold on;
imagesc(sort_minmaxnorm_speed_all(:,(4*75):(10*75)));

map_blk = [0.5 0.5 0.5; 1 1 1;  1 0 0; 0 1 0];
colormap(map_blk); colorbar
% xlim([0 2500]);
ylim([0.5 size(sortidx(:,1),1)+0.5])
box on;
if analyse==1||analyse==2
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
elseif analyse==3||analyse==4
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(1.75*75) (1.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
end
% ax = gca;
% ax.positionConstraint = 'innerposition';
% ax.position = [1 1 1500 7];
xlim([0 (6*75)])
xticklabels = [-1 0 1 2 3 4 5];
yticklabels = [1 size(sortidx(:,1),1)];
xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];

set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

% yticklabels = [1 7];;
% yticks = [1 7];
yticks = [1 size(sortidx(:,1),1)];
set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
% xlim('auto'); ylim('auto')
set(gca,'fontSize',15,'FontName','Arial');
% line([xticks(2) xticks(2)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);
% line([xticks(2)+1500 xticks(2)+1500],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);
%     line([xticks(2)+750 xticks(2)+750],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',1);

if analyse==1
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),1) = [random_trials];

    figname = 'Baseline_sweep_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'Baseline_sweep_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==3
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),3) = [random_trials];

    figname = 'Baseline_loom_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'Baseline_loom_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

end
