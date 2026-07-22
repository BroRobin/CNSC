1%% Perform the group average analysis (All mice)

G.pupmov_US=[];
G.pupmov_US_opto0=[];
G.pupmov_US_opto25=[];
G.pupmov_US_opto50=[];
G.pupmov_US_opto75=[];
G.pupmov_US_opto100=[];

G.pupmov_cumsum_opto_US=[];
G.pupmov_cumsum_opto_opto0=[];
G.pupmov_cumsum_opto_opto25=[];
G.pupmov_cumsum_opto_opto50=[];
G.pupmov_cumsum_opto_opto75=[];
G.pupmov_cumsum_opto_opto100=[];

for zz=1:4
    clearvars -except zz G
    close all;
    if zz==1
        cd('')
        P.mouseID = '1009_D2';
        load(sprintf('%s_pupil_data_Ctrl.mat',P.mouseID))
    elseif zz==2
        cd('')
        P.mouseID = '1010_D2';
        load(sprintf('%s_pupil_data_Ctrl.mat',P.mouseID))
    elseif zz==3
        cd('')
        P.mouseID = '1011_D2';
        load(sprintf('%s_pupil_data_Ctrl.mat',P.mouseID))
    elseif zz==4
        cd('')
        P.mouseID = '1013_D2';
        load(sprintf('%s_pupil_data_Ctrl.mat',P.mouseID))

    end
    G.pupmov_US(zz,:)=S.pupmov_US_avg;
    G.pupmov_US_opto0(zz,:)=S.pupmov_US_opto0_avg;
    G.pupmov_US_opto25(zz,:)=S.pupmov_US_opto25_avg;
    G.pupmov_US_opto50(zz,:)=S.pupmov_US_opto50_avg;
    G.pupmov_US_opto75(zz,:)=S.pupmov_US_opto75_avg;
    G.pupmov_US_opto100(zz,:)=S.pupmov_US_opto100_avg;

    G.pupmov_cumsum_opto_US(zz,:)=S.pupmov_cumsum_opto_avg_US;
    G.pupmov_cumsum_opto_opto0(zz,:)=S.pupmov_cumsum_opto_avg_opto0;
    G.pupmov_cumsum_opto_opto25(zz,:)=S.pupmov_cumsum_opto_avg_opto25;
    G.pupmov_cumsum_opto_opto50(zz,:)=S.pupmov_cumsum_opto_avg_opto50;
    G.pupmov_cumsum_opto_opto75(zz,:)=S.pupmov_cumsum_opto_avg_opto75;
    G.pupmov_cumsum_opto_opto100(zz,:)=S.pupmov_cumsum_opto_avg_opto100;

    % Calculate the area - 500-700ms
    G.pupmov_US_area=[];
    G.pupmov_US_opto0_area=[];
    G.pupmov_US_opto25_area=[];
    G.pupmov_US_opto50_area=[];
    G.pupmov_US_opto75_area=[];
    G.pupmov_US_opto100_area=[];
    %
    %     for yy=1:size(S.pupmov_US,1)
    %         if isnan(S.pupmov_US(yy,1))==0
    %             G.pupmov_US_area(yy)=nansum(S.pupmov_US(yy,round(0.5*P.fs):round(0.75*P.fs)));
    %         else
    %             G.pupmov_US_area(yy)=NaN;
    %         end
    %         if isnan(S.pupmov_US_opto0(yy,1))==0
    %             G.pupmov_US_opto0_area(yy)=nansum(S.pupmov_US_opto0(yy,round(0.5*P.fs):round(0.75*P.fs)));
    %         else
    %             G.pupmov_US_opto0_area(yy)=NaN;
    %         end
    %         if isnan(S.pupmov_US_opto25(yy,1))==0
    %             G.pupmov_US_opto25_area(yy)=nansum(S.pupmov_US_opto25(yy,round(0.5*P.fs):round(0.75*P.fs)));
    %         else
    %             G.pupmov_US_opto25_area(yy)=NaN;
    %         end
    %         if isnan(S.pupmov_US_opto50(yy,1))==0
    %             G.pupmov_US_opto50_area(yy)=nansum(S.pupmov_US_opto50(yy,round(0.5*P.fs):round(0.75*P.fs)));
    %         else
    %             G.pupmov_US_opto50_area(yy)=NaN;
    %         end
    %         if isnan(S.pupmov_US_opto75(yy,1))==0
    %             G.pupmov_US_opto75_area(yy)=nansum(S.pupmov_US_opto75(yy,round(0.5*P.fs):round(0.75*P.fs)));
    %         else
    %             G.pupmov_US_opto75_area(yy)=NaN;
    %         end
    %         if isnan(S.pupmov_US_opto100(yy,1))==0
    %             G.pupmov_US_opto100_area(yy)=nansum(S.pupmov_US_opto100(yy,round(0.5*P.fs):round(0.75*P.fs)));
    %         else
    %             G.pupmov_US_opto100_area(yy)=NaN;
    %         end
    %     end


    for yy=1:size(S.pupmov_US,1)
        if isnan(S.pupmov_US(yy,1))==0
            G.pupmov_US_area(yy)=nansum(S.pupmov_US(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_area(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto0(yy,1))==0
            G.pupmov_US_opto0_area(yy)=nansum(S.pupmov_US_opto0(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto0_area(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto25(yy,1))==0
            G.pupmov_US_opto25_area(yy)=nansum(S.pupmov_US_opto25(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto25_area(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto50(yy,1))==0
            G.pupmov_US_opto50_area(yy)=nansum(S.pupmov_US_opto50(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto50_area(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto75(yy,1))==0
            G.pupmov_US_opto75_area(yy)=nansum(S.pupmov_US_opto75(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto75_area(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto100(yy,1))==0
            G.pupmov_US_opto100_area(yy)=nansum(S.pupmov_US_opto100(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto100_area(yy)=NaN;
        end
    end

    G.pupmov_US_area_avg(zz,1)=nanmean(G.pupmov_US_area);
    G.pupmov_US_opto0_area_avg(zz,1)=nanmean(G.pupmov_US_opto0_area);
    G.pupmov_US_opto25_area_avg(zz,1)=nanmean(G.pupmov_US_opto25_area);
    G.pupmov_US_opto50_area_avg(zz,1)=nanmean(G.pupmov_US_opto50_area);
    G.pupmov_US_opto75_area_avg(zz,1)=nanmean(G.pupmov_US_opto75_area);
    G.pupmov_US_opto100_area_avg(zz,1)=nanmean(G.pupmov_US_opto100_area);


    % Calculate the amplitude - 500-700ms
    G.pupmov_US_amp=[];
    G.pupmov_US_opto0_amp=[];
    G.pupmov_US_opto25_amp=[];
    G.pupmov_US_opto50_amp=[];
    G.pupmov_US_opto75_amp=[];
    G.pupmov_US_opto100_amp=[];

    for yy=1:size(S.pupmov_US,1)
        if isnan(S.pupmov_US(yy,1))==0
            G.pupmov_US_amp(yy)=nanmax(S.pupmov_US(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_amp(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto0(yy,1))==0
            G.pupmov_US_opto0_amp(yy)=nanmax(S.pupmov_US_opto0(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto0_amp(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto25(yy,1))==0
            G.pupmov_US_opto25_amp(yy)=nanmax(S.pupmov_US_opto25(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto25_amp(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto50(yy,1))==0
            G.pupmov_US_opto50_amp(yy)=nanmax(S.pupmov_US_opto50(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto50_amp(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto75(yy,1))==0
            G.pupmov_US_opto75_amp(yy)=nanmax(S.pupmov_US_opto75(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto75_amp(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto100(yy,1))==0
            G.pupmov_US_opto100_amp(yy)=nanmax(S.pupmov_US_opto100(yy,round(0.5*P.fs):round(0.7*P.fs)));
        else
            G.pupmov_US_opto100_amp(yy)=NaN;
        end
    end

    G.pupmov_US_amp_avg(zz,1)=nanmean(G.pupmov_US_amp);
    G.pupmov_US_opto0_amp_avg(zz,1)=nanmean(G.pupmov_US_opto0_amp);
    G.pupmov_US_opto25_amp_avg(zz,1)=nanmean(G.pupmov_US_opto25_amp);
    G.pupmov_US_opto50_amp_avg(zz,1)=nanmean(G.pupmov_US_opto50_amp);
    G.pupmov_US_opto75_amp_avg(zz,1)=nanmean(G.pupmov_US_opto75_amp);
    G.pupmov_US_opto100_amp_avg(zz,1)=nanmean(G.pupmov_US_opto100_amp);

    % 600-750ms
    for yy=1:size(S.pupmov_US,1)
        if isnan(S.pupmov_US(yy,1))==0
            G.pupmov_US_area_600(yy)=nansum(S.pupmov_US(yy,round(0.6*P.fs):round(0.75*P.fs)));
        else
            G.pupmov_US_area_600(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto0(yy,1))==0
            G.pupmov_US_opto0_area_600(yy)=nansum(S.pupmov_US_opto0(yy,round(0.6*P.fs):round(0.75*P.fs)));
        else
            G.pupmov_US_opto0_area_600(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto25(yy,1))==0
            G.pupmov_US_opto25_area_600(yy)=nansum(S.pupmov_US_opto25(yy,round(0.6*P.fs):round(0.75*P.fs)));
        else
            G.pupmov_US_opto25_area_600(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto50(yy,1))==0
            G.pupmov_US_opto50_area_600(yy)=nansum(S.pupmov_US_opto50(yy,round(0.6*P.fs):round(0.75*P.fs)));
        else
            G.pupmov_US_opto50_area_600(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto75(yy,1))==0
            G.pupmov_US_opto75_area_600(yy)=nansum(S.pupmov_US_opto75(yy,round(0.6*P.fs):round(0.75*P.fs)));
        else
            G.pupmov_US_opto75_area_600(yy)=NaN;
        end
        if isnan(S.pupmov_US_opto100(yy,1))==0
            G.pupmov_US_opto100_area_600(yy)=nansum(S.pupmov_US_opto100(yy,round(0.6*P.fs):round(0.75*P.fs)));
        else
            G.pupmov_US_opto100_area_600(yy)=NaN;
        end
    end

    G.pupmov_US_area_600_avg(zz,1)=nanmean(G.pupmov_US_area_600);
    G.pupmov_US_opto0_area_600_avg(zz,1)=nanmean(G.pupmov_US_opto0_area_600);
    G.pupmov_US_opto25_area_600_avg(zz,1)=nanmean(G.pupmov_US_opto25_area_600);
    G.pupmov_US_opto50_area_600_avg(zz,1)=nanmean(G.pupmov_US_opto50_area_600);
    G.pupmov_US_opto75_area_600_avg(zz,1)=nanmean(G.pupmov_US_opto75_area_600);
    G.pupmov_US_opto100_area_600_avg(zz,1)=nanmean(G.pupmov_US_opto100_area_600);

    %% Calculate the saccade length

    G.saccadeLength_US(zz,:) = R.saccadeLength_US;
    G.saccadeLength_opto0(zz,:) = R.saccadeLength_opto0;
    G.saccadeLength_opto50(zz,:) = R.saccadeLength_opto50;

end

G.saccadeLength_US(G.saccadeLength_US==0) = NaN;
G.saccadeLength_opto0(G.saccadeLength_opto0==0) = NaN;
G.saccadeLength_opto50(G.saccadeLength_opto50==0) = NaN;

G.saccadeLength_US_AVG=nanmean(G.saccadeLength_US,2);
G.saccadeLength_opto0_AVG=nanmean(G.saccadeLength_opto0,2);
G.saccadeLength_opto50_AVG=nanmean(G.saccadeLength_opto50,2);

G.pupmov_US_avg=nanmean(G.pupmov_US);
G.pupmov_US_opto0_avg=nanmean(G.pupmov_US_opto0);
G.pupmov_US_opto25_avg=nanmean(G.pupmov_US_opto25);
G.pupmov_US_opto50_avg=nanmean(G.pupmov_US_opto50);
G.pupmov_US_opto75_avg=nanmean(G.pupmov_US_opto75);
G.pupmov_US_opto100_avg=nanmean(G.pupmov_US_opto100);

G.pupmov_US_SEM=nanstd(G.pupmov_US)/sqrt(size(G.pupmov_US,1));
G.pupmov_US_opto0_SEM=nanstd(G.pupmov_US_opto0)/sqrt(size(G.pupmov_US_opto0,1));
G.pupmov_US_opto25_SEM=nanstd(G.pupmov_US_opto25)/sqrt(size(G.pupmov_US_opto0,1));
G.pupmov_US_opto50_SEM=nanstd(G.pupmov_US_opto50)/sqrt(size(G.pupmov_US_opto0,1));
G.pupmov_US_opto75_SEM=nanstd(G.pupmov_US_opto75)/sqrt(size(G.pupmov_US_opto0,1));
G.pupmov_US_opto100_SEM=nanstd(G.pupmov_US_opto100)/sqrt(size(G.pupmov_US_opto0,1));

% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.pupmov_US_avg,2)),G.pupmov_US_avg,G.pupmov_US_SEM,'k');
shadedErrorBar(P.xaxis(1:size(G.pupmov_US_opto0_avg,2)),G.pupmov_US_opto0_avg,G.pupmov_US_opto0_SEM,'b');
% plot(P.xaxis(1:size(G.pupmov_US_opto25_avg,2)),G.pupmov_US_opto25_avg,'LineWidth',1.5);
% plot(P.xaxis(1:size(G.pupmov_US_opto50_avg,2)),G.pupmov_US_opto50_avg,'LineWidth',1.5);
% plot(P.xaxis(1:size(G.pupmov_US_opto75_avg,2)),G.pupmov_US_opto75_avg,'LineWidth',1.5);
% plot(P.xaxis(1:size(G.pupmov_US_opto100_avg,2)),G.pupmov_US_opto100_avg,'LineWidth',1.5);

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
ylim([-20 150])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd = legend('Ctrl','Opto');

% Save figure
cd('')
figname = sprintf('D2_pupilmovements_USvsopto0_CtrlgroupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_pupilmovements_USvsopto0_CtrlgroupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_pupilmovements_USvsopto0_CtrlgroupAVG.jpg')
saveas(gcf,figname,'jpg')

% plot the figures
figure; hold on;
shadedErrorBar(P.xaxis(1:size(G.pupmov_US_avg,2)),G.pupmov_US_avg,G.pupmov_US_SEM,'k');
shadedErrorBar(P.xaxis(1:size(G.pupmov_US_opto50_avg,2)),G.pupmov_US_opto50_avg,G.pupmov_US_opto50_SEM,'b');
% plot(P.xaxis(1:size(G.pupmov_US_opto25_avg,2)),G.pupmov_US_opto25_avg,'LineWidth',1.5);
% plot(P.xaxis(1:size(G.pupmov_US_opto50_avg,2)),G.pupmov_US_opto50_avg,'LineWidth',1.5);
% plot(P.xaxis(1:size(G.pupmov_US_opto75_avg,2)),G.pupmov_US_opto75_avg,'LineWidth',1.5);
% plot(P.xaxis(1:size(G.pupmov_US_opto100_avg,2)),G.pupmov_US_opto100_avg,'LineWidth',1.5);

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
xlabel('Time (s)'); ylabel('Pupil velocity (%eye width/s)')
xlim([-0.25 0.5])
ylim([-20 150])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd = legend('Ctrl','Opto');

% Save figure
cd('')
figname = sprintf('D2_pupilmovements_USvsopto50_CtrlgroupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_pupilmovements_USvsopto50_CtrlgroupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_pupilmovements_USvsopto50_CtrlgroupAVG.jpg')
saveas(gcf,figname,'jpg')

%% Cumulative sum

G.pupmov_cumsum_opto_US_avg=nanmean(G.pupmov_cumsum_opto_US);
G.pupmov_cumsum_opto_opto0_avg=nanmean(G.pupmov_cumsum_opto_opto0);
G.pupmov_cumsum_opto_opto25_avg=nanmean(G.pupmov_cumsum_opto_opto25);
G.pupmov_cumsum_opto_opto50_avg=nanmean(G.pupmov_cumsum_opto_opto50);
G.pupmov_cumsum_opto_opto75_avg=nanmean(G.pupmov_cumsum_opto_opto75);
G.pupmov_cumsum_opto_opto100_avg=nanmean(G.pupmov_cumsum_opto_opto100);

G.pupmov_cumsum_opto_US_SEM=nanstd(G.pupmov_cumsum_opto_US)/sqrt(size(G.pupmov_cumsum_opto_US,1));
G.pupmov_cumsum_opto_opto0_SEM=nanstd(G.pupmov_cumsum_opto_opto0)/sqrt(size(G.pupmov_cumsum_opto_opto0,1));
G.pupmov_cumsum_opto_opto25_SEM=nanstd(G.pupmov_cumsum_opto_opto25)/sqrt(size(G.pupmov_cumsum_opto_opto25,1));
G.pupmov_cumsum_opto_opto50_SEM=nanstd(G.pupmov_cumsum_opto_opto50)/sqrt(size(G.pupmov_cumsum_opto_opto50,1));
G.pupmov_cumsum_opto_opto75_SEM=nanstd(G.pupmov_cumsum_opto_opto75)/sqrt(size(G.pupmov_cumsum_opto_opto75,1));
G.pupmov_cumsum_opto_opto100_SEM=nanstd(G.pupmov_cumsum_opto_opto100)/sqrt(size(G.pupmov_cumsum_opto_opto100,1));

% plot the figures
% figure; hold on;
% plot([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_US_avg,'LineWidth',1.5);
% plot([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_opto0_avg,'LineWidth',1.5);
% plot([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_opto25_avg,'LineWidth',1.5);
% plot([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_opto50_avg,'LineWidth',1.5);
% plot([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_opto75_avg,'LineWidth',1.5);
% plot([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_opto100_avg,'LineWidth',1.5);

figure; hold on;
shadedErrorBar([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_US_avg,G.pupmov_cumsum_opto_US_SEM,'k');
shadedErrorBar([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_opto0_avg,G.pupmov_cumsum_opto_opto0_SEM,'b');


line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');

% line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
%     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumul. sum pupil movements (arb. units)');
ylim([-500 4000])
% xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd = legend('Ctrl','Opto');
% lgd.Location = 'northwest'
% Save figure
cd('')
figname = sprintf('D2_cumsum_pupilmovs_USvsopto0_CtrlgroupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_cumsum_pupilmovs_USvsopto0_CtrlgroupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_cumsum_pupilmovs_USvsopto0_CtrlgroupAVG.jpg')
saveas(gcf,figname,'jpg')

figure; hold on;
shadedErrorBar([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_US_avg,G.pupmov_cumsum_opto_US_SEM,'k');
shadedErrorBar([0:(1/P.fs):0.25],G.pupmov_cumsum_opto_opto50_avg,G.pupmov_cumsum_opto_opto50_SEM,'b');


line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');

% line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
%     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumul. sum pupil movements (arb. units)');
ylim([-500 4000])
% xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd = legend('Ctrl','Opto');
% lgd.Location = 'northwest'
% Save figure
cd('')
figname = sprintf('D2_cumsum_pupilmovs_USvsopto50_CtrlgroupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_cumsum_pupilmovs_USvsopto50_CtrlgroupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_cumsum_pupilmovs_USvsopto50_CtrlgroupAVG.jpg')
saveas(gcf,figname,'jpg')



%% Save the data
P.savename = sprintf('D2_pupil_data_Ctrlgroupanalysis.mat');
save(P.savename,'G',"-v7.3");

