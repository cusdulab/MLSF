clear all;clc
%% Input 
% options setting
%     Data_name    = {'RF_score_v3.mat','RF_score.mat','xscore.mat','vina.mat','vina_flexible.mat','cyscore.mat'};
%     Machine_name = {'random_forest','linear'};
%     File_name    = {'Structure_Similarity.xls','Sequence_Similarity.xls'};
%     Choose_name  = {'in','out'};
%   we should give the num of options to choose the setting value

%% output
%     num: the num of train data in train process
%     rp : the pearson correlation 
%     rs : the spearman correlation
%     mse: the mean square error
%   tips:  the first column is the value of train set
%          the second column is the value of train set 
%    

%% for example
% the experiment MLR::Cyscore setting in 
%      Table 1: Performance of ... trained at different structural similarity levels.
Options.Data_name    = 6; % 6 represent Data_name      = 'cyscore.mat'
Options.Machine_name = 2; % 2 represent Machine_name   = 'linear'
Options.File_name    = 1; % 1 represent File_name      = 'Structure_Similarity.xls'
Options.Choose_name  = 2; % 2 represent Choose_name    = 'out'
[rp,mse,num,rs] = menu(Options);
result_test = [num,rs(:,2),rp(:,2),mse(:,2)];

% % the experiment RF::Cyscore setting in 
% %     Table 1: Performance of ... trained at different structural similarity levels.
% Options.Data_name    = 6; % 6 represent Data_name      = 'cyscore.mat'
% Options.Machine_name = 1; % 1 represent Machine_name   = 'random_forest'
% Options.File_name    = 1; % 1 represent File_name      = 'Structure_Similarity.xls'
% Options.Choose_name  = 2; % 2 represent Choose_name    = 'out'
% [rp,mse,num,rs] = menu(Options);
% result_test = [num,rs(:,2),rp(:,2),mse(:,2)];

% % the experiment MLR::Cyscore setting in 
% %     Table 3: Performance of ... trained with similar samples only. 
% %     In the training sets, the samples are required to have structural similarity 
% %        (with the test samples) higher than the specified cutoffs
% Options.Data_name    = 6; % 6 represent Data_name      = 'cyscore.mat'
% Options.Machine_name = 2; % 1 represent Machine_name   = 'random_forest'
% Options.File_name    = 1; % 1 represent File_name      = 'Structure_Similarity.xls'
% Options.Choose_name  = 1; % 1 represent Choose_name    = 'in'
% [rp,mse,num,rs] = menu(Options);
% result_test = [num,rs(:,2),rp(:,2),mse(:,2)];
