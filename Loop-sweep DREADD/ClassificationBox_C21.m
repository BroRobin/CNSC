%% Create stimulus boxes from the speed data
clear all;
close all;

analyse =6 %1=EGFP Sweep, 2=hMD3q Sweep, 3=hM4dgi Sweep, 4=EGFP loom, 5=hMD3q loom, 6=hM4dgi loom,

cd('Y:\Data\CN-SC_fearCond\Openfield-looming\cerebellotectal DREADD project - loomsweep\C21_test1\Allfiles') %Path to analysis files
if analyse ==1
    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];

    Filenames = {
        'OpenField_2021-03-21 12-13-35_sweep_16887_resultQuantifications.mat'
        'OpenField_2021-03-21 12-47-32_sweep_16847_resultQuantifications.mat'
        'OpenField_2021-03-21 13-33-18_sweep_16888_resultQuantifications.mat'
        'OpenField_2021-03-22 12-26-29_sweep_16888_resultQuantifications.mat'
        'OpenField_2021-03-22 13-33-20_sweep_16847_resultQuantifications.mat'
        'OpenField_2021-03-22 14-38-54_sweep_16887_resultQuantifications.mat'};

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        2484 2484 % for the colormap



        ];

    startanalysisFrame =[1922
        3363
        9135
        16149
        18873
        1360


        ];

    freeze_periods=[2701	2846	NaN	NaN
        4148	4444	NaN	NaN
        9898	10143	NaN	NaN
        16909	17049	17079	17180
        NaN	NaN	NaN	NaN
        2143	2317	NaN	NaN



        ];

    escape_periods = [NaN NaN
        4487 4487 %for the colormap
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN NaN



        ];



elseif analyse ==2


    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];

    Filenames = {
        'OpenField_2021-03-21 11-25-05_sweep_16848_resultQuantifications.mat'
        'OpenField_2021-03-21 11-57-11_sweep_16767_resultQuantifications.mat'
        'OpenField_2021-03-21 13-04-23_sweep_16764_cropped_resultQuantifications.mat'
        'OpenField_2021-03-21 15-53-25_sweep_16849_resultQuantifications.mat'
        'OpenField_2021-03-22 13-56-40_sweep_16849_resultQuantifications.mat'
        'OpenField_2021-03-22 14-20-03_sweep_16767_resultQuantifications.mat'
        'OpenField_2021-03-22 14-56-31_sweep_16764_resultQuantifications.mat'
        'OpenField_2021-03-22 15-57-46_sweep_16848_resultQuantifications.mat'};

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [13084	15000
        NaN	NaN
        3188	4877
        15326	15945
        NaN	NaN
        NaN	NaN
        NaN	NaN
        5109 5109 % for the colormap




        ];

    startanalysisFrame =[12139
        2932
        1851
        14251
        3210
        4025
        768
        3985


        ];

    freeze_periods=[12917	12930	12984	13054
        3721	4014	NaN	NaN
        2626	2704	2797	2929
        15020	15045	NaN	NaN
        4002	4035	NaN	NaN
        4837	5059	NaN	NaN
        1566	1630	NaN	NaN
        4907	4940	4971	5051
        ];

    escape_periods = [NaN NaN
        4056 4056 % for the colormap
        NaN	NaN
        NaN	NaN
        NaN NaN
        NaN	NaN
        NaN	NaN
        NaN NaN
        ];

