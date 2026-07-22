%% Analyze eyelid movements during optogenetic stimulation of CN-SC neurons
clear all; close all;

cd('');

data=readtable("data_eyelid_RB.xlsx");

mouse_ID = table2array(data(:,1));
session_ID = table2array(data(:,24));
trial_ID = table2array(data(:,29));

D.mouse_ID_list =unique(mouse_ID);
D.session_ID_list =unique(session_ID);
D.trial_ID_list =trial_ID;

%D1 data (in order of mouse number)
D.D1_sessionlist = [17037 17029 17033 17034 17035 17036 17358 17359 17364 17365 17366 17367 17368 17369 17370];

% 973
ii=1;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_973_D1 = table2array(data(logical(index),38:end));

ii=2;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_974_D1 = table2array(data(logical(index),38:end));

ii=3;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_975_D1 = table2array(data(logical(index),38:end));

ii=4;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_976_D1 = table2array(data(logical(index),38:end));

ii=5;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_977_D1 = table2array(data(logical(index),38:end));

ii=6;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_978_D1 = table2array(data(logical(index),38:end));

ii=7;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1007_D1 = table2array(data(logical(index),38:end));

ii=8;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1008_D1 = table2array(data(logical(index),38:end));

ii=9;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1009_D1 = table2array(data(logical(index),38:end));

ii=10;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1010_D1 = table2array(data(logical(index),38:end));

ii=11;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1011_D1 = table2array(data(logical(index),38:end));

ii=12;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1012_D1 = table2array(data(logical(index),38:end));

ii=13;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1013_D1 = table2array(data(logical(index),38:end));

ii=14;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1014_D1 = table2array(data(logical(index),38:end));

ii=15;
index = zeros(size(data(:,1),1),1);
index(mouse_ID==D.mouse_ID_list(ii)&session_ID==D.D1_sessionlist(ii))=1;
D.mouse_1015_D1 = table2array(data(logical(index),38:end));

%% Process
D.trialorder_D1 = repmat([1 2 2 2 2 2 2 2 2 2 2],1,5);

% Normalize to the min value in the dataset (full eyelid opening)
D.mouse_973_D1(:,:)= D.mouse_973_D1(:,:)-min(min(D.mouse_973_D1(:,:)));
D.mouse_974_D1(:,:)= D.mouse_974_D1(:,:)-min(min(D.mouse_974_D1(:,:)));
D.mouse_975_D1(:,:)= D.mouse_975_D1(:,:)-min(min(D.mouse_975_D1(:,:)));
D.mouse_976_D1(:,:)= D.mouse_976_D1(:,:)-min(min(D.mouse_976_D1(:,:)));
D.mouse_977_D1(:,:)= D.mouse_977_D1(:,:)-min(min(D.mouse_977_D1(:,:)));
D.mouse_978_D1(:,:)= D.mouse_978_D1(:,:)-min(min(D.mouse_978_D1(:,:)));
D.mouse_1007_D1(:,:)= D.mouse_1007_D1(:,:)-min(min(D.mouse_1007_D1(:,:)));
D.mouse_1008_D1(:,:)= D.mouse_1008_D1(:,:)-min(min(D.mouse_1008_D1(:,:)));
D.mouse_1009_D1(:,:)= D.mouse_1009_D1(:,:)-min(min(D.mouse_1009_D1(:,:)));
D.mouse_1010_D1(:,:)= D.mouse_1010_D1(:,:)-min(min(D.mouse_1010_D1(:,:)));
D.mouse_1011_D1(:,:)= D.mouse_1011_D1(:,:)-min(min(D.mouse_1011_D1(:,:)));
D.mouse_1012_D1(:,:)= D.mouse_1012_D1(:,:)-min(min(D.mouse_1012_D1(:,:)));
D.mouse_1013_D1(:,:)= D.mouse_1013_D1(:,:)-min(min(D.mouse_1013_D1(:,:)));
D.mouse_1014_D1(:,:)= D.mouse_1014_D1(:,:)-min(min(D.mouse_1014_D1(:,:)));
D.mouse_1015_D1(:,:)= D.mouse_1015_D1(:,:)-min(min(D.mouse_1015_D1(:,:)));

