%% Analyze eyelid movements during optogenetic stimulation of CN-SC neurons
clear all; close all;
% Edit the excel file: Move the columns after "Video" to the front so that
% "Video" is the last column. Then apply text to columns on the video with
% comma as separator
cd('');

data=readtable("data_eyelid_D3_RB.xlsx");

mouse_ID = table2array(data(:,1));
session_ID = table2array(data(:,24));
trial_ID = table2array(data(:,29));

D.mouse_ID_list =unique(mouse_ID);
D.mouse_ID_list =[D.mouse_ID_list; D.mouse_ID_list];
D.session_ID_list =unique(session_ID);
D.trial_ID_list =trial_ID;

%D3 data (in order of mouse number)
D.D3_sessionlist = [17407 17409 17405 17406 17408 17404];


ii=1;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D3_sessionlist(ii))=1;
D.mouse_1007_D3_50 = table2array(data(logical(index),38:end));

ii=2;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D3_sessionlist(ii))=1;
D.mouse_1008_D3_50 = table2array(data(logical(index),38:end));

ii=3;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D3_sessionlist(ii))=1;
D.mouse_1012_D3_50 = table2array(data(logical(index),38:end));

ii=4;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D3_sessionlist(ii))=1;
D.mouse_1007_D3_100 = table2array(data(logical(index),38:end));

ii=5;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D3_sessionlist(ii))=1;
D.mouse_1008_D3_100 = table2array(data(logical(index),38:end));

ii=6;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D3_sessionlist(ii))=1;
D.mouse_1012_D3_100 = table2array(data(logical(index),38:end));

%% Process
D.trialorder_D3 = repmat([1 2 2 2 2 2 2 2 2 2 2],1,5);

% Normalize to the max value in the dataset (full eyelid closure)
D.mouse_1007_D3_50(:,:)= D.mouse_1007_D3_50(:,:)/max(max(D.mouse_1007_D3_50(:,:)))*100;
D.mouse_1008_D3_50(:,:)= D.mouse_1008_D3_50(:,:)/max(max(D.mouse_1008_D3_50(:,:)))*100;
D.mouse_1012_D3_50(:,:)= D.mouse_1012_D3_50(:,:)/max(max(D.mouse_1012_D3_50(:,:)))*100;

% Normalize to baseline
for ii=1:size(D.trialorder_D3,2)
    D.mouse_1007_D3_50(ii,:) = D.mouse_1007_D3_50(ii,:)-nanmean(D.mouse_1007_D3_50(ii,250:500));
    D.mouse_1008_D3_50(ii,:) = D.mouse_1008_D3_50(ii,:)-nanmean(D.mouse_1008_D3_50(ii,250:500));
    D.mouse_1012_D3_50(ii,:) = D.mouse_1012_D3_50(ii,:)-nanmean(D.mouse_1012_D3_50(ii,250:500));
end

% Normalize to the max value in the dataset (full eyelid closure)
D.mouse_1007_D3_100(:,:)= D.mouse_1007_D3_100(:,:)/max(max(D.mouse_1007_D3_100(:,:)))*100;
D.mouse_1008_D3_100(:,:)= D.mouse_1008_D3_100(:,:)/max(max(D.mouse_1008_D3_100(:,:)))*100;
D.mouse_1012_D3_100(:,:)= D.mouse_1012_D3_100(:,:)/max(max(D.mouse_1012_D3_100(:,:)))*100;

% Normalize to baseline
for ii=1:size(D.trialorder_D3,2)
    D.mouse_1007_D3_100(ii,:) = D.mouse_1007_D3_100(ii,:)-nanmean(D.mouse_1007_D3_100(ii,250:500));
    D.mouse_1008_D3_100(ii,:) = D.mouse_1008_D3_100(ii,:)-nanmean(D.mouse_1008_D3_100(ii,250:500));
    D.mouse_1012_D3_100(ii,:) = D.mouse_1012_D3_100(ii,:)-nanmean(D.mouse_1012_D3_100(ii,250:500));
end


