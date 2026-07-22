%% Analysis of air puff + optogenetic stimulus 

D.D2_sessionlist = [17043 17038 17039 17040 17041 17042 17371 17374 17373 17376 17375 17378 17377 17380 17379];

% 973
ii=1;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_973_D2 = table2array(data(logical(index),38:end));

ii=2;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_974_D2 = table2array(data(logical(index),38:end));

ii=3;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_975_D2 = table2array(data(logical(index),38:end));

ii=4;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_976_D2 = table2array(data(logical(index),38:end));

ii=5;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_977_D2 = table2array(data(logical(index),38:end));

ii=6;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_978_D2 = table2array(data(logical(index),38:end));

ii=7;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1007_D2 = table2array(data(logical(index),38:end));

ii=8;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1008_D2 = table2array(data(logical(index),38:end));

ii=9;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1009_D2 = table2array(data(logical(index),38:end));

ii=10;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1010_D2 = table2array(data(logical(index),38:end));

ii=11;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1011_D2 = table2array(data(logical(index),38:end));

ii=12;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1012_D2 = table2array(data(logical(index),38:end));

ii=13;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1013_D2 = table2array(data(logical(index),38:end));

ii=14;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1014_D2 = table2array(data(logical(index),38:end));

ii=15;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D2_sessionlist(ii))=1;
D.mouse_1015_D2 = table2array(data(logical(index),38:end));

%% Process
D.trialorder_D2 = repmat([1 2 3 4 5 6],1,25);

% Normalize to the max value in the dataset (full eyelid closure)
D.mouse_973_D2(:,:)= D.mouse_973_D2(:,:)/max(max(D.mouse_973_D2(:,:)))*100;
D.mouse_974_D2(:,:)= D.mouse_974_D2(:,:)/max(max(D.mouse_974_D2(:,:)))*100;
D.mouse_975_D2(:,:)= D.mouse_975_D2(:,:)/max(max(D.mouse_975_D2(:,:)))*100;
D.mouse_976_D2(:,:)= D.mouse_976_D2(:,:)/max(max(D.mouse_976_D2(:,:)))*100;
D.mouse_977_D2(:,:)= D.mouse_977_D2(:,:)/max(max(D.mouse_977_D2(:,:)))*100;
D.mouse_978_D2(:,:)= D.mouse_978_D2(:,:)/max(max(D.mouse_978_D2(:,:)))*100;
D.mouse_1007_D2(:,:)= D.mouse_1007_D2(:,:)/max(max(D.mouse_1007_D2(:,:)))*100;
D.mouse_1008_D2(:,:)= D.mouse_1008_D2(:,:)/max(max(D.mouse_1008_D2(:,:)))*100;
D.mouse_1009_D2(:,:)= D.mouse_1009_D2(:,:)/max(max(D.mouse_1009_D2(:,:)))*100;
D.mouse_1010_D2(:,:)= D.mouse_1010_D2(:,:)/max(max(D.mouse_1010_D2(:,:)))*100;
D.mouse_1011_D2(:,:)= D.mouse_1011_D2(:,:)/max(max(D.mouse_1011_D2(:,:)))*100;
D.mouse_1012_D2(:,:)= D.mouse_1012_D2(:,:)/max(max(D.mouse_1012_D2(:,:)))*100;
D.mouse_1013_D2(:,:)= D.mouse_1013_D2(:,:)/max(max(D.mouse_1013_D2(:,:)))*100;
D.mouse_1014_D2(:,:)= D.mouse_1014_D2(:,:)/max(max(D.mouse_1014_D2(:,:)))*100;
D.mouse_1015_D2(:,:)= D.mouse_1015_D2(:,:)/max(max(D.mouse_1015_D2(:,:)))*100;