% Normalize to the max value in the dataset (full eyelid closure)
D.mouse_973_D1(:,:)= D.mouse_973_D1(:,:)/max(max(D.mouse_973_D1(:,:)))*100;
D.mouse_974_D1(:,:)= D.mouse_974_D1(:,:)/max(max(D.mouse_974_D1(:,:)))*100;
D.mouse_975_D1(:,:)= D.mouse_975_D1(:,:)/max(max(D.mouse_975_D1(:,:)))*100;
D.mouse_976_D1(:,:)= D.mouse_976_D1(:,:)/max(max(D.mouse_976_D1(:,:)))*100;
D.mouse_977_D1(:,:)= D.mouse_977_D1(:,:)/max(max(D.mouse_977_D1(:,:)))*100;
D.mouse_978_D1(:,:)= D.mouse_978_D1(:,:)/max(max(D.mouse_978_D1(:,:)))*100;
D.mouse_1007_D1(:,:)= D.mouse_1007_D1(:,:)/max(max(D.mouse_1007_D1(:,:)))*100;
D.mouse_1008_D1(:,:)= D.mouse_1008_D1(:,:)/max(max(D.mouse_1008_D1(:,:)))*100;
D.mouse_1009_D1(:,:)= D.mouse_1009_D1(:,:)/max(max(D.mouse_1009_D1(:,:)))*100;
D.mouse_1010_D1(:,:)= D.mouse_1010_D1(:,:)/max(max(D.mouse_1010_D1(:,:)))*100;
D.mouse_1011_D1(:,:)= D.mouse_1011_D1(:,:)/max(max(D.mouse_1011_D1(:,:)))*100;
D.mouse_1012_D1(:,:)= D.mouse_1012_D1(:,:)/max(max(D.mouse_1012_D1(:,:)))*100;
D.mouse_1013_D1(:,:)= D.mouse_1013_D1(:,:)/max(max(D.mouse_1013_D1(:,:)))*100;
D.mouse_1014_D1(:,:)= D.mouse_1014_D1(:,:)/max(max(D.mouse_1014_D1(:,:)))*100;
D.mouse_1015_D1(:,:)= D.mouse_1015_D1(:,:)/max(max(D.mouse_1015_D1(:,:)))*100;


% Exclude trials where the eye is closed >75% or overextending opening (<5%)
closedThreshold = 75;
openThreshold = 5;
for ii=1:size(D.trialorder_D1,2)
    if nanmean(D.mouse_973_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_973_D1(ii,250:500))<openThreshold
        sprintf('Mouse 973: trial %.f excluded',ii)
        D.mouse_973_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_974_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_974_D1(ii,250:500))<openThreshold
        sprintf('Mouse 974: trial %.f excluded',ii)
        D.mouse_974_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_975_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_975_D1(ii,250:500))<openThreshold
        sprintf('Mouse 975: trial %.f excluded',ii)
        D.mouse_975_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_976_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_976_D1(ii,250:500))<openThreshold
        sprintf('Mouse 976: trial %.f excluded',ii)
        D.mouse_976_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_977_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_977_D1(ii,250:500))<openThreshold
        sprintf('Mouse 977: trial %.f excluded',ii)
        D.mouse_977_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_978_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_978_D1(ii,250:500))<openThreshold
        sprintf('Mouse 978: trial %.f excluded',ii)
        D.mouse_978_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1007_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1007_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1007: trial %.f excluded',ii)
        D.mouse_1007_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1008_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1008_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1008: trial %.f excluded',ii)
        D.mouse_1008_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1009_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1009_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1009: trial %.f excluded',ii)
        D.mouse_1009_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1010_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1010_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1010: trial %.f excluded',ii)
        D.mouse_1010_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1011_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1011_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1011: trial %.f excluded',ii)
        D.mouse_1011_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1012_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1012_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1012: trial %.f excluded',ii)
        D.mouse_1012_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1013_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1013_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1013: trial %.f excluded',ii)
        D.mouse_1013_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1014_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1014_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1014: trial %.f excluded',ii)
        D.mouse_1014_D1(ii,:) = nan;
    end
    if nanmean(D.mouse_1015_D1(ii,250:500))>closedThreshold || nanmean(D.mouse_1015_D1(ii,250:500))<openThreshold
        sprintf('Mouse 1015: trial %.f excluded',ii)
        D.mouse_1015_D1(ii,:) = nan;
    end

end