%% Remove the baseline outliers
for jj=1:size(D.trialorder_D3,2)
    if sum(D.mouse_1007_D3_50(jj,250:500)>3*nanmean(nanstd(D.mouse_1007_D3_50(:,1:500)')))>0 || sum(D.mouse_1007_D3_50(jj,250:500)<-3*nanmean(nanstd(D.mouse_1007_D3_50(:,1:500)')))<0
        D.mouse_1007_D3_50(jj,:)=NaN;
    end
    if sum(D.mouse_1008_D3_50(jj,250:500)>3*nanmean(nanstd(D.mouse_1008_D3_50(:,1:500)')))>0 || sum(D.mouse_1008_D3_50(jj,250:500)<-3*nanmean(nanstd(D.mouse_1008_D3_50(:,1:500)')))<0
        D.mouse_1008_D3_50(jj,:)=NaN;
    end
    
    if sum(D.mouse_1012_D3_50(jj,250:500)>3*nanmean(nanstd(D.mouse_1012_D3_50(:,1:500)')))>0 || sum(D.mouse_1012_D3_50(jj,250:500)<-3*nanmean(nanstd(D.mouse_1012_D3_50(:,1:500)')))<0
        D.mouse_1012_D3_50(jj,:)=NaN;
    end
  
end

D.D3_avg_50(1,:) = nanmean(D.mouse_1007_D3_50(D.trialorder_D3==2,:));
D.D3_avg_50(2,:) = nanmean(D.mouse_1008_D3_50(D.trialorder_D3==2,:));
D.D3_avg_50(3,:) = nanmean(D.mouse_1012_D3_50(D.trialorder_D3==2,:));

for jj=1:size(D.trialorder_D3,2)
    if sum(D.mouse_1007_D3_100(jj,250:500)>3*nanmean(nanstd(D.mouse_1007_D3_100(:,1:500)')))>0 || sum(D.mouse_1007_D3_100(jj,250:500)<-3*nanmean(nanstd(D.mouse_1007_D3_100(:,1:500)')))<0
        D.mouse_1007_D3_100(jj,:)=NaN;
    end
    if sum(D.mouse_1008_D3_100(jj,250:500)>3*nanmean(nanstd(D.mouse_1008_D3_100(:,1:500)')))>0 || sum(D.mouse_1008_D3_100(jj,250:500)<-3*nanmean(nanstd(D.mouse_1008_D3_100(:,1:500)')))<0
        D.mouse_1008_D3_100(jj,:)=NaN;
    end
    
    if sum(D.mouse_1012_D3_100(jj,250:500)>3*nanmean(nanstd(D.mouse_1012_D3_100(:,1:500)')))>0 || sum(D.mouse_1012_D3_100(jj,250:500)<-3*nanmean(nanstd(D.mouse_1012_D3_100(:,1:500)')))<0
        D.mouse_1012_D3_100(jj,:)=NaN;
    end
  
end

D.D3_avg_100(1,:) = nanmean(D.mouse_1007_D3_100(D.trialorder_D3==2,:));
D.D3_avg_100(2,:) = nanmean(D.mouse_1008_D3_100(D.trialorder_D3==2,:));
D.D3_avg_100(3,:) = nanmean(D.mouse_1012_D3_100(D.trialorder_D3==2,:));


%% Calculate the cumsum of eyelid movements
idx=[];

idx=[];
for ii=1:size(D.trialorder_D3,2)
    idx(ii,:) = D.mouse_1007_D3_50(ii,:)-nanmean(D.mouse_1007_D3_50(ii,1:500));
    S.D3_cumsum_opto_traces_50(ii,:) = cumsum(D.mouse_1007_D3_50(ii,500:1000));
end
S.D3_cumsum_opto_50(1,:)=nanmean(S.D3_cumsum_opto_traces_50,1);

idx=[];
for ii=1:size(D.trialorder_D3,2)
    idx(ii,:) = D.mouse_1008_D3_50(ii,:)-nanmean(D.mouse_1008_D3_50(ii,1:500));
    S.D3_cumsum_opto_traces_50(ii,:) = cumsum(D.mouse_1008_D3_50(ii,500:1000));
