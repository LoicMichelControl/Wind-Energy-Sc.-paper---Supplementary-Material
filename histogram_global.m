   
% This script makes an average over all scenario of the statistics SSE, STD
% and VarU for each controller
% => Build an histogram that presents a comparison of the results

    cell_gl = Stat_save_cellcomplet;
    
    cont_vec = ["_MFC", "_STW", "PIDa", "PIDb", "PIDc"];
    
    cnt = 0;
    
    Init_mesure;
    
    clear vals
    
    SSE_MFC__vec = [];
    SSE_STW__vec = [];
    SSE_PIDa__vec = [];
    SSE_PIDb__vec = [];
    SSE_PIDc__vec = [];
   
    for tt = 1:length( type_vec )
    
        for ttt = 1:length( cont_vec )
    
            cnt = cnt + 1;
    
            type = type_vec( tt );
    
            cont = cont_vec( ttt );
    
            a = 0;
    
            RAZ_mesure;
    
            switch ( cell_gl{cnt,1} )
    
                case type_vec(1) % "vent_19.3";
    
                    switch (  cell_gl{cnt,2} )
    
                        case "_MFC"
    
                            SSE_MFC = cell_gl{cnt,4};
                            %  SSE
                            STD_MFC = cell_gl{cnt,5};
                            %  STD
                            VarU_MFC = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "_STW"
    
                            SSE_STW = cell_gl{cnt,4};
                            % SSE
                            STD_STW = cell_gl{cnt,5};
                            %  STD
                            VarU_STW = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDa"
    
                            SSE_PIDa = cell_gl{cnt,4};
                            % SSE
                            STD_PIDa = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDa = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDb"
    
                            SSE_PIDb = cell_gl{cnt,4};
                            % SSE
                            STD_PIDb = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDb = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDc"
    
                            SSE_PIDc = cell_gl{cnt,4};
                            % SSE
                            STD_PIDc = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDc = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                    end
    
                    %%%%%%%%%%%%%%
                case type_vec(2) % "chopper_0.6pc";
    
                    switch (  cont )
    
                        case "_MFC"
    
                            SSE_MFC = cell_gl{cnt,4};
                            %  SSE
                            STD_MFC = cell_gl{cnt,5};
                            %  STD
                            VarU_MFC = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "_STW"
    
                            SSE_STW = cell_gl{cnt,4};
                            % SSE
                            STD_STW = cell_gl{cnt,5};
                            %  STD
                            VarU_STW = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDa"
    
                            SSE_PIDa = cell_gl{cnt,4};
                            % SSE
                            STD_PIDa = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDa = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDb"
    
                            SSE_PIDb = cell_gl{cnt,4};
                            % SSE
                            STD_PIDb = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDb = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDc"
    
                            SSE_PIDc = cell_gl{cnt,4};
                            % SSE
                            STD_PIDc = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDc = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                    end
    
                case type_vec(3) % "chopper_0.6pc_impact21.4";
    
                    switch (  cont )
    
                        case "_MFC"
    
                            SSE_MFC = cell_gl{cnt,4};
                            %  SSE
                            STD_MFC = cell_gl{cnt,5};
                            %  STD
                            VarU_MFC = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "_STW"
    
                            SSE_STW = cell_gl{cnt,4};
                            % SSE
                            STD_STW = cell_gl{cnt,5};
                            %  STD
                            VarU_STW = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDa"
    
                            SSE_PIDa = cell_gl{cnt,4};
                            % SSE
                            STD_PIDa = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDa = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDb"
    
                            SSE_PIDb = cell_gl{cnt,4};
                            % SSE
                            STD_PIDb = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDb = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDc"
    
                            SSE_PIDc = cell_gl{cnt,4};
                            % SSE
                            STD_PIDc = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDc = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                    end
    
                case  type_vec(4) % "chopper_2.5pc_impact21.4";
    
    
                    switch (  cont )
    
                        case "_MFC"
    
                            SSE_MFC = cell_gl{cnt,4};
                            %  SSE
                            STD_MFC = cell_gl{cnt,5};
                            %  STD
                            VarU_MFC = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "_STW"
    
                            SSE_STW = cell_gl{cnt,4};
                            % SSE
                            STD_STW = cell_gl{cnt,5};
                            %  STD
                            VarU_STW = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDa"
    
                            SSE_PIDa = cell_gl{cnt,4};
                            % SSE
                            STD_PIDa = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDa = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDb"
    
                            SSE_PIDb = cell_gl{cnt,4};
                            % SSE
                            STD_PIDb = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDb = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDc"
    
                            SSE_PIDc = cell_gl{cnt,4};
                            % SSE
                            STD_PIDc = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDc = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                    end
    
    
                case  type_vec(5) % "chopper_2.5pc";
    
    
                    switch (  cont )
    
                        case "_MFC"
    
                            SSE_MFC = cell_gl{cnt,4};
                            %  SSE
                            STD_MFC = cell_gl{cnt,5};
                            %  STD
                            VarU_MFC = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "_STW"
    
                            SSE_STW = cell_gl{cnt,4};
                            % SSE
                            STD_STW = cell_gl{cnt,5};
                            %  STD
                            VarU_STW = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDa"
    
                            SSE_PIDa = cell_gl{cnt,4};
                            % SSE
                            STD_PIDa = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDa = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDb"
    
    
                            SSE_PIDb = cell_gl{cnt,4};
                            % SSE
                            STD_PIDb = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDb = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDc"
    
                            SSE_PIDc = cell_gl{cnt,4};
                            % SSE
                            STD_PIDc = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDc = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                    end
    
                case  type_vec(6) % "chopper_pm2.5pc";
    
    
                    switch (  cont )
    
                        case "_MFC"
    
                            SSE_MFC = cell_gl{cnt,4};
                            %  SSE
                            STD_MFC = cell_gl{cnt,5};
                            %  STD
                            VarU_MFC = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "_STW"
    
                            SSE_STW = cell_gl{cnt,4};
                            % SSE
                            STD_STW = cell_gl{cnt,5};
                            %  STD
                            VarU_STW = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDa"
    
                            SSE_PIDa = cell_gl{cnt,4};
                            % SSE
                            STD_PIDa = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDa = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDb"
    
    
                            SSE_PIDb = cell_gl{cnt,4};
                            % SSE
                            STD_PIDb = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDb = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                        case "PIDc"
    
                            SSE_PIDc = cell_gl{cnt,4};
                            % SSE
                            STD_PIDc = cell_gl{cnt,5};
                            %  STD
                            VarU_PIDc = cell_gl{cnt,6};
                            %  VarU
    
                            a = 1;
    
                    end
            end
    
    
    
            if ( a == 0)
    
                fprintf("problem")
    
                pause
            end
    
            % Re-build averaged statistics over all scenarios for each
            % controller
    
            SSE_MFC_vec = SSE_MFC_vec + SSE_MFC;
            SSE_STW_vec = SSE_STW_vec + SSE_STW;
            SSE_PIDa_vec = SSE_PIDa_vec + SSE_PIDa;
            SSE_PIDb_vec = SSE_PIDb_vec + SSE_PIDb;
            SSE_PIDc_vec = SSE_PIDc_vec + SSE_PIDc;
    
            STD_MFC_vec = STD_MFC_vec + STD_MFC;
            STD_STW_vec = STD_STW_vec + STD_STW;
            STD_PIDa_vec = STD_PIDa_vec + STD_PIDa;
            STD_PIDb_vec = STD_PIDb_vec + STD_PIDb;
            STD_PIDc_vec = STD_PIDc_vec + STD_PIDc;
    
            VarU_MFC_vec = VarU_MFC_vec + abs( VarU_MFC );
            VarU_STW_vec = VarU_STW_vec + abs( VarU_STW );
            VarU_PIDa_vec = VarU_PIDa_vec + abs( VarU_PIDa );
            VarU_PIDb_vec = VarU_PIDb_vec + abs( VarU_PIDb );
            VarU_PIDc_vec = VarU_PIDc_vec + abs( VarU_PIDc );
    
        end
    
    end
    
    
    % Normalize stat. vectors
    SSE_vec = [SSE_MFC_vec, SSE_STW_vec, SSE_PIDa_vec, SSE_PIDb_vec, SSE_PIDc_vec]./length( type_vec );
    
    STD_vec = [STD_MFC_vec, STD_STW_vec, STD_PIDa_vec, STD_PIDb_vec, STD_PIDc_vec]./length( type_vec );
    
    VarU_vec = [VarU_MFC_vec, VarU_STW_vec, VarU_PIDa_vec, VarU_PIDb_vec, VarU_PIDc_vec]./length( type_vec );
    
 %   x = 0:5;
    
    ylabels{1} = 'MFC';
    ylabels{2} = 'AST';
    ylabels{3} = 'PIDa';
    ylabels{4} = 'PIDb';
    ylabels{5} = 'PIDc';
    
    
    x = [1 2 3];
    
    vals = [SSE_vec; STD_vec; VarU_vec] ;

    clear Nvals
    
    Nvals(1,:) = vals(1,:)./max(SSE_vec);
    Nvals(2,:) = vals(2,:)./max(STD_vec);
    Nvals(3,:) = vals(3,:)./max(VarU_vec);
    
    histo_save = sprintf("Performances_histogram.png");
     
    cd Results/
    
    figure(10)
    figure('units','normalized','outerposition',[0 0 1 1])
    b = bar(x,((Nvals)));
    grid on
    xticklabels({'SSE', 'STD', 'VarU'})
    legend(ylabels{1},ylabels{2},ylabels{3},ylabels{4},ylabels{5});
    latex_setting;
    saveas(gcf,histo_save)
    set(gca,'FontSize',40);
    set(gcf,'Color','w');
    set(gcf,'Color','w');

    cd ..
    
    % end of the script
