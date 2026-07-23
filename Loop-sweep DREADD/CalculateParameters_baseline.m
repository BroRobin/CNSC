%% Create stimulus boxes from the speed data
clear all;
close all;

analyse =1 %1=Sweep, 3=Loom,

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


%general
R.baseline_avgspeed = NaN(size(Filenames,1),1);
R.baseline_peakspeed = NaN(size(Filenames,1),1);

%freezing
R.avgspeed_during_freeze = NaN(size(Filenames,1),3);
R.peakspeed_during_freeze = NaN(size(Filenames,1),3);
R.freeze_latency = NaN(size(Filenames,1),1);

R.FreezeDuration = NaN(size(Filenames,1),3);
R.TotalFreezeDuration = NaN(size(Filenames,1),1);
R.TotalFreezeDuration_capped = NaN(size(Filenames,1),1);
R.perc_freezeDuringStim = NaN(size(Filenames,1),1);


%escape
R.avgspeed_during_escape = NaN(size(Filenames,1),2);
R.peakspeed_during_escape = NaN(size(Filenames,1),2);
R.escape_latency = NaN(size(Filenames,1),1);
R.distance_during_escape = NaN(size(Filenames,1),1);

distancePlot=[];
speed = [];
freeze_speed = [];
escape_speed = [];
all_speed =[];
freeze_cumprob = zeros(1,3750);
escape_cumprob = zeros(1,3750);
freeze_counter = 0;
escape_counter = 0;
escape_speed_centered =NaN(100,3750);
freeze_speed_centered =NaN(100,3750);