%% Remove the baseline outliers
for jj=1:size(D.trialorder_D1,2)
    if sum(D.mouse_973_D1(jj,250:500)>((3*nanstd(D.mouse_973_D1(jj,250:500)))+nanmean(D.mouse_973_D1(jj,250:500)))) || sum(D.mouse_973_D1(jj,250:500)<((-3*nanstd(D.mouse_973_D1(jj,250:500)))+nanmean(D.mouse_973_D1(jj,250:500))))
        sprintf('Mouse 973: trial %.f excluded',jj)
        D.mouse_973_D1(jj,:)=NaN;
    end
    if sum(D.mouse_974_D1(jj,250:500)>((3*nanstd(D.mouse_974_D1(jj,250:500)))+nanmean(D.mouse_974_D1(jj,250:500)))) || sum(D.mouse_974_D1(jj,250:500)<((-3*nanstd(D.mouse_974_D1(jj,250:500)))+nanmean(D.mouse_974_D1(jj,250:500))))
        sprintf('Mouse 974: trial %.f excluded',jj)
        D.mouse_974_D1(jj,:)=NaN;
    end
    if sum(D.mouse_975_D1(jj,250:500)>((3*nanstd(D.mouse_975_D1(jj,250:500)))+nanmean(D.mouse_975_D1(jj,250:500)))) || sum(D.mouse_975_D1(jj,250:500)<((-3*nanstd(D.mouse_975_D1(jj,250:500)))+nanmean(D.mouse_975_D1(jj,250:500))))
        sprintf('Mouse 975: trial %.f excluded',jj)
        D.mouse_975_D1(jj,:)=NaN;
    end
    if sum(D.mouse_976_D1(jj,250:500)>((3*nanstd(D.mouse_976_D1(jj,250:500)))+nanmean(D.mouse_976_D1(jj,250:500)))) || sum(D.mouse_976_D1(jj,250:500)<((-3*nanstd(D.mouse_976_D1(jj,250:500)))+nanmean(D.mouse_976_D1(jj,250:500))))
        sprintf('Mouse 976: trial %.f excluded',jj)
        D.mouse_976_D1(jj,:)=NaN;
    end
    if sum(D.mouse_977_D1(jj,250:500)>((3*nanstd(D.mouse_977_D1(jj,250:500)))+nanmean(D.mouse_977_D1(jj,250:500)))) || sum(D.mouse_977_D1(jj,250:500)<((-3*nanstd(D.mouse_977_D1(jj,250:500)))+nanmean(D.mouse_977_D1(jj,250:500))))
        sprintf('Mouse 977: trial %.f excluded',jj)
        D.mouse_977_D1(jj,:)=NaN;
    end
    if sum(D.mouse_978_D1(jj,250:500)>((3*nanstd(D.mouse_978_D1(jj,250:500)))+nanmean(D.mouse_978_D1(jj,250:500)))) || sum(D.mouse_978_D1(jj,250:500)<((-3*nanstd(D.mouse_978_D1(jj,250:500)))+nanmean(D.mouse_978_D1(jj,250:500))))
        sprintf('Mouse 978: trial %.f excluded',jj)
        D.mouse_978_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1007_D1(jj,250:500)>((3*nanstd(D.mouse_1007_D1(jj,250:500)))+nanmean(D.mouse_1007_D1(jj,250:500)))) || sum(D.mouse_1007_D1(jj,250:500)<((-3*nanstd(D.mouse_1007_D1(jj,250:500)))+nanmean(D.mouse_1007_D1(jj,250:500))))
        sprintf('Mouse 1007: trial %.f excluded',jj)
        D.mouse_1007_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1008_D1(jj,250:500)>((3*nanstd(D.mouse_1008_D1(jj,250:500)))+nanmean(D.mouse_1008_D1(jj,250:500)))) || sum(D.mouse_1008_D1(jj,250:500)<((-3*nanstd(D.mouse_1008_D1(jj,250:500)))+nanmean(D.mouse_1008_D1(jj,250:500))))
        sprintf('Mouse 1008: trial %.f excluded',jj)
        D.mouse_1008_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1009_D1(jj,250:500)>((3*nanstd(D.mouse_1009_D1(jj,250:500)))+nanmean(D.mouse_1009_D1(jj,250:500)))) || sum(D.mouse_1009_D1(jj,250:500)<((-3*nanstd(D.mouse_1009_D1(jj,250:500)))+nanmean(D.mouse_1009_D1(jj,250:500))))
        sprintf('Mouse 1009: trial %.f excluded',jj)
        D.mouse_1009_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1010_D1(jj,250:500)>((3*nanstd(D.mouse_1010_D1(jj,250:500)))+nanmean(D.mouse_1010_D1(jj,250:500)))) || sum(D.mouse_1010_D1(jj,250:500)<((-3*nanstd(D.mouse_1010_D1(jj,250:500)))+nanmean(D.mouse_1010_D1(jj,250:500))))
        sprintf('Mouse 1010: trial %.f excluded',jj)
        D.mouse_1010_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1011_D1(jj,250:500)>((3*nanstd(D.mouse_1011_D1(jj,250:500)))+nanmean(D.mouse_1011_D1(jj,250:500)))) || sum(D.mouse_1011_D1(jj,250:500)<((-3*nanstd(D.mouse_1011_D1(jj,250:500)))+nanmean(D.mouse_1011_D1(jj,250:500))))
        sprintf('Mouse 1011: trial %.f excluded',jj)
        D.mouse_1011_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1012_D1(jj,250:500)>((3*nanstd(D.mouse_1012_D1(jj,250:500)))+nanmean(D.mouse_1012_D1(jj,250:500)))) || sum(D.mouse_1012_D1(jj,250:500)<((-3*nanstd(D.mouse_1012_D1(jj,250:500)))+nanmean(D.mouse_1012_D1(jj,250:500))))
        sprintf('Mouse 1012: trial %.f excluded',jj)
        D.mouse_1012_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1013_D1(jj,250:500)>((3*nanstd(D.mouse_1013_D1(jj,250:500)))+nanmean(D.mouse_1013_D1(jj,250:500)))) || sum(D.mouse_1013_D1(jj,250:500)<((-3*nanstd(D.mouse_1013_D1(jj,250:500)))+nanmean(D.mouse_1013_D1(jj,250:500))))
        sprintf('Mouse 1013: trial %.f excluded',jj)
        D.mouse_1013_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1014_D1(jj,250:500)>((3*nanstd(D.mouse_1014_D1(jj,250:500)))+nanmean(D.mouse_1014_D1(jj,250:500)))) || sum(D.mouse_1014_D1(jj,250:500)<((-3*nanstd(D.mouse_1014_D1(jj,250:500)))+nanmean(D.mouse_1014_D1(jj,250:500))))
        sprintf('Mouse 1014: trial %.f excluded',jj)
        D.mouse_1014_D1(jj,:)=NaN;
    end
    if sum(D.mouse_1015_D1(jj,250:500)>((3*nanstd(D.mouse_1015_D1(jj,250:500)))+nanmean(D.mouse_1015_D1(jj,250:500)))) || sum(D.mouse_1015_D1(jj,250:500)<((-3*nanstd(D.mouse_1015_D1(jj,250:500)))+nanmean(D.mouse_1015_D1(jj,250:500))))
        sprintf('Mouse 1015: trial %.f excluded',jj)
        D.mouse_1015_D1(jj,:)=NaN;
    end
