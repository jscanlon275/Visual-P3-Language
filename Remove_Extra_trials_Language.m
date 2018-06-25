%% trial plotting to remove bad trials
% 
% for i_event = 1:length(EEG.event)
% 
% trials{1, i_event} = EEG.event(i_event).latency
% 
% if strcmp(EEG.event(i_event).type,'S  3');
% trials(2, i_event)  = 'r'
% end
% end 
close all 
clear all

exp = 'pilot';
subs = { '001' '002' '003' '004'  };% 
% subs = {'014''}; %to test on just one sub


nsubs = length(subs);
conds = {'Video'};
nconds = length(conds);
Pathname = 'M:\Data\Visual P3 Language\'; 

if ~exist([Pathname 'segments\'])
    mkdir([Pathname 'segments\']);
end
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;


for i_sub = 1:nsubs
    
    for i_cond = 1:nconds
Filename = [subs{i_sub} '_' exp  '.vhdr'];
        setname = Filename(1:end-5)

        EEG = pop_loadbv(Pathname, Filename);




types = {EEG.event(:).type};
latencies = {EEG.event(:).latency};
triggers = unique(types);

figure;
colors = hsv(length(triggers))
colors(2, 1:3) = zeros
for i_trig = 1:length(triggers)

trigplot = [latencies{strcmp(types,triggers{i_trig})}];

scatter(trigplot,i_trig*100*ones(1,size(trigplot,2)),'MarkerEdgeColor',colors(i_trig,:));
hold on

h_ln = plot(trigplot, 1:length(trigplot),'Color',colors(i_trig,:));

if i_trig == 1;
    Targs(i_sub, i_cond) = length(trigplot)
elseif i_trig == 2;
    Stands(i_sub, i_cond) = length(trigplot)
    
end
end
title(Filename)
legend(reshape(repmat(triggers,[2 1]),[1 2*length(triggers)]))

    end
end