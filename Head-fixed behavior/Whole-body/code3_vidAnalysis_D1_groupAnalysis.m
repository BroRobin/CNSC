%% Analysis of whole-body movements

% (c) R. Broersen, Erasmus MC, 2023
clear all; close all
%% Perform the group average analysis (ALL mice)

G.trial_mov=[];
G.trial_cumsum_opto=[];


for zz=1:14
    clearvars -except zz G
    close all;
    if zz==1
       cd('')
        P.mouseID = '973_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==2
       cd('')
        P.mouseID = '974_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==3
cd('')
        P.mouseID = '975_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==4
    cd('')
        P.mouseID = '976_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==5
cd('')
        P.mouseID = '977_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==6
cd('')
        P.mouseID = '978_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==7
      cd('')
        P.mouseID = '1007_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==8
      cd('')
        P.mouseID = '1008_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==9
      cd('')
        P.mouseID = '1009_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==10
       cd('')
        P.mouseID = '1010_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==11
        cd('')
        P.mouseID = '1011_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==12
       cd('')
        P.mouseID = '1012_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==13
    cd('')
        P.mouseID = '1013_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==14
     cd('')
        P.mouseID = '1014_D1';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    end

    if zz<9
    G.trial_mov(zz,:)=imresize(S.trial_avg,[1 101]);
    G.trial_cumsum_opto(zz,:)=imresize(S.trial_cumsum_opto_avg,[1 25]);
    G.trial_cumsum_baseline(zz,:)=imresize(S.trial_cumsum_baseline_avg,[1 25]);
    elseif zz>8
            G.trial_mov(zz,:)=S.trial_avg;
    G.trial_cumsum_opto(zz,:)=S.trial_cumsum_opto_avg;
    G.trial_cumsum_baseline(zz,:)=S.trial_cumsum_baseline_avg;
    end
end

%Ctr mice AVERAGE
G.trial_mov_avg_ctr=nanmean(G.trial_mov([9 10 11 13 14],:));
G.trial_mov_SD_ctr=nanstd(G.trial_mov([9 10 11 13 14],:));
G.trial_mov_SEM_ctr=nanstd(G.trial_mov([9 10 11 13 14],:))/sqrt(size(G.trial_mov([9 10 11 13 14],:),1));
P.xaxis=linspace(-0.5,1.5,101);
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_ctr,2)),G.trial_mov_avg_ctr,G.trial_mov_SEM_ctr,'k');

%ChR2 mice
G.trial_mov_avg_chr2=nanmean(G.trial_mov([1 2 3 4 5 6 7 8 12],:));
G.trial_mov_SD_chr2=nanstd(G.trial_mov([1 2 3 4 5 6 7 8 12],:));
G.trial_mov_SEM_chr2=nanstd(G.trial_mov([1 2 3 4 5 6 7 8 12],:))/sqrt(size(G.trial_mov([1 2 3 4 5 6 7 8 12],:),1));
% plot the figures
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_chr2,2)),G.trial_mov_avg_chr2,G.trial_mov_SEM_chr2,'b');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (%maximum)')
% ylim([-2*10^-3 8*10^-3]);
xlim([-0.25 0.5])
% title('Mean/SEM')

% Save figure
cd('')
figname = sprintf('D1_wholebody_groupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_wholebody_groupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_wholebody_groupAVG.jpg')
saveas(gcf,figname,'jpg')

%ChR2 mice
G.trial_mov_median_chr2=nanmedian(G.trial_mov([1 2 3 4 5 6 7 8 12],:));
G.trial_mov_iqr_chr2=iqr(G.trial_mov([1 2 3 4 5 6 7 8 12],:));
P.xaxis=linspace(-0.5,1.5,101);
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.trial_mov_median_chr2,2)),G.trial_mov_median_chr2,G.trial_mov_iqr_chr2,'b');

