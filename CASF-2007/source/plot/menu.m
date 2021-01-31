% menu 
% metric_id = 1,2,3,4; 
%    id = 1, num; id = 2, RP; id = 3, RS; id = 4, RMSE;
% table_num = 1,2,3,4 
%    1, table1; 2, table2; 3, table3; 4, table4;
%    1: is Structural similarity\Training with most dissimilar samples
%    2: is Sequence similarity\Training with most dissimilar samples
% compare_method
%   method = ['X_score','Vina','Cyscore']
clear all;
clc;
%% example 
%   metric_id  = 2;
%   table_num  = 4; 
%   compare_method = 'Cyscore';
%   plot_metric(table_num,metric_id,compare_method)

%% ±È¿˙À˘”–
Compare_method   = cell(3,1);
Compare_method{1}= 'X_score';
Compare_method{2}= 'Vina';
Compare_method{3}= 'Cyscore';
count = 0;
for table_num = 1:4
    for metric_id=2:4
        for method_id = 1:3
            count = count + 1;
            fprintf('======================= ploting %d figure=======================\n',count)
            compare_method = Compare_method{method_id};
            plot_metric(table_num,metric_id,compare_method);
            % create the save road
            
            if mod(table_num,2)==1 % 1,3
                if table_num ==1
                    filename1='G:\CyscoreV2.0\2018_new_paper\plot_new\Structural similarity\Training with most dissimilar samples\';
                else
                    filename1='G:\CyscoreV2.0\2018_new_paper\plot_new\Structural similarity\Training with most similar samples\';
                end
            else
                if table_num ==2
                    filename1='G:\CyscoreV2.0\2018_new_paper\plot_new\Sequence similarity\Training with most dissimilar samples\';
                else
                    filename1='G:\CyscoreV2.0\2018_new_paper\plot_new\Sequence similarity\Training with most similar samples\';
                end
            end
            
            switch metric_id
                case 2
                    filename2 = '\RP.pdf';
                case 3
                    filename2 = '\RS.pdf';
                case 4
                    filename2 = '\RMSE.pdf';
            end
            
            filename = strcat(filename1,compare_method,filename2);
            saveas(gcf,filename)
            close(figure(gcf)) % close the figure
        end
    end
end