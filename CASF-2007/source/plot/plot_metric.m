function plot_metric(table_num,metric_id,compare_method)

    % load the mat.file
    load(strcat('table_',num2str(table_num),'.mat'))
    % setting the xlabel
    switch table_num
        case 1
            xlabel_str= 'Number of training samples (structural similarity)';
        case 2
            xlabel_str= 'Number of training samples (sequence similarity)';
        case 3
            xlabel_str= 'Number of training samples (structural similarity)';
        case 4
            xlabel_str= 'Number of training samples (sequence similarity)';
    end
    % setting the ylabel 
    switch metric_id
        case 2
            ylabel_str= 'Pearson correlation (Rp)';
        case 3
            ylabel_str= 'Spearman correlation (Rs)';
        case 4
            ylabel_str= 'RMSE';
    end
    
    figure;
    tmp = [];
    num = RF_score(:,1);
    % load the method metric 
    switch compare_method
        case 'X_score'
            plot(num(index),X_score(index,metric_id),'bo-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor','b');
            tmp  = [tmp;X_score(index,metric_id)];
            hold on;
            plot(num(index),RF_X_score(index,metric_id),'go-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','g','MarkerFaceColor','g');
            tmp  = [tmp;RF_X_score(index,metric_id)];
        case 'Vina'
            plot(num(index),MLR_Vina(index,metric_id),'bo-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor','b');
            tmp  = [tmp;MLR_Vina(index,metric_id)];
            hold on;
            plot(num(index),RF_Vina(index,metric_id),'go-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','g','MarkerFaceColor','g');
            tmp  = [tmp;RF_Vina(index,metric_id)];
        case 'Cyscore'
            plot(num(index),MLR_Cyscore(index,metric_id),'bo-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','b','MarkerFaceColor','b');
            tmp  = [tmp;MLR_Cyscore(index,metric_id)];
            hold on;
            plot(num(index),RF_Cyscore(index,metric_id),'go-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','g','MarkerFaceColor','g');
            tmp  = [tmp;RF_Cyscore(index,metric_id)]; 
    end
    
    hold on;
    plot(num(index),RF_score(index,metric_id),'ro-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','r','MarkerFaceColor','r');
    tmp  = [tmp;RF_score(index,metric_id)];
    hold on;
    plot(num(index),RF_score_v3(index,metric_id),'mo-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','m','MarkerFaceColor','m');
    tmp  = [tmp;RF_score_v3(index,metric_id)];
    hold on;
    plot(num(index),XGB_score(index,metric_id),'co-','Linewidth',2,'MarkerSize',6,'MarkerEdgeColor','c','MarkerFaceColor','c');
    tmp  = [tmp;XGB_score(index,metric_id)];
    ymin = min(tmp);
    ymax = max(tmp);
    xmin = min(num(index));
    xmax = max(num(index));
    %xmax = 1105;
    start_num = ceil(xmin/100);
    if abs(start_num*100-xmin)<=30
        start_num = start_num+1;
    end
    end_num   = floor(xmax/100);
    if abs(end_num*100-xmax)<=30
        end_num = end_num-1;
    end
    labellist = xmin;
    for num_id = start_num:end_num
        labellist = [labellist,num_id*100];
    end
    labellist = [labellist,xmax];
    set(gca,'XTick',labellist,'Fontname', 'Times New Roman','FontSize',12)  
    
    axis([xmin xmax ymin ymax]); % 设置坐标轴在指定的区间
    xlabel(xlabel_str)
    ylabel(ylabel_str)
    %% legend plotting
    if strcmp(compare_method,'X_score')
        if metric_id == 4
            legend('MLR::X-Score','RF::X-Score','RF-Score','RF-Score-v3','XGB-Score','Location','northeast');
        else
            legend('MLR::X-Score','RF::X-Score','RF-Score','RF-Score-v3','XGB-Score','Location','southeast');
        end
    elseif strcmp(compare_method,'Vina')
        if metric_id == 4
            legend('MLR::Vina','RF::Vina','RF-Score','RF-Score-v3','XGB-Score','Location','northeast');
        else
            legend('MLR::Vina','RF::Vina','RF-Score','RF-Score-v3','XGB-Score','Location','southeast');
        end
    else
        if metric_id == 4
            legend('MLR::Cyscore','RF::Cyscore','RF-Score','RF-Score-v3','XGB-Score','Location','northeast'); 
        else
            legend('MLR::Cyscore','RF::Cyscore','RF-Score','RF-Score-v3','XGB-Score','Location','southeast'); 
        end
    end  
%     switch compare_method
%         case 'X_score'
%             legend('MLR::X-Score','RF::X-Score','RF-Score','RF-Score-v3','XGB-Score');
%         case 'Vina'
%             legend('MLR::Vina','RF::Vina','RF-Score','RF-Score-v3','XGB-Score');    
%         case 'Cyscore'
%             legend('MLR::Cyscore','RF::Cyscore','RF-Score','RF-Score-v3','XGB-Score');  
%     end
end