end


% subtract baseline
for ii=1:55
    D.mouse_973_D1(ii,:)= D.mouse_973_D1(ii,:)-nanmean(D.mouse_973_D1(ii,250:500));
    D.mouse_974_D1(ii,:)= D.mouse_974_D1(ii,:)-nanmean(D.mouse_974_D1(ii,250:500));
    D.mouse_975_D1(ii,:)= D.mouse_975_D1(ii,:)-nanmean(D.mouse_975_D1(ii,250:500));
    D.mouse_976_D1(ii,:)= D.mouse_976_D1(ii,:)-nanmean(D.mouse_976_D1(ii,250:500));
    D.mouse_977_D1(ii,:)= D.mouse_977_D1(ii,:)-nanmean(D.mouse_977_D1(ii,250:500));
    D.mouse_978_D1(ii,:)= D.mouse_978_D1(ii,:)-nanmean(D.mouse_978_D1(ii,250:500));
    D.mouse_1007_D1(ii,:)= D.mouse_1007_D1(ii,:)-nanmean(D.mouse_1007_D1(ii,250:500));
    D.mouse_1008_D1(ii,:)= D.mouse_1008_D1(ii,:)-nanmean(D.mouse_1008_D1(ii,250:500));
    D.mouse_1009_D1(ii,:)= D.mouse_1009_D1(ii,:)-nanmean(D.mouse_1009_D1(ii,250:500));
    D.mouse_1010_D1(ii,:)= D.mouse_1010_D1(ii,:)-nanmean(D.mouse_1010_D1(ii,250:500));
    D.mouse_1011_D1(ii,:)= D.mouse_1011_D1(ii,:)-nanmean(D.mouse_1011_D1(ii,250:500));
    D.mouse_1012_D1(ii,:)= D.mouse_1012_D1(ii,:)-nanmean(D.mouse_1012_D1(ii,250:500));
    D.mouse_1013_D1(ii,:)= D.mouse_1013_D1(ii,:)-nanmean(D.mouse_1013_D1(ii,250:500));
    D.mouse_1014_D1(ii,:)= D.mouse_1014_D1(ii,:)-nanmean(D.mouse_1014_D1(ii,250:500));
    D.mouse_1015_D1(ii,:)= D.mouse_1015_D1(ii,:)-nanmean(D.mouse_1015_D1(ii,250:500));
