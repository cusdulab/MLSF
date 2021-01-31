%% the article 
%    <The Impact of Protein Structure and SequenceSimilarity on the Accuracy of 
%      Machine-Learning Scoring Functions for Binding Affinity Prediction >
% the journey
%     biomolecules
% the author is :
%     Hongjian Li,Jiangjun Peng
% the code time is :
%     2018-10-14
function [RPM,MSEM,Num,RSM] = menu(Options)
% basic settings
Data_name    = {'RF_score_v3.mat','RF_score.mat','xscore.mat','vina.mat','vina_flexible.mat','cyscore.mat'};
Machine_name = {'random_forest','linear'};
File_name    = {'Structure_Similarity.xls','Sequence_Similarity.xls'};
Choose_name  = {'in','out'};
% options setting
data_num        = Options.Data_name;
machine_num     = Options.Machine_name;
file_num        = Options.File_name;
choose_num      = Options.Choose_name;
% get the trainning option setting
data_name       = Data_name(data_num);
load(data_name{1});
machine_nm      = Machine_name(machine_num);
machine_name    = machine_nm{1};
file_nm         = File_name(file_num);
file_name       = file_nm{1};
choose_nm       = Choose_name(choose_num);
choose_name     = choose_nm{1};
% get the cutoff value
load('Cutoff.mat');
if file_num == 1
    Cutoff = Cutoff_structure;
else
    Cutoff = Cutoff_sequence;
end
Len     = length(Cutoff);
RPM    = zeros(Len,2);
MSEM     = zeros(Len,2);
Num     = zeros(Len,1);
RSM     = RPM;
for Co=1:Len
    cutoff    = Cutoff(Co);
    fprintf(['dealing with the ',num2str(Co),' cutoff =',num2str(cutoff),'\n']);
    %% read the similarity data
    filename  = file_name;
    SS        = xlsread(filename);
    SS        = SS(2:end,:);
    [m,n]     = size(SS);
    %% choose similarity way
    flag      = 1;
    if strcmp('in',choose_name)
        % in the sample
        ind_in =[];
        for traini=1:m
            if max(SS(traini,:))>cutoff
                ind_in=[ind_in;traini];
            end
        end
        train_x   = Train_x(ind_in,:);
        train_y   = Train_y(ind_in); 
        if length(train_x)==0
            disp(['no sample in train data']);
            flag =0;
        end
    else
        ind_in    =[1:m]';
        ind_out   =[];
        for traini=1:m
            if max(SS(traini,:))>cutoff
                ind_out=[ind_out;traini];
            end
        end
        ind_in(ind_out)=[];
        train_x   = Train_x(ind_in,:);
        train_y   = Train_y(ind_in);
        if length(train_x)==0
            disp(['no sample in train data']);
            flag =0;
        end
    end
    %% machine method and random 10 times
    if flag == 1
        if strcmp('random_forest',machine_name)
            fprintf(['training number is  ',num2str(length(train_y)),'\n']);
            for i =1:10
                BaggedEnsemble = TreeBagger(500,train_x,train_y,'OOBPred','On','Method','regression','MinLeaf',1);
                est_train      = predict(BaggedEnsemble,train_x);
                MMsee(i,1)     = sqrt(mse(est_train,train_y));
                Rp(i,1)        = corr(est_train,train_y,'Type','Pearson');
                SP(i,1)        = corr(est_train,train_y,'Type','Spearman');

                est_test       = predict(BaggedEnsemble,test_x);
                MMsee(i,2)     = sqrt(mse(est_test,test_y));
                Rp(i,2)        = corr(est_test,test_y,'Type','Pearson');
                SP(i,2)        = corr(est_test,test_y,'Type','Spearman');
            end
            % obtain the mean of Rp and MMsee
            RPM(Co,:) = mean(Rp);
            MSEM(Co,:)  = mean(MMsee);
            Num(Co,:)  = length(train_y);
            RSM(Co,:)  = mean(SP);
        else
            fprintf(['training number is  ',num2str(length(train_y)),'\n']);
            new_train_x = [ones(size(train_x,1),1),train_x];
            new_test_x  = [ones(size(test_x,1),1),test_x];
            for i =1:10
                weight   = inv(new_train_x'*new_train_x)*new_train_x'*train_y;
                est_train      = new_train_x*weight;
                MMsee(i,1)     = sqrt(mse(est_train,train_y));
                Rp(i,1)        = corr(est_train,train_y,'Type','Pearson');
                SP(i,1)        = corr(est_train,train_y,'Type','Spearman');
                
                est_test = new_test_x*weight;
                MMsee(i,2)     = sqrt(mse(est_test,test_y));
                Rp(i,2)        = corr(est_test,test_y,'Type','Pearson');
                SP(i,2)        = corr(est_test,test_y,'Type','Spearman');    
            end
            % obtain the mean of Rp and MMsee
            RPM(Co,:) = mean(Rp);
            MSEM(Co,:)  = mean(MMsee);
            Num(Co,:)  = length(train_y);
            RSM(Co,:)  = mean(SP);
        end
    end
end

    