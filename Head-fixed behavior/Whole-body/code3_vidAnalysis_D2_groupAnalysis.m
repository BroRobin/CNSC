%% Perform the group average analysis (ALL mice)

% G.trial_mov=[];
% G.trial_cumsum_opto=[];


for zz=1:15
    clearvars -except zz G
    close all;
    if zz==1
        cd('')
        P.mouseID = '973_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==2
        cd('')
        P.mouseID = '974_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==3
        cd('')
        P.mouseID = '975_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==4
        cd('')
        P.mouseID = '976_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==5
        cd('')
        P.mouseID = '977_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==6
        cd('')
        P.mouseID = '978_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))

    elseif zz==7
        cd('')
        P.mouseID = '1007_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==8
        cd('')
        P.mouseID = '1008_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==9
        cd('')
        P.mouseID = '1009_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==10
        cd('')
        P.mouseID = '1010_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==11
        cd('')
        P.mouseID = '1011_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==12
        cd('')
        P.mouseID = '1012_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==13
        cd('')
        P.mouseID = '1013_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==14
        cd('')
        P.mouseID = '1014_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==15
        cd('')
        P.mouseID = '1015_D2';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    end

    try; G.trial_mov_US(zz,:)=imresize(S.trial_US_avg,[1 101]);end
    G.trial_mov_0(zz,:)=imresize(S.trial_0_avg,[1 101]);
    G.trial_mov_25(zz,:)=imresize(S.trial_25_avg,[1 101]);
    G.trial_mov_50(zz,:)=imresize(S.trial_50_avg,[1 101]);
    G.trial_mov_75(zz,:)=imresize(S.trial_75_avg,[1 101]);
    G.trial_mov_100(zz,:)=imresize(S.trial_100_avg,[1 101]);
end

%Ctr mice AVERAGE
G.trial_mov_avg_US_ctr=nanmean(G.trial_mov_US([9 10 11 13 14 15],:));
G.trial_mov_SD_US_ctr=nanstd(G.trial_mov_US([9 10 11 13 14 15],:));
G.trial_mov_SEM_US_ctr=nanstd(G.trial_mov_US([9 10 11 13 14 15],:))/sqrt(size(G.trial_mov_US([9 10 11 13 14 15],:),1));

G.trial_mov_avg_0_ctr=nanmean(G.trial_mov_0([9 10 11 13 14 15],:));
G.trial_mov_SD_0_ctr=nanstd(G.trial_mov_0([9 10 11 13 14 15],:));
G.trial_mov_SEM_0_ctr=nanstd(G.trial_mov_0([9 10 11 13 14 15],:))/sqrt(size(G.trial_mov_0([9 10 11 13 14 15],:),1));

G.trial_mov_avg_25_ctr=nanmean(G.trial_mov_25([9 10 11 13 14 15],:));
G.trial_mov_SD_25_ctr=nanstd(G.trial_mov_25([9 10 11 13 14 15],:));
G.trial_mov_SEM_25_ctr=nanstd(G.trial_mov_25([9 10 11 13 14 15],:))/sqrt(size(G.trial_mov_25([9 10 11 13 14 15],:),1));

G.trial_mov_avg_50_ctr=nanmean(G.trial_mov_50([9 10 11 13 14 15],:));
G.trial_mov_SD_50_ctr=nanstd(G.trial_mov_50([9 10 11 13 14 15],:));
G.trial_mov_SEM_50_ctr=nanstd(G.trial_mov_50([9 10 11 13 14 15],:))/sqrt(size(G.trial_mov_50([9 10 11 13 14 15],:),1));

G.trial_mov_avg_75_ctr=nanmean(G.trial_mov_75([9 10 11 13 14 15],:));
G.trial_mov_SD_75_ctr=nanstd(G.trial_mov_75([9 10 11 13 14 15],:));
G.trial_mov_SEM_75_ctr=nanstd(G.trial_mov_75([9 10 11 13 14 15],:))/sqrt(size(G.trial_mov_75([9 10 11 13 14 15],:),1));

G.trial_mov_avg_100_ctr=nanmean(G.trial_mov_100([9 10 11 13 14 15],:));
G.trial_mov_SD_100_ctr=nanstd(G.trial_mov_100([9 10 11 13 14 15],:));
G.trial_mov_SEM_100_ctr=nanstd(G.trial_mov_100([9 10 11 13 14 15],:))/sqrt(size(G.trial_mov_100([9 10 11 13 14 15],:),1));

%ChR2 mice
G.trial_mov_avg_US_chr2=nanmean(G.trial_mov_US([1 2 3 4 5 6 7 8],:));
G.trial_mov_SD_US_chr2=nanstd(G.trial_mov_US([1 2 3 4 5 6 7 8],:));
G.trial_mov_SEM_US_chr2=nanstd(G.trial_mov_US([1 2 3 4 5 6 7 8],:))/sqrt(size(G.trial_mov_US([1 2 3 4 5 6 7 8],:),1));