end


%% Calculate the baseline and peak amp/area

for ii=1:55
    if isnan(D.mouse_973_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_973_D1_area__baseline(ii,1)= nansum(D.mouse_973_D1(ii,350:500));
        D.mouse_973_D1_area__opto(ii,1)= nansum(D.mouse_973_D1(ii,600:750));
    else
        D.mouse_973_D1_area__baseline(ii,1)= NaN;
        D.mouse_973_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_974_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_974_D1_area__baseline(ii,1)= nansum(D.mouse_974_D1(ii,350:500));
        D.mouse_974_D1_area__opto(ii,1)= nansum(D.mouse_974_D1(ii,600:750));
    else
        D.mouse_974_D1_area__baseline(ii,1)= NaN;
        D.mouse_974_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_975_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_975_D1_area__baseline(ii,1)= nansum(D.mouse_975_D1(ii,350:500));
        D.mouse_975_D1_area__opto(ii,1)= nansum(D.mouse_975_D1(ii,600:750));
    else
        D.mouse_975_D1_area__baseline(ii,1)= NaN;
        D.mouse_975_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_976_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_976_D1_area__baseline(ii,1)= nansum(D.mouse_976_D1(ii,350:500));
        D.mouse_976_D1_area__opto(ii,1)= nansum(D.mouse_976_D1(ii,600:750));
    else
        D.mouse_976_D1_area__baseline(ii,1)= NaN;
        D.mouse_976_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_977_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_977_D1_area__baseline(ii,1)= nansum(D.mouse_977_D1(ii,350:500));
        D.mouse_977_D1_area__opto(ii,1)= nansum(D.mouse_977_D1(ii,600:750));
    else
        D.mouse_977_D1_area__baseline(ii,1)= NaN;
        D.mouse_977_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_978_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_978_D1_area__baseline(ii,1)= nansum(D.mouse_978_D1(ii,350:500));
        D.mouse_978_D1_area__opto(ii,1)= nansum(D.mouse_978_D1(ii,600:750));
    else
        D.mouse_978_D1_area__baseline(ii,1)= NaN;
        D.mouse_978_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1007_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1007_D1_area__baseline(ii,1)= nansum(D.mouse_1007_D1(ii,350:500));
        D.mouse_1007_D1_area__opto(ii,1)= nansum(D.mouse_1007_D1(ii,600:750));
    else
        D.mouse_1007_D1_area__baseline(ii,1)= NaN;
        D.mouse_1007_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1008_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1008_D1_area__baseline(ii,1)= nansum(D.mouse_1008_D1(ii,350:500));
        D.mouse_1008_D1_area__opto(ii,1)= nansum(D.mouse_1008_D1(ii,600:750));
    else
        D.mouse_1008_D1_area__baseline(ii,1)= NaN;
        D.mouse_1008_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1009_D1(ii,350))==0
        D.mouse_1009_D1_area__baseline(ii,1)= nansum(D.mouse_1009_D1(ii,350:500));
        D.mouse_1009_D1_area__opto(ii,1)= nansum(D.mouse_1009_D1(ii,600:750));
    else
        D.mouse_1009_D1_area__baseline(ii,1)= NaN;
        D.mouse_1009_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1010_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1010_D1_area__baseline(ii,1)= nansum(D.mouse_1010_D1(ii,350:500));
        D.mouse_1010_D1_area__opto(ii,1)= nansum(D.mouse_1010_D1(ii,600:750));
    else
        D.mouse_1010_D1_area__baseline(ii,1)= NaN;
        D.mouse_1010_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1011_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1011_D1_area__baseline(ii,1)= nansum(D.mouse_1011_D1(ii,350:500));
        D.mouse_1011_D1_area__opto(ii,1)= nansum(D.mouse_1011_D1(ii,600:750));
    else
        D.mouse_1011_D1_area__baseline(ii,1)= NaN;
        D.mouse_1011_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1012_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1012_D1_area__baseline(ii,1)= nansum(D.mouse_1012_D1(ii,350:500));
        D.mouse_1012_D1_area__opto(ii,1)= nansum(D.mouse_1012_D1(ii,600:750));
    else
        D.mouse_1012_D1_area__baseline(ii,1)= NaN;
        D.mouse_1012_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1013_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1013_D1_area__baseline(ii,1)= nansum(D.mouse_1013_D1(ii,350:500));
        D.mouse_1013_D1_area__opto(ii,1)= nansum(D.mouse_1013_D1(ii,600:750));
    else
        D.mouse_1013_D1_area__baseline(ii,1)= NaN;
        D.mouse_1013_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1014_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1014_D1_area__baseline(ii,1)= nansum(D.mouse_1014_D1(ii,350:500));
        D.mouse_1014_D1_area__opto(ii,1)= nansum(D.mouse_1014_D1(ii,600:750));
    else
        D.mouse_1014_D1_area__baseline(ii,1)= NaN;
        D.mouse_1014_D1_area__opto(ii,1)= NaN;
    end
    if isnan(D.mouse_1015_D1(ii,350))==0 && D.trialorder_D1(ii)==2
        D.mouse_1015_D1_area__baseline(ii,1)= nansum(D.mouse_1015_D1(ii,350:500));
        D.mouse_1015_D1_area__opto(ii,1)= nansum(D.mouse_1015_D1(ii,600:750));
    else
        D.mouse_1015_D1_area__baseline(ii,1)= NaN;
        D.mouse_1015_D1_area__opto(ii,1)= NaN;
    end