% Normalize to baseline
for ii=1:size(D.trialorder_D2,2)
    D.mouse_973_D2(ii,:) = D.mouse_973_D2(ii,:)-nanmean(D.mouse_973_D2(ii,250:500));
    D.mouse_974_D2(ii,:) = D.mouse_974_D2(ii,:)-nanmean(D.mouse_974_D2(ii,250:500));
    D.mouse_975_D2(ii,:) = D.mouse_975_D2(ii,:)-nanmean(D.mouse_975_D2(ii,250:500));
    D.mouse_976_D2(ii,:) = D.mouse_976_D2(ii,:)-nanmean(D.mouse_976_D2(ii,250:500));
    D.mouse_977_D2(ii,:) = D.mouse_977_D2(ii,:)-nanmean(D.mouse_977_D2(ii,250:500));
    D.mouse_978_D2(ii,:) = D.mouse_978_D2(ii,:)-nanmean(D.mouse_978_D2(ii,250:500));
    D.mouse_1007_D2(ii,:) = D.mouse_1007_D2(ii,:)-nanmean(D.mouse_1007_D2(ii,250:500));
    D.mouse_1008_D2(ii,:) = D.mouse_1008_D2(ii,:)-nanmean(D.mouse_1008_D2(ii,250:500));
    D.mouse_1009_D2(ii,:) = D.mouse_1009_D2(ii,:)-nanmean(D.mouse_1009_D2(ii,250:500));
    D.mouse_1010_D2(ii,:) = D.mouse_1010_D2(ii,:)-nanmean(D.mouse_1010_D2(ii,250:500));
    D.mouse_1011_D2(ii,:) = D.mouse_1011_D2(ii,:)-nanmean(D.mouse_1011_D2(ii,250:500));
    D.mouse_1012_D2(ii,:) = D.mouse_1012_D2(ii,:)-nanmean(D.mouse_1012_D2(ii,250:500));
    D.mouse_1013_D2(ii,:) = D.mouse_1013_D2(ii,:)-nanmean(D.mouse_1013_D2(ii,250:500));
    D.mouse_1014_D2(ii,:) = D.mouse_1014_D2(ii,:)-nanmean(D.mouse_1014_D2(ii,250:500));
    D.mouse_1015_D2(ii,:) = D.mouse_1015_D2(ii,:)-nanmean(D.mouse_1015_D2(ii,250:500));
end

%% Remove the baseline outliers
for jj=1:size(D.trialorder_D2,2)
    if sum(D.mouse_973_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_973_D2(:,1:500)')))>0 || sum(D.mouse_973_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_973_D2(:,1:500)')))<0
        D.mouse_973_D2(jj,:)=NaN;
    end
    if sum(D.mouse_974_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_974_D2(:,1:500)')))>0 || sum(D.mouse_974_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_974_D2(:,1:500)')))<0
        D.mouse_974_D2(jj,:)=NaN;
    end
    if sum(D.mouse_975_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_975_D2(:,1:500)')))>0 || sum(D.mouse_975_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_975_D2(:,1:500)')))<0
        D.mouse_975_D2(jj,:)=NaN;
    end
    if sum(D.mouse_976_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_976_D2(:,1:500)')))>0 || sum(D.mouse_976_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_976_D2(:,1:500)')))<0
        D.mouse_976_D2(jj,:)=NaN;
    end
    if sum(D.mouse_977_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_977_D2(:,1:500)')))>0 || sum(D.mouse_977_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_977_D2(:,1:500)')))<0
        D.mouse_977_D2(jj,:)=NaN;
    end
    if sum(D.mouse_978_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_978_D2(:,1:500)')))>0 || sum(D.mouse_978_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_978_D2(:,1:500)')))<0
        D.mouse_978_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1007_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1007_D2(:,1:500)')))>0 || sum(D.mouse_1007_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1007_D2(:,1:500)')))<0
        D.mouse_1007_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1008_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1008_D2(:,1:500)')))>0 || sum(D.mouse_1008_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1008_D2(:,1:500)')))<0
        D.mouse_1008_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1009_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1009_D2(:,1:500)')))>0 || sum(D.mouse_1009_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1009_D2(:,1:500)')))<0
        D.mouse_1009_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1010_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1010_D2(:,1:500)')))>0 || sum(D.mouse_1010_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1010_D2(:,1:500)')))<0
        D.mouse_1010_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1011_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1011_D2(:,1:500)')))>0 || sum(D.mouse_1011_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1011_D2(:,1:500)')))<0
        D.mouse_1011_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1012_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1012_D2(:,1:500)')))>0 || sum(D.mouse_1012_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1012_D2(:,1:500)')))<0
        D.mouse_1012_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1013_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1013_D2(:,1:500)')))>0 || sum(D.mouse_1013_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1013_D2(:,1:500)')))<0
        D.mouse_1013_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1014_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1014_D2(:,1:500)')))>0 || sum(D.mouse_1014_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1014_D2(:,1:500)')))<0
        D.mouse_1014_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1015_D2(jj,250:500)>3*nanmean(nanstd(D.mouse_1015_D2(:,1:500)')))>0 || sum(D.mouse_1015_D2(jj,250:500)<-3*nanmean(nanstd(D.mouse_1015_D2(:,1:500)')))<0
        D.mouse_1015_D2(jj,:)=NaN;
    end