%Ctr mice
G.trial_mov_median_ctr=nanmedian(G.trial_mov([9 10 11 13 14],:));
G.trial_mov_iqr_ctr=iqr(G.trial_mov([9 10 11 13 14],:));
% plot the figures
shadedErrorBar(P.xaxis(1:size(G.trial_mov_median_ctr,2)),G.trial_mov_median_ctr,G.trial_mov_iqr_ctr,'k');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (arb. units)')
xlim([-0.25 0.5])
% title('Median/IQR')

% Save figure
cd('')
figname = sprintf('D1_wholebody_groupMDN.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_wholebody_groupMDN.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_wholebody_groupMDN.jpg')
saveas(gcf,figname,'jpg')


figure; hold on;
P.xaxis=linspace(-0.5,1.5,101);
plot(P.xaxis,G.trial_mov([9 10 11 13 14],:)','k','LineWidth',2)
plot(P.xaxis,G.trial_mov([1 2 3 4 5 6 7 8 12],:)','b','LineWidth',2)

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (arb. units)')
xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');

% Save figure
cd('')
figname = sprintf('D1_wholebody_groupAVG_indTrials.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_wholebody_groupAVG_indTrials.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_wholebody_groupAVG_indTrials.jpg')
saveas(gcf,figname,'jpg')

%% Cumsum groupaverages

G.trial_cumsum_opto_avg_chr2=nanmean(G.trial_cumsum_opto([1 2 3 4 5 6 7 8 12],:));
G.trial_cumsum_opto_SD_chr2=nanstd(G.trial_cumsum_opto([1 2 3 4 5 6 7 8 12],:));
G.trial_cumsum_opto_SEM_chr2=nanstd(G.trial_cumsum_opto([1 2 3 4 5 6 7 8 12],:))/sqrt(size(G.trial_cumsum_opto([1 2 3 4 5 6 7 8 12],:),1));

G.trial_cumsum_opto_avg_ctr=nanmean(G.trial_cumsum_opto([9 10 11 13 14],:));
G.trial_cumsum_opto_SD_ctr=nanstd(G.trial_cumsum_opto([9 10 11 13 14],:));
G.trial_cumsum_opto_SEM_ctr=nanstd(G.trial_cumsum_opto([9 10 11 13 14],:))/sqrt(size(G.trial_cumsum_opto([9 10 11 13 14],:),1));

% plot the figures
figure; hold on;
P.xaxis_cumsum=linspace(0,0.5,25);
shadedErrorBar(P.xaxis_cumsum,G.trial_cumsum_opto_avg_ctr,G.trial_cumsum_opto_SEM_ctr,'k');
shadedErrorBar(P.xaxis_cumsum,G.trial_cumsum_opto_avg_chr2,G.trial_cumsum_opto_SEM_chr2,'b');


line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumulative sum movement index (arb. units)');
% xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd.Location = 'northwest'
% Save figure
cd('')
figname = sprintf('D1_cumsum_wholebody_groupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_cumsum_wholebody_groupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_cumsum_wholebody_groupAVG.jpg')
saveas(gcf,figname,'jpg')

%% Calculate the area and amplitude
G.trial_mov_area=[];
G.trial_mov_amp=[];
for ii=1:size(G.trial_mov,1)
    G.trial_mov_area(ii)= nansum(G.trial_mov(ii,P.xaxis>=0&P.xaxis<0.25));
    G.trial_mov_amp(ii)= nanmax(G.trial_mov(ii,P.xaxis>=0&P.xaxis<0.25));
end
G.trial_mov_area_chr2=G.trial_mov_area([1 2 3 4 5 6 7 8 12])';
G.trial_mov_area_ctr=G.trial_mov_area([9 10 11 13 14])';
G.trial_mov_amp_chr2=G.trial_mov_amp([1 2 3 4 5 6 7 8 12])';
G.trial_mov_amp_ctr=G.trial_mov_amp([9 10 11 13 14])';


%% Save the data
P.savename = sprintf('D1_wholebody_data_groupanalysis.mat');
save(P.savename,'G',"-v7.3");