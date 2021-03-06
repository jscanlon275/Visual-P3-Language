clear all
close all

% Mandarin speaking participants

exp = 'VisLanguage_P3';
subs = {'021' '022' '023' '024' '025' '026' '027' '028' '029' };
%300ms group: '001' '002' '003' '004' 
%100ms group:  '002'  '003' '004' '005' '006' 
% subs = {'001'}
%condition order

nsubs = length(subs);
conds = {'Video'};
condnames = {'Video'};

nconds = length(conds);
Pathname = 'M:\Data\Visual P3 Language\';
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
electrode_loc = 'M:\Analysis\ElectrodeLocs\EOG-electrode-locs.ced';
% elec_names = {EEG.chanlocs(:).labels};

for i_sub = 1:nsubs
        for i_cond = 1:nconds;
        Filename = [subs{i_sub} '_' exp '_' conds{i_cond}];
        
      EEG = pop_loadset('filename',[Filename '_Corrected_Target.set'],'filepath',[Pathname 'Segments\']);
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
        
               num_devs(i_sub, i_cond) = EEG.trials

      EEG = pop_loadset('filename',[Filename '_Corrected_Standard.set'],'filepath',[Pathname 'Segments\']);
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
        
              num_stands(i_sub, i_cond) = EEG.trials
              
      EEG = pop_loadset('filename',[Filename '_Corrected_Bowl.set'],'filepath',[Pathname 'Segments\']);
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
      
               num_bowls(i_sub, i_cond) = EEG.trials
      
        
%         EEG = pop_loadset('filename',[Filename '_Silent_Corrected_Target.set'],'filepath',[Pathname 'Segments\']);
%         [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
%       EEG = pop_loadset('filename',[Filename '_Silent_Corrected_Standard.set'],'filepath',[Pathname 'Segments\']);
%         [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
   end      
end
eeglab redraw

%compute grand average Erps
npersub = nconds*2;
% 
% [erp1aw, erp2aw, diffaw] = pop_comperp( ALLEEG, 1, [1:npersub:i_sub*i_cond*2] ,[2:npersub:i_sub*i_cond*2],'addavg','on','addstd','off','subavg','on','diffavg','off','diffstd','off','tplotopt',{'ydir' -1});
% [erp1pw, erp2pw, diffpw] = pop_comperp( ALLEEG, 1, [3:npersub:i_sub*i_cond*2] ,[4:npersub:i_sub*i_cond*2],'addavg','on','addstd','off','subavg','on','diffavg','off','diffstd','off','tplotopt',{'ydir' -1});
% [erp1ad, erp2ad, diffad, time] = pop_comperp( ALLEEG, 1, [5:npersub:i_sub*i_cond*2] ,[6:npersub:i_sub*i_cond*2],'addavg','on','addstd','off','subavg','on','diffavg','off','diffstd','off','tplotopt',{'ydir' -1});

%subject erps
erp_out = [];
for i_sub = 1:nsubs
    for i_cond = 1:nconds
        erp_out_man(:,1,:,i_cond,i_sub) = mean(     ALLEEG( 1 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data         ,3)'; %targets
        erp_out_man(:,2,:,i_cond,i_sub) = mean(     ALLEEG( 2 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data         ,3)'; %standrads
        erp_out_man(:,3,:,i_cond,i_sub) = mean(     ALLEEG( 3 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data         ,3)'; %bowl

        disp( [ '# Target Trials: ' num2str(size(ALLEEG( 1 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data,3)) ' # Standard Trials: ' num2str(size(ALLEEG( 2 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data,3))...
           ' # Bowl Trials: ' num2str(size(ALLEEG( 3 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data,3)) ] )
    end
end
erp_diff_out_man = squeeze(erp_out_man(:,1,:,:,:)-erp_out_man(:,2,:,:,:)); 
erp_diff_out2_man = squeeze(erp_out_man(:,3,:,:,:)-erp_out_man(:,2,:,:,:)); 
%% English speaking participants
clear ALLEEG

exp = 'VisLanguage_P3';
subs = { '002'  '003' '004' '005' '006' '008' '009' '010' '011' '012' '013' '014' '015' '016'};
%300ms group: '001' '002' '003' '004' 
%100ms group:  '002'  '003' '004' '005' '006' 
% subs = {'001'}
%condition order

nsubs = length(subs);
conds = {'Video'};
condnames = {'Video'};

nconds = length(conds);
Pathname = 'M:\Data\Visual P3 Language\';
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
electrode_loc = 'M:\Analysis\ElectrodeLocs\EOG-electrode-locs.ced';
% elec_names = {EEG.chanlocs(:).labels};

for i_sub = 1:nsubs
        for i_cond = 1:nconds;
        Filename = [subs{i_sub} '_' exp '_' conds{i_cond}];
        
      EEG = pop_loadset('filename',[Filename '_Corrected_Target.set'],'filepath',[Pathname 'Segments\']);
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
        
               num_devs(i_sub, i_cond) = EEG.trials

      EEG = pop_loadset('filename',[Filename '_Corrected_Standard.set'],'filepath',[Pathname 'Segments\']);
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
        
              num_stands(i_sub, i_cond) = EEG.trials
              
      EEG = pop_loadset('filename',[Filename '_Corrected_Bowl.set'],'filepath',[Pathname 'Segments\']);
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
      
               num_bowls(i_sub, i_cond) = EEG.trials
      
        
%         EEG = pop_loadset('filename',[Filename '_Silent_Corrected_Target.set'],'filepath',[Pathname 'Segments\']);
%         [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
%       EEG = pop_loadset('filename',[Filename '_Silent_Corrected_Standard.set'],'filepath',[Pathname 'Segments\']);
%         [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
   end      
end
eeglab redraw

%compute grand average Erps
npersub = nconds*2;
% 
% [erp1aw, erp2aw, diffaw] = pop_comperp( ALLEEG, 1, [1:npersub:i_sub*i_cond*2] ,[2:npersub:i_sub*i_cond*2],'addavg','on','addstd','off','subavg','on','diffavg','off','diffstd','off','tplotopt',{'ydir' -1});
% [erp1pw, erp2pw, diffpw] = pop_comperp( ALLEEG, 1, [3:npersub:i_sub*i_cond*2] ,[4:npersub:i_sub*i_cond*2],'addavg','on','addstd','off','subavg','on','diffavg','off','diffstd','off','tplotopt',{'ydir' -1});
% [erp1ad, erp2ad, diffad, time] = pop_comperp( ALLEEG, 1, [5:npersub:i_sub*i_cond*2] ,[6:npersub:i_sub*i_cond*2],'addavg','on','addstd','off','subavg','on','diffavg','off','diffstd','off','tplotopt',{'ydir' -1});

%subject erps
erp_out = [];
for i_sub = 1:nsubs
    for i_cond = 1:nconds
        erp_out_eng(:,1,:,i_cond,i_sub) = mean(     ALLEEG( 1 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data         ,3)'; %targets
        erp_out_eng(:,2,:,i_cond,i_sub) = mean(     ALLEEG( 2 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data         ,3)'; %standrads
        erp_out_eng(:,3,:,i_cond,i_sub) = mean(     ALLEEG( 3 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data         ,3)'; %standrads

        disp( [ '# Target Trials: ' num2str(size(ALLEEG( 1 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data,3)) ' # Standard Trials: ' num2str(size(ALLEEG( 2 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data,3))...
           ' # Bowl Trials: ' num2str(size(ALLEEG( 3 + 3*((i_sub-1)*nconds + (i_cond-1)) ).data,3)) ] )
    end
end
erp_diff_out_eng = squeeze(erp_out_eng(:,1,:,:,:)-erp_out_eng(:,2,:,:,:)); 
erp_diff_out2_eng = squeeze(erp_out_eng(:,3,:,:,:)-erp_out_eng(:,2,:,:,:)); 
    
%% grand average plots + difference


figure('Color',[1 1 1]); 
electrode = 1;

for i_cond = 1:nconds
    switch i_cond
        case 1
            colour = 'g';
        case 2
            colour = 'b';
        case 3
            colour = 'r';
 
    end
    
    subplot(2,2,1);
        Targetmeans = squeeze(mean(erp_out_man(:,1,electrode,i_cond,:),5));
        Targetstds = squeeze(           std(erp_out_man(:,1,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
        Standardmeans = squeeze(mean    (erp_out_man  (:,2,electrode,i_cond,:)   ,5));
        Standardstds = squeeze(std(erp_out_man(:,2,electrode,i_cond,:),[],5))./sqrt(nsubs);
         Bowlmeans = squeeze(mean(erp_out_man(:,3,electrode,i_cond,:),5));
        Bowlstds = squeeze(           std(erp_out_man(:,3,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
   h =     boundedline(  EEG.times , Targetmeans , Targetstds , 'g', EEG.times , Standardmeans , Standardstds , 'k',  ...
            EEG.times , Bowlmeans , Bowlstds , 'r' );
%
        set(gca,'Color',[1 1 1]);
%         set(gca,'YDir','reverse');
% line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [150 150], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [400 400], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
% line('XData', [600 600], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');

        if i_cond == 1
            legend({'Deviants', 'Standards', 'Bowl'},'Location','SouthEast');
%             text( -6, 12, 'P3(400-600ms) labelled')
        end
        DRN =  fill([145 180 180 145],[-7 -7 15 15],'y') ; 
     set(DRN,'edgecolor','none');
 uistack(DRN,'bottom'); 
         MMN =  fill([250 350 350 250],[-7 -7 15 15],'y') ; 
     set(MMN,'edgecolor','none');
 uistack(MMN,'bottom');
set(DRN,'edgecolor','none');
 uistack(DRN,'bottom'); 
 
p3 =  fill([400 500 500 400],[-7 -7 15 15],'y') ; 
set(p3,'edgecolor','none');
 uistack(p3,'bottom'); 
        axis tight; ylim([-10 20]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-7 15],'color','k');
        title('Language P3 Mandarin speakers (at O2)');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');
        set(gca,'LineWidth',2.0); 
        set(h,'LineWidth',3.0); 

    subplot(2,2,3);
    %add condition back in later!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     Diffmeans = squeeze(mean(erp_diff_out_man(:,electrode,:),3));
        Diffstds = squeeze(std(erp_diff_out_man(:,electrode,:),[],3) )./sqrt(nsubs);
     Diffmeans2 = squeeze(mean(erp_diff_out2_man(:,electrode,:),3));
        Diffstds2 = squeeze(std(erp_diff_out2_man(:,electrode,:),[],3) )./sqrt(nsubs);
        
    h =    boundedline(EEG.times , Diffmeans , Diffstds , 'g', EEG.times , Diffmeans2 , Diffstds2 , 'r');        
        set(gca,'Color',[1 1 1]);
     %  set(gca,'YDir','reverse'); 
% line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [150 150], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [400 400], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
% line('XData', [600 600], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');

        if i_cond == 1
            legend('Deviants-Standards', 'Bowl-Standards','Location','SouthEast'); 
        end
        DRN =  fill([145 180 180 145],[-7 -7 15 15],'y') ; 
     set(DRN,'edgecolor','none');
 uistack(DRN,'bottom'); 
        MMN =  fill([250 350 350 250],[-7 -7 15 15],'y') ; 
     set(MMN,'edgecolor','none');
 uistack(MMN,'bottom');

p3 =  fill([400 500 500 400],[-7 -7 15 15],'y') ; 
set(p3,'edgecolor','none');
 uistack(p3,'bottom'); 
        axis tight; ylim([-10 20]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-7 15],'color','k');
        title('Language P3');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');
        set(gca,'LineWidth',2.0); 
        set(h,'LineWidth',3.0); 

end
% grand average plots + difference
% Right side-up plots
% erp_diff_out = squeeze(erp_out(:,1,:,:,:)-erp_out(:,2,:,:,:)); 
% erp_diff_out2 = squeeze(erp_out(:,3,:,:,:)-erp_out(:,2,:,:,:)); 

% figure('Color',[1 1 1]); 
electrode = 7;

for i_cond = 1:nconds
    switch i_cond
        case 1
            colour = 'g';
        case 2
            colour = 'b';
         case 3
            colour = 'r';
 
    end
    
    subplot(2,2,2);
        Targetmeans = squeeze(mean(erp_out_eng(:,1,electrode,i_cond,:),5));
        Targetstds = squeeze(           std(erp_out_eng(:,1,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
        Standardmeans = squeeze(mean    (erp_out_eng  (:,2,electrode,i_cond,:)   ,5));
        Standardstds = squeeze(std(erp_out_eng(:,2,electrode,i_cond,:),[],5))./sqrt(nsubs);
         Bowlmeans = squeeze(mean(erp_out_eng(:,3,electrode,i_cond,:),5));
        Bowlstds = squeeze(           std(erp_out_eng(:,3,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
   h =     boundedline(  EEG.times , Targetmeans , Targetstds , 'g', EEG.times , Standardmeans , Standardstds , 'k' ,  ...
           EEG.times , Bowlmeans , Bowlstds , 'r' );
%
        set(gca,'Color',[1 1 1]);
%         set(gca,'YDir','reverse');
% line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [150 150], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [400 400], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
% line('XData', [600 600], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');

        if i_cond == 1
            legend({'Deviants', 'Standards', 'Bowl'},'Location','SouthEast');
%             text( -6, 12, 'P3(400-600ms) labelled')
        end
         DRN =  fill([145 180 180 145],[-7 -7 15 15],'y') ; 
 set(DRN,'edgecolor','none');
  uistack(DRN,'bottom'); 
  MMN =  fill([250 350 350 250],[-7 -7 15 15],'y') ; 
     set(MMN,'edgecolor','none');
 uistack(MMN,'bottom');
p3 =  fill([400 500 500 400],[-7 -7 15 15],'y') ; 
set(p3,'edgecolor','none');
 uistack(p3,'bottom'); 
        axis tight; ylim([-10 20]);
    L1 =    line([-200 1000],[0 0],'color','k');
    L2 =    line([0 0],[-7 9.25],'color','k');
        title('Language P3 English speakers');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');
        set(gca,'LineWidth',2.0); 
        set(h,'LineWidth',3.0); 
         set(L1,'LineWidth',2.0); 
        set(L2,'LineWidth',2.0); 

    subplot(2,2,4);
    %add condition back in later!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     Diffmeans = squeeze(mean(erp_diff_out_eng(:,electrode,:),3));
        Diffstds = squeeze(std(erp_diff_out_eng(:,electrode,:),[],3) )./sqrt(nsubs);
     Diffmeans2 = squeeze(mean(erp_diff_out2_eng(:,electrode,:),3));
        Diffstds2 = squeeze(std(erp_diff_out2_eng(:,electrode,:),[],3) )./sqrt(nsubs);
        
    h =    boundedline(EEG.times , Diffmeans , Diffstds , 'g', EEG.times , Diffmeans2 , Diffstds2 , 'r');        
        set(gca,'Color',[1 1 1]);
%         set(gca,'YDir','reverse'); 
% line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [150 150], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
% line('XData', [400 400], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
% line('XData', [600 600], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');

        if i_cond == 1
            legend('Deviants-Standards', 'Bowl-Standards','Location','SouthEast'); 
        end
         DRN =  fill([145 180 180 145],[-7 -7 15 15],'y') ; 
 set(DRN,'edgecolor','none');
  uistack(DRN,'bottom'); 
   MMN =  fill([250 350 350 250],[-7 -7 15 15],'y') ; 
     set(MMN,'edgecolor','none');
 uistack(MMN,'bottom');
p3 =  fill([400 500 500 400],[-7 -7 15 15],'y') ; 
set(p3,'edgecolor','none');
 uistack(p3,'bottom'); 
        axis tight; ylim([-10 20]);
      L1 =  line([-200 1000],[0 0],'color','k');
      L2 = line([0 0],[-7 15],'color','k');
        title('Language P3');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');
        set(gca,'LineWidth',2.0); 
        set(h,'LineWidth',3.0); 
        set(L1,'LineWidth',2.0); 
        set(L2,'LineWidth',2.0); 

end

%% Bargraphs
 %% Bargraphs - Mandarin MMN
%erp_out(time_window,standard/target,electrode,cond,sub)
% barweb(barvalues, errors, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type)
elecs = [7 15]
figure('Color',[1 1 1]);
% stim = 2
time_window = find(EEG.times>180,1)-1:find(EEG.times>250,1)-2;

for i_elec = 1:length(elecs)
 electrode = elecs(i_elec);
labels = 'Deviant    Standard    Bowl';

subplot(2,2,2*(i_elec-1) +1);
standmeans = [ squeeze(mean(erp_out_man(time_window,1,electrode,1,:))) squeeze(mean(erp_out_man(time_window,2,electrode,1,:)))  squeeze(mean(erp_out_man(time_window,3,electrode,1,:))) ];

set(gca,'Color',[1 1 1]);
%ylim([-2 2])
handles = barweb(mean(standmeans), std(standmeans)./sqrt(nsubs), 0.85, [], [], labels, 'Amplitude', jet ) 
% 
if electrode == 1
%  ylim([0 3]); 
 title('Mandarin Speakers P3 (400-500) at O1');
 h_leg = legend('Deviant',  'Standard', 'Bowl');

elseif electrode == 15
%     ylim([-2.5 0]); 
    title('Mandarin Speakers at O2');
else 
%     ylim([-2 3]);
end
 text( 4, 2, 'Mandarin MMN')
%      
ylim([-3 20])
end 
%
 % Bargraphs - English MMN
%erp_out(time_window,standard/target,electrode,cond,sub)
% barweb(barvalues, errors, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type)
% elecs = [15 1]
%figure('Color',[1 1 1]);
% stim = 2
for i_elec = 1:length(elecs)
% time_window = find(EEG.times>250,1)-1:find(EEG.times>350,1)-2;
 electrode = elecs(i_elec);
labels = 'Deviant    Standard    Bowl';

subplot(2,2,2*(i_elec-1) +2);
standmeans = [ squeeze(mean(erp_out_eng(time_window,1,electrode,1,:))) squeeze(mean(erp_out_eng(time_window,2,electrode,1,:)))  squeeze(mean(erp_out_eng(time_window,3,electrode,1,:))) ];

set(gca,'Color',[1 1 1]);
%ylim([-2 2])
handles = barweb(mean(standmeans), std(standmeans)./sqrt(nsubs), 0.85, [], [], labels, 'Amplitude', jet ) 
% 
if electrode == 1
%  ylim([0 3]); 
 title('English Speakers P3 (400-500) at O1');
 h_leg = legend('Deviant',  'Standard', 'Bowl');

elseif electrode == 15
%     ylim([-2.5 0]); 
    title('English Speakers at O2');
else 
%     ylim([-2 3]);
end
 text( 4, 2, 'Mandarin MMN')
%      
ylim([-3 20])
end 

    
    
    
    


        %=======================================================================================================================
        %% Within STimulus comparisons
figure('Color',[1 1 1]);
subplot(2,2,1);
        electrode = 8;
        boundedline(EEG.times,squeeze(mean(erp_out(:,2,electrode,1,:),5)), squeeze(std(erp_out(:,2,electrode,1,:),[],5))./sqrt(nsubs),'g',...
                    EEG.times,squeeze(mean(erp_out(:,2,electrode,2,:),5)), squeeze(std(erp_out(:,2,electrode,2,:),[],5))./sqrt(nsubs),'b')%,... 
                   %  EEG.times,squeeze(mean(erp_out(:,2,electrode,3,:),5)), squeeze(std(erp_out(:,2,electrode,3,:),[],5))./sqrt(nsubs),'r');
               set(gca,'Color',[1 1 1]);
        set(gca,'YDir','reverse'); 

        legend('Video','Static','Location','SouthEast'); 
%         line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
%         line('XData', [150 150], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
        line('XData', [140 140], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        line('XData', [210 210], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        
        axis tight; ylim([-7 9.29]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-7 9.25],'color','k');
        title('Standards - Fz');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');     
subplot(2,2,2);
        electrode = 9;
        boundedline(EEG.times,squeeze(mean(erp_out(:,1,electrode,1,:),5)), squeeze(std(erp_out(:,1,electrode,1,:),[],5))./sqrt(nsubs),'g',...
                    EEG.times,squeeze(mean(erp_out(:,1,electrode,2,:),5)), squeeze(std(erp_out(:,1,electrode,2,:),[],5))./sqrt(nsubs),'b')%,... 
                 %    EEG.times,squeeze(mean(erp_out(:,1,electrode,3,:),5)), squeeze(std(erp_out(:,1,electrode,3,:),[],5))./sqrt(nsubs),'r');
               set(gca,'Color',[1 1 1]);
        set(gca,'YDir','reverse'); 

        legend('Video','Static','Location','SouthEast'); 
%       line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
%         line('XData', [150 150], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
        line('XData', [140 140], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        line('XData', [210 210], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        
        axis tight; ylim([-7 9.25]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-7 9.25],'color','k');
        title('Targets - Fz');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');  
subplot(2,2,3);
        electrode = 7;
        boundedline(EEG.times,squeeze(mean(erp_out(:,2,electrode,1,:),5)), squeeze(std(erp_out(:,2,electrode,1,:),[],5))./sqrt(nsubs),'g',...
                    EEG.times,squeeze(mean(erp_out(:,2,electrode,2,:),5)), squeeze(std(erp_out(:,2,electrode,2,:),[],5))./sqrt(nsubs),'b')%,...
                  %   EEG.times,squeeze(mean(erp_out(:,2,electrode,3,:),5)), squeeze(std(erp_out(:,2,electrode,3,:),[],5))./sqrt(nsubs),'r');
               set(gca,'Color',[1 1 1]);
        set(gca,'YDir','reverse'); 

        legend('Video','Static','Location','SouthEast'); 
%         line('XData', [100 100], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
%         line('XData', [150 150], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
        line('XData', [400 400], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        line('XData', [600 600], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        
        axis tight; ylim([-7 20]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-7 9.25],'color','k');
        title('Standards - Pz');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');     
subplot(2,2,4);
        electrode = 7;
        boundedline(EEG.times,squeeze(mean(erp_out(:,1,electrode,1,:),5)), squeeze(std(erp_out(:,1,electrode,1,:),[],5))./sqrt(nsubs),'g',...
                    EEG.times,squeeze(mean(erp_out(:,1,electrode,2,:),5)), squeeze(std(erp_out(:,1,electrode,2,:),[],5))./sqrt(nsubs),'b')%,...
                   %  EEG.times,squeeze(mean(erp_out(:,1,electrode,3,:),5)), squeeze(std(erp_out(:,1,electrode,3,:),[],5))./sqrt(nsubs),'r');
               set(gca,'Color',[1 1 1]);
        set(gca,'YDir','reverse'); 

        legend('Video','Static','Location','SouthEast'); 
%         line('XData', [100 100], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
%         line('XData', [150 150], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r')
        line('XData', [400 400], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        line('XData', [600 600], 'YData', [15 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m')
        
        axis tight; ylim([-7 20]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-7 9.25],'color','k');
        title('Targets - Pz');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)'); 


  %% Differencetopographys
  erp_diff_out = squeeze(erp_out(:,1,:,:,:)-erp_out(:,2,:,:,:)); 
erp_diff_out2 = squeeze(erp_out(:,3,:,:,:)-erp_out(:,2,:,:,:)); 
 % difference topographys P3
  Targetmeans = squeeze(mean(erp_out(:,1,electrode,i_cond,:),5));
        Targetstds = squeeze(           std(erp_out(:,1,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
        Standardmeans = squeeze(mean    (erp_out  (:,2,electrode,i_cond,:)   ,5));
        Standardstds = squeeze(std(erp_out(:,2,electrode,i_cond,:),[],5))./sqrt(nsubs);
         Bowlmeans = squeeze(mean(erp_out(:,3,electrode,i_cond,:),5));
        Bowlstds = squeeze(           std(erp_out(:,3,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
time_window = find(EEG.times>145,1)-1:find(EEG.times>180,1)-2;
figure('Color',[1 1 1]);
suptitle('DRN (145-180ms)')

for i_cond = 1:nconds
    subplot(1,2,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out2(time_window,:,:),3),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title( ' Difference (Bowl-Standards)');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        if i_cond == 1
%text( 2, -1, 'DRN (145-180ms) Difference (Bowl-Standards)')
        end
end


for i_cond = 1:nconds
    subplot(1,2,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,:),3),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title(' Difference (Deviants-Standards)');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        if i_cond == 1
%text( 2, -1, 'DRN (145-180ms) Difference (Deviants-Standards)')
        end
end

  %% Differencetopographys
  erp_diff_out = squeeze(erp_out(:,1,:,:,:)-erp_out(:,2,:,:,:)); 
erp_diff_out2 = squeeze(erp_out(:,3,:,:,:)-erp_out(:,2,:,:,:)); 
 % difference topographys P3
  Targetmeans = squeeze(mean(erp_out(:,1,electrode,i_cond,:),5));
        Targetstds = squeeze(           std(erp_out(:,1,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
        Standardmeans = squeeze(mean    (erp_out  (:,2,electrode,i_cond,:)   ,5));
        Standardstds = squeeze(std(erp_out(:,2,electrode,i_cond,:),[],5))./sqrt(nsubs);
         Bowlmeans = squeeze(mean(erp_out(:,3,electrode,i_cond,:),5));
        Bowlstds = squeeze(           std(erp_out(:,3,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
time_window = find(EEG.times>400,1)-1:find(EEG.times>600,1)-2;
figure('Color',[1 1 1]);
suptitle('P3 (400-600ms)')

for i_cond = 1:nconds
    subplot(1,2,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out2(time_window,:,:),3),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-10 10]  )
        title( ' Difference (Bowl-Standards)');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        if i_cond == 1
%text( 2, -1, 'DRN (145-180ms) Difference (Bowl-Standards)')
        end
end


for i_cond = 1:nconds
    subplot(1,2,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,:),3),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-10 10]  )
        title(' Difference (Deviants-Standards)');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        if i_cond == 1
%text( 2, -1, 'DRN (145-180ms) Difference (Deviants-Standards)')
        end
end

 %% Differencetopographys
  erp_diff_out = squeeze(erp_out(:,1,:,:,:)-erp_out(:,2,:,:,:)); 
erp_diff_out2 = squeeze(erp_out(:,3,:,:,:)-erp_out(:,2,:,:,:)); 
 % difference topographys P3
  Targetmeans = squeeze(mean(erp_out(:,1,electrode,i_cond,:),5));
        Targetstds = squeeze(           std(erp_out(:,1,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
        Standardmeans = squeeze(mean    (erp_out  (:,2,electrode,i_cond,:)   ,5));
        Standardstds = squeeze(std(erp_out(:,2,electrode,i_cond,:),[],5))./sqrt(nsubs);
         Bowlmeans = squeeze(mean(erp_out(:,3,electrode,i_cond,:),5));
        Bowlstds = squeeze(           std(erp_out(:,3,electrode,i_cond,:),[],5)            )./sqrt(nsubs);
time_window = find(EEG.times>175,1)-1:find(EEG.times>275,1)-2;
figure('Color',[1 1 1]);
suptitle('MMN (175-275ms)')

for i_cond = 1:nconds
    subplot(1,2,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out2(time_window,:,:),3),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title( ' Difference (Bowl-Standards)');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        if i_cond == 1
%text( 2, -1, 'DRN (145-180ms) Difference (Bowl-Standards)')
        end
end


for i_cond = 1:nconds
    subplot(1,2,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,:),3),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title(' Difference (Deviants-Standards)');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        if i_cond == 1
%text( 2, -1, 'DRN (145-180ms) Difference (Deviants-Standards)')
        end
end
%%
 % difference topographys N1
time_window = find(EEG.times>145,1)-1:find(EEG.times>180,1)-2; %%usually will be 175-275, but here is 150-250 to differentiate from P2
figure('Color',[1 1 1]);
for i_cond = 1:nconds
    subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,i_cond,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
 if i_cond == 1
text( 2, -1, 'N1 (100-175ms) Difference (Targets-Standards)')
        end
end
 % Difference topographys P2
time_window = find(EEG.times>140,1)-1:find(EEG.times>210,1)-2;
figure('Color',[1 1 1]);
for i_cond = 1:nconds
    subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
 if i_cond == 1
text( 2, -1, 'P2 (140-210ms) Difference (Targets-Standards)')
        end
end

% Difference topographys N2
time_window = find(EEG.times>325,1)-1:find(EEG.times>400,1)-2;
figure('Color',[1 1 1]);
for i_cond = 1:nconds
    subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
 if i_cond == 1
text( 2, -1, 'N2 (325-400ms) Difference (Targets-Standards)')
        end
end
%% STANDARDS AND TARGET TOPOS
% topographys P2 
%Standards
%%%Used handles to make these graphs pretty
%look here to see how!! hoe
time_window = find(EEG.times>140,1)-1:find(EEG.times>210,1)-2;
h_f = figure('Color',[1 1 1]);
suptitle('P2 (140-210ms) Standards')
for i_cond = 1:nconds
   
h_topo(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,2,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%set(h_topo(3),'Position',[0.7484,0.1100,0.1566]);

% topographys P2 Targets
time_window = find(EEG.times>140,1)-1:find(EEG.times>210,1)-2;
h_f1 = figure('Color',[1 1 1]);
suptitle('P2 (140-210ms) Targets')
for i_cond = 1:nconds
   
h_topo1(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,1,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%set(h_topo1(4),'Position',[0.7484,0.1100,0.1566,0.8150]);

% P3 Standards
time_window = find(EEG.times>400,1)-1:find(EEG.times>600,1)-2;
h_f = figure('Color',[1 1 1]);
suptitle('P3 (400-600) Standards')
for i_cond = 1:nconds
   
h_topo(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,2,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%set(h_topo(3),'Position',[0.7484,0.1100,0.1566, 0.8150]);

% topographys P3 Targets
time_window = find(EEG.times>400,1)-1:find(EEG.times>6000,1)-2;
h_f1 = figure('Color',[1 1 1]);
suptitle('P3 (400-600) Targets')
for i_cond = 1:nconds
   
h_topo1(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,1,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%set(h_topo1(4),'Position',[0.7484,0.1100,0.1566,0.8150]);

% N1 Standards
time_window = find(EEG.times>100,1)-1:find(EEG.times>175,1)-2;
h_f = figure('Color',[1 1 1]);
suptitle('N1 (100-175) Standards')
for i_cond = 1:nconds
   
h_topo(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,2,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%set(h_topo(3),'Position',[0.7484,0.1100,0.1566, 0.8150]);

% topographys N1 Targets
time_window = find(EEG.times>100,1)-1:find(EEG.times>175,1)-2;
h_f1 = figure('Color',[1 1 1]);
suptitle('N1 (100-175) Targets')
for i_cond = 1:nconds
   
h_topo1(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,1,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');

%

% N1 Standards
time_window = find(EEG.times>325,1)-1:find(EEG.times>400,1)-2;
h_f = figure('Color',[1 1 1]);
suptitle('N2 (325-400ms) Standards')
for i_cond = 1:nconds
   
h_topo(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,2,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%set(h_topo(3),'Position',[0.7484,0.1100,0.1566, 0.8150]);

% topographys N1 Targets
time_window = find(EEG.times>325,1)-1:find(EEG.times>400,1)-2;
h_f1 = figure('Color',[1 1 1]);
suptitle('N2 (325-400ms) Targets')
for i_cond = 1:nconds
   
h_topo1(i_cond) = subplot(1,2,i_cond);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,1,:,i_cond,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(conds{i_cond});
        t = colorbar('peer',gca);

end

set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');

%% Static - Video plot

time_window = find(EEG.times>140,1)-1:find(EEG.times>210,1)-2;
h_f = figure('Color',[1 1 1]);
suptitle('P2 (140-210ms)')
  labels = {'Targets: Static - Video', 'Standards: Static - Video'}
for i_stim = 1:2
  
 h_topo(i_cond) = subplot(1,2,i_stim);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,i_stim,:,2,:),4),1)- mean(mean(erp_out(time_window,i_stim,:,1,:),4),1); % minus the video from static 
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(labels{i_stim});
        t = colorbar('peer',gca);


end 

%set(h_topo1(4),'Position',[0.7484,0.1100,0.1566,0.8150]);

%% =========================================================================================
%Latencybargraph

% Bargraphs -Standard P2 at Fz
%erp_out(time_window,standard/target,electrode,cond,sub)
% barweb(barvalues, errors, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type)
% -----The following is an unsuccessful attempt at measuring the latency. 

%time_window = find(EEG.times>175,1)-1:find(EEG.times>275,1)-2;
%  electrode = 7;
% labels = 'Sound   Silent   White  Silent low';
% figure('Color',[1 1 1]);
%  temp = [ squeeze(max(erp_out(time_window,2,9,1,:))) squeeze(max(erp_out(time_window,2,9,2,:))) squeeze(max(erp_out(time_window,2,9,3,:))) squeeze(max(erp_out(time_window,2,9,4,:))) ];
% %  temptime = 
% set(gca,'Color',[1 1 1]);      
% barweb(mean(temp), std(temp)/sqrt(nsubs), 0.85, [], [], labels, 'Amplitude', jet ) 
% ylim([-1 4.5]); title('Max P2(175-275) Standards at Pz');
%  legend(conds);
% 
% %%        
% % Bargraphs
% %erp_out(time_window,standard/target,electrode,cond,sub)
% % barweb(barvalues, errors, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type)
% time_window = find(EEG.times>175,1)-1:find(EEG.times>275,1)-2;
%  electrode = 9;
% labels = 'Sound   Silent   White  Silent low';
% figure('Color',[1 1 1]);
%  temp = [ squeeze(max(erp_out(time_window,1,9,1,:))) squeeze(max(erp_out(time_window,1,9,2,:))) squeeze(max(erp_out(time_window,1,9,3,:))) squeeze(max(erp_out(time_window,1,9,4,:))) ];
% set(gca,'Color',[1 1 1]); 
% barweb(mean(temp), std(temp)/sqrt(nsubs), 0.85, [], [], labels, 'Amplitude', jet ) 
% ylim([-2 3.5]); title('Max P2 (175-275) Targets at Fz');
%  legend(conds);


%%      
%% %difference topographys P3
time_window = find(EEG.times>400,1)-1:find(EEG.times>600,1)-2;
figure('Color',[1 1 1]);
%for i_cond = 1:nconds
    subplot(1,4,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,1,:),4),1)'-mean(mean(erp_diff_out(time_window,:,4,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Sound-Silent P3');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');

text( 4, 2, 'P3 (400-600ms) ')
       


%% 
 subplot(1,4,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,2,:),4),1)'-mean(mean(erp_diff_out(time_window,:,3,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('White-Silent-Low P3');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%% 

 subplot(1,4,3);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,1,:),4),1)'-mean(mean(erp_diff_out(time_window,:,2,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Sound-White P3');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');


 subplot(1,4,4);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,4,:),4),1)'-mean(mean(erp_diff_out(time_window,:,3,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Silent - Silent-Low P3');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        
%% difference topographys P2
time_window = find(EEG.times>150,1)-1:find(EEG.times>250,1)-2;
figure('Color',[1 1 1]);
%for i_cond = 1:nconds
    subplot(1,4,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,1,:),4),1)'-mean(mean(erp_diff_out(time_window,:,4,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Sound-Silent Difference P2');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
text( 4, 2, 'P2 (150-250ms) ')


 
 subplot(1,4,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,2,:),4),1)'-mean(mean(erp_diff_out(time_window,:,4,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('White-Silent Difference P2');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%% I Have a Name! :)

 subplot(1,4,3);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,3,:),4),1)'-mean(mean(erp_diff_out(time_window,:,4,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Silent-Low -Silent Difference P2');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');


%  subplot(1,4,4);
%        set(gca,'Color',[1 1 1]);
%         temp = mean(mean(erp_diff_out(time_window,:,2,:),4),1)'-mean(mean(erp_diff_out(time_window,:,4,:),4),1)';
%         temp(16:18) = NaN;
%         topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
%         title('Silent - Silent-Low P3');
%         t = colorbar('peer',gca);
%         set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
 %difference topographys MMN
 time_window = find(EEG.times>100,1)-1:find(EEG.times>175,1)-2; %%usually will be 175-275, but here is 150-250 to differentiate from P2
  figure('Color',[1 1 1]);
    subplot(1,4,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,1,:),4),1)'-mean(mean(erp_diff_out(time_window,:,4,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Sound-Silent MMN');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
text( 4, 2, 'MMN (100-175ms) ')


%% 
 subplot(1,4,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,2,:),4),1)'-mean(mean(erp_diff_out(time_window,:,3,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('White-Silent-Low MMN');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%% 

 subplot(1,4,3);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,1,:),4),1)'-mean(mean(erp_diff_out(time_window,:,2,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Sound-White MMN');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');


 subplot(1,4,4);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_diff_out(time_window,:,4,:),4),1)'-mean(mean(erp_diff_out(time_window,:,3,:),4),1)';
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
        title('Silent - Silent-Low MMN');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');

        %% 
         %difference topographys P2 
        %Target = 1
        %Standard = 2
        %TargetS
 time_window = find(EEG.times>150,1)-1:find(EEG.times>250,1)-2;
  figure('Color',[1 1 1]);
%for i_cond = 1:nconds
    subplot(1,4,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,1,:,1,:),4),1)-mean(mean(erp_out(time_window,1,:,4,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title('Sound-Silent  Target P2');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
text( 4, 2, 'P2 (150-250ms) ')
%end

%% 
 subplot(1,4,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,1,:,2,:),4),1)-mean(mean(erp_out(time_window,1,:,4,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title('White-Silent Target P2');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%% 

 subplot(1,4,3);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,1,:,3,:),4),1)-mean(mean(erp_out(time_window,1,:,4,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title('Silent-Low -Silent Target P2');
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');

%% 
 % topographys P2 
        %Target = 1
        %Standard = 2
        %Standards
            stims = {'Targets','Standards'};
           for i_stim = 1:length(stims);
 time_window = find(EEG.times>175,1)-1:find(EEG.times>275,1)-2;
  figure('Color',[1 1 1]);
%for i_cond = 1:nconds
    subplot(1,3,1);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,i_stim,:,4,:),4),1)-mean(mean(erp_out(time_window,i_stim,:,1,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-3 3]  )
        if i_stim == 1
             title('Silent-Sound  Target P2');
        else
        title('Silent-Sound  Standard P2');
        end
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
text( 4, 2, 'P2 (175-275ms) ')
%end

%% 
 subplot(1,3,2);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,i_stim,:,4,:),4),1)- mean(mean(erp_out(time_window,i_stim,:,2,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-3 3]  )
        if i_stim == 1
              title('Silent - White Target P2');
        else
         title('Silent - White Standard P2');
        end
       
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%% 

 subplot(1,3,3);
       set(gca,'Color',[1 1 1]);
        temp = mean(mean(erp_out(time_window,i_stim,:,4,:),4),1)- mean(mean(erp_out(time_window,i_stim,:,3,:),4),1);
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-3 3]  )
         if i_stim == 1
              title('Silent - Silent-Low Target P2');
        else
         title('Silent - Silent-Low Standard P2');
         end
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
           end
% %% 
%  subplot(1,4,4);
%        set(gca,'Color',[1 1 1]);
%         temp = mean(mean(erp_out(time_window,2,:,2,:),4),1)-mean(mean(erp_out(time_window,2,:,4,:),4),1);
%         temp(16:18) = NaN;
%         topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-4 4]  )
%         title('Silent - Silent-Low Standard P2');
%         t = colorbar('peer',gca);
%         set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
%%         
  
% time_window = find(EEG.times>175,1)-1:find(EEG.times>275,1)-2;
% figure('Color',[1 1 1]);
% %for i_cond = 1:nconds
%     %subplot(1,2,i_cond);
%        set(gca,'Color',[1 1 1]);
%         temp = mean(mean(erp_diff_out(time_window,:,1,:),4),1)'-mean(mean(erp_diff_out(time_window,:,2,:),4),1)';
%         temp(16:18) = NaN;
%         topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
%         title('Sound-Silent MMN');
%         t = colorbar('peer',gca);
%         set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
% 
% %end

%% plot difference waves overlayed
erp_outside_diff_out = squeeze(erp_out(:,:,:,1,:)-erp_out(:,:,:,4 ,:)); %in - Silent
figure('Color',[1 1 1]); 
subplot(2,1,1);
        electrode = 9;
        boundedline(EEG.times,squeeze(mean(erp_outside_diff_out(:,1,electrode,:),4)), squeeze(std(erp_outside_diff_out(:,1,electrode,:),[],4))./sqrt(nsubs),'g',...
                    EEG.times,squeeze(mean(erp_outside_diff_out(:,2,electrode,:),4)), squeeze(std(erp_outside_diff_out(:,2,electrode,:),[],4))./sqrt(nsubs),'b'); %,...
               set(gca,'Color',[1 1 1]);
        set(gca,'YDir','reverse'); 
line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
line('XData', [175 175], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
line('XData', [180 180], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
line('XData', [275 275], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
        legend('Targets','Standards','Location','SouthEast'); 
       
        axis tight; ylim([-6 7]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-6 7],'color','k');
        title('Sound - Silent Difference Wave, Fz');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');
subplot(2,1,2);
        electrode = 7;
        boundedline(EEG.times,squeeze(mean(erp_outside_diff_out(:,1,electrode,:),4)), squeeze(std(erp_outside_diff_out(:,1,electrode,:),[],4))./sqrt(nsubs),'g',...
                    EEG.times,squeeze(mean(erp_outside_diff_out(:,2,electrode,:),4)), squeeze(std(erp_outside_diff_out(:,2,electrode,:),[],4))./sqrt(nsubs),'b'); %,...
               set(gca,'Color',[1 1 1]);
        set(gca,'YDir','reverse'); 
line('XData', [100 100], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
line('XData', [175 175], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','r');
line('XData', [180 180], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
line('XData', [275 275], 'YData', [9.25 -7], 'LineStyle', '-','LineWidth', 2, 'Color','m');
        legend('Targets','Standards','Location','SouthEast'); 
       
        axis tight; ylim([-6 7]);
        line([-200 1000],[0 0],'color','k');
        line([0 0],[-6 7],'color','k');
        title('Sound - Silent Difference Wave, Pz');
        xlabel('Time (ms)');
        ylabel('Voltage (uV)');
        
    %% topographies Targets/Standards
    stims = {'Targets','Standards'};
    
    time_window = find(EEG.times>100,1):find(EEG.times>175,1);
    figure('Color',[1 1 1]);
    for i_stim = 1:length(stims)
        subplot(1,4,i_stim);
        set(gca,'Color',[1 1 1]);
        temp = squeeze(mean(mean(erp_out(time_window,i_stim,:,:),4),1));
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(stims{i_stim});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
if i_stim == 1
    text( 1, 2, 'MMN (100-175ms) ')
end
    end
     %% Post - P2 weird thing topographies Targets/Standards
    stims = {'Targets','Standards'};
    
    time_window = find(EEG.times>210,1):find(EEG.times>310,1);
    figure('Color',[1 1 1]);
    for i_stim = 1:length(stims)
        subplot(1,2,i_stim);
        set(gca,'Color',[1 1 1]);
        temp = squeeze(mean(mean(erp_out(time_window,i_stim,:,:),4),1));
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(stims{i_stim});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        suptitle('Post-P2 (210-310ms) ')
% if i_stim == 1
%     text( 1, 2, 'Post-P2 (210-310) ')
% end
    end
    %_____________________________________________________________________________________________
    %difference topography
     time_window = find(EEG.times>210,1):find(EEG.times>310,1);
    figure('Color',[1 1 1]);
   
%         subplot(1,2,i_stim);
        set(gca,'Color',[1 1 1]);
        temp = squeeze(mean(mean(erp_diff_out(time_window,1,:),4),1));
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-3 1]  )
%         title(stims{i_stim});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
        suptitle('Post-P2 (210-310ms) Targets-Standards ')
    %% topographies Targets/Standards
    stims = {'Targets','Standards'};
    
    time_window = find(EEG.times>175,1):find(EEG.times>275,1);
    figure('Color',[1 1 1]);
    for i_stim = 1:length(stims)
        subplot(1,4,i_stim);
        set(gca,'Color',[1 1 1]);
        temp = squeeze(mean(mean(erp_out(time_window,i_stim,:,:),4),1));
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(stims{i_stim});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
if i_stim == 1
    text( 1, 2, 'P2 (175-275ms) ')
end
    end
    
     stims = {'Targets','Standards'};
    
    time_window = find(EEG.times>300,1):find(EEG.times>430,1);
    figure('Color',[1 1 1]);
    for i_stim = 1:length(stims)
        subplot(1,4,i_stim);
        set(gca,'Color',[1 1 1]);
        temp = squeeze(mean(mean(erp_out(time_window,i_stim,:,:),4),1));
        temp(16:18) = NaN;
        topoplot(temp,electrode_loc, 'whitebk','on','plotrad',.6,'maplimits',[-2 2]  )
        title(stims{i_stim});
        t = colorbar('peer',gca);
        set(get(t,'ylabel'),'String', 'Voltage Difference (uV)');
if i_stim == 1
    text( 1, 2, 'P3 (300-430ms) ')
end
    end

    
    %% Bargraphs -Standard P2 at Fz
%erp_out(time_window,standard/target,electrode,cond,sub)
% barweb(barvalues, errors, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type)
elecs = [7 9]
figure('Color',[1 1 1]);
stim = 2
for i_elec = 1:length(elecs)
time_window = find(EEG.times>150,1)-1:find(EEG.times>215,1)-2;
 electrode = elecs(i_elec);
labels = 'Video  Static ';

subplot(2,2,2*(i_elec-1) +1);
standmeans = [ squeeze(mean(erp_out(time_window,stim,electrode,1,:))) squeeze(mean(erp_out(time_window,stim,electrode,2,:))) ];

set(gca,'Color',[1 1 1]);
% handles4 = barweb(mean(standmeans), std(standmeans)./sqrt(nsubs), 0.85, [], [], labels, 'Amplitude', jet ) 
ylim([-2 2])
handles = barweb(mean(standmeans), std(standmeans)./sqrt(nsubs), 0.85, [], [], labels, 'Amplitude', jet ) 
% 
if electrode == 9
 ylim([0 3]); title('P2 Standards at Fz');
elseif electrode == 7
    ylim([-2.5 0]); title('P2 Standards at Pz');
else 
    ylim([-2 3]);
end
h_leg = legend('Video',  'Static');
 text( 4, 2, 'P2 (175-275ms) Standards')
%         
% Target P2 at electrode
% erp_out(time_window,standard/target,electrode,cond,sub)
% barweb(barvalues, errors, width, groupnames, bw_title, bw_xlabel, bw_ylabel, bw_colormap, gridstatus, bw_legend, error_sides, legend_type)
time_window = find(EEG.times>150,1)-1:find(EEG.times>215,1)-2;
% labels = 
stim = 1
subplot(2,2,2*(i_elec-1) +2);
%figure('Color',[1 1 1]);
targmeans = [ squeeze(mean(erp_out(time_window,stim,electrode,1,:))) squeeze(mean(erp_out(time_window,stim,electrode,2,:))) ];
set(gca,'Color',[1 1 1]);      
handles3 = barweb(mean(targmeans), std(targmeans)./sqrt(nsubs), 0.85, [], [], labels, 'Amplitude', jet ) 
if electrode == 9
ylim([0 3]); title('P2 Targets at Fz');
elseif electrode == 7
   ylim([-2 0.5]); title('P2 Targets at Pz');
else 
    ylim([-4 1]);
end
 legend('Video',  'Static');
  text( 4, 2, 'P2 (150-250ms) Targets')
% 
% %anova of the targets bar values
% disp(['Anova for the the targets at electrode ' elec_names{elecs(i_elec)}])
% temp = reshape(targmeans,nsubs*4,1);
% factor = [1*ones(nsubs,1); 2*ones(nsubs,1); 3*ones(nsubs,1); 4*ones(nsubs,1)];
% subject = repmat([1:nsubs]',[4 1]);
% data = [temp factor subject];
% RMAOV1(data,0.05)
% 
% disp(['Anova for the the standards at electrode ' elec_names{elecs(i_elec)}])
% temp = reshape(standmeans,nsubs*4,1);
% factor = [1*ones(nsubs,1); 2*ones(nsubs,1); 3*ones(nsubs,1); 4*ones(nsubs,1)];
% subject = repmat([1:nsubs]',[4 1]);
% data = [temp factor subject];
% RMAOV1(data,0.05)

end
%t test : [sig p CI STAT] = ttest(targmeans(:,1),targmeans(:,4),0.05/6)

    
    
    
    
    
    
%% count trials        
        
for i_set = 1:4; trial_count(i_set) = ALLEEG(i_set).trials; end
trial_count = reshape(trial_count,[1, 1, 4]);
min(trial_count,[],3)
mean(trial_count,3)
max(trial_count,[],3)

% 
% time_window = find(EEG.times>175,1)-1:find(EEG.times>275,1)-2;
% %mean and sd
% mean(mean(erp_diff_out(time_window,9,1:3,:),1),4)
% std(mean(erp_diff_out(time_window,9,1:3,:),1),[],4)
% 
% % ttest of each condition
% [h p ci stat] = ttest(squeeze(mean(erp_diff_out(time_window,9,1,:),1)),0,.05,'left',1)
% [h p ci stat] = ttest(squeeze(mean(erp_diff_out(time_window,9,2,:),1)),0,.05,'left',1)
% [h p ci stat] = ttest(squeeze(mean(erp_diff_out(time_window,9,3,:),1)),0,.05,'left',1)
% 
% %% p3
% time_window = find(EEG.times>300,1)-1:find(EEG.times>430,1)-2;
% %mean and sd
% mean(mean(erp_diff_out(time_window,7,1:3,:),1),4)
% std(mean(erp_diff_out(time_window,7,1:3,:),1),[],4)
% 
% % ttest of each condition
% [h p ci stat] = ttest(squeeze(mean(erp_diff_out(time_window,7,1,:),1)),0,.05,'right',1)
% [h p ci stat] = ttest(squeeze(mean(erp_diff_out(time_window,7,2,:),1)),0,.05,'right',1)
% [h p ci stat] = ttest(squeeze(mean(erp_diff_out(time_window,7,3,:),1)),0,.05,'right',1)
% 
%% Stats



%% Final graphs









