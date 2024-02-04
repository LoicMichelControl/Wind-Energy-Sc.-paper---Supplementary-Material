    
    % This function plots u, y and reference signals
    
    function [ii] = PlotSignals ( borne_, time, yc_effectif, y_filter_observation, u_signal,  ii, commande)
    
    
    % buffer names
    buffer_save_Y = sprintf("PLOT_%s_Y.png",commande);
    
    buffer_save_Y_chopper = sprintf("PLOT_%s_Y_chopper.png",commande);
    
    % Determine the length of time-windows to plot:
    % interval [1, uu_25_start]        for the saturation operation
    % interval [uu_25_start, uu_70]    for the non-saturation operation
    
    rr = 1;
    qq = 1;
    for uu = 1: length( yc_effectif )
    
        if ( yc_effectif(uu) > 10)
    
            uu_beg(rr) = uu;
    
            t_start = time(uu_beg(1));
    
            if ( (time(uu) -  t_start) >= (30 + 3) )
    
                t_chopper(qq) = time(uu);
                qq_chopper(qq) = uu- uu_beg(1) ;
    
                qq = qq + 1;
            end
    
            rr = rr + 1;
    
            if ( ( time(uu) - t_start) <= 25 )
                uu_25_start = uu;
            end
    
            if ( ( time(uu) - t_start) <= 100 )
                uu_70 = uu;
            end
    
        end
    
    end
    
    
    cd Results/
    
    % Filtering of the u-signal
    
    U_vec = u_signal(borne_ : end );
    
    end_fifo = u_signal(borne_) * ones(1, 100 );
    
    for n=1:length( U_vec )
    
        x(n) = U_vec(n);
    
        if ( length( end_fifo ) ~= 1 )
    
            end_fifo_l = length( end_fifo );
    
            for tt = 2:end_fifo_l
                end_fifo(tt-1) = end_fifo(tt);
            end
            end_fifo(end) = U_vec(n);
    
            out_data = end_fifo(1);
    
            sum_data = sum( end_fifo  ) / length( end_fifo );
    
        else
    
            out_data = in_data;
    
        end
    
        Ucont(n) = sum_data;
    
    
    end
    
    
    % Plot the figures w.r.t. the Sc #2
    
    % Set the instant where the chopper is present in the wind tunnel
    str = {'Chopper perturbation of 0.6 %'};
    borne_ = uu_beg(1);
    
    
    figure(ii)
    figure('units','normalized','outerposition',[0 0 1 1])
    p1 = plot (time( borne_ : uu_25_start  ) - time(borne_), yc_effectif( borne_ : uu_25_start  ), 'r' , 'linewidth', 2 );
    hold on
    p2 = plot (time( borne_ : uu_25_start  ) - time(borne_), y_filter_observation( borne_ : uu_25_start ), 'b' , 'linewidth', 2 );
    ylim([9.5, 11]);
    legend([p1, p2],{'reference lift','measured lift'})
    xlabel('Time [s]','Interpreter','latex','FontSize',40);
    ylabel('F [N]','Interpreter','latex','FontSize',40);
    latex_setting;
    saveas(gcf,buffer_save_Y_chopper)
    set(gca,'FontSize',40);
    set(gcf,'Color','w');
    
    
    ii = ii + 1;
    figure(ii)
    figure('units','normalized','outerposition',[0 0 1 1])
    subplot(2,1,1)
    p1 = plot (time( uu_25_start : uu_70  ) - time(uu_25_start), yc_effectif( uu_25_start : uu_70  ), 'r' , 'linewidth', 2 );
    hold on
    p2 = plot (time( uu_25_start : uu_70  ) - time(uu_25_start), y_filter_observation( uu_25_start : uu_70 ), 'b' , 'linewidth', 2 );
    scatter( time(uu_25_start) - time(qq_chopper(1)), 10.5 )
    text( time(uu_25_start) - time(qq_chopper(1)) + 0.2 ,10.5, str, 'FontSize', 30 )
    legend([p1, p2],{'reference lift','measured lift'})
    xlim([0, 75]);
    ylim([9.5, 10.6]);
    %   xlabel('Time [s]','Interpreter','latex','FontSize',34);
    ylabel('F [N]','Interpreter','latex','FontSize',34);
    latex_setting;
    set(gca,'FontSize',40);
    set(gcf,'Color','w');
    subplot(2,1,2)
    hold on
    plot (time( uu_25_start : uu_70  ) - time(uu_25_start), Ucont( uu_25_start : uu_70 ) / max ( u_signal ) , 'linewidth', 2 )
    scatter( time(uu_25_start) - time(qq_chopper(1)) , 0.55 )
    xlim([0, 75]);
    ylim([0.5, 1]);
    xlabel('Time [s]','Interpreter','latex','FontSize',40);
    ylabel('valve duty-cycle','Interpreter','latex','FontSize',40);
    latex_setting;
    saveas(gcf,buffer_save_Y)
    set(gca,'FontSize',40);
    set(gcf,'Color','w');
    
    ii = ii + 1;
    
    cd ..
    
    
    % end of the function