end

%%
figure; hold on;
for ii=1:55
    %     if D.trialorder_D1(ii)==2
    plot(D.mouse_1007_D1(ii,:))
    %     end
end

D.D1_avg(1,:) = nanmean(D.mouse_973_D1(D.trialorder_D1==2,:));
D.D1_avg(2,:) = nanmean(D.mouse_974_D1(D.trialorder_D1==2,:));
D.D1_avg(3,:) = nanmean(D.mouse_975_D1(D.trialorder_D1==2,:));
D.D1_avg(4,:) = nanmean(D.mouse_976_D1(D.trialorder_D1==2,:));
D.D1_avg(5,:) = nanmean(D.mouse_977_D1(D.trialorder_D1==2,:));
D.D1_avg(6,:) = nanmean(D.mouse_978_D1(D.trialorder_D1==2,:));
D.D1_avg(7,:) = nanmean(D.mouse_1007_D1(D.trialorder_D1==2,:));
D.D1_avg(8,:) = nanmean(D.mouse_1008_D1(D.trialorder_D1==2,:));
D.D1_avg(9,:) = nanmean(D.mouse_1009_D1(D.trialorder_D1==2,:));
D.D1_avg(10,:) = nanmean(D.mouse_1010_D1(D.trialorder_D1==2,:));
D.D1_avg(11,:) = nanmean(D.mouse_1011_D1(D.trialorder_D1==2,:));
D.D1_avg(12,:) = nanmean(D.mouse_1012_D1(D.trialorder_D1==2,:));
D.D1_avg(13,:) = nanmean(D.mouse_1013_D1(D.trialorder_D1==2,:));
D.D1_avg(14,:) = nanmean(D.mouse_1014_D1(D.trialorder_D1==2,:));
D.D1_avg(15,:) = nanmean(D.mouse_1015_D1(D.trialorder_D1==2,:));