for ii = 1:size(Filenames,1)

    clearvars -except R loadedTrials sortedTrials ii kk speed loadlist Filenames random_trials refuge_periods freeze_periods escape_periods startanalysisFrame analyse distancePlot...
        freeze_speed escape_speed freeze_cumprob escape_cumprob freeze_counter escape_counter h escape_speed_centered freeze_speed_centered all_speed

    try
        load(char(Filenames(ii)))
    catch
        ii
        disp('Could not load:')
        char(Filenames(ii))
        %         pause;
    end



    if size(result.speed,1)>0

        result.filt_speed_gauss = gfilt(result.filt_speed(2:end,1),75,0.0375); % Gaussian filter (5 Hz SD)



        %general
        R.baseline_avgspeed(ii,1) = nanmean(result.filt_speed_gauss(round(9*75):round(10*75)));
        R.baseline_peakspeed(ii,1) = nanmax(result.filt_speed_gauss(round(9*75):round(10*75)));

        freeze_idx =zeros(1,(4*75));

        % convert freezing #1 (latency is from 0 to 4s after start stimulus)
        if isnan(freeze_periods(ii,1))==0
            % start freeze between start stim and end stim, end freeze
            % <3 min after start stim

            %             if (freeze_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (freeze_periods(ii,1)-startanalysisFrame(ii))<(14*75) && (freeze_periods(ii,2)-startanalysisFrame(ii))<3750
            %             result.filt_speed_gauss((freeze_periods(ii,1)-startanalysisFrame(ii)):(freeze_periods(ii,2)-startanalysisFrame(ii))) = 1;
            R.avgspeed_during_freeze(ii,1)= nanmean(result.filt_speed_gauss((freeze_periods(ii,1)-startanalysisFrame(ii)):(freeze_periods(ii,2)-startanalysisFrame(ii))));
            R.peakspeed_during_freeze(ii,1)= nanmax(result.filt_speed_gauss((freeze_periods(ii,1)-startanalysisFrame(ii)):(freeze_periods(ii,2)-startanalysisFrame(ii))));
            R.freeze_latency(ii,1) =(freeze_periods(ii,1)-startanalysisFrame(ii))/75;
            R.freeze_latency(ii,1)=R.freeze_latency(ii,1)-10;
            R.FreezeDuration(ii,1)= (freeze_periods(ii,2)-freeze_periods(ii,1))/75;
            freeze_idx((freeze_periods(ii,1)-startanalysisFrame(ii)-(10*75)):(freeze_periods(ii,2)-startanalysisFrame(ii)-(10*75))) = 1;
        end

        % convert freezing #2
        if isnan(freeze_periods(ii,3))==0
            %             if (freeze_periods(ii,3)-startanalysisFrame(ii))>=(10*75) && (freeze_periods(ii,4)-startanalysisFrame(ii))<3750
            %             result.filt_speed_gauss((freeze_periods(ii,3)-startanalysisFrame(ii)):(freeze_periods(ii,4)-startanalysisFrame(ii))) = 1;
            R.avgspeed_during_freeze(ii,2)=nanmean(result.filt_speed_gauss((freeze_periods(ii,3)-startanalysisFrame(ii)):(freeze_periods(ii,4)-startanalysisFrame(ii))));
            R.peakspeed_during_freeze(ii,2)=nanmax(result.filt_speed_gauss((freeze_periods(ii,3)-startanalysisFrame(ii)):(freeze_periods(ii,4)-startanalysisFrame(ii))));
            R.FreezeDuration(ii,2)= (freeze_periods(ii,4)-freeze_periods(ii,3))/75;
            freeze_idx((freeze_periods(ii,3)-startanalysisFrame(ii)-(10*75)):(freeze_periods(ii,4)-startanalysisFrame(ii)-(10*75))) = 1;

        end

        if sum(freeze_idx)>0
            R.perc_freezeDuringStim(ii,1) = (sum(freeze_idx(1:300))/300)*100;
            R.TotalFreezeDuration(ii,1) = nansum(R.FreezeDuration(ii,:));
        end
        if R.TotalFreezeDuration(ii,1)>10
            R.TotalFreezeDuration_capped(ii,1)=10;
        elseif R.TotalFreezeDuration(ii,1)<=10
            R.TotalFreezeDuration_capped(ii,1)=nansum(R.TotalFreezeDuration(ii,1));
        end



        % Escape period #1 is most important. If not there, then include period 2
        % convert escape #1 (latency is from 0 to 0.75s after start stimulus)
        if isnan(escape_periods(ii,1))==0
            %             if (escape_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (escape_periods(ii,1)-startanalysisFrame(ii))<(10.75*75) && (escape_periods(ii,2)-startanalysisFrame(ii))<3750
            %                     result.filt_speed_gauss((escape_periods(ii,1)-startanalysisFrame(ii)):(escape_periods(ii,2)-startanalysisFrame(ii))) = 2;
            R.escape_latency(ii,1) =(escape_periods(ii,1)-startanalysisFrame(ii))/75;
            R.escape_latency(ii,1) =R.escape_latency(ii,1)-10;
            R.avgspeed_during_escape(ii,1)= nanmean(result.filt_speed_gauss((escape_periods(ii,1)-startanalysisFrame(ii)):(escape_periods(ii,2)-startanalysisFrame(ii))));
            R.peakspeed_during_escape(ii,1)= nanmax(result.filt_speed_gauss((escape_periods(ii,1)-startanalysisFrame(ii)):(escape_periods(ii,2)-startanalysisFrame(ii))));

            R.distance_during_escape(ii,1)= result.distance(escape_periods(ii,2)-startanalysisFrame(ii))-result.distance(escape_periods(ii,1)-startanalysisFrame(ii));

        end


        % convert refuge - test whether latencies start after start stimulus
        if isnan(refuge_periods(ii,1))==0
            %                 if (refuge_periods(ii,1)-startanalysisFrame(ii))>=(10*75) && (refuge_periods(ii,2)-startanalysisFrame(ii))<3750
            result.distance((refuge_periods(ii,1)-startanalysisFrame(ii)):(refuge_periods(ii,2)-startanalysisFrame(ii))) = result.distance(refuge_periods(ii,1)-1-startanalysisFrame(ii));
            result.filt_speed_gauss((refuge_periods(ii,1)-startanalysisFrame(ii)):(refuge_periods(ii,2)-startanalysisFrame(ii))) = NaN;

        end

        distancePlot = [distancePlot; result.distance'-result.distance(10*75)];

        %     try
        if size(result.speed,1)>0
            if size(result.speed,1)<3750
                speedidx = [result.filt_speed_gauss' NaN(1,3750-(size(result.filt_speed_gauss,1)))];
            elseif size(result.speed,1)>=3750
                speedidx = [result.filt_speed_gauss(1:3750)'];
            end
            speed = [speed; speedidx];
        end


        %% Gather the responses for the graphs
        % freeze responses
        if isnan(freeze_periods(ii,1))==0 && freeze_periods(ii,1)>=(startanalysisFrame(ii)+(10*75))
            freeze_speed = [freeze_speed; result.filt_speed_gauss'];
            freeze_cumprob(freeze_periods(ii,1)-startanalysisFrame(ii):end) = freeze_cumprob(freeze_periods(ii,1)-startanalysisFrame(ii):end)+1;
            freeze_counter = freeze_counter+1;
            freeze_speed_centered(ii,1:length(result.filt_speed_gauss(freeze_periods(ii,1)-startanalysisFrame(ii):freeze_periods(ii,2)-startanalysisFrame(ii)))) = result.filt_speed_gauss(freeze_periods(ii,1)-startanalysisFrame(ii):freeze_periods(ii,2)-startanalysisFrame(ii))';
        end


        %escape responses
        if isnan(escape_periods(ii,1))==0 && escape_periods(ii,1)>=(startanalysisFrame(ii)+(10*75)) % inside refuge
            %
            result.filt_speed_gauss(escape_periods(ii,2)-startanalysisFrame(ii):end) = NaN;
            escape_speed = [escape_speed; result.filt_speed_gauss'];
            escape_cumprob(escape_periods(ii,1)-startanalysisFrame(ii):end) = escape_cumprob(escape_periods(ii,1)-startanalysisFrame(ii):end)+1;
            escape_counter = escape_counter+1;
            escape_speed_centered(ii,1:length(result.filt_speed_gauss(escape_periods(ii,1)-startanalysisFrame(ii):escape_periods(ii,2)-startanalysisFrame(ii)))) = result.filt_speed_gauss(escape_periods(ii,1)-startanalysisFrame(ii):escape_periods(ii,2)-startanalysisFrame(ii))';


        end



    end
    % all responses
    all_speed = [all_speed; result.filt_speed_gauss'];

end



if analyse ==1 || analyse==3
    %
    avg_distancePlot = nanmean(distancePlot);
    sd_distancePlot = nanstd(distancePlot);
    sem_distancePlot = sd_distancePlot/sqrt(size(distancePlot,1));
    figure;
    plot(avg_distancePlot((9*75):(15*75)),'k'); hold on;
    plot(avg_distancePlot((9*75):(15*75))+sem_distancePlot((9*75):(15*75)),'k');
    plot(avg_distancePlot((9*75):(15*75))-sem_distancePlot((9*75):(15*75)),'k');

    %     xlim([(9*75) (15*75)])

elseif analyse ==2 || analyse==4
    %
    avg_distancePlot = nanmean(distancePlot);
    sd_distancePlot = nanstd(distancePlot);
    sem_distancePlot = sd_distancePlot/sqrt(size(distancePlot,1));
    figure;
    plot(avg_distancePlot((9*75):(15*75)),'r'); hold on;
    plot(avg_distancePlot((9*75):(15*75))+sem_distancePlot((9*75):(15*75)),'r');
    plot(avg_distancePlot((9*75):(15*75))-sem_distancePlot((9*75):(15*75)),'r');
    %      line([(10*75) (10*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    %     line([(14*75) (14*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    %     xlim([(9*75) (15*75)])
end
%     ylim([-25 60])

if analyse ==1 || analyse==2
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
elseif analyse ==3 || analyse==4
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(1.75*75) (1.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
end
%
xlim([0 (6*75)])
xticklabels = [-1 0 1 2 3 4 5];
xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

% yticklabels = [1 7];;
% yticks = [1 7];
% set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
% xlim('auto'); ylim('auto')
set(gca,'fontSize',15,'FontName','Arial');


excel=[R.baseline_avgspeed R.baseline_peakspeed R.avgspeed_during_freeze R.peakspeed_during_freeze...
    R.freeze_latency R.avgspeed_during_escape R.peakspeed_during_escape R.escape_latency...
    R.FreezeDuration R.TotalFreezeDuration R.TotalFreezeDuration_capped R.perc_freezeDuringStim R.distance_during_escape];


%% Log function on freezing


avg_freeze_speed = nanmean(freeze_speed);
sd_freeze_speed = nanstd(freeze_speed);
sem_freeze_speed = sd_freeze_speed/sqrt(size(freeze_speed,1));

%% Log function on escape
avg_escape_speed = nanmean(escape_speed);
sd_escape_speed = nanstd(escape_speed);
sem_escape_speed = sd_escape_speed/sqrt(size(escape_speed,1));

%% Log function all trials
sd_all_speed = nanstd(all_speed);
sem_all_speed = sd_all_speed/sqrt(size(all_speed,1));


if analyse==1||analyse==3
    h(20) = figure; hold on; title('all trials')
    plot(avg_all_speed((9*75):(15*75)),'k')
    plot(avg_all_speed((9*75):(15*75))+sem_all_speed((9*75):(15*75)),'r')
    plot(avg_all_speed((9*75):(15*75))-sem_all_speed((9*75):(15*75)),'r')

    xlim([0 (6*75)])
    % xticklabels = [-5 0 5 10 15];
    xticklabels = [-1 0 1 2 3 4 5];
    % xticks = [0 (5*75) (10*75) (15*75) (20*75)];
    xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];
    set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

    % yticklabels = [1 7];;
    % yticklabels = [1 size(sort_minmaxnorm_speed_all,1)];
    % yticks = [1 size(sort_minmaxnorm_speed_all,1)];
    % set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
    % xlim('auto'); ylim('auto')
    set(gca,'fontSize',15,'FontName','Arial');

    if analyse==1||analyse==2
        %     ylim([0 4])
        line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
        line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    elseif analyse==3||analyse==4
        %         ylim([0 4])
        line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
        line([(1.75*75) (1.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    end



    %freeze
    if isnan(avg_freeze_speed(1))==0
        h(1) = figure; hold on; title('Freeze')
        plot(avg_freeze_speed((9*75):(15*75)),'k')
        plot(avg_freeze_speed((9*75):(15*75))+sem_freeze_speed((9*75):(15*75)),'r')
        plot(avg_freeze_speed((9*75):(15*75))-sem_freeze_speed((9*75):(15*75)),'r')

        xlim([0 (6*75)])
        % xticklabels = [-5 0 5 10 15];
        xticklabels = [-1 0 1 2 3 4 5];
        % xticks = [0 (5*75) (10*75) (15*75) (20*75)];
        xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];
        set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

        % yticklabels = [1 7];;
        % yticklabels = [1 size(sort_minmaxnorm_speed_all,1)];
        % yticks = [1 size(sort_minmaxnorm_speed_all,1)];
        % set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
        % xlim('auto'); ylim('auto')
        set(gca,'fontSize',15,'FontName','Arial');

        if analyse==1||analyse==2
            %     ylim([0 4])
            line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
            line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
        elseif analyse==3||analyse==4
            %         ylim([0 4])
            line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
            line([(1.75*75) (1.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
        end
    end
    %escape
    if isnan(avg_escape_speed(1))==0
        h(2) = figure; hold on; title('escape')
        plot(avg_escape_speed((9*75):(15*75)),'k')
        plot(avg_escape_speed((9*75):(15*75))+sem_escape_speed((9*75):(15*75)),'r')
        plot(avg_escape_speed((9*75):(15*75))-sem_escape_speed((9*75):(15*75)),'r')

        xlim([0 (6*75)])
        % xticklabels = [-5 0 5 10 15];
        xticklabels = [-1 0 1 2 3 4 5];
        % xticks = [0 (5*75) (10*75) (15*75) (20*75)];
        xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];
        set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

        % yticklabels = [1 7];;
        % yticklabels = [1 size(sort_minmaxnorm_speed_all,1)];
        % yticks = [1 size(sort_minmaxnorm_speed_all,1)];
        % set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
        % xlim('auto'); ylim('auto')
        set(gca,'fontSize',15,'FontName','Arial');
    end
elseif analyse==2||analyse==4
    try
        figure(h(1))
        plot(avg_freeze_speed((9*75):(15*75)),'b')
        plot(avg_freeze_speed((9*75):(15*75))+sem_freeze_speed((9*75):(15*75)),'g')
        plot(avg_freeze_speed((9*75):(15*75))-sem_freeze_speed((9*75):(15*75)),'g')
    end
    try
        figure(h(2))
        plot(avg_escape_speed((9*75):(15*75)),'b')
        plot(avg_escape_speed((9*75):(15*75))+sem_escape_speed((9*75):(15*75)),'g')
        plot(avg_escape_speed((9*75):(15*75))-sem_escape_speed((9*75):(15*75)),'g')
    end
end

if analyse==1||analyse==2
    %         ylim([0 4])
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
elseif analyse==3||analyse==4
    %         ylim([0 4])
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(1.75*75) (1.75*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
end




%% cumprobability graphs

% freezetrials_perc = freeze_counter/size(distancePlot,1);
% escapetrials_perc = escape_counter/size(distancePlot,1);

freezetrials_perc = 1;
escapetrials_perc = 1;

%freeze
freeze_cumprob = freeze_cumprob/(freeze_counter/freezetrials_perc);


% yticklabels = [1 7];;
% yticklabels = [1 size(sort_minmaxnorm_speed_all,1)];
% yticks = [1 size(sort_minmaxnorm_speed_all,1)];
% set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
% xlim('auto'); ylim('auto')
set(gca,'fontSize',15,'FontName','Arial');

if analyse==1 || analyse==3
    h(3) = figure; hold on;title('Freeze')
    plot(freeze_cumprob((9*75):(15*75)),'r','LineWidth',2)
    % plot(freeze_cumprob)
    xlim([0 (6*75)])
    % xticklabels = [-5 0 5 10 15];
    xticklabels = [-1 0 1 2 3 4 5];
    % xticks = [0 (5*75) (10*75) (15*75) (20*75)];
    xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];
    set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
    ylim([0 1]);
    line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    set(gca,'fontSize',15,'FontName','Arial');

    try
        %escape
        escape_cumprob = escape_cumprob/(escape_counter/escapetrials_perc);


        h(4) = figure; hold on;title('Escape')
        plot(escape_cumprob((9*75):(15*75)),'g','LineWidth',2)
        % plot(escape_cumprob)

        xlim([0 (6*75)])
        ylim([0 1]);
        % xticklabels = [-5 0 5 10 15];
        xticklabels = [-1 0 1 2 3 4 5];
        % xticks = [0 (5*75) (10*75) (15*75) (20*75)];
        xticks = [0 (1*75) (2*75) (3*75) (4*75) (5*75) (6*75)];
        set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)

        % yticklabels = [1 7];;
        % yticklabels = [1 size(sort_minmaxnorm_speed_all,1)];
        % yticks = [1 size(sort_minmaxnorm_speed_all,1)];
        % set(gca, 'YTick', yticks, 'YTickLabel', yticklabels)
        % xlim('auto'); ylim('auto')
        set(gca,'fontSize',15,'FontName','Arial');

        line([(1*75) (1*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
        line([(5*75) (5*75)],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

    end

end



if analyse==1
    figure(h(1))
    box on;
    figname = 'Baseline_sweep_speedvstime_freeze.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_sweep_speedvstime_freeze.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

    figure(h(20))
    box on;
    figname = 'Baseline_sweep_speedvstime_all.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_sweep_speedvstime_all.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

    figure(h(3))
    box on;
    figname = 'Baseline_sweep_freeze_cumprob.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_sweep_freeze_cumprob.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

    try
        figure(h(2))
        box on;
        figname = 'Baseline_sweep_speedvstime_escape.fig';
        saveas(gcf,figname,'fig');
        figname = 'Baseline_sweep_speedvstime_escape.pdf';
        orient(gcf,'portrait')
        print('-dpdf','-painters','-loose',figname);

        figure(h(4))
        box on;
        figname = 'Baseline_sweep_escape_cumprob.fig';
        saveas(gcf,figname,'fig');
        figname = 'Baseline_sweep_escape_cumprob.pdf';
        orient(gcf,'portrait')
        print('-dpdf','-painters','-loose',figname);
    end
elseif analyse==3
    figure(h(1))
    box on;
    figname = 'Baseline_loom_speedvstime_freeze.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_loom_speedvstime_freeze.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

    figure(h(20))
    box on;
    figname = 'Baseline_loom_speedvstime_all.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_loom_speedvstime_all.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);


    figure(h(3))
    box on;
    figname = 'Baseline_loom_freeze_cumprob.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_loom_freeze_cumprob.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

    try
        figure(h(2))
        box on;
        figname = 'Baseline_loom_speedvstime_escape.fig';
        saveas(gcf,figname,'fig');
        figname = 'Baseline_loom_speedvstime_escape.pdf';
        orient(gcf,'portrait')
        print('-dpdf','-painters','-loose',figname);

        figure(h(4))
        box on;
        figname = 'Baseline_loom_escape_cumprob.fig';
        saveas(gcf,figname,'fig');
        figname = 'Baseline_loom_escape_cumprob.pdf';
        orient(gcf,'portrait')
        print('-dpdf','-painters','-loose',figname);
    end
end


% TURN ON TO SAVE FIGURES

if analyse==1
    xvalues = linspace(-1,5,(6*75));
    % Freeze trials
    yvalues = freeze_speed(:,(9*75):(15*75)-1);
    yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
    xvalues = xvalues(1:size(yvalues,2));
    h(5) = figure; hold on;
    iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
        'spreadAlpha',0.3,...
        'outerMode', 'none', ...
        'innermode', 'quartile', ...
        'mainmode', 'median', ...
        'showOutliers', false,...
        'addPrctilesLineColor','r');
    title('Median and 25th to 75th percentile (IQR)')
    axis tight
    box on
    %               set(H(1),'Color','k')
    xlim([-1 5])
    ylim([0 50])
    set(gca,'fontSize',15,'FontName','Arial');
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([4 4],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

    figname = 'Baseline_sweep_speedvstime_Medianfreeze_WT_gauss.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_sweep_speedvstime_Medianfreeze_WT_gauss.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

    %% Freeze speed centered
    xvalues = linspace(-1,5,(6*75));
    yvalues = freeze_speed_centered(:,1:450);
    xvalues = xvalues(1:size(yvalues,2));
    h(5) = figure; hold on;
    iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
        'spreadAlpha',0.3,...
        'outerMode', 'none', ...
        'innermode', 'quartile', ...
        'mainmode', 'median', ...
        'showOutliers', false,...
        'addPrctilesLineColor','r');
    title('Median and 25th to 75th percentile (IQR)')
    axis tight
    box on
    %               set(H(1),'Color','k')
    xlim([-1 5])
    ylim([0 50])
    set(gca,'fontSize',15,'FontName','Arial');

    try
        % Escape trials
        xvalues = linspace(-1,5,(6*75));
        yvalues = escape_speed(:,(9*75):(15*75)-1);
        yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
        xvalues = xvalues(1:size(yvalues,2));
        h(7) = figure; hold on;
        iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
            'spreadAlpha',0.3,...
            'outerMode', 'none', ...
            'innermode', 'quartile', ...
            'mainmode', 'median', ...
            'showOutliers', false,...
            'addPrctilesLineColor','r');
        title('Median and 25th to 75th percentile (IQR)')
        axis tight
        box on
        xlim([-1 1.5])
        ylim([0 50])
        set(gca,'fontSize',15,'FontName','Arial');
        line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
        line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

        figname = 'Baseline_sweep_speedvstime_Medianescape_WT_gauss.fig';
        saveas(gcf,figname,'fig');
        figname = 'Baseline_sweep_speedvstime_Medianescape_WT_gauss.pdf';
        orient(gcf,'portrait')
        print('-dpdf','-painters','-loose',figname);

        %% escape speed centered
        xvalues = linspace(-1,5,(6*75));
        yvalues = escape_speed_centered(:,1:450);
        yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
        xvalues = xvalues(1:size(yvalues,2));
        h(5) = figure; hold on;
        iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
            'spreadAlpha',0.3,...
            'outerMode', 'none', ...
            'innermode', 'quartile', ...
            'mainmode', 'median', ...
            'showOutliers', false,...
            'addPrctilesLineColor','r');
        title('Median and 25th to 75th percentile (IQR)')
        axis tight
        box on
        %               set(H(1),'Color','k')
        %               xlim([-1 5])
        %               ylim([0 40])
        set(gca,'fontSize',15,'FontName','Arial');
    end

    % All trials
    xvalues = linspace(-1,5,(6*75));
    yvalues = all_speed(:,(9*75):(15*75)-1);
    yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
    xvalues = xvalues(1:size(yvalues,2));
    h(21) = figure; hold on;
    iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
        'spreadAlpha',0.3,...
        'outerMode', 'none', ...
        'innermode', 'quartile', ...
        'mainmode', 'median', ...
        'showOutliers', false,...
        'addPrctilesLineColor','r');
    title('Median and 25th to 75th percentile (IQR) - all trials')
    axis tight
    box on
    %               set(H(1),'Color','k')
    xlim([-1 5])
    ylim([0 50])
    set(gca,'fontSize',15,'FontName','Arial');
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([4 4],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    colorbar;
    figname = 'Baseline_sweep_speedvstime_Alltrials_gauss.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_sweep_speedvstime_Alltrials_gauss.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

elseif analyse==3
    xvalues = linspace(-1,5,(6*75));
    % Freeze trials
    yvalues = freeze_speed(:,(9*75):(15*75)-1);
    yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
    xvalues = xvalues(1:size(yvalues,2));
    h(5) = figure; hold on;
    iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
        'spreadAlpha',0.3,...
        'outerMode', 'none', ...
        'innermode', 'quartile', ...
        'mainmode', 'median', ...
        'showOutliers', false,...
        'addPrctilesLineColor','r');
    title('Median and 25th to 75th percentile (IQR)')
    axis tight
    box on
    %               set(H(1),'Color','k')
    xlim([-1 5])
    ylim([0 50])
    set(gca,'fontSize',15,'FontName','Arial');
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([4 4],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

    figname = 'Baseline_loom_speedvstime_Medianfreeze_WT_gauss.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_loom_speedvstime_Medianfreeze_WT_gauss.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

    %% Freeze speed centered
    xvalues = linspace(-1,5,(6*75));
    yvalues = freeze_speed_centered(:,1:450);
    xvalues = xvalues(1:size(yvalues,2));
    h(5) = figure; hold on;
    iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
        'spreadAlpha',0.3,...
        'outerMode', 'none', ...
        'innermode', 'quartile', ...
        'mainmode', 'median', ...
        'showOutliers', false,...
        'addPrctilesLineColor','r');
    title('Median and 25th to 75th percentile (IQR)')
    axis tight
    box on
    %               set(H(1),'Color','k')
    xlim([-1 5])
    ylim([0 50])
    set(gca,'fontSize',15,'FontName','Arial');

    try
        % Escape trials
        xvalues = linspace(-1,5,(6*75));
        yvalues = escape_speed(:,(9*75):(15*75)-1);
        yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
        xvalues = xvalues(1:size(yvalues,2));
        h(7) = figure; hold on;
        iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
            'spreadAlpha',0.3,...
            'outerMode', 'none', ...
            'innermode', 'quartile', ...
            'mainmode', 'median', ...
            'showOutliers', false,...
            'addPrctilesLineColor','r');
        title('Median and 25th to 75th percentile (IQR)')
        axis tight
        box on
        xlim([-1 1.5])
        ylim([0 50])
        set(gca,'fontSize',15,'FontName','Arial');
        line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
        line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);

        figname = 'Baseline_loom_speedvstime_Medianescape_WT_gauss.fig';
        saveas(gcf,figname,'fig');
        figname = 'Baseline_loom_speedvstime_Medianescape_WT_gauss.pdf';
        orient(gcf,'portrait')
        print('-dpdf','-painters','-loose',figname);

        %% escape speed centered
        xvalues = linspace(-1,5,(6*75));
        yvalues = escape_speed_centered(:,1:450);
        yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
        xvalues = xvalues(1:size(yvalues,2));
        h(5) = figure; hold on;
        iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
            'spreadAlpha',0.3,...
            'outerMode', 'none', ...
            'innermode', 'quartile', ...
            'mainmode', 'median', ...
            'showOutliers', false,...
            'addPrctilesLineColor','r');
        title('Median and 25th to 75th percentile (IQR)')
        axis tight
        box on
        %               set(H(1),'Color','k')
        %               xlim([-1 5])
        %               ylim([0 40])
        set(gca,'fontSize',15,'FontName','Arial');
    end

    % All trials
    xvalues = linspace(-1,5,(6*75));
    yvalues = all_speed(:,(9*75):(15*75)-1);
    yvalues = yvalues(:,sum(isnan(yvalues))<size(yvalues,1));
    xvalues = xvalues(1:size(yvalues,2));
    h(22) = figure; hold on;
    iosr.statistics.functionalSpreadPlot(xvalues, yvalues,...
        'spreadAlpha',0.3,...
        'outerMode', 'none', ...
        'innermode', 'quartile', ...
        'mainmode', 'median', ...
        'showOutliers', false,...
        'addPrctilesLineColor','r');
    title('Median and 25th to 75th percentile (IQR) - all trials')
    axis tight
    box on
    %               set(H(1),'Color','k')
    xlim([-1 5])
    ylim([0 50])
    set(gca,'fontSize',15,'FontName','Arial');
    line([0 0],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([4 4],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    line([0.75 0.75],   [min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r','LineWidth',0.5);
    colorbar;
    figname = 'Baseline_loom_speedvstime_Alltrials_gauss.fig';
    saveas(gcf,figname,'fig');
    figname = 'Baseline_loom_speedvstime_Alltrials_gauss.pdf';
    orient(gcf,'portrait')
    print('-dpdf','-painters','-loose',figname);

end



