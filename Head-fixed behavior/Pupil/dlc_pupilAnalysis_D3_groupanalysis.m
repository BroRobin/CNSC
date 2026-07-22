%% Analyze CSV files to extract pupil movements and pupil size

clear all; close all
%% Perform the group average analysis (ALL mice)

for zz=1:4
    clearvars -except zz G
    close all;
    if zz==1
        cd('')
        P.mouseID = '1007_100ms_D3';
        load(sprintf('%s_pupil_data_25Hzgauss.mat',P.mouseID))
    elseif zz==2
        cd('')
        P.mouseID = '1007_lido_D3';
        load(sprintf('%s_pupil_data_25Hzgauss.mat',P.mouseID))
    elseif zz==3
        cd('')
        P.mouseID = '1008_100ms_D3';
        load(sprintf('%s_pupil_data_25Hzgauss.mat',P.mouseID))
    elseif zz==4
        cd('')
        P.mouseID = '1008_lido_D3';
        load(sprintf('%s_pupil_data_25Hzgauss.mat',P.mouseID))
    elseif zz==5
        cd('')
        P.mouseID = '1012_100ms_D3';
        load(sprintf('%s_pupil_data_25Hzgauss.mat',P.mouseID))
    elseif zz==6
        cd('')
        P.mouseID = '1012_lido_D3';
        load(sprintf('%s_pupil_data_25Hzgauss.mat',P.mouseID))

    end
    G.pupmov(zz,:)=S.pupmov_avg;
    G.pupmov_cumsum_opto(zz,:)=S.pupmov_cumsum_opto_avg;
    G.pupdist(zz,:)=nanmean(S.pupdist_baselined,1);

    % Calculate the cumsum of pupil diameter
    for ii=1:size(P.fileList,2)
        idx = S.pupdist(ii,:)-nanmean(S.pupdist(ii,1:round(0.5*P.fs)));
        S.pupdist_cumsum_opto(ii,:) = cumsum(idx(round(0.5*P.fs):round(0.75*P.fs)));
    end
    G.pupdist_cumsum_opto(zz,:) = nanmean(S.pupdist_cumsum_opto);


    G.pupmov_area(zz,:)=nanmean(S.pupmov_area);
    G.pupmov_amp(zz,:)=nanmean(S.pupmov_amp);
end


%Ctr mice AVERAGE
G.pupmov_avg_ctr=nanmean(G.pupmov([1 3],:));
G.pupmov_SD_ctr=nanstd(G.pupmov([1 3],:));
G.pupmov_SEM_ctr=nanstd(G.pupmov([1 3],:))/sqrt(size(G.pupmov([1 3],:),1));
P.xaxis=linspace(-0.5,1.5,640);
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis,G.pupmov_avg_ctr(1:size(P.xaxis,2)),G.pupmov_SEM_ctr(1:size(P.xaxis,2)),'k');

%ChR2 mice
G.pupmov_avg_chr2=nanmean(G.pupmov([2 4],:));
G.pupmov_SD_chr2=nanstd(G.pupmov([2 4],:));
G.pupmov_SEM_chr2=nanstd(G.pupmov([2 4],:))/sqrt(size(G.pupmov([2 4],:),1));
% plot the figures
shadedErrorBar(P.xaxis,G.pupmov_avg_chr2(1:size(P.xaxis,2)),G.pupmov_SEM_chr2(1:size(P.xaxis,2)),'b');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
% title('Mean/SEM')

% Save figure
cd('')
figname = sprintf('D3_pupilmovements_groupAVG_25Hzgauss.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_pupilmovements_groupAVG_25Hzgauss.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_pupilmovements_groupAVG_25Hzgauss.jpg')
saveas(gcf,figname,'jpg')

%Ctr mice
G.pupmov_median_ctr=nanmedian(G.pupmov([1 3],:));
G.pupmov_iqr_ctr=iqr(G.pupmov([1 3],:));
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis,G.pupmov_median_ctr(1:size(P.xaxis,2)),G.pupmov_iqr_ctr(1:size(P.xaxis,2)),'k');

%ChR2 mice
G.pupmov_median_chr2=nanmedian(G.pupmov([2 4],:));
G.pupmov_iqr_chr2=iqr(G.pupmov([2 4],:));
% plot the figures

shadedErrorBar(P.xaxis,G.pupmov_median_chr2(1:size(P.xaxis,2)),G.pupmov_iqr_chr2(1:size(P.xaxis,2)),'b');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
% title('Median/IQR')

% Save figure
cd('')
figname = sprintf('D3_pupilmovements_groupMDN_25Hzgauss.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_pupilmovements_groupMDN_25Hzgauss.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_pupilmovements_groupMDN_25Hzgauss.jpg')
saveas(gcf,figname,'jpg')


