%% Convert NBDfiles into .avi movie files
clear all; close all;
for gg=1:25

    close all;
    clearvars -except gg
    % Define parameters
    path = ''; % Define the path to the root folder
    %     path = 'D:\videorecs_eyeblink\'; % Define the path to the root folder
    if gg==1
        folder = '974_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==2
        folder = '975_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==3
        folder = '976_D2'; % Name of the folder
        startpeak= 1198;% Define the x value of the first peak in the first derivative
        secondpeak= 1518;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==4
        folder = '977_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==5
        folder = '978_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==6
        folder = '973_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==7
        folder = '1007_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==8
        folder = '1008_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==9
        folder = '1009_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==10
        folder = '1010_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==11
        folder = '1011_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==12
        folder = '1012_D1'; % Name of the folder
        startpeak= 814;% Define the x value of the first peak in the first derivative
        secondpeak= 1006;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==13
        folder = '1013_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==14
        folder = '1014_D1'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==15
        folder = '1015_D1'; % Name of the folder
        startpeak= 1198;% Define the x value of the first peak in the first derivative
        secondpeak= 1518;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==16
        folder = '1007_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==17
        folder = '1008_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==18
        folder = '1009_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==19
        folder = '1010_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==20
        folder = '1011_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==21
        folder = '1012_D2'; % Name of the folder
        startpeak= 814;% Define the x value of the first peak in the first derivative
        secondpeak= 1006;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==22
        folder = '1013_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==23
        folder = '1014_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.
    elseif gg==24
        folder = '1015_D2'; % Name of the folder
        startpeak= 1006;% Define the x value of the first peak in the first derivative
        secondpeak= 1262;% Define the x value of the second peak in the first derivative. Restart the script afterward.

    end

    cd([path folder])

    % List the session
    session = dir;
    session = session(3).name;
    cd([path folder '\' session])

    % List the block
    block = dir;
    blocklist={};
    for ii=1:size(block,1)-2
        blocklist{ii} = block(2+ii).name;
    end

    % For each block, list the trials
    triallist={};
    for ii=1:size(blocklist,2)
        cd([path folder '\' session '\' blocklist{ii}])
        trial = dir;

        for jj=1:size(trial,1)-2
            triallist{ii,jj} = trial(2+jj).name;
        end
    end

    %% Run the conversion script for each trial
    %     for ii=4 % Loop through all blocks
    for ii=1:size(blocklist,2) % Loop through all blocks
        for jj=1:size(triallist,2) % Loop through all trials %%%%%%%%%%%% Modified
            %                     for jj=1:3 % Loop through all trials
            cd([path folder '\' session '\' blocklist{ii} '\' triallist{ii,jj}])
            nbd = dir;
            nbdlist={};
            for zz=1:size(nbd,1)-2
                nbdlist{zz} = nbd(2+zz).name;
            end
            fileNums=numel(nbdlist);
            bits_img=[];
            h(1)=figure;
            int = secondpeak-startpeak; % interval between peaks. Don't modify.

            for xx=1:fileNums
                % Load the NBD file
                fileName = nbdlist{xx};
                h = fopen(fileName);
                bits = fread(h);

                %                                 if ii==1 && jj==1 && xx==1 % Visualize the signal only on the first block/trial/file
                %                                     h(2)= figure; ax(1)=subplot(2,1,1); plot(bits); ax(2)=subplot(2,1,2); plot(diff(bits)); linkaxes([ax(1) ax(2)],'xy'); % Plot the peak figure for detection
                %                                     pause; % Detect the x-values of the first two peaks and define those values above
                %                                     close all;
                %                                 end

                %Process the data
                stop=length(bits);
                bits_res=[];
                for cc=1:(floor((stop-startpeak)/int)) % Build the image matrix
                    bits_res(cc,:)=bits((((int*cc)+startpeak)-int):((int*cc)+startpeak));
                end

                %                 if ii==1 && jj==1 && xx==1 % Visualize the eye only on the first block/trial/file - check whether the image looks good
                %                     figure;
                %                     imagesc(bits_res)
                %                     colormap(gray(256))
                %                     pause;
                %                 end

                %             imagesc(bits_res)
                %             colormap(gray(256))
                bits_img(:,:,xx)=bits_res;
                fclose('all');
            end
            %% Create a movie of each trial
            cd([path folder])

            if ~exist('videos', 'dir') % make a directory in which to save the videos
                mkdir('videos')
            end
            cd([path folder '\videos'])
            v=VideoWriter(sprintf('%s_%s_%s_%s.avi',folder,session,blocklist{ii},triallist{ii,jj}));
            % ROI_mask = [399 741 78 323];
            v.FrameRate = 320;
            open(v);
            for ll = 1:fileNums
                sprintf('Creating: %s_%s_%s_%s.avi. processing: %.f / %.f',folder,session,blocklist{ii},triallist{ii,jj},ll,fileNums)
                ax1 = axes;
                hFig = gcf;
                hFig.WindowState = 'maximized';
                im = imagesc(ax1,bits_img(:,:,ll));
                im.AlphaData = 1; % change this value to change the background image transparency
                axis off;
                colormap(ax1,gray(256))
                frame = getframe(gcf);
                writeVideo(v,frame);
                close(gcf)
            end
            close(v);
            close all;
        end
    end
end