% D.D1_avg(1,:) = nanmedian(D.mouse_973_D1(D.trialorder_D1==2,:));
% D.D1_avg(2,:) = nanmedian(D.mouse_974_D1(D.trialorder_D1==2,:));
% D.D1_avg(3,:) = nanmedian(D.mouse_975_D1(D.trialorder_D1==2,:));
% D.D1_avg(4,:) = nanmedian(D.mouse_976_D1(D.trialorder_D1==2,:));
% D.D1_avg(5,:) = nanmedian(D.mouse_977_D1(D.trialorder_D1==2,:));
% D.D1_avg(6,:) = nanmedian(D.mouse_978_D1(D.trialorder_D1==2,:));
% D.D1_avg(7,:) = nanmedian(D.mouse_1007_D1(D.trialorder_D1==2,:));
% D.D1_avg(8,:) = nanmedian(D.mouse_1008_D1(D.trialorder_D1==2,:));
% D.D1_avg(9,:) = nanmedian(D.mouse_1009_D1(D.trialorder_D1==2,:));
% D.D1_avg(10,:) = nanmedian(D.mouse_1010_D1(D.trialorder_D1==2,:));
% D.D1_avg(11,:) = nanmedian(D.mouse_1011_D1(D.trialorder_D1==2,:));
% D.D1_avg(12,:) = nanmedian(D.mouse_1012_D1(D.trialorder_D1==2,:));
% D.D1_avg(13,:) = nanmedian(D.mouse_1013_D1(D.trialorder_D1==2,:));
% D.D1_avg(14,:) = nanmedian(D.mouse_1014_D1(D.trialorder_D1==2,:));
% D.D1_avg(15,:) = nanmedian(D.mouse_1015_D1(D.trialorder_D1==2,:));