figure; hold on;
plot(P.xaxis,G.pupmov([1 3],(1:size(P.xaxis,2)))','k')
plot(P.xaxis,G.pupmov([2 4],(1:size(P.xaxis,2)))','b')

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');

% Save figure
cd('')
figname = sprintf('D3_pupilmovements_groupAVG_indTrials_25Hzgauss.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_pupilmovements_groupAVG_indTrials_25Hzgauss.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_pupilmovements_groupAVG_indTrials_25Hzgauss.jpg')
saveas(gcf,figname,'jpg')

%% Cumsum groupaverages

G.pupmov_cumsum_opto_avg_chr2=nanmean(G.pupmov_cumsum_opto([2 4],:));
G.pupmov_cumsum_opto_SD_chr2=nanstd(G.pupmov_cumsum_opto([2 4],:));
G.pupmov_cumsum_opto_SEM_chr2=nanstd(G.pupmov_cumsum_opto([2 4],:))/sqrt(size(G.pupmov_cumsum_opto([2 4],:),1));

G.pupmov_cumsum_opto_avg_ctr=nanmean(G.pupmov_cumsum_opto([1 3],:));
G.pupmov_cumsum_opto_SD_ctr=nanstd(G.pupmov_cumsum_opto([1 3],:));
G.pupmov_cumsum_opto_SEM_ctr=nanstd(G.pupmov_cumsum_opto([1 3],:))/sqrt(size(G.pupmov_cumsum_opto([1 3],:),1));

% plot the figures
figure; hold on;
P.xaxis_cumsum=linspace(0,0.25,81);
shadedErrorBar(P.xaxis_cumsum,G.pupmov_cumsum_opto_avg_ctr,G.pupmov_cumsum_opto_SEM_ctr,'k');
shadedErrorBar(P.xaxis_cumsum,G.pupmov_cumsum_opto_avg_chr2,G.pupmov_cumsum_opto_SEM_chr2,'b');


line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumulative sum pupil movements (arb. units)');
% xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd.Location = 'northwest'
% Save figure
cd('')
figname = sprintf('D3_cumsum_pupilmovement_groupAVG_25Hzgauss.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_cumsum_pupilmovement_groupAVG_25Hzgauss.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_cumsum_pupilmovement_groupAVG_25Hzgauss.jpg')
saveas(gcf,figname,'jpg')

%% Calculate the area and amp

G.pupmov_area_chr2=G.pupmov_area([2 4]);
G.pupmov_area_ctr=G.pupmov_area([1 3]);

G.pupmov_amp_chr2=G.pupmov_amp([2 4]);
G.pupmov_amp_ctr=G.pupmov_amp([1 3]);


%% pupil diameter changes

%Ctr mice AVERAGE
G.pupdist_avg_ctr=nanmean(G.pupdist([1 3],:));
G.pupdist_SD_ctr=nanstd(G.pupdist([1 3],:));
G.pupdist_SEM_ctr=nanstd(G.pupdist([1 3],:))/sqrt(size(G.pupdist([1 3],:),1));
P.xaxis=linspace(-0.5,1.5,640);
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis,G.pupdist_avg_ctr(1:size(P.xaxis,2)),G.pupdist_SEM_ctr(1:size(P.xaxis,2)),'k');

%ChR2 mice
G.pupdist_avg_chr2=nanmean(G.pupdist([2 4],:));
G.pupdist_SD_chr2=nanstd(G.pupdist([2 4],:));
G.pupdist_SEM_chr2=nanstd(G.pupdist([2 4],:))/sqrt(size(G.pupdist([2 4],:),1));
% plot the figures
shadedErrorBar(P.xaxis,G.pupdist_avg_chr2(1:size(P.xaxis,2)),G.pupdist_SEM_chr2(1:size(P.xaxis,2)),'b');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil diameter change (%eye width)')
xlim([-0.25 0.5])
% title('Mean/SEM')

% Save figure
cd('')
figname = sprintf('D3_pupildiameter_groupAVG_25Hzgauss.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_pupildiameter_groupAVG_25Hzgauss.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_pupildiameter_groupAVG_25Hzgauss.jpg')
saveas(gcf,figname,'jpg')

%% Cumsum groupaverages

G.pupdist_cumsum_opto_avg_chr2=nanmean(G.pupdist_cumsum_opto([2 4],:));
G.pupdist_cumsum_opto_SD_chr2=nanstd(G.pupdist_cumsum_opto([2 4],:));
G.pupdist_cumsum_opto_SEM_chr2=nanstd(G.pupdist_cumsum_opto([2 4],:))/sqrt(size(G.pupdist_cumsum_opto([2 4],:),1));

G.pupdist_cumsum_opto_avg_ctr=nanmean(G.pupdist_cumsum_opto([1 3],:));
G.pupdist_cumsum_opto_SD_ctr=nanstd(G.pupdist_cumsum_opto([1 3],:));
G.pupdist_cumsum_opto_SEM_ctr=nanstd(G.pupdist_cumsum_opto([1 3],:))/sqrt(size(G.pupdist_cumsum_opto([1 3],:),1));

% plot the figures
figure; hold on;
P.xaxis_cumsum=linspace(0,0.25,81);
shadedErrorBar(P.xaxis_cumsum,G.pupdist_cumsum_opto_avg_ctr,G.pupdist_cumsum_opto_SEM_ctr,'k');
shadedErrorBar(P.xaxis_cumsum,G.pupdist_cumsum_opto_avg_chr2,G.pupdist_cumsum_opto_SEM_chr2,'b');


line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumulative sum pupil diameter changes (arb. units)');
% xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd.Location = 'northwest'
% Save figure
cd('')
figname = sprintf('D3_cumsum_pupildiameter_groupAVG_25Hzgauss.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_cumsum_pupildiameter_groupAVG_25Hzgauss.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_cumsum_pupildiameter_groupAVG_25Hzgauss.jpg')
saveas(gcf,figname,'jpg')

%% Calculate the area and amplitude
G.pupdist_area=[];
G.pupdist_amp   =[];
for ii=1:size(G.pupdist,1)
    G.pupdist_area(ii)= nansum(G.pupdist(ii,P.xaxis>=0&P.xaxis<0.25));
end
G.pupdist_area_chr2=G.pupdist_area([2 4])';
G.pupdist_area_ctr=G.pupdist_area([1 3])';


%% Save the data
P.savename = sprintf('D3_pupilmovements_data_groupanalysis_25Hzgauss.mat');
save(P.savename,'G',"-v7.3");