elseif analyse ==3


    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];

    Filenames = {
        'OpenField_2021-03-21 12-29-45_sweep_16765_resultQuantifications.mat'
        'OpenField_2021-03-21 13-53-42_sweep_16763_resultQuantifications.mat'
        'OpenField_2021-03-21 15-20-59_sweep_16766_resultQuantifications.mat'
        'OpenField_2021-03-21 15-38-29_sweep_16772_resultQuantifications.mat'
        'OpenField_2021-03-22 12-50-01_sweep_16763_resultQuantifications.mat'
        'OpenField_2021-03-22 13-14-42_sweep_16766_resultQuantifications.mat'
        'OpenField_2021-03-22 15-14-03_sweep_16772_resultQuantifications.mat'
        'OpenField_2021-03-22 16-14-40_sweep_16765_resultQuantifications.mat'
        };

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [4273 4273 % for the colormap
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN

        ];

    startanalysisFrame =[3149
        6013
        3787
        1939
        1320
        8160
        2262
        4761



        ];

    freeze_periods=[3936	4054	NaN	NaN
        NaN	NaN	NaN	NaN
        4726	4776	NaN	NaN
        NaN	NaN	NaN	NaN
        2106	2145	NaN	NaN
        8930	8993	NaN	NaN
        3065	3296	NaN	NaN
        5538	5663	5678	5849

        ];

    escape_periods = [NaN	NaN
        NaN NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        5885 5885 % for the colormap
        ];

elseif analyse ==4
    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];

    Filenames = {
        'OpenField_2021-03-21 12-17-22_looming_16887_resultQuantifications.mat'
        'OpenField_2021-03-21 12-51-45_looming_16847_resultQuantifications.mat'
        'OpenField_2021-03-21 13-38-41_looming_16888_resultQuantifications.mat'
        'OpenField_2021-03-22 12-33-26_looming_16888_resultQuantifications.mat'
        'OpenField_2021-03-22 13-41-11_looming_16847_resultQuantifications.mat'
        'OpenField_2021-03-22 14-43-24_looming_16887_resultQuantifications.mat'};

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [NaN	NaN
        NaN	NaN
        11617	13000
        NaN	NaN
        NaN	NaN
        NaN	NaN


        ];

    startanalysisFrame =[2376
        5463
        10613
        15922
        4372
        1472

        ];

    freeze_periods=[3145	3192	NaN	NaN
        6232	6265	NaN	NaN
        11399	11501	NaN	NaN
        16704	16798	NaN	NaN
        NaN	NaN	NaN	NaN
        2256	2331	NaN	NaN


        ];

    escape_periods = [NaN	NaN
        NaN	NaN
        NaN	NaN
        16684	16703
        NaN	NaN
        NaN	NaN


        ];

elseif analyse ==5
    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];

    Filenames = {
        'OpenField_2021-03-21 11-35-39_looming_16848_cropped_resultQuantifications.mat'
        'OpenField_2021-03-21 12-01-12_looming_16767_resultQuantifications.mat'
        'OpenField_2021-03-21 13-17-10_looming_16764_resultQuantifications.mat'
        'OpenField_2021-03-21 16-00-12_looming_16849_resultQuantifications.mat'
        'OpenField_2021-03-22 14-00-46_looming_16849_resultQuantifications.mat'
        'OpenField_2021-03-22 14-24-51_looming_16767_resultQuantifications.mat'
        'OpenField_2021-03-22 15-02-25_looming_16764_resultQuantifications.mat'
        'OpenField_2021-03-22 16-02-11_looming_16848_resultQuantifications.mat'};

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [3352	5600
        NaN	NaN
        10226	12600
        5591	7000
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN

        ];

    startanalysisFrame =[2508
        4342
        9351
        4701
        6114
        5002
        2580
        4650
        ];

    freeze_periods=[NaN	NaN	NaN	NaN
        5147	6731	NaN	NaN
        10120	10130	NaN	NaN
        NaN	NaN	NaN	NaN
        6933	6988	NaN	NaN
        5781	5807	NaN	NaN
        3366	3482	NaN	NaN
        5421	5463	NaN	NaN

        ];

    escape_periods = [3281	3351
        NaN	NaN
        NaN	NaN
        5511	5590
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN

        ];