G.trial_mov_avg_0_chr2=nanmean(G.trial_mov_0([1 2 3 4 5 6 7 8],:));
G.trial_mov_SD_0_chr2=nanstd(G.trial_mov_0([1 2 3 4 5 6 7 8],:));
G.trial_mov_SEM_0_chr2=nanstd(G.trial_mov_0([1 2 3 4 5 6 7 8],:))/sqrt(size(G.trial_mov_0([1 2 3 4 5 6 7 8],:),1));

G.trial_mov_avg_25_chr2=nanmean(G.trial_mov_25([1 2 3 4 5 6 7 8],:));
G.trial_mov_SD_25_chr2=nanstd(G.trial_mov_25([1 2 3 4 5 6 7 8],:));
G.trial_mov_SEM_25_chr2=nanstd(G.trial_mov_25([1 2 3 4 5 6 7 8],:))/sqrt(size(G.trial_mov_25([1 2 3 4 5 6 7 8],:),1));

G.trial_mov_avg_50_chr2=nanmean(G.trial_mov_50([1 2 3 4 5 6 7 8],:));
G.trial_mov_SD_50_chr2=nanstd(G.trial_mov_50([1 2 3 4 5 6 7 8],:));
G.trial_mov_SEM_50_chr2=nanstd(G.trial_mov_50([1 2 3 4 5 6 7 8],:))/sqrt(size(G.trial_mov_50([1 2 3 4 5 6 7 8],:),1));

G.trial_mov_avg_75_chr2=nanmean(G.trial_mov_75([1 2 3 4 5 6 7 8],:));
G.trial_mov_SD_75_chr2=nanstd(G.trial_mov_75([1 2 3 4 5 6 7 8],:));
G.trial_mov_SEM_75_chr2=nanstd(G.trial_mov_75([1 2 3 4 5 6 7 8],:))/sqrt(size(G.trial_mov_75([1 2 3 4 5 6 7 8],:),1));

G.trial_mov_avg_100_chr2=nanmean(G.trial_mov_100([1 2 3 4 5 6 7 8],:));
G.trial_mov_SD_100_chr2=nanstd(G.trial_mov_100([1 2 3 4 5 6 7 8],:));
G.trial_mov_SEM_100_chr2=nanstd(G.trial_mov_100([1 2 3 4 5 6 7 8],:))/sqrt(size(G.trial_mov_100([1 2 3 4 5 6 7 8],:),1));

P.xaxis=linspace(-0.5,1.5,101);


% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_US_ctr,2)),G.trial_mov_avg_US_ctr,G.trial_mov_SEM_US_ctr,'k');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_0_ctr,2)),G.trial_mov_avg_0_ctr,G.trial_mov_SEM_0_ctr,'b');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_25_ctr,2)),G.trial_mov_avg_25_ctr,G.trial_mov_SEM_25_ctr,'y');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_50_ctr,2)),G.trial_mov_avg_50_ctr,G.trial_mov_SEM_50_ctr,'r');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_75_ctr,2)),G.trial_mov_avg_75_ctr,G.trial_mov_SEM_75_ctr,'g');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_100_ctr,2)),G.trial_mov_avg_100_ctr,G.trial_mov_SEM_100_ctr,'m');
% legend({'US' '0ms' '25ms' '50ms' '75ms' '100'})

% plot the figures
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (%maximum)')
% ylim([-2*10^-3 8*10^-3]);
xlim([-0.25 0.5])
% title('Mean/SEM')


% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_US_chr2,2)),G.trial_mov_avg_US_chr2,G.trial_mov_SEM_US_chr2,'k');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_0_chr2,2)),G.trial_mov_avg_0_chr2,G.trial_mov_SEM_0_chr2,'b');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_25_chr2,2)),G.trial_mov_avg_25_chr2,G.trial_mov_SEM_25_chr2,'y');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_50_chr2,2)),G.trial_mov_avg_50_chr2,G.trial_mov_SEM_50_chr2,'r');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_75_chr2,2)),G.trial_mov_avg_75_chr2,G.trial_mov_SEM_75_chr2,'g');
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_100_chr2,2)),G.trial_mov_avg_100_chr2,G.trial_mov_SEM_100_chr2,'m');
% legend({'US' '0ms' '25ms' '50ms' '75ms' '100'})

% plot the figures
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (%maximum)')
% ylim([-2*10^-3 8*10^-3]);
xlim([-0.25 0.5])
% title('Mean/SEM')