end
S.D3_cumsum_opto_50(2,:)=nanmean(S.D3_cumsum_opto_traces_50,1);

idx=[];
for ii=1:size(D.trialorder_D3,2)
    idx(ii,:) = D.mouse_1012_D3_50(ii,:)-nanmean(D.mouse_1012_D3_50(ii,1:500));
    S.D3_cumsum_opto_traces_50(ii,:) = cumsum(D.mouse_1012_D3_50(ii,500:1000));
end
S.D3_cumsum_opto_50(3,:)=nanmean(S.D3_cumsum_opto_traces_50,1);

idx=[];
for ii=1:size(D.trialorder_D3,2)
    idx(ii,:) = D.mouse_1007_D3_100(ii,:)-nanmean(D.mouse_1007_D3_100(ii,1:500));
    S.D3_cumsum_opto_traces_100(ii,:) = cumsum(D.mouse_1007_D3_100(ii,500:1000));
end
S.D3_cumsum_opto_100(1,:)=nanmean(S.D3_cumsum_opto_traces_100,1);

idx=[];
for ii=1:size(D.trialorder_D3,2)
    idx(ii,:) = D.mouse_1008_D3_100(ii,:)-nanmean(D.mouse_1008_D3_100(ii,1:500));
    S.D3_cumsum_opto_traces_100(ii,:) = cumsum(D.mouse_1008_D3_100(ii,500:1000));
end
S.D3_cumsum_opto_100(2,:)=nanmean(S.D3_cumsum_opto_traces_100,1);

idx=[];
for ii=1:size(D.trialorder_D3,2)
    idx(ii,:) = D.mouse_1012_D3_100(ii,:)-nanmean(D.mouse_1012_D3_100(ii,1:500));
    S.D3_cumsum_opto_traces_100(ii,:) = cumsum(D.mouse_1012_D3_100(ii,500:1000));
end
S.D3_cumsum_opto_100(3,:)=nanmean(S.D3_cumsum_opto_traces_100,1);


%% Cumsum groupaverages

S.D3_cumsum_opto_avg_50=nanmean(S.D3_cumsum_opto_50([1 2],:));
S.D3_cumsum_opto_SD_50=nanstd(S.D3_cumsum_opto_50([1 2],:));
S.D3_cumsum_opto_SEM_50=nanstd(S.D3_cumsum_opto_50([1 2],:))/sqrt(size(S.D3_cumsum_opto_50([1 2],:),1));

S.D3_cumsum_opto_avg_100=nanmean(S.D3_cumsum_opto_100([1 2],:));
S.D3_cumsum_opto_SD_100=nanstd(S.D3_cumsum_opto_100([1 2],:));
S.D3_cumsum_opto_SEM_100=nanstd(S.D3_cumsum_opto_100([1 2],:))/sqrt(size(S.D3_cumsum_opto_100([1 2],:),1));


% S.D3_cumsum_opto_avg_ctr=nanmean(S.D3_cumsum_opto([9 10 11 13 14 15],:));
% S.D3_cumsum_opto_SD_ctr=nanstd(S.D3_cumsum_opto([9 10 11 13 14 15],:));
% S.D3_cumsum_opto_SEM_ctr=nanstd(S.D3_cumsum_opto([9 10 11 13 14 15],:))/sqrt(size(S.D3_cumsum_opto([9 10 11 13 14 15],:),1));

% plot the figures
figure; hold on;
P.xaxis_cumsum=linspace(0,0.5,501);
% shadedErrorBar(P.xaxis_cumsum,S.D3_cumsum_opto_avg_ctr,S.D3_cumsum_opto_SEM_ctr,'k');
shadedErrorBar(P.xaxis_cumsum,S.D3_cumsum_opto_avg_50,S.D3_cumsum_opto_SEM_50,'b');
shadedErrorBar(P.xaxis_cumsum,S.D3_cumsum_opto_avg_100,S.D3_cumsum_opto_SEM_100,'k');


line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumulative sum eyelid movements (arb. units)');
% xlim([-0.25 0.5])
lgd = legend({'50ms' '100ms'});
lgd.Location = 'northwest'

