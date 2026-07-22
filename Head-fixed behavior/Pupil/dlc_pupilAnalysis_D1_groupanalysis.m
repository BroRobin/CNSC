%% Analyze CSV files to extract pupil movements and pupil size

clear all; close all
%% Perform the group average analysis (ALL mice)

for zz=1:14
    clearvars -except zz G
    close all;
    if zz==1
        cd('')
        P.mouseID = '973_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==2
        cd('')
        P.mouseID = '974_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==3
        cd('')
        P.mouseID = '975_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==4
        cd('')
        P.mouseID = '976_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==5
        cd('')
        P.mouseID = '977_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==6
        cd('')
        P.mouseID = '978_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==7
        cd('')
        P.mouseID = '1007_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==8
        cd('')
        P.mouseID = '1008_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==9
        cd('')
        P.mouseID = '1009_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==10
        cd('')
        P.mouseID = '1010_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==11
        cd('')
        P.mouseID = '1011_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==12
        cd('')
        P.mouseID = '1013_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==13
        cd('')
        P.mouseID = '1014_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
    elseif zz==14
        cd('')
        P.mouseID = '1015_D1';
        load(sprintf('%s_pupil_data_25Hzgauss_revised.mat',P.mouseID))
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
    G.pupmov_area_100ms(zz,:)=nanmean(S.pupmov_area_100ms);
    G.pupmov_amp_100ms(zz,:)=nanmean(S.pupmov_amp_100ms);
    G.pupmov_area_50ms(zz,:)=nanmean(S.pupmov_area_50ms);
    G.pupmov_amp_50ms(zz,:)=nanmean(S.pupmov_amp_50ms);
    G.pupmov_area_200ms(zz,:)=nanmean(S.pupmov_area_200ms);
    G.pupmov_amp_200ms(zz,:)=nanmean(S.pupmov_amp_200ms);
end
savefig = 0;

%Ctr mice AVERAGE
G.pupmov_avg_ctr=nanmean(G.pupmov([9 10 11 12 13 14],:));
G.pupmov_SD_ctr=nanstd(G.pupmov([9 10 11 12 13 14],:));
G.pupmov_SEM_ctr=nanstd(G.pupmov([9 10 11 12 13 14],:))/sqrt(size(G.pupmov([9 10 11 12 13 14],:),1));
P.xaxis=linspace(-0.5,1.5,640);
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis,G.pupmov_avg_ctr(1:size(P.xaxis,2)),G.pupmov_SEM_ctr(1:size(P.xaxis,2)),'k');

%ChR2 mice
G.pupmov_avg_chr2=nanmean(G.pupmov([1 2 3 4 5 6 7 8],:));
G.pupmov_SD_chr2=nanstd(G.pupmov([1 2 3 4 5 6 7 8],:));
G.pupmov_SEM_chr2=nanstd(G.pupmov([1 2 3 4 5 6 7 8],:))/sqrt(size(G.pupmov([1 2 3 4 5 6 7 8],:),1));
% plot the figures
shadedErrorBar(P.xaxis,G.pupmov_avg_chr2(1:size(P.xaxis,2)),G.pupmov_SEM_chr2(1:size(P.xaxis,2)),'b');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
% title('Mean/SEM')

% Save figure
if savefig==1
    cd('')
    figname = sprintf('D1_pupilmovements_groupAVG_25Hzgauss.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D1_pupilmovements_groupAVG_25Hzgauss.pdf')
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D1_pupilmovements_groupAVG_25Hzgauss.jpg')
    saveas(gcf,figname,'jpg')
end
%Ctr mice
G.pupmov_median_ctr=nanmedian(G.pupmov([9 10 11 12 13 14],:));
G.pupmov_iqr_ctr=iqr(G.pupmov([9 10 11 12 13 14],:));
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis,G.pupmov_median_ctr(1:size(P.xaxis,2)),G.pupmov_iqr_ctr(1:size(P.xaxis,2)),'k');

%ChR2 mice
G.pupmov_median_chr2=nanmedian(G.pupmov([1 2 3 4 5 6 7 8],:));
G.pupmov_iqr_chr2=iqr(G.pupmov([1 2 3 4 5 6 7 8],:));
% plot the figures

shadedErrorBar(P.xaxis,G.pupmov_median_chr2(1:size(P.xaxis,2)),G.pupmov_iqr_chr2(1:size(P.xaxis,2)),'b');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
% title('Median/IQR')

