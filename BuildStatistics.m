    
    
function [Stat_save_cell, Stat_SSE_seg, Stat_STD_seg, Stat_VarU_seg, StatSegment] = BuildStatistics (StatSegment,  Stat_SSE_seg, Stat_STD_seg, Stat_VarU_seg, Stat_save_cell, index_scenario, type_cntrl, file_name, u_signal, lift_signal, reference, time, type_, cntrl_type, meas_seg_length, file)
    
        % StatSegment : save all time-segments for comparison purpose : Four 'full' segments are considered w.r.t. the variations of the reference:
        % (full) Seg #1 : [Point of segment #1, Point of segment #2 ] => P1
        % (full) Seg #2 : [Point of segment #2, Point of segment #3 ] => P2
        % (full) Seg #3 : [Point of segment #3, Point of segment #4 ] => P3
        % (full) Seg #4 : [Point of segment #4, Point of segment #5 ] => P4

        % Stat_SSE_seg, Stat_STD_seg and Stat_VarU_seg (through the fields
        % S1, S2, S3, S4 and S5) save the statistics for each segment


    % Operation flag for segment detection
    StartSegment_beg_1 = 0;
    StartSegment_beg_2 = 0;
    StartSegment_beg_3 = 0;
    StartSegment_beg_4 = 0;
    StartSegment_beg_5 = 0;
    StartSegment_beg_6 = 0;

    % intermediate level of the reference
    reference_intermediate_level = reference(end);
        
    % Max of the reference (max of the sine part)
    [~,Index_max_cloche] = max(reference);
    
    % =====================================
    % Start the time-lift segmentation (through the reference reading) 
    % =====================================

    for rr = 1:length( reference )
        
        if reference (rr) > 10
    
            StartSegment_beg_1 = 1;
    
        end
    
        %================================================
        %================================================
     
        % Point of segment #1: when the sine part is finished and the ref.
        % converges to 'reference_intermediate_level' (ref. -> ref_medium [precision: 0.01] )
        if ( rr > Index_max_cloche && StartSegment_beg_1 == 1 && abs(reference (rr) - reference_intermediate_level) < 0.01 && StartSegment_beg_2 == 0 )
    
            point_seg_1 = rr;
            StartSegment_beg_2 = 1;
    
        end

    
        % Point of segment #2 / when the reference moves from 'reference_intermediate_level'
        % to 'high ref.' (ref. > ref_medium [precision: 0.01])
    
        if ( StartSegment_beg_2 == 1 && abs(reference (rr) - reference_intermediate_level) > 0.01 && StartSegment_beg_3 == 0 )
    
            StartSegment_beg_3 = 1;
    
            point_seg_2 = rr;
     
            % length of the Seg. #1
            distance_l1 = point_seg_2 - point_seg_1;
    
            % demi-length of the Seg. #1
            distance_l1_demi = floor( distance_l1 / 2);
    
            % middle point of the Seg. #1
            point_middle_seg_1 = floor( (point_seg_1 + point_seg_2)/2 );
    
            % effective length of the Seg. #1 (problem of floor trunc)
            le_segment_1 = length(point_middle_seg_1-distance_l1_demi : point_middle_seg_1+distance_l1_demi   );
    
            segment_1_full = zeros(1,length(reference));
            segment_1_full(point_middle_seg_1-distance_l1_demi : point_middle_seg_1+distance_l1_demi ) = reference(point_middle_seg_1)*ones(1,le_segment_1);
    
        end

    
        % Point of segment #3 / when the reference converges again to the
        % 'reference_intermediate_level' (ref. -> ref_medium [precision: 0.01])
    
        if ( StartSegment_beg_3 == 1 && abs(reference (rr) - reference_intermediate_level) <= 0.01 && StartSegment_beg_4 == 0 )
    
            point_seg_3 = rr;
    
            % length of the Seg. #2
            distance_l2 = point_seg_3 - point_seg_2;
    
            % demi-length of the Seg. #2
            distance_l2_demi = floor( distance_l2 / 2);
    
            % middle point of the Seg. #2
            point_middle_seg_2 = floor( (point_seg_3 + point_seg_2)/2 );
    
            % effective length of the Seg. #2 (problem of floor trunc)
            le_segment_2 = length(point_middle_seg_2-distance_l2_demi : point_middle_seg_2+distance_l2_demi   );
    
            segment_2_full = zeros(1,length(reference));
            segment_2_full(point_middle_seg_2-distance_l2_demi : point_middle_seg_2+distance_l2_demi   ) = reference(point_middle_seg_2)*ones(1,le_segment_2);
    
            StartSegment_beg_4 = 1;
    
        end
    
    
        % Point of segment #4 / when the reference moves from 'reference_intermediate_level'
        % to 'low ref.' (ref. < ref_medium [precision: 0.01])
        if ( StartSegment_beg_4 == 1 && (reference (rr) - reference_intermediate_level) < -0.01 && StartSegment_beg_5 == 0 )
    
            point_seg_4 = rr;
    
            StartSegment_beg_5 = 1;
    
            % length of the Seg. #3
            distance_l3 = point_seg_4 - point_seg_3;
    
            % demi-length of the Seg. #3
            distance_l3_demi = floor( distance_l3 / 2);
    
            % middle point of the Seg. #3
            moyenne_l3 = floor((point_seg_4 + point_seg_3)/2);
    
            % effective length of the Seg. #3 (problem of floor trunc)
            le_segment_3 = length(moyenne_l3-distance_l3_demi : moyenne_l3+distance_l3_demi   );
    
            segment_3_full = zeros(1,length(reference));
            segment_3_full(moyenne_l3-distance_l3_demi : moyenne_l3+distance_l3_demi   ) = reference(moyenne_l3)*ones(1,le_segment_3);
    
        end

    
        % Point of segment #5 / when the reference converges again to the
        % 'reference_intermediate_level' (ref. -> ref_medium [precision: 0.01])
    
        if ( StartSegment_beg_5 == 1 && (reference (rr) - reference_intermediate_level) > -0.01 && StartSegment_beg_6 == 0 )
    
            StartSegment_beg_6 = 1;
    
            point_seg_5 = rr;
    
            % length of the Seg. #4
            distance_l4 = point_seg_5 - point_seg_4;
    
            % demi-length of the Seg. #4
            distance_l4_demi = floor( distance_l4 / 2);
    
            % middle point of the Seg. #4
            moyenne_l4 = floor((point_seg_5 + point_seg_4)/2);
    
            % effective length of the Seg. #4 (problem of floor trunc)
            le_segment_4 = length(moyenne_l4-distance_l4_demi : moyenne_l4+distance_l4_demi   );
    
            segment_4_full = zeros(1,length(reference));
            segment_4_full(moyenne_l4-distance_l4_demi : moyenne_l4+distance_l4_demi   ) = reference(moyenne_l4)*ones(1,le_segment_4);
    
        end
    
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    demi_seg_length = floor(meas_seg_length / 2);
       
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Meas. Segmentation definition 
    
    le_segment_1_min = length( (point_middle_seg_1-demi_seg_length)  : (point_middle_seg_1+demi_seg_length) );
    segment_1_meas = zeros(1,length(reference));
    segment_1_meas( (point_middle_seg_1-demi_seg_length)  : (point_middle_seg_1+demi_seg_length) ) = reference(point_middle_seg_1)*ones(1,le_segment_1_min);
    % Seg. of points for Seg. #1
    seg_1_index_meas = (point_middle_seg_1-demi_seg_length)  : (point_middle_seg_1+demi_seg_length);
    
    le_segment_2_min = length(point_middle_seg_2-demi_seg_length : point_middle_seg_2+demi_seg_length );
    segment_2_meas = zeros(1,length(reference));
    segment_2_meas(point_middle_seg_2-demi_seg_length : point_middle_seg_2+demi_seg_length ) = reference(point_middle_seg_2)*ones(1,le_segment_2_min);
    % Seg. of points for Seg. #2
    seg_2_index_meas = point_middle_seg_2-demi_seg_length : point_middle_seg_2+demi_seg_length;
    
    le_segment_3_min = length(moyenne_l3-demi_seg_length : moyenne_l3+demi_seg_length );
    segment_3_meas = zeros(1,length(reference));
    segment_3_meas(moyenne_l3-demi_seg_length : moyenne_l3+demi_seg_length) = reference(moyenne_l3)*ones(1,le_segment_3_min);
    % Seg. of points for Seg. #3
    seg_3_index_meas = moyenne_l3-demi_seg_length : moyenne_l3+demi_seg_length;
    
    le_segment_4_min = length(moyenne_l4-demi_seg_length : moyenne_l4+demi_seg_length ) ;
    segment_4_meas = zeros(1,length(reference));
    segment_4_meas(moyenne_l4-demi_seg_length : moyenne_l4+demi_seg_length ) = reference(moyenne_l4)*ones(1,le_segment_4_min);
    % Seg. of points for Seg. #4
    seg_4_index_meas = moyenne_l4-demi_seg_length : moyenne_l4+demi_seg_length;
    
       
    % Save all Segments
    StatSegment(index_scenario,type_cntrl).Seg_temps_1         =   time(seg_1_index_meas) - time(seg_1_index_meas(1) );
    StatSegment(index_scenario,type_cntrl).P1_reference        =   reference( seg_1_index_meas );
    StatSegment(index_scenario,type_cntrl).P1_y                =   lift_signal( seg_1_index_meas );
    
    StatSegment(index_scenario,type_cntrl).Seg_temps_2         =   time(seg_2_index_meas) - time(seg_2_index_meas(1) );    
    StatSegment(index_scenario,type_cntrl).P2_reference        =   reference( seg_2_index_meas );
    StatSegment(index_scenario,type_cntrl).P2_y                =   lift_signal( seg_2_index_meas );
    
    StatSegment(index_scenario,type_cntrl).Seg_temps_3         =   time(seg_3_index_meas) - time(seg_3_index_meas(1) );    
    StatSegment(index_scenario,type_cntrl).P3_reference        =   reference( seg_3_index_meas );
    StatSegment(index_scenario,type_cntrl).P3_y                =   lift_signal( seg_3_index_meas );
    
    StatSegment(index_scenario,type_cntrl).Seg_temps_4         =   time(seg_4_index_meas) - time(seg_4_index_meas(1) );
    StatSegment(index_scenario,type_cntrl).P4_reference        =   reference( seg_4_index_meas );
    StatSegment(index_scenario,type_cntrl).P4_y                =   lift_signal( seg_4_index_meas );
     
    % SSE Statistic
    Stat_SSE_seg(index_scenario,type_cntrl).S1 = sum((lift_signal(seg_1_index_meas) - reference(seg_1_index_meas)).^2);
    Stat_SSE_seg(index_scenario,type_cntrl).S2 = sum((lift_signal(seg_2_index_meas) - reference(seg_2_index_meas)).^2);
    Stat_SSE_seg(index_scenario,type_cntrl).S3 = sum((lift_signal(seg_3_index_meas) - reference(seg_3_index_meas)).^2);
    Stat_SSE_seg(index_scenario,type_cntrl).S4 = sum((lift_signal(seg_4_index_meas) - reference(seg_4_index_meas)).^2);
        
    % STD Statistic
    Stat_STD_seg(index_scenario,type_cntrl).S1 = std((lift_signal(seg_1_index_meas) - reference(seg_1_index_meas)));
    Stat_STD_seg(index_scenario,type_cntrl).S2 = std((lift_signal(seg_2_index_meas) - reference(seg_2_index_meas)));
    Stat_STD_seg(index_scenario,type_cntrl).S3 = std((lift_signal(seg_3_index_meas) - reference(seg_3_index_meas)));
    Stat_STD_seg(index_scenario,type_cntrl).S4 = std((lift_signal(seg_4_index_meas) - reference(seg_4_index_meas)));
    
    % VarU Statistic
    Stat_VarU_seg(index_scenario,type_cntrl).S1 = sum( diff( u_signal(seg_1_index_meas) ));
    Stat_VarU_seg(index_scenario,type_cntrl).S2 = sum( diff( u_signal(seg_2_index_meas) ));
    Stat_VarU_seg(index_scenario,type_cntrl).S3 = sum( diff( u_signal(seg_3_index_meas) ));
    Stat_VarU_seg(index_scenario,type_cntrl).S4 = sum( diff( u_signal(seg_4_index_meas) ));
    
    % Averaged statistics
    SSE_avg  = mean([ Stat_SSE_seg(index_scenario,type_cntrl).S1,  Stat_SSE_seg(index_scenario,type_cntrl).S2,  Stat_SSE_seg(index_scenario,type_cntrl).S3, Stat_SSE_seg(index_scenario,type_cntrl).S4] );
    STD_avg  = mean([ Stat_STD_seg(index_scenario,type_cntrl).S1,  Stat_STD_seg(index_scenario,type_cntrl).S2,  Stat_STD_seg(index_scenario,type_cntrl).S3, Stat_STD_seg(index_scenario,type_cntrl).S4] );
    VarU_avg = mean([Stat_VarU_seg(index_scenario,type_cntrl).S1, Stat_VarU_seg(index_scenario,type_cntrl).S2, Stat_VarU_seg(index_scenario,type_cntrl).S3, Stat_VarU_seg(index_scenario,type_cntrl).S4] );
    
    % just check if the lengths are identical
    if ( length(seg_2_index_meas) == length(seg_1_index_meas) && length(seg_2_index_meas) == length(seg_3_index_meas) && length(seg_3_index_meas) == length(seg_4_index_meas) )
    
        fprintf('length OK ... \n')
            close all

    end

        buffer_title = sprintf("Sc #%d-- type control %d--",index_scenario, type_cntrl);
    
    % Fig. 1 plots each 'Point of segment' incl. the associated full segments (between each point of seg.)
    % and the corresponding meas. segments -> saved in the 'plot_signal_with_segment' directory
    
    cd Results/plot_signal_with_segment

    figure(1)
    figure('units','normalized','outerposition',[0 0 1 1])
    plot(time, reference , '--r', 'linewidth', 2)
    hold on
    plot(time,  lift_signal, '-b')
    plot(time, segment_1_full - 0.1, 'r')
    plot(time, segment_1_meas - 0.1, 'or' );
    plot(time, segment_2_full - 0.1, 'm')
    plot(time, segment_2_meas - 0.1, 'om' );
    plot(time, segment_3_full - 0.1, 'g')
    plot(time, segment_3_meas - 0.1, 'og' );
    plot(time, segment_4_full - 0.1, 'b')
    plot(time, segment_4_meas - 0.1, 'ob' );
    scatter(time( point_seg_1 ), 10.9, 'filled');
    scatter(time( point_seg_2 ), 10.9, 'filled');
    scatter(time( point_seg_3 ), 10.9, 'filled');
    scatter(time( point_seg_4 ), 10.9, 'filled');
    scatter(time( point_seg_5 ), 10.9, 'filled');
    legend('reference', 'mes. lift', ...
        'segment1 - full', 'segment1 - mes', ...
        'segment2 - full', 'segment2 - mes', ...
        'segment3 - full', 'segment3 - mes', ...
        'segment4 - full', 'segment4 - mes', ...
        'point-seg-1', 'point-seg-2', 'point-seg-3', 'point-seg-4', 'point-seg-5' );
    xlim([0, 108]);
    ylim([9.4, 11])
    title(buffer_title)
    set(gcf,'Color','w');
    set(gcf,'Color','w');
    saveas(gcf,buffer_title,'png')
    set(gca,'FontSize',30);

    cd ../..
    
      cd Results/

    % Save the stats in a file
    fid =  fopen(file_name,'a'); 
    fprintf(fid, '%s & %s & %3.3e & %3.3e & %3.3e & %s \n', type_, cntrl_type, SSE_avg, STD_avg,  VarU_avg, file );   
    fclose(fid);
    
    % Save the stats in cell format in order to plot the global histogram
    Stat_save_cell(type_cntrl,:) = { type_, cntrl_type,  -99, SSE_avg, STD_avg,  VarU_avg, -99, file_name };

    cd ..

    % end of the function
