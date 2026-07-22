%% US versus opto0 cumsum

Time = 1:80;
nTrials = 9;
% cond1 = rand(nTrials,length(Time));  % generates some random noise (structure trials x time)
% cond1(:,100:200)=2*rand(nTrials,101); % makes an impulse of noise of 2
%
% cond2 = rand(nTrials,length(Time));% generates some random noise (structure trials x time)
% cond2(:,100:200)=4*rand(nTrials,101); % makes an impulse of noise of 2

% cond3 = repmat(0.4,[1,500]);
% cond2 = cond3;

cond1 = G.pupmov_cumsum_opto([1 2 3 4 5 6 7 8],:);
cond2 = G.pupmov_cumsum_opto([9 10 11 12 13 14],:);
cond2 = [cond2; mean(G.pupmov_cumsum_opto([9 10 11 12 13 14],:))];
cond2 = [cond2; mean(G.pupmov_cumsum_opto([9 10 11 12 13 14],:))];
figure;hold on
plot(mean(cond1))


plot(mean(cond2),'r')
% plot(mean(cond2))
nPerms=2000; % how many permuations do you want

[datobs, datrnd] = cluster_test_helper([cond1-cond2]',nPerms); % does the cluster test

[h_mem, p_mem, ~] = cluster_test(datobs,datrnd,0,0.05,0.05);
pclustu = unique(p_mem);
npclust = nnz(pclustu < 0.05);
npclust = nnz(pclustu < 0.05);
for ipclust = 1:npclust % extract time range of each significant cluster and show in figure
    currind  = p_mem == pclustu(ipclust);
    fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[2,2,2,2],[0 0 0],'EdgeColor','none')
    h1=fill([min(Time(currind)),min(Time(currind)),max(Time(currind)),max(Time(currind))],[-1,2,2,-1],[0 0 0],'EdgeColor','none');
    set(h1,'facealpha',.2);
end
legend('Cond1','Cond2','Significant time points')
xlabel('Time')

% Save figure
cd('')
figname = sprintf('D1_pupilmovements_ChR2vsCtr_clustertest.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_pupilmovements_ChR2vsCtr_clustertest.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_pupilmovements_ChR2vsCtr_clustertest.jpg')
saveas(gcf,figname,'jpg')


