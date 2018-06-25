clear all
close all
ccc;
% if matlabpool('size') == 0
%     matlabpool open
% end

exp = 'VisLanguage_P3';
subs = {'026' '027' '028' '029'};% '001' '002' '003' '004' '005'
%100ms group:  '002'  '003' '004' '005' '006' '008' '009' '010' '011' '014' '015' '016' '021' '022'

% subs = {'014''}; %to test on just one sub 
%008 removed because they didn't do the task right


nsubs = length(subs);
Pathname = 'M:\Data\Visual P3 Language\';

if ~exist([Pathname 'Segments\'])
    mkdir([Pathname 'Segments\']);
end
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
%%
for i_sub = 1:nsubs
    %for i_cond = 1:nconds
        
        Filename = [subs{i_sub} '_' exp '.vhdr'];
        setname = Filename(1:end-5)

        
        EEG = pop_loadbv(Pathname, Filename);

        % get electrode locatoins
        EEG=pop_chanedit(EEG, 'load',{'M:\Analysis\ElectrodeLocs\EOG-electrode-locs.ced' 'filetype' 'autodetect'});

        % arithmetically rereference to linked mastoid
         for x=1:EEG.nbchan-2
             EEG.data(x,:) = (EEG.data(x,:)-((EEG.data(EEG.nbchan-2,:))*.5));
         end
%function [smoothdata,filtwts] = eegfilt(data,srate,locutoff,hicutoff,epochframes,filtorder,revfilt,firtype,causal)
%        Filter the data with low pass of 30
       EEG = pop_eegfilt( EEG, .1, 0, [], 0);  %high pass filter
       EEG = pop_eegfilt( EEG, 0, 30, [], 0);  %low pass filter

         
% change markers so they can be used by the gratton_emcp script

       %% Trigger codes: 
% S 11: Mug; Mugs are common  - Standard
% S 21: Cup; Cups are rare    - Target
% S 12: Cup; Cups are common  - Standard
% S 22: Mug; Mugs are rare    - Target
% S  3: bowl. 

              for i_event = 1:length(EEG.event)
%             %cond 1 #Targets first.Video
            if strcmp (EEG.event(i_event).type,'S 11')
                EEG.event(i_event).type = '2';
                if strcmp (EEG.event(i_event-1).type, 'S  3')
                    EEG.event(i_event).type = '4';
                end
             elseif strcmp (EEG.event(i_event).type,'S 21')
                EEG.event(i_event).type = '1'; %deviant
%              
             elseif strcmp (EEG.event(i_event).type,'S 12')
                EEG.event(i_event).type = '2';
             elseif strcmp (EEG.event(i_event).type,'S 22')
                 EEG.event(i_event).type = '1';
             elseif strcmp (EEG.event(i_event).type,'S  3')
                EEG.event(i_event).type = '3';
              %RT
%              elseif strcmp (EEG.event(i_event).type,'S  8')
%                 EEG.event(i_event).type = '8';
             end 
         end
        
%%         %epoch
% 

        EEG = pop_epoch( EEG, { '1' '2' '3'}, [-.2  .65], 'newname',  sprintf('%s epochs' , setname), 'epochinfo', 'yes');
        EEG = pop_rmbase( EEG, [-200    0]);

       eeglab redraw


        %    Artifact rejection, trials with range >500 uV
      
        EEG = pop_eegthresh(EEG,1,[1:size(EEG.data,1)],-1000,1000,EEG.xmin,EEG.xmax,0,1);
        
        %   EMCP occular correction          
        temp_ocular = EEG.data(end-1:end,:,:); %to save the EYE data for after
        selection_cards = {'1', '2', '3'}; %different bin names, each condition should be separate 
        EEG = gratton_emcp(EEG,selection_cards,{'VEOG'},{'HEOG'}); %this assumes the eye channels are called this
        EEG.emcp.table %this prints out the regression coefficients
        EEG.data(end-1:end,:,:) = temp_ocular; %replace the eye data
        
         %    Artifact rejection, trials with range >250 uV
        EEG = pop_rmbase( EEG, [-200 0]); %baseline again since this changed it
         EEG = pop_eegthresh(EEG,1,[1:size(EEG.data,1)-2],-500,500,EEG.xmin,EEG.xmax,0,1);%%this line  was removed

        tempEEG =   EEG;

 %%  
% %           %% Select individual events
%      events = {[2 1 3]}; %Standard, then target
%      npersub = size(events,2);
%      event_names = {'Language'};
% %   
%      for i_event = 1:npersub
% 
%         EEG = pop_selectevent( tempEEG, 'type',events{i_event},'deleteepochs','on','invertepochs','off');
%         EEG = pop_editset(EEG, 'setname', [subs{i_sub} '_' event_names{i_event}]);
%         EEG = pop_saveset( EEG, 'filename',[subs{i_sub} '_' event_names{i_event} '.set'],'filepath',[Pathname 'Segments\']);
%     end
%         
        %now select the corrected trials 
        % Targets
        
        EEG = pop_selectevent( tempEEG, 'type',[1],'renametype','LangTarget','deleteevents','on','deleteepochs','on','invertepochs','off');
        EEG = pop_editset(EEG, 'setname',[subs{i_sub} '_' exp '_Video_Corrected_Target']);
        EEG = pop_saveset( EEG, 'filename',[subs{i_sub} '_' exp '_Video_Corrected_Target.set'],'filepath',[Pathname 'Segments\']);
        
%         
%         EEG = pop_selectevent( tempEEG, 'type',['3'],'renametype','StaticTarget','deleteevents','on','deleteepochs','on','invertepochs','off');
%         EEG = pop_editset(EEG, 'setname',[subs{i_sub} '_' exp '_Static_Corrected_Target']);
%         EEG = pop_saveset( EEG, 'filename',[subs{i_sub} '_' exp '_Static_Corrected_Target.set'],'filepath',[Pathname 'Segments\']);
%         
        %Standards
        
        EEG = pop_selectevent( tempEEG, 'type',[2] ,'renametype','LangStandard','deleteevents','on','deleteepochs','on','invertepochs','off');
        EEG = pop_editset(EEG, 'setname',[subs{i_sub} '_' exp '_Video_Corrected_Standard']);
        EEG = pop_saveset( EEG, 'filename',[subs{i_sub} '_' exp '_Video_Corrected_Standard.set'],'filepath',[Pathname 'Segments\']);
       
     
        %bowls
        EEG = pop_selectevent( tempEEG, 'type',[3] ,'renametype','LangBowl','deleteevents','on','deleteepochs','on','invertepochs','off');
        EEG = pop_editset(EEG, 'setname',[subs{i_sub} '_' exp '_Video_Corrected_Bowl']);
        EEG = pop_saveset( EEG, 'filename',[subs{i_sub} '_' exp '_Video_Corrected_Bowl.set'],'filepath',[Pathname 'Segments\']);
       
        
         

   % end %i_cond
 end %i_sub
% 