end

% Exclude trials where there is no eyelid movement

for jj=1:size(D.trialorder_D2,2)
    if sum(D.mouse_973_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_973_D2(:,1:500)')))==0 
        D.mouse_973_D2(jj,:)=NaN;
    end
    if sum(D.mouse_974_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_974_D2(:,1:500)')))==0 
        D.mouse_974_D2(jj,:)=NaN;
    end
    if sum(D.mouse_975_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_975_D2(:,1:500)')))==0 
        D.mouse_975_D2(jj,:)=NaN;
    end
    if sum(D.mouse_976_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_976_D2(:,1:500)')))==0 
        D.mouse_976_D2(jj,:)=NaN;
    end
    if sum(D.mouse_977_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_977_D2(:,1:500)')))==0 
        D.mouse_977_D2(jj,:)=NaN;
    end
    if sum(D.mouse_978_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_978_D2(:,1:500)')))==0 
        D.mouse_978_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1007_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1007_D2(:,1:500)')))==0 
        D.mouse_1007_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1008_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1008_D2(:,1:500)')))==0 
        D.mouse_1008_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1009_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1009_D2(:,1:500)')))==0 
        D.mouse_1009_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1010_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1010_D2(:,1:500)')))==0 
        D.mouse_1010_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1011_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1011_D2(:,1:500)')))==0 
        D.mouse_1011_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1012_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1012_D2(:,1:500)')))==0 
        D.mouse_1012_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1013_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1013_D2(:,1:500)')))==0 
        D.mouse_1013_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1014_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1014_D2(:,1:500)')))==0 
        D.mouse_1014_D2(jj,:)=NaN;
    end
    if sum(D.mouse_1015_D2(jj,500:750)>3*nanmean(nanstd(D.mouse_1015_D2(:,1:500)')))==0 
        D.mouse_1015_D2(jj,:)=NaN;
    end
end



D.D2_avg_1(1,:) = nanmean(D.mouse_973_D2(D.trialorder_D2==1,:));
D.D2_avg_1(2,:) = nanmean(D.mouse_974_D2(D.trialorder_D2==1,:));
D.D2_avg_1(3,:) = nanmean(D.mouse_975_D2(D.trialorder_D2==1,:));
D.D2_avg_1(4,:) = nanmean(D.mouse_976_D2(D.trialorder_D2==1,:));
D.D2_avg_1(5,:) = nanmean(D.mouse_977_D2(D.trialorder_D2==1,:));
D.D2_avg_1(6,:) = nanmean(D.mouse_978_D2(D.trialorder_D2==1,:));
D.D2_avg_1(7,:) = nanmean(D.mouse_1007_D2(D.trialorder_D2==1,:));
D.D2_avg_1(8,:) = nanmean(D.mouse_1008_D2(D.trialorder_D2==1,:));
D.D2_avg_1(9,:) = nanmean(D.mouse_1009_D2(D.trialorder_D2==1,:));
D.D2_avg_1(10,:) = nanmean(D.mouse_1010_D2(D.trialorder_D2==1,:));
D.D2_avg_1(11,:) = nanmean(D.mouse_1011_D2(D.trialorder_D2==1,:));
D.D2_avg_1(12,:) = nanmean(D.mouse_1012_D2(D.trialorder_D2==1,:));
D.D2_avg_1(13,:) = nanmean(D.mouse_1013_D2(D.trialorder_D2==1,:));
D.D2_avg_1(14,:) = nanmean(D.mouse_1014_D2(D.trialorder_D2==1,:));
D.D2_avg_1(15,:) = nanmean(D.mouse_1015_D2(D.trialorder_D2==1,:));

D.D2_avg_2(1,:) = nanmean(D.mouse_973_D2(D.trialorder_D2==2,:));
D.D2_avg_2(2,:) = nanmean(D.mouse_974_D2(D.trialorder_D2==2,:));
D.D2_avg_2(3,:) = nanmean(D.mouse_975_D2(D.trialorder_D2==2,:));
D.D2_avg_2(4,:) = nanmean(D.mouse_976_D2(D.trialorder_D2==2,:));
D.D2_avg_2(5,:) = nanmean(D.mouse_977_D2(D.trialorder_D2==2,:));
D.D2_avg_2(6,:) = nanmean(D.mouse_978_D2(D.trialorder_D2==2,:));
D.D2_avg_2(7,:) = nanmean(D.mouse_1007_D2(D.trialorder_D2==2,:));
D.D2_avg_2(8,:) = nanmean(D.mouse_1008_D2(D.trialorder_D2==2,:));
D.D2_avg_2(9,:) = nanmean(D.mouse_1009_D2(D.trialorder_D2==2,:));
D.D2_avg_2(10,:) = nanmean(D.mouse_1010_D2(D.trialorder_D2==2,:));
D.D2_avg_2(11,:) = nanmean(D.mouse_1011_D2(D.trialorder_D2==2,:));
D.D2_avg_2(12,:) = nanmean(D.mouse_1012_D2(D.trialorder_D2==2,:));
D.D2_avg_2(13,:) = nanmean(D.mouse_1013_D2(D.trialorder_D2==2,:));
D.D2_avg_2(14,:) = nanmean(D.mouse_1014_D2(D.trialorder_D2==2,:));
D.D2_avg_2(15,:) = nanmean(D.mouse_1015_D2(D.trialorder_D2==2,:));

D.D2_avg_3(1,:) = nanmean(D.mouse_973_D2(D.trialorder_D2==3,:));
D.D2_avg_3(2,:) = nanmean(D.mouse_974_D2(D.trialorder_D2==3,:));
D.D2_avg_3(3,:) = nanmean(D.mouse_975_D2(D.trialorder_D2==3,:));
D.D2_avg_3(4,:) = nanmean(D.mouse_976_D2(D.trialorder_D2==3,:));
D.D2_avg_3(5,:) = nanmean(D.mouse_977_D2(D.trialorder_D2==3,:));
D.D2_avg_3(6,:) = nanmean(D.mouse_978_D2(D.trialorder_D2==3,:));
D.D2_avg_3(7,:) = nanmean(D.mouse_1007_D2(D.trialorder_D2==3,:));
D.D2_avg_3(8,:) = nanmean(D.mouse_1008_D2(D.trialorder_D2==3,:));
D.D2_avg_3(9,:) = nanmean(D.mouse_1009_D2(D.trialorder_D2==3,:));
D.D2_avg_3(10,:) = nanmean(D.mouse_1010_D2(D.trialorder_D2==3,:));
D.D2_avg_3(11,:) = nanmean(D.mouse_1011_D2(D.trialorder_D2==3,:));
D.D2_avg_3(12,:) = nanmean(D.mouse_1012_D2(D.trialorder_D2==3,:));
D.D2_avg_3(13,:) = nanmean(D.mouse_1013_D2(D.trialorder_D2==3,:));
D.D2_avg_3(14,:) = nanmean(D.mouse_1014_D2(D.trialorder_D2==3,:));
D.D2_avg_3(15,:) = nanmean(D.mouse_1015_D2(D.trialorder_D2==3,:));

D.D2_avg_4(1,:) = nanmean(D.mouse_973_D2(D.trialorder_D2==4,:));
D.D2_avg_4(2,:) = nanmean(D.mouse_974_D2(D.trialorder_D2==4,:));
D.D2_avg_4(3,:) = nanmean(D.mouse_975_D2(D.trialorder_D2==4,:));
D.D2_avg_4(4,:) = nanmean(D.mouse_976_D2(D.trialorder_D2==4,:));
D.D2_avg_4(5,:) = nanmean(D.mouse_977_D2(D.trialorder_D2==4,:));
D.D2_avg_4(6,:) = nanmean(D.mouse_978_D2(D.trialorder_D2==4,:));
D.D2_avg_4(7,:) = nanmean(D.mouse_1007_D2(D.trialorder_D2==4,:));
D.D2_avg_4(8,:) = nanmean(D.mouse_1008_D2(D.trialorder_D2==4,:));
D.D2_avg_4(9,:) = nanmean(D.mouse_1009_D2(D.trialorder_D2==4,:));
D.D2_avg_4(10,:) = nanmean(D.mouse_1010_D2(D.trialorder_D2==4,:));
D.D2_avg_4(11,:) = nanmean(D.mouse_1011_D2(D.trialorder_D2==4,:));
D.D2_avg_4(12,:) = nanmean(D.mouse_1012_D2(D.trialorder_D2==4,:));
D.D2_avg_4(13,:) = nanmean(D.mouse_1013_D2(D.trialorder_D2==4,:));
D.D2_avg_4(14,:) = nanmean(D.mouse_1014_D2(D.trialorder_D2==4,:));
D.D2_avg_4(15,:) = nanmean(D.mouse_1015_D2(D.trialorder_D2==4,:));

D.D2_avg_5(1,:) = nanmean(D.mouse_973_D2(D.trialorder_D2==5,:));
D.D2_avg_5(2,:) = nanmean(D.mouse_974_D2(D.trialorder_D2==5,:));
D.D2_avg_5(3,:) = nanmean(D.mouse_975_D2(D.trialorder_D2==5,:));
D.D2_avg_5(4,:) = nanmean(D.mouse_976_D2(D.trialorder_D2==5,:));
D.D2_avg_5(5,:) = nanmean(D.mouse_977_D2(D.trialorder_D2==5,:));
D.D2_avg_5(6,:) = nanmean(D.mouse_978_D2(D.trialorder_D2==5,:));
D.D2_avg_5(7,:) = nanmean(D.mouse_1007_D2(D.trialorder_D2==5,:));
D.D2_avg_5(8,:) = nanmean(D.mouse_1008_D2(D.trialorder_D2==5,:));
D.D2_avg_5(9,:) = nanmean(D.mouse_1009_D2(D.trialorder_D2==5,:));
D.D2_avg_5(10,:) = nanmean(D.mouse_1010_D2(D.trialorder_D2==5,:));
D.D2_avg_5(11,:) = nanmean(D.mouse_1011_D2(D.trialorder_D2==5,:));
D.D2_avg_5(12,:) = nanmean(D.mouse_1012_D2(D.trialorder_D2==5,:));
D.D2_avg_5(13,:) = nanmean(D.mouse_1013_D2(D.trialorder_D2==5,:));
D.D2_avg_5(14,:) = nanmean(D.mouse_1014_D2(D.trialorder_D2==5,:));
D.D2_avg_5(15,:) = nanmean(D.mouse_1015_D2(D.trialorder_D2==5,:));

D.D2_avg_6(1,:) = nanmean(D.mouse_973_D2(D.trialorder_D2==6,:));
D.D2_avg_6(2,:) = nanmean(D.mouse_974_D2(D.trialorder_D2==6,:));
D.D2_avg_6(3,:) = nanmean(D.mouse_975_D2(D.trialorder_D2==6,:));
D.D2_avg_6(4,:) = nanmean(D.mouse_976_D2(D.trialorder_D2==6,:));
D.D2_avg_6(5,:) = nanmean(D.mouse_977_D2(D.trialorder_D2==6,:));
D.D2_avg_6(6,:) = nanmean(D.mouse_978_D2(D.trialorder_D2==6,:));
D.D2_avg_6(7,:) = nanmean(D.mouse_1007_D2(D.trialorder_D2==6,:));
D.D2_avg_6(8,:) = nanmean(D.mouse_1008_D2(D.trialorder_D2==6,:));
D.D2_avg_6(9,:) = nanmean(D.mouse_1009_D2(D.trialorder_D2==6,:));
D.D2_avg_6(10,:) = nanmean(D.mouse_1010_D2(D.trialorder_D2==6,:));
D.D2_avg_6(11,:) = nanmean(D.mouse_1011_D2(D.trialorder_D2==6,:));
D.D2_avg_6(12,:) = nanmean(D.mouse_1012_D2(D.trialorder_D2==6,:));
D.D2_avg_6(13,:) = nanmean(D.mouse_1013_D2(D.trialorder_D2==6,:));
D.D2_avg_6(14,:) = nanmean(D.mouse_1014_D2(D.trialorder_D2==6,:));
D.D2_avg_6(15,:) = nanmean(D.mouse_1015_D2(D.trialorder_D2==6,:));


D.D2_groupavg_opto_1 = nanmean(D.D2_avg_1([1 2 3 4 5 6 7 8 12],:));
D.D2_groupavg_ctr_1 = nanmean(D.D2_avg_1([9 10 11 13 14 15],:));
D.D2_groupavg_opto_sem_1 = nanstd(D.D2_avg_1([1 2 3 4 5 6 7 8 12],:))/sqrt(9);
D.D2_groupavg_ctr_sem_1 = nanstd(D.D2_avg_1([9 10 11 13 14 15],:))/sqrt(6);

figure; subplot(2,3,1); hold on; shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_ctr_1,D.D2_groupavg_ctr_sem_1,'k'); shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_opto_1,D.D2_groupavg_opto_sem_1,'b'); 
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])
title('US only')

D.D2_groupavg_opto_2 = nanmean(D.D2_avg_2([1 2 3 4 5 6 7 8 12],:));
D.D2_groupavg_ctr_2 = nanmean(D.D2_avg_2([9 10 11 13 14 15],:));
D.D2_groupavg_opto_sem_2 = nanstd(D.D2_avg_2([1 2 3 4 5 6 7 8 12],:))/sqrt(9);
D.D2_groupavg_ctr_sem_2 = nanstd(D.D2_avg_2([9 10 11 13 14 15],:))/sqrt(6);

subplot(2,3,2); hold on; shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_ctr_2,D.D2_groupavg_ctr_sem_2,'k'); shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_opto_2,D.D2_groupavg_opto_sem_2,'b'); 
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
          line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])
title('US+opto0')

D.D2_groupavg_opto_3 = nanmean(D.D2_avg_3([1 2 3 4 5 6 7 8 12],:));
D.D2_groupavg_ctr_3 = nanmean(D.D2_avg_3([9 10 11 13 14 15],:));
D.D2_groupavg_opto_sem_3 = nanstd(D.D2_avg_3([1 2 3 4 5 6 7 8 12],:))/sqrt(9);
D.D2_groupavg_ctr_sem_3 = nanstd(D.D2_avg_3([9 10 11 13 14 15],:))/sqrt(6);

subplot(2,3,3); hold on; shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_ctr_3,D.D2_groupavg_ctr_sem_3,'k'); shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_opto_3,D.D2_groupavg_opto_sem_3,'b'); 
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
               line([0.025 0.025],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])
