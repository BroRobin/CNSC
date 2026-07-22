%% Analysis of whole-body movements

% (c) R. Broersen, Erasmus MC, 2023
clear all; close all
%% Perform the group average analysis (ALL mice)

G.trial_mov=[];
G.trial_cumsum_opto=[];


for zz=1:9
    clearvars -except zz G
    close all;
    if zz==1
        cd('')
        P.mouseID = '1007_D3_100ms';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==2
        cd('')
        P.mouseID = '1008_D3_100ms';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==3
        cd('')
        P.mouseID = '1012_D3_100ms';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))

    elseif zz==4
        cd('')
        P.mouseID = '1007_D3_100ms_lido';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==5
        cd('')
        P.mouseID = '1008_D3_100ms_lido';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==6
        cd('')
        P.mouseID = '1012_D3_100ms_lido';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))

    elseif zz==7
        cd('')
        P.mouseID = '1007_D3_100ms_washout';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==8
        cd('')
        P.mouseID = '1008_D3_100ms_washout';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    elseif zz==9
        cd('')
        P.mouseID = '1012_D3_100ms_washout';
        load(sprintf('%s_wholebody_data_withinROI_corrected.mat',P.mouseID))
    end

    G.trial_mov(zz,:)=imresize(S.trial_avg,[1 101]);
    G.trial_cumsum_opto(zz,:)=imresize(S.trial_cumsum_opto_avg,[1 25]);
    G.trial_cumsum_baseline(zz,:)=imresize(S.trial_cumsum_baseline_avg,[1 25]);


end

% Baseline AVERAGE
G.trial_mov_avg_baseline=nanmean(G.trial_mov([1 2 3],:));
G.trial_mov_SD_baseline=nanstd(G.trial_mov([1 2 3],:));
G.trial_mov_SEM_baseline=nanstd(G.trial_mov([1 2 3],:))/sqrt(size(G.trial_mov([1 2 3],:),1));
P.xaxis=linspace(-0.5,1.5,101);

% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_baseline,2)),G.trial_mov_avg_baseline,G.trial_mov_SEM_baseline,'k');

% Lido mice
G.trial_mov_avg_lido=nanmean(G.trial_mov([4 5 6],:));
G.trial_mov_SD_lido=nanstd(G.trial_mov([4 5 6],:));
G.trial_mov_SEM_lido=nanstd(G.trial_mov([4 5 6],:))/sqrt(size(G.trial_mov([4 5 6],:),1));
% plot the figures
shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_lido,2)),G.trial_mov_avg_lido,G.trial_mov_SEM_lido,'m');

% Washout mice
G.trial_mov_avg_washout=nanmean(G.trial_mov([7 8 9],:));
G.trial_mov_SD_washout=nanstd(G.trial_mov([7 8 9],:));
G.trial_mov_SEM_washout=nanstd(G.trial_mov([7 8 9],:))/sqrt(size(G.trial_mov([7 8 9],:),1));
% plot the figures
% shadedErrorBar(P.xaxis(1:size(G.trial_mov_avg_washout,2)),G.trial_mov_avg_washout,G.trial_mov_SEM_washout,'c');

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (%maximum)')
% ylim([-2*10^-3 8*10^-3]);
xlim([-0.25 0.5]); ylim([-0.5 1.5])
% title('Mean/SEM')

% Save figure
cd('')
figname = sprintf('D3_wholebody_groupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_wholebody_groupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_wholebody_groupAVG.jpg')
saveas(gcf,figname,'jpg')


%%
figure; hold on;
P.xaxis=linspace(-0.5,1.5,101);
plot(P.xaxis,G.trial_mov([1 2 3],:)','k','LineWidth',2)
plot(P.xaxis,G.trial_mov([4 5],:)','m','LineWidth',2)
% plot(P.xaxis,G.trial_mov([7 8 9],:)','c','LineWidth',2)

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Movement index (arb. units)')
xlim([-0.25 0.5]); ylim([-0.5 1.5]);
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');

% Save figure
cd('')
figname = sprintf('D3_wholebody_groupAVG_indTrials.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_wholebody_groupAVG_indTrials.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_wholebody_groupAVG_indTrials.jpg')
saveas(gcf,figname,'jpg')

%% Calculate the area and amplitude
G.trial_mov_area=[];
G.trial_mov_amp=[];
for ii=1:size(G.trial_mov,1)
    G.trial_mov_area(ii)= nansum(G.trial_mov(ii,P.xaxis>=0&P.xaxis<0.25));
    G.trial_mov_amp(ii)= nanmax(G.trial_mov(ii,P.xaxis>=0&P.xaxis<0.25));
end
G.trial_mov_area_baseline=G.trial_mov_area([1 2])';
G.trial_mov_amp_baseline=G.trial_mov_area([1 2])';

G.trial_mov_amp_lido=G.trial_mov_area([4 5])';
G.trial_mov_area_lido=G.trial_mov_area([4 5])';

G.trial_mov_amp_washout=G.trial_mov_area([7 8])';
G.trial_mov_area_washout=G.trial_mov_area([7 8])';


%% Save the data
P.savename = sprintf('D3_wholebody_data_groupanalysis.mat');
save(P.savename,'G',"-v7.3");



