    
% Supplementary Material — Some comments on experimental results of three lift controllers for a wind turbine blade section using an active flow control

% Loic Michel, Caroline Braud, Jean-Pierre Barbot, Franck Plestan, Dimitri Peaucelle and Xavier Boucher  

% ==== Matlab scripts and dataset ====


% The script 'Plot_histogram_and_steady_state.m' evaluates the performance of each control law with respect to all scenarios and deduces the histogram that compares the statistics.
% => Create of the file 'Statistic_all_control_all_sc.txt' that contains all statistical data (w.r.t. each scenario & each control law).
% => Plot of each controlled lift signal including its associated segmentation to evaluate the statistics (for debug purpose).
% => Plot of the Fig. 7 (histogram), the Fig. 13 (Sc. #2) and the Fig. 14 (Sc. #5) of the paper.

    clear all
    close all
    clc

    nb_points_per_seg = 2000;
      
    file_name = 'WindXP_Statistic_all_control.txt';
    
    cd Results  
    delete(file_name);
    cd ..

    % First unzip files
    unzip('Dataset_Experiments_1.zip', 'Dataset');
    unzip('Dataset_Experiments_2.zip', 'Dataset');
    unzip('Dataset_Experiments_3.zip', 'Dataset');
    
    % Clean *.png figures in Results and plot_signal_with_segment
    delete *.png
    
    cd Results/

    % Create the 'plot_signal_with_segment' directroy if it not exists
    if ( exist( 'plot_signal_with_segment' ) == 0)
        mkdir plot_signal_with_segment
    end
    
    delete *.png

    cd plot_signal_with_segment/
    
    delete *.png
       
    cd ../..
    %%%%%%%%%%%%%%%%%%%
    
    
    type_vec(1) = "vent_19.3";
    type_vec(2) = "chopper_0.6pc";
    type_vec(3) = "chopper_0.6pc_impact21.4";
    type_vec(4) = "chopper_2.5pc_impact21.4";
    type_vec(5) = "chopper_2.5pc";
    type_vec(6) = "chopper_pm2.5pc";
    
    cntrl_type_vec = ["_MFC", "_STW", "PIDa", "PIDb", "PIDc" ];
        
    Stat_save_cellcomplet = {};
        
    % StatSegment : save all time-segments for comparison purpose
    StatSegment = [];
        
    % Stat_SSE_seg, Stat_STD_seg and Stat_VarU_seg save the statistics
    Stat_SSE_seg = [];
    Stat_STD_seg = [];
    Stat_VarU_seg = [];

    cd Results/
    % Initialize the output file (Statistic_all_control_all_scenarios.txt)
    fid =  fopen(file_name,'a');
    fprintf(fid, ' Scenario & control law &  SSE_avg & STD_avg  & VarU_avg  \n');
    fclose(fid);
    cd ..

    
    % Sweep all scenarios
    for index_scenario = 1:length( type_vec )
    
        type_ = type_vec(index_scenario);
    
        Stat_save_cell = {};
    
        % Sweep all control types
        for type_cntrl = 1:length( cntrl_type_vec )
    
            clear file
        
            cntrl_type = cntrl_type_vec(type_cntrl);
    
            type_;

            fprintf('Scenario = %s  -- control law : %s \n', type_, cntrl_type )
    
            % Select the file corresponding to the selected operating
            % condition (wind inflow speed + chopper condition +
            % controller)
            WindTypeOperationSelect;
        
            % Build the data base => Reads the dataset of experimental data
            [const, signal, u_max] = BuildDataBase(file, cntrl_type, file_name );
    
            FileName = const.FileName;
    
            % Functions of lift scaling (through internal calibration)
            [ Yc_F,  YF_F , Offset_general ] = LiftScaling( signal.y_filter_observation, signal.yc_effectif, 1);
            Fconversion = @(x)( 2 * 10.15 -(Offset_general + x./3.3 ) );
            bornes_inf_vec = find ( 0.4 <  abs( diff ( Fconversion(Yc_F) ) ) ) + 1;
            %%%%%%%%%%%%%%%%
    
            [Stat_save_cell, Stat_SSE_seg, Stat_STD_seg, Stat_VarU_seg, StatSegment] = BuildStatistics(StatSegment, Stat_SSE_seg, Stat_STD_seg, Stat_VarU_seg, Stat_save_cell, index_scenario, type_cntrl, file_name, signal.u_MFC ./ u_max, Fconversion(YF_F), Fconversion(Yc_F), signal.time, type_, cntrl_type, nb_points_per_seg, file);
      
        end
    
        Stat_save_cellcomplet = [Stat_save_cellcomplet; Stat_save_cell];
    
        % Plot all segments w.r.t. each scenario and control law
        Seg_superposition_plot;
    
    end
    
    histogram_global
    
    close all
    
    % end of the program

