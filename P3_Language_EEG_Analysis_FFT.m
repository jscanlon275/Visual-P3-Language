ccc

exp = 'VisLanguage_P3';
subs = {  '002'  '003' '004' '005' '006' }; 
% subs = {'006'}; %to test on just one sub

nsubs = length(subs);
conds = {'Video'}
nconds = length(conds);
Pathname = 'M:\Data\Visual P3 Language\';
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

figure;
pick_trials = 290; %pick per resample
for elec = 1:2
    elecs = [7 9]
electrode = elecs(elec);% fz
perms = 1; %pick all the standard trials for each subject

i_count = 0;

power_out = zeros(30,nsubs,nconds,perms);
for i_sub = 1:nsubs
    
    for i_cond = 1:nconds
        
        i_count = i_count + 1;
        Filename = [subs{i_sub} '_' exp '_' conds{i_cond}];
        EEG = pop_loadset('filename',[Filename '_Corrected_Standard.set'],'filepath',[Pathname '\segments\']);
        [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
     
        n_trials = ALLEEG(i_count).trials;
        for i_perm = 1:perms 
            these_trials = randperm(n_trials,pick_trials);
               test = ALLEEG(i_count).data(:, :,these_trials) ;
               power = [];
               phase = [];
                 for i_pick = 1:pick_trials
                     tempdat = test(electrode,:,i_pick);
                    [power(:,i_pick) phase(:,i_pick) freqs] = kyle_fft(tempdat,EEG.srate,30);
%                     power(2:end,i_pick) = power(2:end,i_pick) - mean(power(2:end,i_pick,1)); %subtract mean spectra
                end
                power_out(:,i_sub,i_cond,i_perm) = mean(power(2:end,:),2);
                

        end
 
    end
end
% eeglab redraw

mean_power_out = squeeze(mean(power_out,2));
stderr_power_out = squeeze(std(power_out,[],2))./sqrt(nsubs);
% figure; 
subplot(2,1,elec)
b = boundedline(freqs(2:end),mean_power_out(:,1)',stderr_power_out(:,1)', 'b' ); axis tight
% 
 set(gca,'LineWidth',2.0); 
  set(b,'LineWidth',3.0); 
% hold on
ylim([1 3.5])
end 

%% Check for significance
%Alpha frequencies: 8-12Hz
subfreqs1 = (mean(power_out(16:24,:,1,:),1))';
subfreqs2 = mean(power_out(16:24,:,2,:),1)';
%two-tailed
[h p ci test] = ttest(subfreqs1,subfreqs2);
mdiff = mean(subfreqs1)-mean(subfreqs2);
disp('Alpha (8-12Hz): Traffic vs. Park ')
disp(['(Mdiff=', num2str(mdiff), ' ; SDdiff=',num2str(test.sd), ' ; t(', num2str(test.df),')= ',num2str(test.tstat), ' ; p=', num2str(p), ')' ])

%%
%high frequencies: >15Hz
subfreqs1 = mean(power_out(30:end,:,1,:),1);
subfreqs2 = mean(power_out(30:end,:,2,:),1);

[h p ci test] = ttest(subfreqs1,subfreqs2);
mdiff = mean(subfreqs1)-mean(subfreqs2);
disp('High Freq (>15Hz): Traffic vs. Park ')
disp(['(Mdiff=', num2str(mdiff), ' ; SDdiff=',num2str(test.sd), ' ; t(', num2str(test.df),')= ',num2str(test.tstat), ' ; p=', num2str(p), ')' ])
%%

%Beta frequencies: >23-30Hz (normally 35max)
subfreqs1 = mean(power_out(46:end,:,1,:),1);
subfreqs2 = mean(power_out(46:end,:,2,:),1);

[h p ci test] = ttest(subfreqs1,subfreqs2);
mdiff = mean(subfreqs1)-mean(subfreqs2);

disp('Beta (>23-30Hz): Traffic vs. Park ')
disp(['(Mdiff=', num2str(mdiff), ' ; SDdiff=',num2str(test.sd), ' ; t(', num2str(test.df),')= ',num2str(test.tstat), ' ; p=', num2str(p), ')' ])
%%

%delta frequencies: >1-4Hz (normally 35max)
subfreqs1 = mean(power_out(2:8,:,1,:),1);
subfreqs2 = mean(power_out(2:8,:,2,:),1);

[h p ci test] = ttest(subfreqs1,subfreqs2);
mdiff = mean(subfreqs1)-mean(subfreqs2);

disp('Delta (>1-4Hz): Traffic vs. Park ')
disp(['(Mdiff=', num2str(mdiff), ' ; SDdiff=',num2str(test.sd), ' ; t(', num2str(test.df),')= ',num2str(test.tstat), ' ; p=', num2str(p), ')' ])
%%

%theta frequencies: >4-8Hz (normally 35max)
subfreqs1 = mean(power_out(8:16,:,1,:),1);
subfreqs2 = mean(power_out(8:16,:,2,:),1);

[h p ci test] = ttest(subfreqs1,subfreqs2);
mdiff = mean(subfreqs1)-mean(subfreqs2);

disp('Theta (>4-8Hz): Traffic vs. Park ')
disp(['(Mdiff=', num2str(mdiff), ' ; SDdiff=',num2str(test.sd), ' ; t(', num2str(test.df),')= ',num2str(test.tstat), ' ; p=', num2str(p), ')' ])

%% 
% 
% 
% freqs = mean_power_out(30:end,:)
% [h p ci test] = ttest(freqs(:,1),freqs(:,2))
% mdiff = mean(freqs(:,1))-mean(freqs(:,2))

%figure;
% subplot(3,1,1);
% rms_perm_mean = squeeze(mean(rms_out,1));
% hist(rms_perm_mean(1,:),50); 
%  hold on; hist(rms_perm_mean(2,:),50); hold on; hist(rms_perm_mean(3,:),50);
%  g=findobj(gca,'Type','patch');
% set(g(1),'FaceColor',[.9 0 0],'EdgeColor','k');
% set(g(2),'FaceColor',[0 .9 0],'EdgeColor','k');
% set(g(3),'FaceColor',[0 0 .9],'EdgeColor','k');
% 
% subplot(3,1,2);
% rms_erp_perm_mean = squeeze(mean(rms_erp_out,1));
%  hist(rms_erp_perm_mean(1,:),50); 
%  hold on; hist(rms_erp_perm_mean(2,:),50); hold on; hist(rms_erp_perm_mean(3,:),50);
%  g=findobj(gca,'Type','patch');
% set(g(1),'FaceColor',[.9 0 0],'EdgeColor','k');
% set(g(2),'FaceColor',[0 .9 0],'EdgeColor','k');
% set(g(3),'FaceColor',[0 0 .9],'EdgeColor','k');
% 
% subplot(3,1,3);
% mean_erp_out = squeeze(mean(erp_out,2));
% rms_mean_erp_out = squeeze(rms(mean_erp_out,1));
% hist(rms_mean_erp_out(1,:),50); 
%  hold on; hist(rms_mean_erp_out(2,:),50); hold on; hist(rms_mean_erp_out(3,:),50);
%  g=findobj(gca,'Type','patch');
% set(g(1),'FaceColor',[.9 0 0],'EdgeColor','k');
% set(g(2),'FaceColor',[0 .9 0],'EdgeColor','k');
% set(g(3),'FaceColor',[0 0 .9],'EdgeColor','k');
% 
legend(conds);