%% Calculate the cumsum of eyelid movements
idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_973_D1(ii,:)-nanmean(D.mouse_973_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_973_D1(ii,500:1000));
end
S.D1_cumsum_opto(1,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_974_D1(ii,:)-nanmean(D.mouse_974_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_974_D1(ii,500:1000));
end
S.D1_cumsum_opto(2,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_975_D1(ii,:)-nanmean(D.mouse_975_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_975_D1(ii,500:1000));
end
S.D1_cumsum_opto(3,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_976_D1(ii,:)-nanmean(D.mouse_976_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_976_D1(ii,500:1000));
end
S.D1_cumsum_opto(4,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_977_D1(ii,:)-nanmean(D.mouse_977_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_977_D1(ii,500:1000));
end
S.D1_cumsum_opto(5,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_978_D1(ii,:)-nanmean(D.mouse_978_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_978_D1(ii,500:1000));
end
S.D1_cumsum_opto(6,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1007_D1(ii,:)-nanmean(D.mouse_1007_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1007_D1(ii,500:1000));
end
S.D1_cumsum_opto(7,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1008_D1(ii,:)-nanmean(D.mouse_1008_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1008_D1(ii,500:1000));
end
S.D1_cumsum_opto(8,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1009_D1(ii,:)-nanmean(D.mouse_1009_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1009_D1(ii,500:1000));
end
S.D1_cumsum_opto(9,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1010_D1(ii,:)-nanmean(D.mouse_1010_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1010_D1(ii,500:1000));
end
S.D1_cumsum_opto(10,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1011_D1(ii,:)-nanmean(D.mouse_1011_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1011_D1(ii,500:1000));
end
S.D1_cumsum_opto(11,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1012_D1(ii,:)-nanmean(D.mouse_1012_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1012_D1(ii,500:1000));
end
S.D1_cumsum_opto(12,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1013_D1(ii,:)-nanmean(D.mouse_1013_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1013_D1(ii,500:1000));
end
S.D1_cumsum_opto(13,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1014_D1(ii,:)-nanmean(D.mouse_1014_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1014_D1(ii,500:1000));
end
S.D1_cumsum_opto(14,:)=nanmean(S.D1_cumsum_opto_traces,1);

idx=[];
for ii=1:size(D.trialorder_D1,2)
    idx(ii,:) = D.mouse_1015_D1(ii,:)-nanmean(D.mouse_1015_D1(ii,1:500));
    S.D1_cumsum_opto_traces(ii,:) = cumsum(D.mouse_1015_D1(ii,500:1000));
end
S.D1_cumsum_opto(15,:)=nanmean(S.D1_cumsum_opto_traces,1);

%% Cumsum groupaverages

S.D1_cumsum_opto_avg_chr2=nanmean(S.D1_cumsum_opto([1 2 3 4 5 6 7 8 12],:));
S.D1_cumsum_opto_SD_chr2=nanstd(S.D1_cumsum_opto([1 2 3 4 5 6 7 8 12],:));
S.D1_cumsum_opto_SEM_chr2=nanstd(S.D1_cumsum_opto([1 2 3 4 5 6 7 8 12],:))/sqrt(size(S.D1_cumsum_opto([1 2 3 4 5 6 7 8 12],:),1));

S.D1_cumsum_opto_avg_ctr=nanmean(S.D1_cumsum_opto([9 10 11 13 14 15],:));
S.D1_cumsum_opto_SD_ctr=nanstd(S.D1_cumsum_opto([9 10 11 13 14 15],:));
S.D1_cumsum_opto_SEM_ctr=nanstd(S.D1_cumsum_opto([9 10 11 13 14 15],:))/sqrt(size(S.D1_cumsum_opto([9 10 11 13 14 15],:),1));

% plot the figures
figure; hold on;
P.xaxis_cumsum=linspace(0,0.5,501);
shadedErrorBar(P.xaxis_cumsum,S.D1_cumsum_opto_avg_ctr,S.D1_cumsum_opto_SEM_ctr,'k');
shadedErrorBar(P.xaxis_cumsum,S.D1_cumsum_opto_avg_chr2,S.D1_cumsum_opto_SEM_chr2,'b');


line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)');     ylabel('Cumulative sum eyelid movements (arb. units)');
% xlim([-0.25 0.5])
% lgd = legend('US','US-opto0','US-opto25','US-opto50','US-opto75','US-opto100');
% lgd.Location = 'northwest'


%Save figure
cd('')
figname = sprintf('D1_cumsum_eyelid_groupAVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_cumsum_eyelid_groupAVG.pdf')
orient(gcf,'landscape')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_cumsum_eyelid_groupAVG.jpg')
saveas(gcf,figname,'jpg')

%% Plot the figures;
figure; subplot(1,2,1); hold on;
for ii=[1 2 3 4 5 6 7 8 12]
    plot(linspace(-0.5,1.5,2000),D.D1_avg(ii,:))
    %      pause;
end
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])

subplot(1,2,2); hold on;
for ii=[9 10 11 13 14 15]
    plot(linspace(-0.5,1.5,2000),D.D1_avg(ii,:))
    %     pause;
end
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])
% legend({'973' '974' '975' '976' '977' '978' '1007' '1008' '1009' '1010' '1011' '1012' '1013' '1014' '1015'})

% Save figure
figname = sprintf('D1_eyelidmovements_indTrials.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_eyelidmovements_indTrials.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_eyelidmovements_indTrials.jpg')
saveas(gcf,figname,'jpg')

D.D1_groupavg_opto = nanmean(D.D1_avg([1 2 3 4 5 6 7 8 12],:));
D.D1_groupavg_ctr = nanmean(D.D1_avg([9 10 11 13 14 15],:));
D.D1_groupavg_opto_sem = nanstd(D.D1_avg([1 2 3 4 5 6 7 8 12],:))/sqrt(9);
D.D1_groupavg_ctr_sem = nanstd(D.D1_avg([9 10 11 13 14 15],:))/sqrt(6);
figure; hold on; shadedErrorBar(linspace(-0.5,1.5,2000),D.D1_groupavg_ctr,D.D1_groupavg_ctr_sem,'k'); shadedErrorBar(linspace(-0.5,1.5,2000),D.D1_groupavg_opto,D.D1_groupavg_opto_sem,'b');
line([0 0],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
line([0.1 0.1],[min(get(gca, 'Ylim')) max(get(gca, 'Ylim'))], 'Color', 'r');
xlabel('Time (s)'); ylabel('Eyelid movement (%full closure)')
xlim([-0.25 0.5])

% Save figure
figname = sprintf('D1_eyelidmovements_AVG.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D1_eyelidmovements_AVG.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D1_eyelidmovements_AVG.jpg')
saveas(gcf,figname,'jpg')

%% Calculate the area
D.D1_avg_area=[];
D.D1_avg_amplitude=[];
P.xaxis=linspace(-0.5,1.5,2000);
for ii=1:size(D.D1_avg,1)
    D.D1_avg_area(ii)= nansum(D.D1_avg(ii,P.xaxis>=0.1&P.xaxis<0.25));
    D.D1_avg_amplitude(ii)= nanmax(D.D1_avg(ii,P.xaxis>=0.1&P.xaxis<0.25));
end
D.D1_avg_area_chr2=D.D1_avg_area([1 2 3 4 5 6 7 8 12])';
D.D1_avg_area_ctr=D.D1_avg_area([9 10 11 13 14 15])';
D.D1_avg_amplitude_chr2=D.D1_avg_amplitude([1 2 3 4 5 6 7 8 12])';
D.D1_avg_amplitude_ctr=D.D1_avg_amplitude([9 10 11 13 14 15])';

%% Save the data
P.savename = sprintf('D1_eyelidmovements_data_groupanalysis.mat');
save(P.savename,'D','S','data',"-v7.3");