title('US+opto25')

D.D2_groupavg_opto_4 = nanmean(D.D2_avg_4([1 2 3 4 5 6 7 8 12],:));
D.D2_groupavg_ctr_4 = nanmean(D.D2_avg_4([9 10 11 13 14 15],:));
D.D2_groupavg_opto_sem_4 = nanstd(D.D2_avg_4([1 2 3 4 5 6 7 8 12],:))/sqrt(9);
D.D2_groupavg_ctr_sem_4 = nanstd(D.D2_avg_4([9 10 11 13 14 15],:))/sqrt(6);

 subplot(2,3,4); hold on; shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_ctr_4,D.D2_groupavg_ctr_sem_4,'k'); shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_opto_4,D.D2_groupavg_opto_sem_4,'b'); 
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
                    line([0.05 0.05],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])
title('US+opto50')

D.D2_groupavg_opto_5 = nanmean(D.D2_avg_5([1 2 3 4 5 6 7 8 12],:));
D.D2_groupavg_ctr_5 = nanmean(D.D2_avg_5([9 10 11 13 14 15],:));
D.D2_groupavg_opto_sem_5 = nanstd(D.D2_avg_5([1 2 3 4 5 6 7 8 12],:))/sqrt(9);
D.D2_groupavg_ctr_sem_5 = nanstd(D.D2_avg_5([9 10 11 13 14 15],:))/sqrt(6);

 subplot(2,3,5); hold on; shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_ctr_5,D.D2_groupavg_ctr_sem_5,'k'); shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_opto_5,D.D2_groupavg_opto_sem_5,'b'); 
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
                    line([0.075 0.075],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])
