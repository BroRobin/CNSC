%% Analyze baseline data
clear all;
close all;

analyse =3; %1=Sweep, 3= Loom,

cd('') %Path to analysis files
if analyse ==1
    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];
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
        NaN NaN
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
        NaN NaN

        ];



elseif analyse ==3


    sortedTrials = NaN(100,1);
    loadedTrials = NaN(100,1);
    random_trials = [];
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

for ii = 1:size(Filenames,1)
    clearvars -except loadedTrials sortedTrials ii kk speed loadlist Filenames random_trials refuge_periods freeze_periods escape_periods startanalysisFrame analyse

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

            result.filt_speed_gauss = gfilt(result.filt_speed(2:end,1),75,0.0375); % Gaussian filter


        end

    catch
        ii
        disp('could not process')
        char(Filenames(ii))
        %         pause;
        %     speed(ii,:) = -1;
    end


    try
        if size(result.speed,1)>0
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

            %     try
            if size(result.speed,1)>0
                if size(result.speed,1)<3750
                    speedidx = [result.filt_speed_gauss' NaN(1,3750-(size(result.filt_speed_gauss,1)))];
                elseif size(result.speed,1)>=3750
                    speedidx = [result.filt_speed_gauss(1:3750)'];
                end
                speed = [speed; speedidx];
            end
        end
    catch
        ii
        disp('could not process')
        char(Filenames(ii))

    end

end




if analyse ==1 || analyse ==2
    % load('colormap_greenred_sweep.mat')
    load('colormap_greenred_traj.mat')
elseif analyse ==3 || analyse ==4
    %         load('colormap_greenred_loom.mat')
    %         load('colormap_greenred_sweep.mat')
    load('colormap_greenred_traj.mat')
end

%normalise to max and min values
maxnorm_speed_all=[];


%only normalised to max value
norm_max = max(nanmax(speed(:,(9*75):(15*75))));
norm_min = min(nanmin(speed(:,(9*75):(15*75))));


% for ii = 49
for ii = 1:size(speed,1)
    %        maxnorm_binoc_ipsi(ii,:)=binoc_ipsi(ii,:)/max(binoc_ipsi(ii,:));
    %             maxnorm_binoc_contra(ii,:)=binoc_contra(ii,:)/max(binoc_contra(ii,:));
    if sum(isnan(speed(ii,:))==0)>0
        %         X = speed(ii,(5*75):(45*75))+nanmin(speed(ii,(5*75):(45*75)));
        % normalization min-max
        %                 X = speed(ii,(9*75):(14*75))+nanmin(speed(ii,(9*75):(14*75)));
        %         X = X/nanmax(X);

        % log transformation
        X = speed(ii,(9*75):(15*75));

        if min(X)<0
            ii
            X(X<0)=0;
            %             pause;
        end

        %         X(X<0) = NaN;
        X = log(X);
        %         X(X<0) = NaN;
        %                X(X<0) = 0;
        %         maxnorm_speed_all=[maxnorm_speed_all; (speed(ii,(5*75):(45*75))/max(speed(ii,(5*75):(45*75))))+nanmin(speed(ii,(5*75):(45*75)))];
        %     maxnorm_speed_all=[maxnorm_speed_all; speed(ii,(5*75):(45*75))/norm_max];
        % X = (speed(ii,(5*75):(45*75))-nanmean(speed(ii,(5*75):(45*75))))/nanstd(speed(ii,(5*75):(45*75)));
        maxnorm_speed_all=[maxnorm_speed_all; X];
    end
end

%% Sort the graphs to the time of peak

if analyse==1
    load('sortedTrials_baseline_sweep.mat')
elseif analyse==3
    load('sortedTrials_baseline_loom.mat')
end


for ii=1:size(maxnorm_speed_all,1)
    sort_minmaxnorm_speed_all(ii,:) = maxnorm_speed_all(sortedTrials(ii,1),:);
end


sort_minmaxnorm_speed_all=flipud(sort_minmaxnorm_speed_all);


%% plot

figure;
hold on;
imAlpha=ones(size(sort_minmaxnorm_speed_all));
imAlpha(isnan(sort_minmaxnorm_speed_all))=0;
imagesc(sort_minmaxnorm_speed_all,'AlphaData',imAlpha);
set(gca,'color',[1 1 1]);
% imagesc(sort_minmaxnorm_speed_all(:,:));
% colormap(map_blk); colorbar
colormap(map_greenred); colorbar
% colormap('parula'); colorbar
% colormap(colormap_NaN);
% colorbar
% caxis([0 2])
% xlim([0 2500]);

box on;
if analyse==1||analyse==2
    caxis([0 6.75])
    ylim([0.5 size(sort_minmaxnorm_speed_all,1)+0.5])
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    % line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    % line([(9*75) (9*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
elseif analyse==3||analyse==4
    caxis([0 6.75])
    ylim([0.5 size(sort_minmaxnorm_speed_all,1)+0.5])
    % line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    % line([(5.75*75) (5.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(1.75*75) (1.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
end
% ax = gca;
% ax.positionConstraint = 'innerposition';
% ax.position = [1 1 1500 7];
% xlim([0 (20*75)])
xlim([0 (6*75)])
% xticklabels = [-5 0 5 10 15];
xticklabels = [-1 0 1 2 3 4 5];
% xticks = [0 (5*75) (10*75) (15*75) (20*75)];
xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

% yticklabels = [1 7];;
yticklabels = [1 size(sort_minmaxnorm_speed_all,1)];
yticks = [1 size(sort_minmaxnorm_speed_all,1)];
set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
% xlim('auto'); ylim('auto')
set(gca,'fontSize',15,'FontName','Arial');


if analyse==1
    %     sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),1) = [random_trials];

    figname = 'Baseline_sweep_heatplot.fig'
    saveas(gcf,figname,'fig');
    figname = 'Baseline_sweep_heatplot.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==3
    %     sortedTrials(1:size(sortidx,1),1) = [sortidx];
    % loadedTrials(1:size(sortidx,1),3) = [random_trials];

    figname = 'Baseline_loom_heatplot.fig'
    saveas(gcf,figname,'fig');
    figname = 'Baseline_loom_heatplot.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

end