% Save figure
if savefig==1
    cd('')
    figname = sprintf('D1_pupilmovements_groupMDN_25Hzgauss.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D1_pupilmovements_groupMDN_25Hzgauss.pdf')
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D1_pupilmovements_groupMDN_25Hzgauss.jpg')
    saveas(gcf,figname,'jpg')
end

figure; hold on;
plot(P.xaxis,G.pupmov([9 10 11 12 13 14],(1:size(P.xaxis,2)))','k')
plot(P.xaxis,G.pupmov([1 2 3 4 5 6 7 8],(1:size(P.xaxis,2)))','b')

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');

% Save figure
if savefig==1
    cd('')
    figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss.pdf')
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss.jpg')
    saveas(gcf,figname,'jpg')
end
%% Cumsum groupaverages

G.pupmov_cumsum_opto_avg_chr2=nanmean(G.pupmov_cumsum_opto([1 2 3 4 5 6 7 8],:));
G.pupmov_cumsum_opto_SD_chr2=nanstd(G.pupmov_cumsum_opto([1 2 3 4 5 6 7 8],:));
G.pupmov_cumsum_opto_SEM_chr2=nanstd(G.pupmov_cumsum_opto([1 2 3 4 5 6 7 8],:))/sqrt(size(G.pupmov_cumsum_opto([1 2 3 4 5 6 7 8],:),1));

G.pupmov_cumsum_opto_avg_ctr=nanmean(G.pupmov_cumsum_opto([9 10 11 12 13 14],:));
G.pupmov_cumsum_opto_SD_ctr=nanstd(G.pupmov_cumsum_opto([9 10 11 12 13 14],:));
G.pupmov_cumsum_opto_SEM_ctr=nanstd(G.pupmov_cumsum_opto([9 10 11 12 13 14],:))/sqrt(size(G.pupmov_cumsum_opto([9 10 11 12 13 14],:),1));

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
if savefig==1
    cd('')
    figname = sprintf('D1_cumsum_pupilmovement_groupAVG_25Hzgauss.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D1_cumsum_pupilmovement_groupAVG_25Hzgauss.pdf')
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D1_cumsum_pupilmovement_groupAVG_25Hzgauss.jpg')
    saveas(gcf,figname,'jpg')
end

%% Calculate the area and amp

G.pupmov_area_chr2=G.pupmov_area([1 2 3 4 5 6 7 8]);
G.pupmov_area_ctr=G.pupmov_area([9 10 11 12 13 14]);

G.pupmov_amp_chr2=G.pupmov_amp([1 2 3 4 5 6 7 8]);
G.pupmov_amp_ctr=G.pupmov_amp([9 10 11 12 13 14]);

G.pupmov_area_100ms_chr2=G.pupmov_area_100ms([1 2 3 4 5 6 7 8]);
G.pupmov_area_100ms_ctr=G.pupmov_area_100ms([9 10 11 12 13 14]);

G.pupmov_amp_100ms_chr2=G.pupmov_amp_100ms([1 2 3 4 5 6 7 8]);
G.pupmov_amp_100ms_ctr=G.pupmov_amp_100ms([9 10 11 12 13 14]);

G.pupmov_area_50ms_chr2=G.pupmov_area_50ms([1 2 3 4 5 6 7 8]);
G.pupmov_area_50ms_ctr=G.pupmov_area_50ms([9 10 11 12 13 14]);

G.pupmov_amp_50ms_chr2=G.pupmov_amp_50ms([1 2 3 4 5 6 7 8]);
G.pupmov_amp_50ms_ctr=G.pupmov_amp_50ms([9 10 11 12 13 14]);

G.pupmov_area_200ms_chr2=G.pupmov_area_200ms([1 2 3 4 5 6 7 8]);
G.pupmov_area_200ms_ctr=G.pupmov_area_200ms([9 10 11 12 13 14]);

G.pupmov_amp_200ms_chr2=G.pupmov_amp_200ms([1 2 3 4 5 6 7 8]);
G.pupmov_amp_200ms_ctr=G.pupmov_amp_200ms([9 10 11 12 13 14]);




%% pupil diameter changes

%Ctr mice AVERAGE
G.pupdist_avg_ctr=nanmean(G.pupdist([9 10 11 12 13 14],:));
G.pupdist_SD_ctr=nanstd(G.pupdist([9 10 11 12 13 14],:));
G.pupdist_SEM_ctr=nanstd(G.pupdist([9 10 11 12 13 14],:))/sqrt(size(G.pupdist([9 10 11 12 13 14],:),1));
P.xaxis=linspace(-0.5,1.5,640);
% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis,G.pupdist_avg_ctr(1:size(P.xaxis,2)),G.pupdist_SEM_ctr(1:size(P.xaxis,2)),'k');

%ChR2 mice
G.pupdist_avg_chr2=nanmean(G.pupdist([1 2 3 4 5 6 7 8],:));
G.pupdist_SD_chr2=nanstd(G.pupdist([1 2 3 4 5 6 7 8],:));
G.pupdist_SEM_chr2=nanstd(G.pupdist([1 2 3 4 5 6 7 8],:))/sqrt(size(G.pupdist([1 2 3 4 5 6 7 8],:),1));
% plot the figures
shadedErrorBar(P.xaxis,G.pupdist_avg_chr2(1:size(P.xaxis,2)),G.pupdist_SEM_chr2(1:size(P.xaxis,2)),'b');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Pupil diameter change (%eye width)')
xlim([-0.25 0.5])
% title('Mean/SEM')

% Save figure
if savefig==1
    cd('')
    figname = sprintf('D1_pupildiameter_groupAVG_25Hzgauss.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D1_pupildiameter_groupAVG_25Hzgauss.pdf')
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D1_pupildiameter_groupAVG_25Hzgauss.jpg')
    saveas(gcf,figname,'jpg')
end

%% Cumsum groupaverages

G.pupdist_cumsum_opto_avg_chr2=nanmean(G.pupdist_cumsum_opto([1 2 3 4 5 6 7 8],:));
G.pupdist_cumsum_opto_SD_chr2=nanstd(G.pupdist_cumsum_opto([1 2 3 4 5 6 7 8],:));
G.pupdist_cumsum_opto_SEM_chr2=nanstd(G.pupdist_cumsum_opto([1 2 3 4 5 6 7 8],:))/sqrt(size(G.pupdist_cumsum_opto([1 2 3 4 5 6 7 8],:),1));

G.pupdist_cumsum_opto_avg_ctr=nanmean(G.pupdist_cumsum_opto([9 10 11 12 13 14],:));
G.pupdist_cumsum_opto_SD_ctr=nanstd(G.pupdist_cumsum_opto([9 10 11 12 13 14],:));
G.pupdist_cumsum_opto_SEM_ctr=nanstd(G.pupdist_cumsum_opto([9 10 11 12 13 14],:))/sqrt(size(G.pupdist_cumsum_opto([9 10 11 12 13 14],:),1));

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
if savefig==1
    cd('')
    figname = sprintf('D1_cumsum_pupildiameter_groupAVG_25Hzgauss.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D1_cumsum_pupildiameter_groupAVG_25Hzgauss.pdf')
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D1_cumsum_pupildiameter_groupAVG_25Hzgauss.jpg')
    saveas(gcf,figname,'jpg')
end
%% Calculate the area and amplitude
G.pupdist_area=[];
G.pupdist_amp   =[];
for ii=1:size(G.pupdist,1)
    G.pupdist_area(ii)= nansum(G.pupdist(ii,P.xaxis>=0&P.xaxis<0.25));
end
G.pupdist_area_chr2=G.pupdist_area([1 2 3 4 5 6 7 8])';
G.pupdist_area_ctr=G.pupdist_area([9 10 11 12 13 14])';


%% Save the data
cd('')
P.savename = sprintf('D1_pupilmovements_data_groupanalysis_25Hzgauss_revised.mat');
save(P.savename,'G',"-v7.3");


%% Modify axes of opened figure and save

xlim([-0.25 0.5])
ylim([-100 700])

cd('')
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.jpg')
saveas(gcf,figname,'jpg')

xlim([-0.25 0.5])
ylim([-50 300])

cd('')
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.jpg')
saveas(gcf,figname,'jpg')

xlim([-0.25 0.5])
ylim([-50 400])

cd('')
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_pupilmovements_groupAVG_indTrials_25Hzgauss_xaxisEdited.jpg')
saveas(gcf,figname,'jpg')