title('US+opto75')

D.D2_groupavg_opto_6 = nanmean(D.D2_avg_6([1 2 3 4 5 6 7 8 12],:));
D.D2_groupavg_ctr_6 = nanmean(D.D2_avg_6([9 10 11 13 14 15],:));
D.D2_groupavg_opto_sem_6 = nanstd(D.D2_avg_6([1 2 3 4 5 6 7 8 12],:))/sqrt(9);
D.D2_groupavg_ctr_sem_6 = nanstd(D.D2_avg_6([9 10 11 13 14 15],:))/sqrt(6);

subplot(2,3,6); hold on; shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_ctr_6,D.D2_groupavg_ctr_sem_6,'k'); shadedErrorBar(linspace(-0.5,1.5,2000),D.D2_groupavg_opto_6,D.D2_groupavg_opto_sem_6,'b'); 
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
                    line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'b');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])
title('US+opto100')


 % Save figure
    figname = sprintf('D2_eyelidmovements_AVG.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D2_eyelidmovements_AVG.pdf')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D2_eyelidmovements_AVG.jpg')
    saveas(gcf,figname,'jpg')

    figure; hold on;
    plot(P.xaxis,D.D2_groupavg_opto_1,'Color',[0 0 0],'LineWidth',2)
    plot(P.xaxis,D.D2_groupavg_opto_2,'Color',[0.23, 0.29, 0.75],'LineWidth',2)
    plot(P.xaxis,D.D2_groupavg_opto_3,'Color',[0.98, 0.69, 0.37],'LineWidth',2)
    plot(P.xaxis,D.D2_groupavg_opto_4,'Color',[0.42, 0.79, 0.77],'LineWidth',2)
    plot(P.xaxis,D.D2_groupavg_opto_5,'Color',[0.83, 0.36, 0.40],'LineWidth',2)
    plot(P.xaxis,D.D2_groupavg_opto_6,'Color',[0.56, 0.37, 0.58],'LineWidth',2)

    legend({'US' 'US+opto0' 'US+opto25' 'US+opto50' 'US+opto75' 'US+opto100'},'Location','southeast')

    line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
     line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])

 % Save figure
    figname = sprintf('D2_eyelidmovements_ChR2_AVG.fig')
    saveas(gcf,figname,'fig');
    figname = sprintf('D2_eyelidmovements_ChR2_AVG.pdf')
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('D2_eyelidmovements_ChR2_AVG.jpg')
    saveas(gcf,figname,'jpg')



    %% Calculate the amplitude
    S.D2_amplitude_1=[];
    S.D2_amplitude_2=[];
    S.D2_amplitude_3=[];
    S.D2_amplitude_4=[];
    S.D2_amplitude_5=[];
    S.D2_amplitude_6=[];
    for ii=1:size(D.D2_avg_1,1)
        S.D2_amplitude_1(ii)= nanmax(D.D2_avg_1(ii,P.xaxis>=0&P.xaxis<0.3));
        S.D2_amplitude_2(ii)= nanmax(D.D2_avg_2(ii,P.xaxis>=0&P.xaxis<0.3));
        S.D2_amplitude_3(ii)= nanmax(D.D2_avg_3(ii,P.xaxis>=0&P.xaxis<0.3));
        S.D2_amplitude_4(ii)= nanmax(D.D2_avg_4(ii,P.xaxis>=0&P.xaxis<0.3));
        S.D2_amplitude_5(ii)= nanmax(D.D2_avg_5(ii,P.xaxis>=0&P.xaxis<0.3));
        S.D2_amplitude_6(ii)= nanmax(D.D2_avg_6(ii,P.xaxis>=0&P.xaxis<0.3));
    end
    G.D2_amplitude_chr2_1=S.D2_amplitude_1([1 2 3 4 5 6 7 8 12]);
    G.D2_amplitude_ctr_1=S.D2_amplitude_1([9 10 11 13 14 15]);

        G.D2_amplitude_chr2_2=S.D2_amplitude_2([1 2 3 4 5 6 7 8 12]);
    G.D2_amplitude_ctr_2=S.D2_amplitude_2([9 10 11 13 14 15]);

        G.D2_amplitude_chr2_3=S.D2_amplitude_3([1 2 3 4 5 6 7 8 12]);
    G.D2_amplitude_ctr_3=S.D2_amplitude_3([9 10 11 13 14 15]);

        G.D2_amplitude_chr2_4=S.D2_amplitude_4([1 2 3 4 5 6 7 8 12]);
    G.D2_amplitude_ctr_4=S.D2_amplitude_4([9 10 11 13 14 15]);

        G.D2_amplitude_chr2_5=S.D2_amplitude_5([1 2 3 4 5 6 7 8 12]);
    G.D2_amplitude_ctr_5=S.D2_amplitude_5([9 10 11 13 14 15]);

        G.D2_amplitude_chr2_6=S.D2_amplitude_6([1 2 3 4 5 6 7 8 12]);
    G.D2_amplitude_ctr_6=S.D2_amplitude_6([9 10 11 13 14 15]);

    G.D2_excel_chr2 = [G.D2_amplitude_chr2_1' G.D2_amplitude_chr2_2' G.D2_amplitude_chr2_3' G.D2_amplitude_chr2_4' G.D2_amplitude_chr2_5' G.D2_amplitude_chr2_6'];
G.D2_excel_ctr = [G.D2_amplitude_ctr_1' G.D2_amplitude_ctr_2' G.D2_amplitude_ctr_3' G.D2_amplitude_ctr_4' G.D2_amplitude_ctr_5' G.D2_amplitude_ctr_6'];
% G.D2_excel_ctr = [G.D2_amplitude_ctr_1 NaN NaN NaN G.D2_amplitude_ctr_2 NaN NaN NaN G.D2_amplitude_ctr_3 NaN NaN NaN G.D2_amplitude_ctr_4 NaN NaN NaN G.D2_amplitude_ctr_5 NaN NaN NaN G.D2_amplitude_ctr_6 NaN NaN NaN];

%% Save the data
P.savename = sprintf('D2_eyelidmovements_data_groupanalysis.mat');
save(P.savename,'S','D','G',"-v7.3");