%% Analyze CSV files to extract pupil movements and pupil size
clear all;

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

    load(sprintf('%s_pupil_data_Ctrl.mat',P.mouseID));

    %% Saccades trajectories (200ms after US)

    figure;
    k(1)=subplot(2,3,1);hold on;
    for ii=1:size(R.pupmov_location_steps_X_US_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_US_centered(ii,:)=R.pupmov_location_steps_X_US_avg(ii,:)-R.pupmov_location_steps_X_US_avg(ii,6);
        R.pupmov_location_steps_Y_avg_US_centered(ii,:)=R.pupmov_location_steps_Y_US_avg(ii,:)-R.pupmov_location_steps_Y_US_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_US_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_US_centered(ii,[6 10]),'-o')
    end
    title(['Saccades 0-200ms - US'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_US_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_US_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_US_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_US_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(2)=subplot(2,3,2);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto0_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto0_centered(ii,:)=R.pupmov_location_steps_X_opto0_avg(ii,:)-R.pupmov_location_steps_X_opto0_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto0_centered(ii,:)=R.pupmov_location_steps_Y_opto0_avg(ii,:)-R.pupmov_location_steps_Y_opto0_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto0_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto0_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto0'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto0_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto0_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto0_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto0_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(3)=subplot(2,3,3);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto25_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto25_centered(ii,:)=R.pupmov_location_steps_X_opto25_avg(ii,:)-R.pupmov_location_steps_X_opto25_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto25_centered(ii,:)=R.pupmov_location_steps_Y_opto25_avg(ii,:)-R.pupmov_location_steps_Y_opto25_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto25_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto25_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto25'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto25_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto25_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto25_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto25_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(4)=subplot(2,3,4);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto50_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto50_centered(ii,:)=R.pupmov_location_steps_X_opto50_avg(ii,:)-R.pupmov_location_steps_X_opto50_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto50_centered(ii,:)=R.pupmov_location_steps_Y_opto50_avg(ii,:)-R.pupmov_location_steps_Y_opto50_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto50_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto50_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto50'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto50_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto50_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto50_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto50_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(5)=subplot(2,3,5);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto75_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto75_centered(ii,:)=R.pupmov_location_steps_X_opto75_avg(ii,:)-R.pupmov_location_steps_X_opto75_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto75_centered(ii,:)=R.pupmov_location_steps_Y_opto75_avg(ii,:)-R.pupmov_location_steps_Y_opto75_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto75_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto75_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto75'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto75_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto75_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto75_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto75_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    k(6)=subplot(2,3,6);hold on;
    for ii=1:size(R.pupmov_location_steps_X_opto100_avg,1)
        % for ii=10:12
        R.pupmov_location_steps_X_avg_opto100_centered(ii,:)=R.pupmov_location_steps_X_opto100_avg(ii,:)-R.pupmov_location_steps_X_opto100_avg(ii,6);
        R.pupmov_location_steps_Y_avg_opto100_centered(ii,:)=R.pupmov_location_steps_Y_opto100_avg(ii,:)-R.pupmov_location_steps_Y_opto100_avg(ii,6);
        plot(R.pupmov_location_steps_X_avg_opto100_centered(ii,[6 10]),R.pupmov_location_steps_Y_avg_opto100_centered(ii,[6 10]),'-o')
    end
    title(['Saccades - opto100'])
    xlim([(nanmax(abs(R.pupmov_location_steps_X_avg_opto100_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_X_avg_opto100_centered(:,10))))+1])
    ylim([(nanmax(abs(R.pupmov_location_steps_Y_avg_opto100_centered(:,10)))*-1)-1 (nanmax(abs(R.pupmov_location_steps_Y_avg_opto100_centered(:,10))))+1])
    set(gca, 'YDir','reverse')
    xlabel('pixels')
    ylabel('pixels')
    grid on
    box on

    %     linkaxes(k,'xy')

    % Save figure
    figname = sprintf('%s_pupilmovements_trajectories.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_pupilmovements_trajectories.pdf',P.mouseID)
    orient(gcf,'landscape')
    print('-dpdf','-vector','-loose','-fillpage',figname)
    figname = sprintf('%s_pupilmovements_trajectories.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')

    %% Polar plot

    % Divide the saccades into quadrants
    figure; hold on;
    R.pupmov_quad_up_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_leftup_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_left_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_leftdown_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_down_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_rightdown_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_right_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.pupmov_quad_rightup_US=NaN(size(R.pupmov_location_steps_X_avg_US_centered,1),1);
    R.saccadeLength_US =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_US_centered,1)
        idx = [R.pupmov_location_steps_X_avg_US_centered(ii,10) R.pupmov_location_steps_Y_avg_US_centered(ii,10)];
        R.saccadeLength_US(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_US = nanmean(R.saccadeLength_US);
    R.saccadeLength_SD_US = nanstd(R.saccadeLength_US);

    for ii=1:size(R.pupmov_location_steps_X_avg_US_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_US_centered(ii,10) R.pupmov_location_steps_Y_avg_US_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_US(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_US(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_US(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_US(ii)=1;
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_US(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_US(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_US(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_US(ii)=1;
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(1)=subplot(2,3,1);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts = [nansum(R.pupmov_quad_rightdown_US) nansum(R.pupmov_quad_down_US)...
        nansum(R.pupmov_quad_leftdown_US) nansum(R.pupmov_quad_left_US)...
        nansum(R.pupmov_quad_leftup_US) nansum(R.pupmov_quad_up_US)...
        nansum(R.pupmov_quad_rightup_US) nansum(R.pupmov_quad_right_US) ];

    counts = sum(counts);

    counts_US = [(nansum(R.pupmov_quad_rightdown_US)/counts)*100 (nansum(R.pupmov_quad_down_US)/counts)*100 (nansum(R.pupmov_quad_leftdown_US)/counts)*100 (nansum(R.pupmov_quad_left_US)/counts)*100 (nansum(R.pupmov_quad_leftup_US)/counts)*100 (nansum(R.pupmov_quad_up_US)/counts)*100 (nansum(R.pupmov_quad_rightup_US)/counts)*100 (nansum(R.pupmov_quad_right_US)/counts)*100];


    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_US);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _US');

    % -------------------------------
    R.pupmov_quad_up_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_leftup_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_left_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_leftdown_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_down_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_rightdown_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_right_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.pupmov_quad_rightup_opto0=NaN(size(R.pupmov_location_steps_X_avg_opto0_centered,1),1);
    R.saccadeLength_opto0 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto0_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto0_centered(ii,10) R.pupmov_location_steps_Y_avg_opto0_centered(ii,10)];
        R.saccadeLength_opto0(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto0 = nanmean(R.saccadeLength_opto0);
    R.saccadeLength_SD_opto0 = nanstd(R.saccadeLength_opto0);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto0_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto0_centered(ii,10) R.pupmov_location_steps_Y_avg_opto0_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto0(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto0(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto0(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto0(ii)=1;
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto0(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto0(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto0(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto0(ii)=1;
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(2)=subplot(2,3,2);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts = [nansum(R.pupmov_quad_rightdown_opto0) nansum(R.pupmov_quad_down_opto0)...
        nansum(R.pupmov_quad_leftdown_opto0) nansum(R.pupmov_quad_left_opto0)...
        nansum(R.pupmov_quad_leftup_opto0) nansum(R.pupmov_quad_up_opto0)...
        nansum(R.pupmov_quad_rightup_opto0) nansum(R.pupmov_quad_right_opto0) ];

    counts = sum(counts);

    counts_opto0 = [(nansum(R.pupmov_quad_rightdown_opto0)/counts)*100 (nansum(R.pupmov_quad_down_opto0)/counts)*100 (nansum(R.pupmov_quad_leftdown_opto0)/counts)*100 (nansum(R.pupmov_quad_left_opto0)/counts)*100 (nansum(R.pupmov_quad_leftup_opto0)/counts)*100 (nansum(R.pupmov_quad_up_opto0)/counts)*100 (nansum(R.pupmov_quad_rightup_opto0)/counts)*100 (nansum(R.pupmov_quad_right_opto0)/counts)*100];



    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto0);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto0');

    % -------------------------------
    R.pupmov_quad_up_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_leftup_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_left_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_leftdown_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_down_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_rightdown_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_right_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.pupmov_quad_rightup_opto25=NaN(size(R.pupmov_location_steps_X_avg_opto25_centered,1),1);
    R.saccadeLength_opto25 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto25_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto25_centered(ii,10) R.pupmov_location_steps_Y_avg_opto25_centered(ii,10)];
        R.saccadeLength_opto25(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto25 = nanmean(R.saccadeLength_opto25);
    R.saccadeLength_SD_opto25 = nanstd(R.saccadeLength_opto25);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto25_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto25_centered(ii,10) R.pupmov_location_steps_Y_avg_opto25_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto25(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto25(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto25(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto25(ii)=1;
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto25(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto25(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto25(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto25(ii)=1;
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(3)=subplot(2,3,3);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts = [nansum(R.pupmov_quad_rightdown_opto25) nansum(R.pupmov_quad_down_opto25)...
        nansum(R.pupmov_quad_leftdown_opto25) nansum(R.pupmov_quad_left_opto25)...
        nansum(R.pupmov_quad_leftup_opto25) nansum(R.pupmov_quad_up_opto25)...
        nansum(R.pupmov_quad_rightup_opto25) nansum(R.pupmov_quad_right_opto25) ];

    counts = sum(counts);

    counts_opto25 = [(nansum(R.pupmov_quad_rightdown_opto25)/counts)*100 (nansum(R.pupmov_quad_down_opto25)/counts)*100 (nansum(R.pupmov_quad_leftdown_opto25)/counts)*100 (nansum(R.pupmov_quad_left_opto25)/counts)*100 (nansum(R.pupmov_quad_leftup_opto25)/counts)*100 (nansum(R.pupmov_quad_up_opto25)/counts)*100 (nansum(R.pupmov_quad_rightup_opto25)/counts)*100 (nansum(R.pupmov_quad_right_opto25)/counts)*100];



    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto25);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto25');

    % -------------------------------
    R.pupmov_quad_up_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_leftup_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_left_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_leftdown_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_down_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_rightdown_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_right_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.pupmov_quad_rightup_opto50=NaN(size(R.pupmov_location_steps_X_avg_opto50_centered,1),1);
    R.saccadeLength_opto50 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto50_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto50_centered(ii,10) R.pupmov_location_steps_Y_avg_opto50_centered(ii,10)];
        R.saccadeLength_opto50(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto50 = nanmean(R.saccadeLength_opto50);
    R.saccadeLength_SD_opto50 = nanstd(R.saccadeLength_opto50);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto50_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto50_centered(ii,10) R.pupmov_location_steps_Y_avg_opto50_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto50(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto50(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto50(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto50(ii)=1;
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto50(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto50(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto50(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto50(ii)=1;
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(4)=subplot(2,3,4);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts = [nansum(R.pupmov_quad_rightdown_opto50) nansum(R.pupmov_quad_down_opto50)...
        nansum(R.pupmov_quad_leftdown_opto50) nansum(R.pupmov_quad_left_opto50)...
        nansum(R.pupmov_quad_leftup_opto50) nansum(R.pupmov_quad_up_opto50)...
        nansum(R.pupmov_quad_rightup_opto50) nansum(R.pupmov_quad_right_opto50) ];

    counts = sum(counts);

    counts_opto50 = [(nansum(R.pupmov_quad_rightdown_opto50)/counts)*100 (nansum(R.pupmov_quad_down_opto50)/counts)*100 (nansum(R.pupmov_quad_leftdown_opto50)/counts)*100 (nansum(R.pupmov_quad_left_opto50)/counts)*100 (nansum(R.pupmov_quad_leftup_opto50)/counts)*100 (nansum(R.pupmov_quad_up_opto50)/counts)*100 (nansum(R.pupmov_quad_rightup_opto50)/counts)*100 (nansum(R.pupmov_quad_right_opto50)/counts)*100];



    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto50);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto50');

    % -------------------------------
    R.pupmov_quad_up_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_leftup_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_left_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_leftdown_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_down_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_rightdown_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_right_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.pupmov_quad_rightup_opto75=NaN(size(R.pupmov_location_steps_X_avg_opto75_centered,1),1);
    R.saccadeLength_opto75 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto75_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto75_centered(ii,10) R.pupmov_location_steps_Y_avg_opto75_centered(ii,10)];
        R.saccadeLength_opto75(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto75 = nanmean(R.saccadeLength_opto75);
    R.saccadeLength_SD_opto75 = nanstd(R.saccadeLength_opto75);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto75_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto75_centered(ii,10) R.pupmov_location_steps_Y_avg_opto75_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto75(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto75(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto75(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto75(ii)=1;
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto75(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto75(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto75(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto75(ii)=1;
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(5)=subplot(2,3,5);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts = [nansum(R.pupmov_quad_rightdown_opto75) nansum(R.pupmov_quad_down_opto75)...
        nansum(R.pupmov_quad_leftdown_opto75) nansum(R.pupmov_quad_left_opto75)...
        nansum(R.pupmov_quad_leftup_opto75) nansum(R.pupmov_quad_up_opto75)...
        nansum(R.pupmov_quad_rightup_opto75) nansum(R.pupmov_quad_right_opto75) ];

    counts = sum(counts);

    counts_opto75 = [(nansum(R.pupmov_quad_rightdown_opto75)/counts)*100 (nansum(R.pupmov_quad_down_opto75)/counts)*100 (nansum(R.pupmov_quad_leftdown_opto75)/counts)*100 (nansum(R.pupmov_quad_left_opto75)/counts)*100 (nansum(R.pupmov_quad_leftup_opto75)/counts)*100 (nansum(R.pupmov_quad_up_opto75)/counts)*100 (nansum(R.pupmov_quad_rightup_opto75)/counts)*100 (nansum(R.pupmov_quad_right_opto75)/counts)*100];



    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto75);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto75');

    % -------------------------------
    R.pupmov_quad_up_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_leftup_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_left_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_leftdown_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_down_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_rightdown_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_right_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.pupmov_quad_rightup_opto100=NaN(size(R.pupmov_location_steps_X_avg_opto100_centered,1),1);
    R.saccadeLength_opto100 =[];

    for ii=1:size(R.pupmov_location_steps_X_avg_opto100_centered,1)
        idx = [R.pupmov_location_steps_X_avg_opto100_centered(ii,10) R.pupmov_location_steps_Y_avg_opto100_centered(ii,10)];
        R.saccadeLength_opto100(ii) = sqrt((idx(1) - 0).^2 + (idx(2) - 0).^2);
    end
    R.saccadeLength_avg_opto100 = nanmean(R.saccadeLength_opto100);
    R.saccadeLength_SD_opto100 = nanstd(R.saccadeLength_opto100);
    for ii=1:size(R.pupmov_location_steps_X_avg_opto100_centered,1)
        % for ii=10:12
        idx = [R.pupmov_location_steps_X_avg_opto100_centered(ii,10) R.pupmov_location_steps_Y_avg_opto100_centered(ii,10)];
        %     if R.saccadeLength(ii)>(R.saccadeLength_avg+(1*R.saccadeLength_SD)) % only select the largest saccades
        if idx(1)>0 % X higher than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: rightup quadrant
                    R.pupmov_quad_rightup_opto100(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: right quadrant
                    R.pupmov_quad_right_opto100(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than Y: down quadrant
                    R.pupmov_quad_down_opto100(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: rightdown quadrant
                    R.pupmov_quad_rightdown_opto100(ii)=1;
                end
            end
        elseif idx(1)<0 % X lower than 0
            if idx(2)>0 % Y higher than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: up quadrant
                    R.pupmov_quad_up_opto100(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: leftup quadrant
                    R.pupmov_quad_leftup_opto100(ii)=1;
                end
            elseif idx(2)<0 % Y lower than 0
                if abs(idx(1))<abs(idx(2)) % Y higher than X: leftdown quadrant
                    R.pupmov_quad_leftdown_opto100(ii)=1;
                elseif abs(idx(1))>abs(idx(2)) % X higher than Y: left quadrant
                    R.pupmov_quad_left_opto100(ii)=1;
                end
            end
        end
    end
    % end

    % Make the polar plot
    l(6)=subplot(2,3,6);
    % First, Declare A 'polaraxes' Object & Return Its Handle
    % Define bin edges for 8 equal quadrants (0 to 2π)
    edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

    % Define bin counts for each quadrant
    counts = [nansum(R.pupmov_quad_rightdown_opto100) nansum(R.pupmov_quad_down_opto100)...
        nansum(R.pupmov_quad_leftdown_opto100) nansum(R.pupmov_quad_left_opto100)...
        nansum(R.pupmov_quad_leftup_opto100) nansum(R.pupmov_quad_up_opto100)...
        nansum(R.pupmov_quad_rightup_opto100) nansum(R.pupmov_quad_right_opto100) ];

    counts = sum(counts);

    counts_opto100 = [(nansum(R.pupmov_quad_rightdown_opto100)/counts)*100 (nansum(R.pupmov_quad_down_opto100)/counts)*100 (nansum(R.pupmov_quad_leftdown_opto100)/counts)*100 (nansum(R.pupmov_quad_left_opto100)/counts)*100 (nansum(R.pupmov_quad_leftup_opto100)/counts)*100 (nansum(R.pupmov_quad_up_opto100)/counts)*100 (nansum(R.pupmov_quad_rightup_opto100)/counts)*100 (nansum(R.pupmov_quad_right_opto100)/counts)*100];



    % Create the polar histogram
    polarhistogram('BinEdges', edges, 'BinCounts', counts_opto100);

    set(gca,'ThetaTick',     [0:90:270], ...
        'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
    title('Saccade direction _opto100');

    %         linkaxes(l,'x')

    % Save figure
    figname = sprintf('%s_saccadeDirectionPolarplots_counts%.fig',P.mouseID)
    saveas(gcf,figname,'fig');
    figname = sprintf('%s_saccadeDirectionPolarplots_counts%.pdf',P.mouseID)
    print('-dpdf','-vector','-loose',figname)
    figname = sprintf('%s_saccadeDirectionPolarplots_counts%.jpg',P.mouseID)
    saveas(gcf,figname,'jpg')
    %     pause;

    %% sum the counts/polar plots
    G.counts_US(zz,:)=[nansum(R.pupmov_quad_rightdown_US) nansum(R.pupmov_quad_down_US)...
        nansum(R.pupmov_quad_leftdown_US) nansum(R.pupmov_quad_left_US)...
        nansum(R.pupmov_quad_leftup_US) nansum(R.pupmov_quad_up_US)...
        nansum(R.pupmov_quad_rightup_US) nansum(R.pupmov_quad_right_US)];

    G.counts_opto0(zz,:)=[nansum(R.pupmov_quad_rightdown_opto0) nansum(R.pupmov_quad_down_opto0)...
        nansum(R.pupmov_quad_leftdown_opto0) nansum(R.pupmov_quad_left_opto0)...
        nansum(R.pupmov_quad_leftup_opto0) nansum(R.pupmov_quad_up_opto0)...
        nansum(R.pupmov_quad_rightup_opto0) nansum(R.pupmov_quad_right_opto0)];

    G.counts_opto25(zz,:)=[nansum(R.pupmov_quad_rightdown_opto25) nansum(R.pupmov_quad_down_opto25)...
        nansum(R.pupmov_quad_leftdown_opto25) nansum(R.pupmov_quad_left_opto25)...
        nansum(R.pupmov_quad_leftup_opto25) nansum(R.pupmov_quad_up_opto25)...
        nansum(R.pupmov_quad_rightup_opto25) nansum(R.pupmov_quad_right_opto25)];

    G.counts_opto50(zz,:)=[nansum(R.pupmov_quad_rightdown_opto50) nansum(R.pupmov_quad_down_opto50)...
        nansum(R.pupmov_quad_leftdown_opto50) nansum(R.pupmov_quad_left_opto50)...
        nansum(R.pupmov_quad_leftup_opto50) nansum(R.pupmov_quad_up_opto50)...
        nansum(R.pupmov_quad_rightup_opto50) nansum(R.pupmov_quad_right_opto50)];

    G.counts_opto75(zz,:)=[nansum(R.pupmov_quad_rightdown_opto75) nansum(R.pupmov_quad_down_opto75)...
        nansum(R.pupmov_quad_leftdown_opto75) nansum(R.pupmov_quad_left_opto75)...
        nansum(R.pupmov_quad_leftup_opto75) nansum(R.pupmov_quad_up_opto75)...
        nansum(R.pupmov_quad_rightup_opto75) nansum(R.pupmov_quad_right_opto75)];

    G.counts_opto100(zz,:)=[nansum(R.pupmov_quad_rightdown_opto100) nansum(R.pupmov_quad_down_opto100)...
        nansum(R.pupmov_quad_leftdown_opto100) nansum(R.pupmov_quad_left_opto100)...
        nansum(R.pupmov_quad_leftup_opto100) nansum(R.pupmov_quad_up_opto100)...
        nansum(R.pupmov_quad_rightup_opto100) nansum(R.pupmov_quad_right_opto100)];


    %% Save the data
    %   save(P.savename,'P','R','S','data',"-v7.3");
end

%% Make the matrix for prism chi2 test

chi_data(:,1) = sum(G.counts_US,1);
chi_data(:,2) = sum(G.counts_opto0,1);
chi_data(:,3) = sum(G.counts_opto50,1);

%convert to percentages
for ii=1:4
    G.counts_US(ii,:) = G.counts_US(ii,:)/sum(G.counts_US(ii,:))*100
    G.counts_opto0(ii,:) = G.counts_opto0(ii,:)/sum(G.counts_opto0(ii,:))*100
    G.counts_opto25(ii,:) = G.counts_opto25(ii,:)/sum(G.counts_opto25(ii,:))*100
    G.counts_opto50(ii,:) = G.counts_opto50(ii,:)/sum(G.counts_opto50(ii,:))*100
    G.counts_opto75(ii,:) = G.counts_opto75(ii,:)/sum(G.counts_opto75(ii,:))*100
    G.counts_opto100(ii,:) = G.counts_opto100(ii,:)/sum(G.counts_opto100(ii,:))*100
end


cd('')
G.counts_US_avg = nanmean(G.counts_US,1);
G.counts_opto0_avg = nanmean(G.counts_opto0,1);
G.counts_opto25_avg = nanmean(G.counts_opto25,1);
G.counts_opto50_avg = nanmean(G.counts_opto50,1);
G.counts_opto75_avg = nanmean(G.counts_opto75,1);
G.counts_opto100_avg = nanmean(G.counts_opto100,1);

G.counts_US_sem = nanstd(G.counts_US,1)/sqrt(size(G.counts_US,1));
G.counts_opto0_sem = nanstd(G.counts_opto0,1)/sqrt(size(G.counts_opto0,1));
G.counts_opto25_sem = nanstd(G.counts_opto25,1)/sqrt(size(G.counts_opto25,1));
G.counts_opto50_sem = nanstd(G.counts_opto50,1)/sqrt(size(G.counts_opto50,1));
G.counts_opto75_sem = nanstd(G.counts_opto75,1)/sqrt(size(G.counts_opto75,1));
G.counts_opto100_sem = nanstd(G.counts_opto100,1)/sqrt(size(G.counts_opto100,1));


rlim_range = [0 40];

figure; hold on;
subplot(2,3,1);
% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Create the polar histogram
l(1)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_US_avg);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
title('Saccade direction US');
rlim(rlim_range)

subplot(2,3,2);
% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Create the polar histogram
l(2)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_opto0_avg);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
title('Saccade direction US+opto0');
rlim(rlim_range)

subplot(2,3,3);
% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Create the polar histogram
l(3)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_opto25_avg);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
title('Saccade direction US+opto25');
rlim(rlim_range)

subplot(2,3,4);
% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Create the polar histogram
l(4)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_opto50_avg);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
title('Saccade direction US+opto50');
rlim(rlim_range)

subplot(2,3,5);
% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Create the polar histogram
l(5)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_opto75_avg);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
title('Saccade direction US+opto75');
rlim(rlim_range)

subplot(2,3,6);
% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Create the polar histogram
l(6)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_opto100_avg);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
title('Saccade direction US+opto100');
rlim(rlim_range)


% Save figure
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_counts%.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_counts%.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_counts%.jpg')
saveas(gcf,figname,'jpg')

%%

figure;

% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Create the polar histogram
l(1)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_US_avg/sum(G.counts_US_avg)*100);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
%     title('Saccade direction US');
rlim(rlim_range)

% Save figure
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_US.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_US.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_US.jpg')
saveas(gcf,figname,'jpg')

% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

figure;
% Create the polar histogram
l(2)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_opto0_avg/sum(G.counts_opto0_avg)*100);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
%     title('Saccade direction US+opto0');
rlim(rlim_range)


% First, Declare A 'polaraxes' Object & Return Its Handle
% Define bin edges for 8 equal quadrants (0 to 2π)
edges = linspace(0, 2*pi, 9); % 9 edges → 8 bins

% Save figure
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_opto0.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_opto0.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_opto0.jpg')
saveas(gcf,figname,'jpg')

figure;
% Create the polar histogram
l(3)=polarhistogram('BinEdges', edges, 'BinCounts', G.counts_opto50_avg/sum(G.counts_opto50_avg)*100);

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
%     title('Saccade direction US+opto25');
rlim(rlim_range)

figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_opto50.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_opto50.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_groupAVG_Ctrl_saccadeDirectionPolarplots_opto50.jpg')
saveas(gcf,figname,'jpg')



%% US
% linspace(22.5, 315, 8);
figure;
theta = [linspace(pi/8, 2*pi-(pi/8), 8) pi/8];
rho = [G.counts_US_avg G.counts_US_avg(1)];
err = [G.counts_US_sem G.counts_US_sem(1)]; % Symmetric error magnitude

% 1. Plot the main data points
pax = polaraxes; % Get current polar axes
polarplot(theta, rho, 'k-', 'LineWidth', 1); % Plot data as blue circles with a line
hold on;

% 2. Manually draw error bars for each point
for i = 1:length(theta)
    % Calculate the start and end points of the error bar in polar coordinates
    rho_upper = rho(i) + err(i);
    rho_lower = rho(i) - err(i);

    % Use 'polarplot' to draw a single vertical line (at the same theta)
    % Note: The 'polarplot' interprets input as polar coordinates directly.
    polarplot([theta(i), theta(i)], [rho_lower, rho_upper], 'k-', 'LineWidth', 1); % Black line for error bar
end

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
%     title('Saccade direction US+opto25');
%    rlim(rlim_range)
hold on;

%% opto0
theta = [linspace(pi/8, 2*pi-(pi/8), 8) pi/8];
rho = [G.counts_opto0_avg G.counts_opto0_avg(1)];
err = [G.counts_opto0_sem G.counts_opto0_sem(1)]; % Symmetric error magnitude

% 1. Plot the main data points
% pax = polaraxes; % Get current polar axes
polarplot(theta, rho, 'b-', 'LineWidth', 1); % Plot data as blue circles with a line
hold on;

% 2. Manually draw error bars for each point
for i = 1:length(theta)
    % Calculate the start and end points of the error bar in polar coordinates
    rho_upper = rho(i) + err(i);
    rho_lower = rho(i) - err(i);

    % Use 'polarplot' to draw a single vertical line (at the same theta)
    % Note: The 'polarplot' interprets input as polar coordinates directly.
    polarplot([theta(i), theta(i)], [rho_lower, rho_upper], 'b-', 'LineWidth', 1); % Black line for error bar
end

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
%     title('Saccade direction US+opto25');
%    rlim(rlim_range)


figname = sprintf('D2_groupAVG_Ctrl_saccadeerrorbarPolarplots_USvsOpto0.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_groupAVG_Ctrl_saccadeerrorbarPolarplots_USvsOpto0.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_groupAVG_Ctrl_saccadeerrorbarPolarplots_USvsOpto0.jpg')
saveas(gcf,figname,'jpg')


%% US
% linspace(22.5, 315, 8);
figure;
theta = [linspace(pi/8, 2*pi-(pi/8), 8) pi/8];
rho = [G.counts_US_avg G.counts_US_avg(1)];
err = [G.counts_US_sem G.counts_US_sem(1)]; % Symmetric error magnitude

% 1. Plot the main data points
pax = polaraxes; % Get current polar axes
polarplot(theta, rho, 'k-', 'LineWidth', 1); % Plot data as blue circles with a line
hold on;

% 2. Manually draw error bars for each point
for i = 1:length(theta)
    % Calculate the start and end points of the error bar in polar coordinates
    rho_upper = rho(i) + err(i);
    rho_lower = rho(i) - err(i);

    % Use 'polarplot' to draw a single vertical line (at the same theta)
    % Note: The 'polarplot' interprets input as polar coordinates directly.
    polarplot([theta(i), theta(i)], [rho_lower, rho_upper], 'k-', 'LineWidth', 1); % Black line for error bar
end

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
%     title('Saccade direction US+opto25');
%    rlim(rlim_range)
hold on;

%% opto50
theta = [linspace(pi/8, 2*pi-(pi/8), 8) pi/8];
rho = [G.counts_opto50_avg G.counts_opto50_avg(1)];
err = [G.counts_opto50_sem G.counts_opto50_sem(1)]; % Symmetric error magnitude

% 1. Plot the main data points
% pax = polaraxes; % Get current polar axes
polarplot(theta, rho, 'b-', 'LineWidth', 1); % Plot data as blue circles with a line
hold on;

% 2. Manually draw error bars for each point
for i = 1:length(theta)
    % Calculate the start and end points of the error bar in polar coordinates
    rho_upper = rho(i) + err(i);
    rho_lower = rho(i) - err(i);

    % Use 'polarplot' to draw a single vertical line (at the same theta)
    % Note: The 'polarplot' interprets input as polar coordinates directly.
    polarplot([theta(i), theta(i)], [rho_lower, rho_upper], 'b-', 'LineWidth', 1); % Black line for error bar
end

set(gca,'ThetaTick',     [0:90:270], ...
    'ThetaTickLabel',{'Nasal','Up','Temporal','Down'});
%     title('Saccade direction US+opto25');
%    rlim(rlim_range)

figname = sprintf('D2_groupAVG_Ctrl_saccadeerrorbarPolarplots_USvsOpto50.fig')
saveas(gcf,figname,'fig');
figname = sprintf('D2_groupAVG_Ctrl_saccadeerrorbarPolarplots_USvsOpto50.pdf')
print('-dpdf','-vector','-loose',figname)
figname = sprintf('D2_groupAVG_Ctrl_saccadeerrorbarPolarplots_USvsOpto50.jpg')
saveas(gcf,figname,'jpg')