% plot the figures
figure; hold on;
% plot((P.xaxis(1:size(G.trial_mov_avg_US_chr2,2)),G.trial_mov_avg_US_chr2,'k','LineWidth',1.5);
plot(P.xaxis(1:size(G.trial_mov_avg_0_chr2,2)),G.trial_mov_avg_0_chr2,'b','LineWidth',1.5);
% plot(P.xaxis(1:size(G.trial_mov_avg_25_chr2,2)),G.trial_mov_avg_25_chr2,'y','LineWidth',1.5);
% plot(P.xaxis(1:size(G.trial_mov_avg_50_chr2,2)),G.trial_mov_avg_50_chr2,'r','LineWidth',1.5);
% plot(P.xaxis(1:size(G.trial_mov_avg_75_chr2,2)),G.trial_mov_avg_75_chr2,'g','LineWidth',1.5);
plot(P.xaxis(1:size(G.trial_mov_avg_100_chr2,2)),G.trial_mov_avg_100_chr2,'m','LineWidth',1.5);
% legend({'US' '0ms' '25ms' '50ms' '75ms' '100'})

% plot the figures
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (%maximum)')
% ylim([-2*10^-3 8*10^-3]);
xlim([-0.25 0.5])
% title('Mean/SEM')

% plot the figures
figure; hold on;
% plot((P.xaxis(1:size(G.trial_mov_avg_US_chr2,2)),G.trial_mov_avg_US_chr2,'k','LineWidth',1.5);
plot(P.xaxis(1:size(G.trial_mov_avg_0_chr2,2)),G.trial_mov_avg_0_chr2,'b','LineWidth',1.5);
% plot(P.xaxis(1:size(G.trial_mov_avg_25_chr2,2)),G.trial_mov_avg_25_chr2,'y','LineWidth',1.5);
% plot(P.xaxis(1:size(G.trial_mov_avg_50_chr2,2)),G.trial_mov_avg_50_chr2,'r','LineWidth',1.5);
% plot(P.xaxis(1:size(G.trial_mov_avg_75_chr2,2)),G.trial_mov_avg_75_chr2,'g','LineWidth',1.5);
plot(P.xaxis(1:size(G.trial_mov_avg_100_chr2,2)),G.trial_mov_avg_100_chr2,'m','LineWidth',1.5);
% legend({'US' '0ms' '25ms' '50ms' '75ms' '100'})

% plot the figures
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (%maximum)')
% ylim([-2*10^-3 8*10^-3]);
xlim([-0.25 0.5])
% title('Mean/SEM')



























shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_US_chr2,2)),G.trial_mov_avg_US_chr2,G.trial_mov_SEM_US_chr2,'b');




G.trial_mov_avg=nanmean(G.trial_mov);
G.trial_mov_SD=nanstd(G.trial_mov);
G.trial_mov_SEM=nanstd(G.trial_mov)/sqrt(size(G.trial_mov,1));
P.xaxis=-0.5:(1/P.framerate):2;
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg,2)),G.trial_mov_avg,G.trial_mov_SEM);

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
%     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (arb. units)')
xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');

% Save figure
Y:\Data\CN-SC_eyemov\Wholebody\groupoutput_D2
figname = sprintf('%s_wholebody_groupAVG.fig',P.mouseID)
saveas(gcf,figname,'fig');
figname = sprintf('%s_wholebody_groupAVG.pdf',P.mouseID)
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('%s_wholebody_groupAVG.jpg',P.mouseID)
saveas(gcf,figname,'jpg')

%% Cumsum groupaverages

G.trial_cumsum_opto_avg=nanmean(G.trial_cumsum_opto);
G.trial_cumsum_opto_SD=nanstd(G.trial_cumsum_opto);
G.trial_cumsum_opto_SEM=nanstd(G.trial_cumsum_opto)/sqrt(size(G.trial_cumsum_opto,1));

G.trial_cumsum_baseline_avg=nanmean(G.trial_cumsum_baseline);
G.trial_cumsum_baseline_SD=nanstd(G.trial_cumsum_baseline);
G.trial_cumsum_baseline_SEM=nanstd(G.trial_cumsum_baseline)/sqrt(size(G.trial_cumsum_baseline,1));

% plot the figures
figure; hold on;
shadedErrorBar([0:(1/P.framerate):(0.5-(1/P.framerate))],G.trial_cumsum_baseline_avg,G.trial_cumsum_opto_SEM,'k');
shadedErrorBar([0:(1/P.framerate):(0.5-(1/P.framerate))],G.trial_cumsum_opto_avg,G.trial_cumsum_opto_SEM,'b');


% line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
%     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumul. sum whole body movements (arb. units)');
% xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd.Location = 'northwest'
% Save figure
Y:\Data\CN-SC_eyemov\Wholebody\groupoutput_D2
figname = sprintf('%s_cumsum_wholebody_groupAVG.fig',P.mouseID)
saveas(gcf,figname,'fig');
figname = sprintf('%s_cumsum_wholebody_groupAVG.pdf',P.mouseID)
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('%s_cumsum_wholebody_groupAVG.jpg',P.mouseID)
saveas(gcf,figname,'jpg')

%% Save the data
P.savename = sprintf('%s_wholebody_data_groupanalysis.mat',P.mouseID);
save(P.savename,'G',"-v7.3");