elseif analyse ==6
    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];

    Filenames = {
        'OpenField_2021-03-21 12-33-54_looming_16765_resultQuantifications.mat'
        'OpenField_2021-03-21 13-58-42_looming_16763_resultQuantifications.mat'
        'OpenField_2021-03-21 15-25-16_looming_16766_resultQuantifications.mat'
        'OpenField_2021-03-21 15-42-28_looming_16772_resultQuantifications.mat'
        'OpenField_2021-03-22 13-01-21_looming2__16763_resultQuantifications.mat'
        'OpenField_2021-03-22 13-21-16_looming2_16766_resultQuantifications.mat'
        'OpenField_2021-03-22 15-18-55_looming_16772_resultQuantifications.mat'
        'OpenField_2021-03-22 16-19-08_looming_16765_resultQuantifications.mat'};

    [C,ia,ic] = unique(Filenames);
    a_counts = accumarray(ic,1);

    refuge_periods = [9810 9810
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN
        NaN	NaN


        ];

    startanalysisFrame =[8686
        7223
        4624
        12847
        1568
        943
        2099
        20982

        ];

    freeze_periods=[9465	9499	NaN	NaN
        8000	8049	NaN	NaN
        NaN	NaN	NaN	NaN
        NaN	NaN	NaN	NaN
        NaN	NaN	NaN	NaN
        NaN	NaN	NaN	NaN
        NaN	NaN	NaN	NaN
        NaN	NaN	NaN	NaN

        ];

    escape_periods = [NaN	NaN
        8347 8347 % for the colormap
        NaN	NaN
        NaN	NaN
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
            %     % filt_speed already filtered with moving mean, window of 53.3332ms
            %     result.filt_speed_gauss = medfilt1(result.filt_speed(2:end,1),25,'truncate');
            %     result.filt_speed_gauss = gfilt(result.filt_speed_gauss,75,0.0187); % Gaussian filter (10 Hz SD)

            %       result.filt_speed_gauss = gfilt(result.filt_speed(2:end,1),75,0.0187); % Gaussian filter (10 Hz SD)
            loadlist = [loadlist;ii];
        end
    catch
        ii
        disp('could not process')
        char(Filenames(ii))
        %     speed(ii,:) = -1;
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

if analyse ==1 || analyse==2 ||analyse==3

    avg_speed = nanmean(speed);
    figure; plot(avg_speed,'k'); hold on;
    line([(10*75) (10*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(14*75) (14*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

elseif analyse ==4 || analyse==5 ||analyse==6

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
    %        maxnorm_binoc_ipsi(ii,:)=binoc_ipsi(ii,:)/max(binoc_ipsi(ii,:));
    %             maxnorm_binoc_contra(ii,:)=binoc_contra(ii,:)/max(binoc_contra(ii,:));
    if sum(isnan(speed(ii,:))==0)>0
        %         maxnorm_speed_all=[maxnorm_speed_all; speed(ii,(25*75):(45*75))/max(speed(ii,(25*75):(45*75)))];
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
%% Plot
figure;
hold on;
imagesc(sort_minmaxnorm_speed_all(:,(4*75):(10*75)));

map_blk = [0.5 0.5 0.5; 1 1 1;  1 0 0; 0 1 0];
colormap(map_blk); colorbar
% xlim([0 2500]);
ylim([0.5 size(sortidx(:,1),1)+0.5])
box on;
if analyse==1||analyse==2 ||analyse==3
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
elseif analyse==4||analyse==5 ||analyse==6
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

if analyse==1
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),1) = [random_trials];

    figname = 'C21_EGFP_sweep_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'C21_EGFP_sweep_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==2
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),1) = [random_trials];

    figname = 'C21_hMD3q_sweep_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'C21_hMD3q_sweep_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==3
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),1) = [random_trials];

    figname = 'C21_hMD4gi_sweep_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'C21_hMD4gi_sweep_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==4
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),3) = [random_trials];

    figname = 'C21_EGFP_loom_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'C21_EGFP_loom_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==5
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),3) = [random_trials];

    figname = 'C21_hMD3q_loom_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'C21_hMD3q_loom_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==6
    sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),3) = [random_trials];

    figname = 'C21_hM4Dgi_loom_classificationBox.fig'
    saveas(gcf,figname,'fig');
    figname = 'C21_hM4Dgi_loom_classificationBox.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);
end
%  randsample(loadlist,55)
% sort(ans)