% Save figure
cd('')
figname = sprintf('D3_cumsum_eyelid_groupAVG_50vs100.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_cumsum_eyelid_groupAVG_50vs100.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_cumsum_eyelid_groupAVG_50vs100.jpg')
saveas(gcf,figname,'jpg')

%% Plot the figures;
figure; hold on;
for ii=[1 2]
    plot(linspace(-0.5,1.5,1995),D.D3_avg_50(ii,:),'b')
        plot(linspace(-0.5,1.5,1995),D.D3_avg_100(ii,:),'k')
%          pause;
end
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlabel('Time (s)'); ylabel('Eyelid movement (%closure)')
xlim([-0.25 0.5])

% subplot(1,2,2); hold on;
% for ii=[1 2]
%     plot(linspace(-0.5,1.5,1995),D.D3_avg(ii,:))
%     %     pause;
% end
% line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
% line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
% xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
% xlim([-0.25 0.5])
% % legend({'973' '974' '975' '976' '977' '978' '1007' '1008' '1009' '1010' '1011' '1012' '1013' '1014' '1015'})

% Save figure
figname = sprintf('D3_eyelidmovements_indTrials_50vs100.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_eyelidmovements_indTrials_50vs100.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_eyelidmovements_indTrials_50vs100.jpg')
saveas(gcf,figname,'jpg')

D.D3_groupavg_50 = nanmean(D.D3_avg_50([1 2],:));
% D.D3_groupavg_ctr = nanmean(D.D3_avg([9 10 11 13 14 15],:));
D.D3_groupavg_50_sem = nanstd(D.D3_avg_50([1 2],:))/sqrt(2);
% D.D3_groupavg_ctr_sem = nanstd(D.D3_avg([9 10 11 13 14 15],:))/sqrt(6);

D.D3_groupavg_100 = nanmean(D.D3_avg_100([1 2],:));
% D.D3_groupavg_ctr = nanmean(D.D3_avg([9 10 11 13 14 15],:));
D.D3_groupavg_100_sem = nanstd(D.D3_avg_100([1 2],:))/sqrt(2);
% D.D3_groupavg_ctr_sem = nanstd(D.D3_avg([9 10 11 13 14 15],:))/sqrt(6);

figure; hold on; 
% shadedErrorBar(linspace(-0.5,1.5,1995),D.D3_groupavg_ctr,D.D3_groupavg_ctr_sem,'k'); 
plot(linspace(-0.5,1.5,1995),D.D3_groupavg_50,'b','LineWidth',1.5);
plot(linspace(-0.5,1.5,1995),D.D3_groupavg_100,'k','LineWidth',1.5);
% plot(linspace(-0.5,1.5,1995),D.D3_groupavg_150,'r','LineWidth',1.5);

line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'k');
xlabel('Time (s)'); ylabel('Eyelid movement (%closure)')
xlim([-0.25 0.5])

% Save figure
figname = sprintf('D3_eyelidmovements_AVG_50vs100.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D3_eyelidmovements_AVG_50vs100.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D3_eyelidmovements_AVG_50vs100.jpg')
saveas(gcf,figname,'jpg')

% %% Calculate the area
% D.D3_avg_area=[];
% D.D3_avg_amplitude=[];
% P.xaxis=linspace(-0.5,1.5,2000);
% for ii=1:size(D.D3_avg,1)
%     D.D3_avg_area(ii)= nansum(D.D3_avg(ii,P.xaxis>=0&P.xaxis<0.3));
%     D.D3_avg_amplitude(ii)= nanmax(D.D3_avg(ii,P.xaxis>=0&P.xaxis<0.3));
% end
% D.D3_avg_area_50=D.D3_avg_area([1 2])';
% % D.D3_avg_area_ctr=D.D3_avg_area([9 10 11 13 14 15])';
% D.D3_avg_amplitude_50=D.D3_avg_amplitude([1 2])';
% % D.D3_avg_amplitude_ctr=D.D3_avg_amplitude([9 10 11 13 14 15])';

%% Save the data
P.savename = sprintf('D3_eyelidmovements_data_groupanalysis_50vs100.mat');
save(P.savename,'D','S','data',"-v7.3");